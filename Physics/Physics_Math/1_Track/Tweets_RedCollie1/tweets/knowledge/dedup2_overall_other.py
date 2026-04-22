#!/usr/bin/env python3
"""
Phase 4 + Phase 5 (v2): Deduplication of overall_other.mdx
Robust approach: split into atomic "entries", deduplicate by content hash
of first ~200 chars, then organize by detected topic.
"""

import re
import hashlib
import sys

CONCAT_FILE = "/Users/bryan/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets/knowledge/concat/overall_other.mdx"
TEMP_FILE   = "/Users/bryan/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets/knowledge/temp/overall_other.mdx"
FINAL_FILE  = "/Users/bryan/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets/knowledge/final/overall_other.mdx"

HEADER = """# overall_other — UAP Physics Knowledge Base

Extracted from 100 tweet directories of @RedCollie1 (Dr. Horace Drew, Caltech/MRC LMB Cambridge).

"""

def read_file(path):
    with open(path, "r", encoding="utf-8") as f:
        return f.read()

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def strip_source_separators(text):
    """Remove all '--- Source: N/M ---' separators and section title boilerplate."""
    # Remove separator lines
    text = re.sub(r'---\s*Source:\s*\d+/\d+\s*---', '', text)
    # Remove per-section title lines like '# overall_other.mdx' and subtitles
    text = re.sub(r'^# overall_other\.mdx\s*$', '', text, flags=re.MULTILINE)
    # Remove source directory lines
    text = re.sub(r'^Source directory:.*$', '', text, flags=re.MULTILINE)
    text = re.sub(r'^.*Generated from END_DIR.*$', '', text, flags=re.MULTILINE)
    # Remove boilerplate headers for each section
    text = re.sub(r'^## (Everything|All Other|Content Not|Other Claims|Other Content|Everything Else|All Remaining).*$',
                  '', text, flags=re.MULTILINE)
    text = re.sub(r'^###? Source:.*tweets/\d+/\d+.*$', '', text, flags=re.MULTILINE)
    # Collapse multiple blank lines
    text = re.sub(r'\n{3,}', '\n\n', text)
    return text

def split_into_entries(text):
    """
    Split text into atomic entries.
    Each entry starts with a heading (## or ### or ####) and ends before the next heading.
    Returns list of (heading_text, full_entry_text).
    """
    # Find all heading positions
    heading_re = re.compile(r'^(#{2,4})\s+(.+)$', re.MULTILINE)

    entries = []
    positions = [(m.start(), m.group(0), m.group(2)) for m in heading_re.finditer(text)]

    for i, (start, heading_line, heading_text) in enumerate(positions):
        if i + 1 < len(positions):
            end = positions[i + 1][0]
        else:
            end = len(text)

        entry_text = text[start:end].strip()
        if len(entry_text) > 50:  # Skip trivially short entries
            entries.append((heading_text.strip(), entry_text))

    return entries

def content_fingerprint(text):
    """
    Create a fingerprint from normalized content for deduplication.
    Uses the first 300 chars of body text (after heading).
    """
    # Remove the heading line
    lines = text.split('\n')
    body_lines = [l for l in lines[1:] if l.strip()]
    body = ' '.join(body_lines[:10])  # First 10 non-empty lines

    # Normalize
    body = body.lower()
    body = re.sub(r'[^\w\s]', ' ', body)
    body = re.sub(r'\s+', ' ', body).strip()
    body = body[:300]

    return hashlib.md5(body.encode()).hexdigest()

def heading_key(heading_text):
    """Create normalized key from heading."""
    h = heading_text.lower()
    h = re.sub(r'^[#\s]+', '', h)
    h = re.sub(r'^(section:|source:|sources?:)\s*', '', h)
    h = re.sub(r'\d{15,}\.yaml.*$', '', h)  # Remove yaml filenames
    h = re.sub(r'\d{15,}', '', h)  # Remove tweet IDs
    h = re.sub(r'[^\w\s]', ' ', h)
    h = re.sub(r'\s+', ' ', h).strip()
    return h[:80]

def are_similar(entry1, entry2, threshold=0.55):
    """
    Check if two entries are significantly similar by word overlap.
    Uses first 500 chars of body text.
    """
    def body_words(text):
        lines = text.split('\n')
        body = ' '.join(l for l in lines[1:6] if l.strip())
        body = body.lower()
        body = re.sub(r'[^\w]', ' ', body)
        words = set(w for w in body.split() if len(w) > 4)
        return words

    w1 = body_words(entry1)
    w2 = body_words(entry2)

    if not w1 or not w2:
        return False

    overlap = len(w1 & w2) / min(len(w1), len(w2))
    return overlap >= threshold

def deduplicate_entries(entries):
    """
    Deduplicate entries.
    1. First pass: exact/near-exact content fingerprint dedup
    2. Second pass: heading similarity dedup (keep longest)
    """
    # Phase 1: Content fingerprint deduplication
    seen_fingerprints = {}  # fingerprint -> index in kept_entries
    kept_entries = []  # list of (heading, text)

    for heading, text in entries:
        fp = content_fingerprint(text)
        hk = heading_key(heading)

        if fp not in seen_fingerprints:
            seen_fingerprints[fp] = len(kept_entries)
            kept_entries.append((heading, text))
        else:
            # Keep longer version
            existing_idx = seen_fingerprints[fp]
            if len(text) > len(kept_entries[existing_idx][1]):
                kept_entries[existing_idx] = (heading, text)

    print(f"  After fingerprint dedup: {len(kept_entries)} (from {len(entries)})")

    # Phase 2: Heading similarity deduplication
    # Group by normalized heading key, keep longest per group
    heading_groups = {}  # heading_key -> (heading, text)
    heading_order = []

    for heading, text in kept_entries:
        hk = heading_key(heading)
        if not hk or len(hk) < 5:
            hk = content_fingerprint(text)[:20]  # Use fingerprint as key

        if hk not in heading_groups:
            heading_groups[hk] = (heading, text)
            heading_order.append(hk)
        else:
            # Keep longer
            if len(text) > len(heading_groups[hk][1]):
                heading_groups[hk] = (heading, text)

    result = [(heading_groups[k][0], heading_groups[k][1]) for k in heading_order]
    print(f"  After heading dedup: {len(result)}")
    return result

# =====================
# TOPIC CATEGORIZATION
# =====================

# Each category: (display_name, list_of_keyword_patterns_in_body_or_heading)
# Order matters: first match wins
TOPIC_CATEGORIES = [
    # SKIP RULES (junk / purely personal / no-content)
    ("__SKIP__", [
        r'no physics content',
        r'no uap.*content',
        r'no scientific.*content',
        r'political commentary.*no',
        r'australian politics',
        r'australian multiculturalism',
        r'sarcastic political response',
        r'uk politics',
        r'einstein not muslim',
        r'response to elon musk',
        r'ecclesiastes citation',
        r'consider the lilies',
        r'storm photo.*personal',
        r'personal.*storm photo',
        r'macao photo',
        r'winter.*australia.*video.*no',
        r'katoomba falls video',
        r'leura video',
        r'fishing.*moffat beach',
        r'pagination.*artifact',
        r'pagination file',
        r'pagination.*json',
        r'page_\d+\.json.*pagination',
        r'no audio stream.*video.only',
        r'animated gif.*no audio',
        r'garbled transcription.*smells',
        r'whisper.*hallucination',
        r'single word.*you.*artifact',
        r'only.*background audio.*so so',
        r'transcription.*garbled',
        r'inaudible.*irrelevant video',
        r'minimal transcription.*single word',
        r'only.*"you".*whisper',
        r'reply to.*_mr_pool.*the end',
        r'no new content beyond.*retweet',
    ]),

    # AUTHOR PROFILE
    ("Author Profile and Credentials", [
        r'author.*background.*credentials',
        r'researcher identity.*credentials',
        r'dr.*horace.*drew.*caltech',
        r'horace drew.*redcollie',
        r'red collie.*caltech',
        r'phd.*x.ray diffraction.*caltech',
        r'postdoctoral.*mrc.*lmb',
        r'institutional affiliation.*caltech',
        r'profile.*caltech.*mrc',
        r'author profile',
        r'redcollie.*caltech.*mrc',
        r'57,?364 followers',
        r'disclose.*evolve.*caltech',
        r'youtube.*caltech.*ph.*d.*1981',
    ]),

    # PERSONAL UFO SIGHTING 1965
    ("Personal UFO Sighting — 1965 Florida", [
        r'silver saucer.*1965.*florida',
        r'1965.*florida.*silver saucer',
        r'silver saucer.*daylight.*1965',
        r'saw.*silver.*saucer.*close.*1965',
        r'personal ufo sighting.*1965',
        r'silver saucer.*hover.*flew.*florida',
        r'silver alien saucer.*1965',
        r'ufo sighting.*1965',
        r'i saw a silver saucer',
        r'silver saucer.*100 meters',
    ]),

    # PERSONAL ATTACK / IMPLANT / SAFETY
    ("Personal Safety Claims and Ear Implant", [
        r'attacked.*unknown entity.*2021',
        r'ear implant.*1998',
        r'implant.*right ear.*1998',
        r'e\.t\..*friends.*australia.*lab',
        r'et friends.*sent.*australia',
        r'not safe.*travel.*uk',
        r'warned.*not.*go.*uk',
        r'fierce.*violent.*cover.up',
        r'nothing.*changed.*galileo',
        r'personal safety.*suppression',
        r'three.body problem.*liu cixin',
        r'alien.*kill.*frontier physicists',
        r'bush administration.*chinese sci.fi',
    ]),

    # CROP CIRCLE EVIDENCE NON-HUMAN ORIGIN
    ("Crop Circle Evidence for Non-Human Origin", [
        r'evidence against human construction',
        r'non.human.*construction.*crop',
        r'authentic.*vs.*fake.*crop',
        r'physical criteria.*authentic',
        r'crop standing on tramlines',
        r'paul jacobs.*tramlines',
        r'netherlands.*2009.*500.*300 meters',
        r'milk hill.*2001.*410 circles',
        r'east field.*july.*2007.*winston keech',
        r'winston keech.*four cameras',
        r'sheet lightning.*300.meter formation',
        r'no heat.signatures.*infrared',
        r'30 tons.*flattened wheat',
        r'26 countries.*worldwide.*crop',
        r'crop circles.*drawn.*26 countries',
        r'global distribution.*crop circle',
        r'certain details.*laid crop.*preclude.*human',
    ]),

    # CROP CIRCLE PHYSICS OF FORMATION
    ("Crop Circle Formation Physics", [
        r'physics.*by which crop circles are swirled',
        r'spin.*counter.spin.*crop circle.*creation',
        r'creation mechanism.*crop circle',
        r'how crop circles are created',
        r'rotating magnetic field.*creates.*crop',
        r'propulsion system.*crop.*pattern',
    ]),

    # BARBURY CASTLE
    ("Barbury Castle 1991 Crop Circle", [
        r'barbury castle.*1991',
        r'1991.*barbury castle',
        r'spinning top.*barbury',
        r'barbury.*spinning.*top.*diagram',
    ]),

    # LYME REGIS
    ("Lyme Regis Crop Circle — June 28, 2025", [
        r'lyme regis.*june.*2025',
        r'june 28.*2025.*lyme regis',
        r'new.*crop.*lyme regis',
        r'et.made.*crop.*lyme regis',
        r'crop.*lyme regis',
    ]),

    # CULLIFORD TREE BARROW
    ("Culliford Tree Barrow Crop Circle — May 2025", [
        r'culliford tree barrow',
        r'dorset.*may.*2025.*crop',
        r'may 18.*2025.*dorset',
    ]),

    # IPUACU BRAZIL
    ("Ipuaçu, Brazil Crop Circles", [
        r'ipua.u.*brazil',
        r'ipuacu.*brazil',
        r'santa catarina.*brazil.*crop',
        r'agroglifo.*brazil',
        r'brazil.*2024.*2025.*2016.*crop',
    ]),

    # 2012 CROP PICTURES DEVICE
    ("2012 England Crop Circles — Device Specifications", [
        r'july.*2012.*crop.*device',
        r'two crop pictures.*july 2012',
        r'first.*second.*2012.*picture.*lift',
        r'2012.*helical.*field.*crop',
    ]),

    # 1998-1999 CROP SERIES
    ("1998–1999 England Crop Circle Series — UFO Drive Diagrams", [
        r'1998.*crop.*6.*wire.*coil',
        r'1998.*crop.*16.*magnet',
        r'may 1999.*six.*formations',
        r'1998.1999.*crop.*series',
        r'august 1998.*crop.*magnet.*ring',
        r'two crop pictures.*1998.*dc.*lorentz',
        r'1999.*crop.*dc.*current.*magnet.*spin',
        r'six.*crop.*pictures.*1998.1999',
    ]),

    # 2005 CROP PICTURES
    ("2005 England Crop Pictures — Comet Holmes and Mayan Encoding", [
        r'wayland.*smithy.*2005',
        r'lane end down.*2005',
        r'july 10.*2005.*crop',
        r'2005.*crop.*comet.*holmes',
        r'crop.*august.*2005.*encoded',
        r'frieding.*germany.*2025.*vs.*2005',
        r'2005.*predicted.*holmes',
    ]),

    # AVEBURY 2014
    ("Avebury 2014 Crop Circle", [
        r'avebury.*august.*2014',
        r'avebury.*2014.*six.*coil',
        r'august.*2014.*avebury.*crop',
        r'westwoods.*2007.*avebury.*2014',
        r'two.*crop.*precisely superimposed.*2014.*2007',
    ]),

    # SILBURY HILL / QUETZALCOATL HEADDRESS
    ("Silbury Hill / Quetzalcoatl Headdress — 2007 and 2009", [
        r'silbury hill.*august.*2009',
        r'quetzalcoatl headdress.*july.*2009',
        r'july.*2009.*silbury hill',
        r'wiltshire.*police.*three.*blond.*alien',
        r'metatron.*cube.*sugar hill.*august.*2007',
        r'sugar hill.*august.*2007',
    ]),

    # ROUNDWAY 2010
    ("Roundway 2010 Crop Circle — Five-Phase Power", [
        r'roundway.*2010',
        r'five.*thin.*lines.*2010.*crop',
        r'five.phase.*ac.*power.*crop.*2010',
    ]),

    # CHILBOLTON 2001 ARECIBO REPLY
    ("Chilbolton 2001 Arecibo Reply Crop Picture", [
        r'arecibo reply.*chilbolton.*2001',
        r'chilbolton.*2001.*arecibo',
        r'arecibo.*reply.*crop.*2001',
        r'arecibo reply.*fractal.*antenna',
        r'nine.*differences.*arecibo.*reply',
        r'2.*5.*dna.*chilbolton',
        r'silicon.*14.*arecibo.*reply',
        r'chilbolton.*radio.*telescope.*1999.*2001',
    ]),

    # CRABWOOD 2002
    ("Crabwood 2002 Crop Circle — Binary ASCII Message", [
        r'crabwood.*2002',
        r'binary.ascii.*crabwood',
        r'crabwood farm.*binary',
        r'grey alien.*60.line.*tv.*signal.*crabwood',
        r'crabwood.*hidden message.*prime.*number',
        r'1368.digit.*binary',
    ]),

    # PI CROP CIRCLE 2008
    ("Pi Crop Circle 2008", [
        r'pi.*crop circle.*2008',
        r'3\.14159.*crop',
        r'3\.141592.*crop',
        r'pi.*3\.1415.*crop',
    ]),

    # SPINNING VORTEX 2018
    ("2018 Crop Picture — Spinning Vortex", [
        r'2018.*crop.*spinning vortex',
        r'spinning vortex.*lifted.*wire coil.*2018',
    ]),

    # TAWSMEAD WORMHOLE
    ("Tawsmead Copse 2022 Crop Circle — Wormhole Topology", [
        r'tawsmead.*2022',
        r'spacetime wormhole.*crop.*tawsmead',
        r'wormhole.*crop.*morris.thorne',
    ]),

    # GENERAL CROP FORMATIONS OTHER
    ("Other Specific Crop Circle Formations", [
        r'crop.*formation.*avebury.*june.*2025',
        r'avebury.*june 8.*2025',
        r'hackpen hill.*2021.*authentic',
        r'disco colgante.*2008.*crop',
        r'ansty farmhouse.*2016.*crop',
        r'crop circle.*jesus christ face.*2010',
        r'bert janssen.*templar cross.*request.*2005',
        r'six templar crosses.*request',
        r'spinning.*diamond.*medellin.*2020',
        r'uap sighting.*medellin.*colombia.*2020',
        r'hexagonal.*california.*april.*2025',
        r'hexagonal.*spinning.*ufo.*ipuacu',
        r'new.*crop.*formation.*avebury.*falkners.*2025',
    ]),

    # CROP CIRCLE BINARY ENCODING
    ("Crop Circle Binary Encoding", [
        r'binary.*encoded.*crop',
        r'0000.1101.*ring.*26.27',
        r'ascii.*crop.*circle.*binary',
        r'ring.*26.27.*binary',
        r'return.*coded.*0000.1101',
        r'binary.*ascii.*ring',
        r'8.bit.*ascii.*crop',
    ]),

    # 4-SYMBOL ALIEN CODE
    ("Four-Symbol Alien Code and DOD Visits", [
        r'4.symbol.*alien.*code',
        r'four.symbol.*alien.*code',
        r'dod.*already.*these codes',
        r'jeremy weeks.*dod',
        r'dod.*visited.*jeremy weeks',
        r'rodney.*reverse.*engineer.*alien.*code',
        r'triple binary.*encode.*decode',
        r'novel.*alien.*computer.*code.*cj',
    ]),

    # EULER IDENTITY
    ("Euler's Identity in ET Communication", [
        r'euler.*identity.*et',
        r'euler.*identity.*crop',
        r'euler.*identity.*nasa.*astronaut',
        r'e\^.*i.*pi.*crop',
        r'fundamental mathematical.*crop.*et',
    ]),

    # KRUSKAL WORMHOLE CROP
    ("Kruskal Coordinates / Wormhole in Crop Formations", [
        r'kruskal.*coordinates.*crop',
        r'entering.*spacetime.*wormhole.*kruskal',
        r'cross over.*wormhole.*crop',
        r'portal.*wormhole.*cgi.*mr.*pool',
        r'mr.*pool.*black.*wormhole',
    ]),

    # CROP CIRCLES SIMULTANEOUS EQUATIONS
    ("Crop Circles as Simultaneous Equation System", [
        r'crop circles.*simultaneous equations',
        r'simultaneous.*equations.*crop',
    ]),

    # FRACTAL ANTENNA
    ("Fractal Antenna Communication Technology", [
        r'fractal.*space.*antenna.*et',
        r'fractal.*antenna.*crop.*buga',
        r'fractal.*antenna.*et.*communication',
        r'not.*radio.telescope.*fractal',
    ]),

    # MAYAN CALENDAR
    ("Mayan Calendar, Venus Cycles, and Crop Circle Encoding", [
        r'mayan.*venus.*calendar.*crop',
        r'18,?980.day.*mayan.*calendar',
        r'mayan.*calendar.*round.*52.year',
        r'mayan.*venus.*calendar.*et',
        r'calendar.*round.*18,?980',
        r'base.16.*mayan.*symbols',
        r'mayan.*long.*count.*crop',
        r'el caracol.*mayan.*observatory',
        r'mayan.*calendar.*13.10.7.*14.5.11',
        r'quetzal.*took.*smart.*mayans.*space.*800.*ad',
        r'mayan.*calendar.*20.year.*sequence',
        r'morgenstern.*mayan.*20.*symbols.*year',
        r'6.*spike.*10.*spike.*mayan',
        r'20.*year.*crop.*picture.*delta',
    ]),

    # COMET 17P HOLMES
    ("Comet 17P/Holmes Outburst — Crop Picture Prediction", [
        r'comet.*17p.*holmes',
        r'holmes.*outburst.*2007',
        r'holmes.*brightened.*10.*6',
        r'10\^6.*comet.*outburst',
        r'holmes.*crop.*2005.*predicted',
        r'toni scarmato.*calabria.*2007',
        r'november.*2007.*conjunction.*holmes.*mirfak',
        r'2005.*crop.*predict.*2007.*comet',
        r'crop.*picture.*july.*2005.*comet.*explosion',
        r'comet.*exploding.*in.*space.*crop.*2005',
    ]),

    # 3I/ATLAS OVERVIEW
    ("3I/ATLAS — Overview and Key Claims", [
        r'3i.*atlas.*trajectory analysis',
        r'3i.*atlas.*third.*interstellar',
        r'3i.*atlas.*oumuamua.*borisov',
        r'interstellar object.*third.*2025',
        r'3i.*atlas.*non.natural.*craft',
        r'3i.*atlas.*ion.*thrusters',
        r'3i.*atlas.*orbital mechanics.*perihelion',
        r'3i.*atlas.*larger.*manhattan',
        r'3i.*atlas.*possibly.*larger',
        r'3i.*atlas.*not.*comet',
        r'3i.*atlas.*practically.*zero.*scientists',
        r'3i.*atlas.*loeb.*media.*tsunami',
    ]),

    # 3I/ATLAS OPTICAL
    ("3I/ATLAS — Optical Characteristics and Imaging", [
        r'3i.*atlas.*optical characteristics',
        r'3i.*atlas.*bright.*round.*center',
        r'3i.*atlas.*blue.*green.*rings',
        r'3i.*atlas.*shiny.*sphere',
        r'3i.*atlas.*anti.tail.*persistence',
        r'3i.*atlas.*anti.tail.*laminar',
        r'3i.*atlas.*phobos.*22 km',
        r'3i.*atlas.*jwst.*pixelated',
        r'3i.*atlas.*jwst.*resolution',
        r'3i.*atlas.*dust tail.*faint',
        r'dobsonian.*3i.*atlas.*october.*2025',
        r'alfons diepvens.*3i.*atlas',
        r'3i.*atlas.*photometric tail',
        r'3i.*atlas.*anti.solar tail',
        r'3i.*atlas.*comet lemmon',
    ]),

    # 3I/ATLAS SUPPRESSION
    ("3I/ATLAS — Data Suppression and Cover-Up", [
        r'nasa.*hiding.*3i.*atlas',
        r'3i.*atlas.*nasa.*hiding',
        r'videos.*3i.*atlas.*mars.*remain secret',
        r'3i.*atlas.*video.*suppression',
        r'high.resolution.*3i.*atlas.*secret',
        r'nasa.*never.*released.*3i',
        r'hundreds.*high.resolution.*photos.*3i.*where',
        r'3i.*atlas.*leaked.*photo',
        r'ray.*astrophotography.*3i.*atlas',
    ]),

    # 3I/ATLAS WORMHOLE/DEPLOYMENT
    ("3I/ATLAS — Wormhole Deployment Hypothesis", [
        r'3i.*atlas.*detach.*solar.*occultation',
        r'small spaceships.*docked.*3i.*atlas',
        r'release.*payload.*3i.*atlas.*sun',
        r'blind spot.*sun.*3i.*atlas',
        r'carrier.*3i.*atlas.*spaceships',
        r'3i.*atlas.*brake.*change.*direction',
    ]),

    # 3I/ATLAS EBEN THREAT
    ("3I/ATLAS — EBEN Space Vessel Threat Hypothesis", [
        r'3i.*atlas.*eben.*space.*vessel',
        r'3i.*atlas.*eben.*threat',
        r'3i.*atlas.*trojan.*horse',
        r'3i.*atlas.*20.40 km.*diameter',
        r'eben.*space.vessel.*3i.*atlas',
        r'3i.*atlas.*perihelion.*timing.*eben',
        r'most logical.*aliens.*plan.*invade.*jeremy',
    ]),

    # EMERTHER ALIENS
    ("Emerther Alien Faction", [
        r'emerthere?.*council.*five',
        r'emerthere?.*12 light.years',
        r'emerthere?.*friendly.*alien',
        r'emerthere?.*royal.*warning',
        r'emerther.*yahweh',
        r'council of five.*wizards.*warlocks',
        r'emerthere?.*protect.*earth',
        r'emerthere?.*guided.*human.*evolution',
        r'emerthere?.*ike.*citizens',
        r'emerthere?.*met.*eisenhower',
        r'royal emerthere?.*warning',
    ]),

    # EBEN GREY ALIENS
    ("EBEN Grey Alien Faction", [
        r'grey.*eben.*orion.*zeta reticuli',
        r'eben.*extraterrestrial.*biological',
        r'eben.*adversarial',
        r'grey.*alien.*eben.*threat',
        r'grey.*alien.*trojan.*horse',
        r'eben.*sent.*threat',
        r'beware.*bearers.*false gifts',
        r'grey.*alien.*orion.*zeta',
        r'ebens.*infiltrated',
    ]),

    # EISENHOWER AND GREYS
    ("Eisenhower 1954 Meeting with Aliens", [
        r'eisenhower.*1954.*grey',
        r'eisenhower.*deceived.*1954',
        r'quetzal.*told.*eisenhower',
        r'eisenhower.*ally.*greys.*nuclear',
        r'1954.*eisenhower.*two.*extraterrestrial',
    ]),

    # WASHINGTON DC UFO 1952
    ("Washington D.C. UFO Wave 1952", [
        r'washington.*1952.*ufo',
        r'saucer.*outran.*jet.*1952',
        r'radar.*blips.*1952.*washington',
        r'1952.*unfriendly.*grey.*washington',
        r'washington post.*july.*1952.*saucer',
    ]),

    # CJ CONTACTEE
    ("US Military Contactee 'CJ' Messages", [
        r'us military contactee.*cj',
        r'contactee.*cj.*alien.*message',
        r'"cj".*military.*contactee',
        r'cj.*military.*scif',
        r'cj.*visual.*binary.*encoding',
        r'imminent.*decoded.*cj',
        r'linda moulton howe.*cj',
        r'emerther.*cj.*four.symbol',
        r'contactee.*cj.*2015.*message',
        r'chris ramsay.*cj.*interview',
        r'scif.*contactee',
        r'ten pages.*decoded.*alien.*message',
    ]),

    # EMERTHER CJ MESSAGES FULL TEXT
    ("Emerther Communication Full Text", [
        r'we are your creators.*altered.*evolution',
        r'truth will come.*protectors',
        r'eben sent threat.*embrace',
        r'evolutionary advancement.*combined survival',
        r'expose.*hidden.*knowledge.*all citizens',
        r'imminent.*threat.*soon.*earth.*leaders',
        r'beware.*orion.*1350.*z reticuli.*39',
        r'advancement imperative.*planetary survival',
        r'much pain.*still time',
    ]),

    # ELIZONDO IMMINENT
    ("Luis Elizondo 'IMMINENT' Connection", [
        r'elizondo.*imminent',
        r'luis elizondo.*imminent',
        r'"imminent".*elizondo.*book',
        r'elizondo.*something.*coming',
        r'elizondo.*book.*title.*imminent',
    ]),

    # SKINWALKER BIGELOW
    ("Skinwalker Ranch and NIDS — Bigelow Visit 2002", [
        r'skinwalker ranch',
        r'bigelow.*skinwalker',
        r'colm kelleher.*bigelow.*2002',
        r'roger leir.*bigelow',
        r'nids.*national institute.*discovery',
        r'bigelow.*aerospace.*baass',
    ]),

    # BERT JANSSEN TEMPLAR
    ("Bert Janssen Templar Cross Request Test — 2005", [
        r'bert janssen.*2005.*templar',
        r'janssen.*templar.*request',
        r'six templar cross.*request.*2005',
        r'janssen.*crop circle.*request',
    ]),

    # CROP CIRCLES AS SIGNS
    ("Crop Circles as Biblical 'Signs on Earth'", [
        r'angels.*making.*signs.*earth',
        r'crop circles.*signs.*earth.*christ',
        r'son of man.*crop.*sign',
        r'mark.*crop circle connector 2025',
    ]),

    # ORBS
    ("Orb-Sphere UAP Observation Devices", [
        r'orb.sphere.*et.*observation',
        r'buga.*orb.*sphere',
        r'orb.*sphere.*crop.*artist',
        r'buga.*orb.*five.*coil',
        r'buga.*orb.*ct.*scan',
        r'buga.*orb.*glyphs',
        r'jaime maussan.*buga',
        r'orb.*sphere.*comparison.*crop',
        r'buga.*sphere.*colombia',
        r'ct.*scan.*buga.*lunar crescent',
    ]),

    # NEW JERSEY DRONES
    ("New Jersey Drone Sightings — December 2024", [
        r'new jersey.*drone.*december.*2024',
        r'nj.*drone.*sightings',
        r'drone.*new jersey.*2024',
        r'lyme regis.*nj.*drone',
    ]),

    # BOB LAZAR 65 STEPS
    ("Bob Lazar — 65 Genetic Engineering Steps", [
        r'lazar.*65.*steps.*genetic',
        r'bob lazar.*65.*genetic',
        r'65 steps.*genetic.*engineering.*lazar',
        r'lazar.*said.*65.*steps.*monkey',
    ]),

    # ET GENETIC ENGINEERING
    ("ET Genetic Engineering of Humanity", [
        r'alien.*genetic.*engineering.*humanity',
        r'et.*genetic.*engineering.*humans',
        r'creator.*god.*selected.*abraham.*sarah',
        r'sarah.*embryo.*et.*genes',
        r'enki.*ninmah.*human.*creation',
        r'annunaki.*genetic.*creator',
        r'65 steps.*away from monkeys',
        r'genetic engineering.*millions.*years.*yahweh.*enki',
        r'annunaki.*blonde.*blue.*eyes',
        r'blue.eyed.*genetics.*et.*hybridization',
        r'created.*cross.*blue.eyed.*aliens',
        r'tuatha de danaan.*alien.*hybrid',
        r'dna double helix.*babylon',
        r'caduceus.*dna.*sumerian.*enki',
        r'enki.*lord.*earth.*ninmah',
        r'babylon.*temple.*dna',
        r'sumerian.*theology.*enki',
        r'yahweh.*prince.*emerther',
        r'enki.*eya.*genetic.*creator',
        r'aum.*symbol.*signature.*ea.*enki',
        r'yahweh.*enki.*distinction',
        r'genesis 18.*et',
        r'noah.*dead sea scrolls.*cat.*eyes',
        r'watchers.*dead sea scrolls.*genetic',
        r'guided.*genetic.*evolution.*sarah.*noah',
        r'lamech.*watchers.*genetic',
    ]),

    # DNA RESEARCH BACKGROUND
    ("Drew's DNA Research Background", [
        r'2.*5.*oligonucleotide.*background',
        r'2.*5.*oligo.*helical.*periodicity.*6',
        r'leslie orgel.*san diego.*2.*5',
        r'struther arnott.*polymorphism.*nucleic',
        r'frank drake.*arecibo.*reply.*fake.*6',
        r'dna structure.*textbook.*3 editions',
        r'dickerson dodecamer.*b.form.*dna',
        r'cgcgaattcgcg',
        r'dcgcgaattcgcg',
        r'curved.*dna.*2002.*crop.*cambridge',
        r'2.*5.*dna.*6.*nucleotides.*per.*turn',
        r'2.*5.*dna.*known.*2001',
    ]),

    # LITHIUM OROTATE
    ("Lithium Orotate, Blood-Brain Barrier, and Alzheimer's", [
        r'lithium orotate',
        r'alzheimer.*lithium',
        r'blood.brain barrier.*lithium',
        r'orotic acid.*lipophilic',
        r'lithium carbonate.*does not.*cross',
        r'orotate.*thymine.*hydrophobic',
        r'lithium.*brain.*deficiency',
        r'lithium.*orotate.*alzheimer',
        r'minocycline.*hydrophobic',
        r'minocycline.*tetracycline',
    ]),

    # DNA BASE-4 / QUATERNARY COMPUTING
    ("DNA Base-4 System and Quaternary Computing", [
        r'dna.*4 bases.*quaternary',
        r'quaternary computing.*dna.*four.*base',
        r'four.*nucleotide.*base.*quaternary',
        r'ac versus dc.*computing',
        r'quaternary.*software.*not.*quantum',
        r'four.symbol.*dna.*information',
        r'dna.*2 bases.*4 bases.*analogy',
    ]),

    # WHITLEY STRIEBER
    ("Whitley Strieber — Ontological Shock Quote", [
        r'whitley strieber',
        r'ontological shock',
        r'world.*overturned.*scientists',
        r'9 out of 10 scientists.*wrong',
        r'somebody here.*technologically superior',
    ]),

    # GALINSTAN / FERROLENS
    ("Galinstan, Ferrolens, and Lab Materials", [
        r'galinstan.*mercury.*substitute',
        r'galinstan.*eutectic.*gallium.*indium',
        r'galinstan.*density.*6,?440',
        r'ferrolens.*ferrofluid',
        r'ferrolens.*visualization',
        r'fe3o4.*ferrofluid',
        r'aluminum disc.*dc motor.*trial',
        r'dc motor.*trial.*3.phase.*real.*ufo',
        r'trial spin setup.*materials',
    ]),

    # ELECTROMAGNETIC INDUCTION HISTORICAL
    ("Electromagnetic Induction Historical Parallel", [
        r'electromagnetic induction.*1830.*faraday',
        r'faraday.*1831.*analogy.*ufo',
        r'discovery.*electromagnetic induction.*1800',
        r'faraday.*rotating.*magnetic.*fields',
    ]),

    # ZETA RETICULI / STAR DISTANCES
    ("Zeta Reticuli and Protector Race Navigation", [
        r'zeta reticuli.*39\.17',
        r'zeta reticuli.*binary.*star.*39',
        r'beware.*orion.*1350.*z reticuli',
        r'protector.*race.*12 light.year',
        r'emergency.*journey.*12 light.year',
        r'nearby.*spacetime.wormhole.*oort.*cloud',
        r'emerther.*12 light.years.*star',
        r'travel.*time.*zeta reticuli.*39',
    ]),

    # MARS LIFE
    ("Mars Life Imagery", [
        r'mars.*life.*imagery',
        r'nasa.*opportunity.*sol.*3954',
        r'mars.*biological.*structure.*rover',
        r'areo\.info.*mer.*opportunity',
    ]),

    # QUETZALCOATL / Q NARRATIVE
    ("Q, Quetzalcoatl, Trump, and 2027 Prediction", [
        r'q.*quetzalcoatl.*trump',
        r'djt.*is.*q\+',
        r'q.*is.*quetzal',
        r'quetzalcoatl.*feathered.*serpent.*et',
        r'billy meier.*quetzal.*sfath',
        r'q.*anon.*alien',
        r'trump.*right.hand.*q\+',
        r'q\+.*djt.*alien',
        r'2027.*eschatological',
        r'morning star.*2027.*autumn',
        r'first horseman.*2027',
        r'trump.*17.*q',
        r'q.*chose.*trump.*defend.*earth',
        r'q.*contact.*history.*2008',
        r'pleiadean.*plejaren.*dream',
    ]),

    # FLATLAND 4D 5D
    ("Flatland Analogy — ET 4D/5D Perception", [
        r'3.d.*flatland.*crop.*artist',
        r'flatland.*4.d.*or.*5.d',
        r'crop.*artists.*live.*4.d',
        r'3d.*flatland.*analogy',
    ]),

    # CERN RADAR ANOMALY
    ("CERN LHC / Mayan Heartland Radar Anomaly", [
        r'radar.*anomaly.*mayan.*heartland.*cern',
        r'cern.*collider.*crop.*picture.*2011',
        r'lhc.*crop.*circle.*ring',
        r'yucatan.*radar.*cern.*ring',
        r'radar.*anomaly.*cern.*geometry',
    ]),

    # INVERSE SQUARE LAW / UAP DEBUNKING
    ("UAP Debunking Tactics and Evidence Suppression", [
        r'debunking tactics.*uap',
        r'psychological tactics.*suppress.*uap',
        r'never saw.*what.*watched.*eyes',
        r'threaten.*arrest.*violence.*uap',
        r'intel scum.*linda howe',
        r'sock.puppets.*disinformation',
        r'practically.*zero.*scientists.*natural.*comet',
    ]),

    # NORMAN PAULSEN
    ("Norman Paulsen UFO Contactee Account", [
        r'norman paulsen.*ufo',
        r'paulsen.*counter.rotating',
        r'paulsen.*1970.*saucer.*mechanism',
        r'paulsen.*12.*magnets.*ufo',
        r'norman paulson.*9 coils.*12.*magnets',
        r'paulsen.*given.*ride.*saucer',
    ]),

    # EDWIN FUHR
    ("Edwin Fuhr UFO Sighting — Canada 1974", [
        r'edwin fuhr',
        r'fuhr.*1974.*langenburg',
        r'fuhr.*rapeseed.*swirling',
        r'fuhr.*five.*silver.*disc',
        r'fuhr.*canada.*1974',
    ]),

    # COUNTER-ROTATING EYEWITNESS
    ("Eyewitness Account: Counter-Rotating UAP Object", [
        r'counterclockwise.*grass.*clockwise',
        r'grass.*moving.*one way.*machine.*other',
        r'15 feet.*counter.*rotating.*uap',
        r'instinct.*back up.*counterclockwise',
        r'counter.*rotating.*eyewitness',
    ]),

    # TEACHING 3-PHASE
    ("Teaching Lesson: 3-Phase Ball Magnet Spin", [
        r'teaching lesson.*3.phase.*ball.*magnet',
        r'spin.*baby.*spin.*ball.*magnet',
        r'3.phase.*rotating.*magnetic.*field.*ball.*magnet.*teaching',
    ]),

    # PERSONAL COMMUNICATIONS WITH ETS
    ("Personal Communications with ETs and Contactees", [
        r'friendly aliens.*drew.*guided',
        r'guided by.*contactees.*crop.*pictures.*propulsion',
        r'charles.*slide.*2.*ball.*light.*15 minutes',
        r'e\.t\..*friends.*crop.*technical.*diagram',
        r'shown.*pole.ball.*device.*dream',
        r'dream.*showed.*device.*ufo.*levitation',
        r'60 years.*know.*extraterrestrial.*exist',
    ]),

    # WASHINGTON DC 1952
    ("Washington D.C. UFO Wave 1952 (Eisenhower Timeline)", [
        r'washington.*ufo.*1952',
        r'1952.*radar.*washington.*blips',
        r'saucer.*outran.*jet.*1952',
    ]),

    # 2D 5D SPACETIME EXTRA-DIMENSIONAL
    ("Extra-Dimensional Physics and UAP Transit", [
        r'interdimensional.*uap.*transit',
        r'spacetime wormhole.*et.*transit',
        r'wormhole.*crop.*formation',
    ]),

    # PERSONAL TRAVEL (keep minimal unique content)
    ("Personal Travel Notes", [
        r'katoomba falls',
        r'leura.*new south wales',
        r'macao.*photo',
        r'winter.*australia',
        r'fishing.*moffat beach',
    ]),

    # OTHER / MISCELLANEOUS
    ("Miscellaneous Observations and Commentary", [
        r'.*',  # Catch-all — always last
    ]),
]

# Compile patterns for efficiency
COMPILED_CATEGORIES = []
for cat_name, patterns in TOPIC_CATEGORIES:
    compiled = [re.compile(p, re.IGNORECASE | re.DOTALL) for p in patterns]
    COMPILED_CATEGORIES.append((cat_name, compiled))

def categorize_entry(heading, text):
    """Assign an entry to a category based on heading + body content."""
    combined = heading + '\n' + text[:800]

    for cat_name, patterns in COMPILED_CATEGORIES:
        for pattern in patterns:
            if pattern.search(combined):
                return cat_name
    return "Miscellaneous Observations and Commentary"

# Entries to skip entirely
SKIP_PATTERNS_COMPILED = [re.compile(p, re.IGNORECASE | re.DOTALL)
                           for p in [
    r'no physics content',
    r'no uap.*content',
    r'no scientific.*content',
    r'political commentary.*no',
    r'australian politics',
    r'australian multiculturalism',
    r'sarcastic political response',
    r'einstein not muslim',
    r'response to elon musk.*daniel',
    r'ecclesiastes.*neither.*toil',
    r'consider the lilies',
    r'he has made everything beautiful',
    r'pagination.*artifact',
    r'pagination file.*twitter api',
    r'page_\d+\.json.*navigation.*json',
    r'no audio stream.*video.only',
    r'animated gif.*no audio',
    r'smells like ice.*mr carey.*pooh',  # Garbled whisper
    r'so.*so.*so.*background audio.*only',
    r'whisper model.*hallucination',
    r'single word.*you.*artifact',
    r'inaudible.*irrelevant',
    r'i.*think.*we.*should.*call.*it.*silver',  # Minimal transcription
    r'transcription.*garbled',
    r'only.*\[no audio',
    r'video.only file.*nothing.*transcribe',
    r'"the end".*_mr_pool.*period',
    r'thank you.*15 dead.*australia',
    r'no new content beyond.*retweet.*of own post',
    r'non.physics content',
    r'no direct.*physics',
    r'storm photo.*personal.*no physics',
    r'reply to.*gregorylent.*banal.*emoji',
    r'crop circle.*aesthetic argument.*no physics',
]]

def should_skip(heading, text):
    combined = heading + '\n' + text[:500]
    for pattern in SKIP_PATTERNS_COMPILED:
        if pattern.search(combined):
            return True
    return False

def main():
    print("Phase 4+5 (v2): Reading CONCAT_FILE...")
    text = read_file(CONCAT_FILE)
    print(f"  File size: {len(text):,} bytes")

    print("Stripping source separators and boilerplate...")
    clean = strip_source_separators(text)

    print("Splitting into atomic entries...")
    entries = split_into_entries(clean)
    print(f"  Total entries found: {len(entries)}")

    print("Filtering skip entries...")
    filtered = [(h, t) for h, t in entries if not should_skip(h, t)]
    print(f"  After filtering: {len(filtered)}")

    print("Deduplicating entries...")
    deduped = deduplicate_entries(filtered)
    print(f"  After deduplication: {len(deduped)}")

    print("Categorizing entries...")
    categorized = {}  # cat_name -> list of (heading, text)
    cat_order = []
    skip_count = 0

    for heading, text in deduped:
        cat = categorize_entry(heading, text)
        if cat == "__SKIP__":
            skip_count += 1
            continue
        if cat not in categorized:
            categorized[cat] = []
            cat_order.append(cat)
        categorized[cat].append((heading, text))

    print(f"  Skipped additional {skip_count} entries")
    print(f"  Categories used: {len(categorized)}")
    for cat in cat_order:
        print(f"    [{len(categorized[cat])} items] {cat}")

    print("Building Phase 4 output (TEMP_FILE)...")

    # Define desired output order
    output_order = [
        "Author Profile and Credentials",
        "Personal UFO Sighting — 1965 Florida",
        "Personal Safety Claims and Ear Implant",
        "Personal Communications with ETs and Contactees",
        "Crop Circle Evidence for Non-Human Origin",
        "Crop Circle Formation Physics",
        "Barbury Castle 1991 Crop Circle",
        "1998–1999 England Crop Circle Series — UFO Drive Diagrams",
        "2005 England Crop Pictures — Comet Holmes and Mayan Encoding",
        "2012 England Crop Circles — Device Specifications",
        "Culliford Tree Barrow Crop Circle — May 2025",
        "Lyme Regis Crop Circle — June 28, 2025",
        "Ipuaçu, Brazil Crop Circles",
        "Silbury Hill / Quetzalcoatl Headdress — 2007 and 2009",
        "Avebury 2014 Crop Circle",
        "Roundway 2010 Crop Circle — Five-Phase Power",
        "Spinning Vortex 2018 Crop Picture",
        "2018 Crop Picture — Spinning Vortex",
        "Other Specific Crop Circle Formations",
        "Chilbolton 2001 Arecibo Reply Crop Picture",
        "Crabwood 2002 Crop Circle — Binary ASCII Message",
        "Pi Crop Circle 2008",
        "Tawsmead Copse 2022 Crop Circle — Wormhole Topology",
        "Crop Circle Binary Encoding",
        "Four-Symbol Alien Code and DOD Visits",
        "Euler's Identity in ET Communication",
        "Kruskal Coordinates / Wormhole in Crop Formations",
        "Crop Circles as Simultaneous Equation System",
        "Fractal Antenna Communication Technology",
        "Mayan Calendar, Venus Cycles, and Crop Circle Encoding",
        "Comet 17P/Holmes Outburst — Crop Picture Prediction",
        "3I/ATLAS — Overview and Key Claims",
        "3I/ATLAS — Optical Characteristics and Imaging",
        "3I/ATLAS — Data Suppression and Cover-Up",
        "3I/ATLAS — Wormhole Deployment Hypothesis",
        "3I/ATLAS — EBEN Space Vessel Threat Hypothesis",
        "Emerther Alien Faction",
        "EBEN Grey Alien Faction",
        "Eisenhower 1954 Meeting with Aliens",
        "Washington D.C. UFO Wave 1952",
        "US Military Contactee 'CJ' Messages",
        "Emerther Communication Full Text",
        "Luis Elizondo 'IMMINENT' Connection",
        "Bert Janssen Templar Cross Request Test — 2005",
        "Crop Circles as Biblical 'Signs on Earth'",
        "Orb-Sphere UAP Observation Devices",
        "New Jersey Drone Sightings — December 2024",
        "Bob Lazar — 65 Genetic Engineering Steps",
        "ET Genetic Engineering of Humanity",
        "Skinwalker Ranch and NIDS — Bigelow Visit 2002",
        "Q, Quetzalcoatl, Trump, and 2027 Prediction",
        "Whitley Strieber — Ontological Shock Quote",
        "UAP Debunking Tactics and Evidence Suppression",
        "Historical UAP Incidents and Witness Accounts",
        "Norman Paulsen UFO Contactee Account",
        "Edwin Fuhr UFO Sighting — Canada 1974",
        "Eyewitness Account: Counter-Rotating UAP Object",
        "New Jersey Drone Sightings — December 2024",
        "Zeta Reticuli and Protector Race Navigation",
        "Mars Life Imagery",
        "CERN LHC / Mayan Heartland Radar Anomaly",
        "Flatland Analogy — ET 4D/5D Perception",
        "Electromagnetic Induction Historical Parallel",
        "Teaching Lesson: 3-Phase Ball Magnet Spin",
        "Galinstan, Ferrolens, and Lab Materials",
        "Lithium Orotate, Blood-Brain Barrier, and Alzheimer's",
        "DNA Base-4 System and Quaternary Computing",
        "Drew's DNA Research Background",
        "Extra-Dimensional Physics and UAP Transit",
        "Buga Sphere Details",
        "Personal Travel Notes",
        "Australian Politics and Social Commentary",
        "Miscellaneous Observations and Commentary",
    ]

    # Add any categories found but not in the explicit order
    for cat in cat_order:
        if cat not in output_order:
            output_order.append(cat)

    parts = [HEADER]
    seen_cats = set()

    for cat_name in output_order:
        if cat_name in seen_cats:
            continue
        if cat_name not in categorized:
            continue
        seen_cats.add(cat_name)

        entries_for_cat = categorized[cat_name]
        if not entries_for_cat:
            continue

        parts.append(f"---\n\n## {cat_name}\n\n")

        # Within-category dedup: skip entries with >60% body overlap to already-written entries
        written_bodies = []

        for heading, text in entries_for_cat:
            # Get body words (skip heading line)
            body_lines = [l for l in text.split('\n')[1:] if l.strip()]
            body_text = ' '.join(body_lines[:8]).lower()
            body_words = set(w for w in re.sub(r'[^\w]', ' ', body_text).split() if len(w) > 4)

            is_dup = False
            for wb in written_bodies:
                if body_words and wb:
                    overlap = len(body_words & wb) / min(len(body_words), len(wb))
                    if overlap > 0.60:
                        is_dup = True
                        break

            if not is_dup:
                written_bodies.append(body_words)
                # Clean up the heading - remove leading '#' markers
                heading_clean = re.sub(r'^#+\s*', '', heading).strip()
                # Clean up source references in text
                entry_clean = text
                # Remove leading source/yaml references from body
                entry_clean = re.sub(r'^Source:.*?\.yaml.*$', '', entry_clean, flags=re.MULTILINE)
                entry_clean = re.sub(r'^---\s*$', '', entry_clean, flags=re.MULTILINE)
                entry_clean = re.sub(r'\n{3,}', '\n\n', entry_clean)

                if heading_clean:
                    parts.append(f"### {heading_clean}\n\n")
                parts.append(entry_clean.strip())
                parts.append("\n\n")

    output = ''.join(parts)

    # Final cleanup
    output = re.sub(r'\n{4,}', '\n\n\n', output)

    write_file(TEMP_FILE, output)
    print(f"  TEMP_FILE: {len(output):,} bytes, {output.count(chr(10)):,} lines")

    # Phase 5: Final polish
    print("Phase 5: Final polish...")
    final = output

    # Ensure no Source separators remain
    final = re.sub(r'--- Source: \d+/\d+ ---\n?', '', final)
    # Remove any remaining file path artifacts
    final = re.sub(r'\*\*Generated from END_DIR:\*\*.*?\n', '', final)
    final = re.sub(r'Generated from END_DIR:.*?\n', '', final)
    # Clean up excessive blank lines
    final = re.sub(r'\n{4,}', '\n\n\n', final)
    # Ensure proper header
    if not final.startswith('# overall_other'):
        final = HEADER + final

    write_file(FINAL_FILE, final)
    print(f"  FINAL_FILE: {len(final):,} bytes, {final.count(chr(10)):,} lines")

    print("\nPhase 4+5 complete for overall_other.mdx. Final file written.")

if __name__ == "__main__":
    main()
