#!/usr/bin/env python3
"""
Phase 4 + Phase 5: Deduplication of overall_other.mdx
Reads the 100-section concatenated file, deduplicates by semantic topic,
writes TEMP_FILE (Phase 4) then FINAL_FILE (Phase 5).
"""

import re
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

def split_into_sections(text):
    """
    Split raw text into the 100 source blocks delimited by '--- Source: N/M ---'
    Returns a list of (source_label, content) tuples.
    """
    # Split on the separator pattern
    parts = re.split(r'\n?--- Source: \d+/\d+ ---\n?', text)
    # First part before any separator may be empty
    sections = []
    for part in parts:
        stripped = part.strip()
        if stripped:
            sections.append(stripped)
    return sections

def extract_subsections(block_text):
    """
    Extract named subsections from a block.
    Subsections start with ## or ### headings.
    Returns list of (heading, body) tuples.
    """
    lines = block_text.split('\n')
    subsections = []
    current_heading = None
    current_body = []

    for line in lines:
        # Match ## or ### level headings (but not # title at top)
        if re.match(r'^#{2,3} ', line):
            if current_heading is not None:
                subsections.append((current_heading, '\n'.join(current_body).strip()))
            current_heading = line
            current_body = []
        elif re.match(r'^# ', line) and not current_heading:
            # Top-level title — treat as preamble
            current_body.append(line)
        else:
            current_body.append(line)

    if current_heading is not None:
        subsections.append((current_heading, '\n'.join(current_body).strip()))
    elif current_body:
        # Block with no subsection headers — treat as single unit
        body = '\n'.join(current_body).strip()
        if body:
            subsections.append(("__PREAMBLE__", body))

    return subsections

def normalize_key(text):
    """
    Create a normalized key from heading text for deduplication comparison.
    Lowercases, removes punctuation, collapses whitespace.
    """
    text = text.lower()
    text = re.sub(r'[^\w\s]', ' ', text)
    text = re.sub(r'\s+', ' ', text).strip()
    return text

def compute_topic_key(heading, body_snippet):
    """
    Build a topic key that captures the essential topic of a subsection.
    Uses heading + first 100 chars of body.
    """
    h_norm = normalize_key(heading)
    # Extract significant words from heading (skip common stopwords)
    stopwords = {'the','a','an','of','in','on','at','to','and','or','for','with','by',
                 'from','is','are','was','were','be','this','that','it','its','as',
                 'section','source','sources','overview','context','background','other',
                 'content','claims','all','not','no','non'}
    words = [w for w in h_norm.split() if w not in stopwords and len(w) > 2]
    key = ' '.join(words[:8])  # First 8 significant words
    return key

def deduplicate_sections(sections):
    """
    Main deduplication logic.

    Strategy:
    1. Parse all sections into subsections.
    2. Build a topic registry keyed by normalized heading.
    3. For each subsection: if its key hasn't been seen, add it.
       If seen, keep the longer/more complete version.
    4. Some topics need special handling to merge unique details.
    """

    # Registry: topic_key -> (heading, body, source_context)
    # We keep the best (longest/most complete) version of each topic
    registry = {}  # topic_key -> {'heading': str, 'body': str, 'length': int, 'source': str}

    # Ordered list to maintain reading order of first occurrence
    ordered_keys = []

    # Sections that are purely boilerplate/metadata to skip
    skip_patterns = [
        r'^page_\d+\.json',
        r'pagination artifact',
        r'pagination file',
        r'no physics content',
        r'political commentary.*no physics',
        r'political/social commentary',
        r'no uap or physics content',
        r'no new content beyond',
        r'this file was listed.*metadata',
        r'empty.*nothing to transcribe',
        r'no audio stream',
        r'garbled transcription',
        r'whisper.*hallucination',
        r'garbled.*whisper',
        r'transcription artifact',
        r'single word.*you.*artifact',
    ]
    skip_re = re.compile('|'.join(skip_patterns), re.IGNORECASE)

    # Headings that are metadata-only boilerplate
    meta_headings = {
        '__preamble__',
        'pagination file',
        'no physics content extracted',
        'animated gif no audio stream',
        'minimal transcriptions single word',
        'garbled transcription spinning top video',
        'inaudible irrelevant video',
    }

    for block_num, block in enumerate(sections):
        subsections = extract_subsections(block)

        for heading, body in subsections:
            # Skip empty bodies
            if not body or len(body) < 20:
                continue

            # Skip boilerplate / junk
            combined = (heading + ' ' + body[:200]).lower()
            if skip_re.search(combined):
                continue

            heading_norm = normalize_key(heading)
            if heading_norm in meta_headings:
                continue

            # Build topic key
            topic_key = compute_topic_key(heading, body[:100])

            if not topic_key or len(topic_key) < 3:
                # Fall back to first 60 chars of body as key
                topic_key = normalize_key(body[:60])

            # Check if we've seen this topic before
            if topic_key in registry:
                existing = registry[topic_key]
                # Keep the longer/more complete version
                if len(body) > existing['length']:
                    registry[topic_key] = {
                        'heading': heading,
                        'body': body,
                        'length': len(body),
                    }
                # else keep existing
            else:
                registry[topic_key] = {
                    'heading': heading,
                    'body': body,
                    'length': len(body),
                }
                ordered_keys.append(topic_key)

    return registry, ordered_keys

def group_into_sections(registry, ordered_keys):
    """
    Group the deduplicated subsections into logical top-level sections.
    Uses keyword matching to assign subsections to categories.
    """

    # Category definitions: (category_name, list of keywords)
    categories = [
        ("Author Profile and Credentials", [
            'author profile', 'credentials', 'caltech', 'mrc lmb', 'horace drew',
            'phd x-ray', 'molecular biology', 'institutional affiliation',
            'researcher identity', 'twitter followers', 'profile description',
            'red collie', 'redcollie'
        ]),
        ("Personal UFO Sighting and Attacks", [
            'personal ufo sighting', 'silver saucer', '1965 florida', '1965 sighting',
            'ufo sighting 1965', 'saw silver saucer', 'personal sighting',
            'close range daylight', 'personal uap sighting',
            'attacked unknown entity', 'attack 2021', 'ear implant', 'implant right ear',
            'personal safety suppression', 'suppression claims personal'
        ]),
        ("Crop Circle Evidence for Non-Human Origin", [
            'evidence against human construction', 'non human construction',
            'crop circle authenticity', 'authentic vs fake', 'physical criteria',
            'netherlands 2009 formation', 'milk hill 2001', 'east field july 7 2007',
            'winston keech', 'paul jacobs finding', 'tramlines criterion',
            'crop standing on tramlines', 'crop circle physics formation',
            'spin counter spin creation', 'global distribution 26 countries',
            'sheets lightning 300 meter', 'sheet lightning formation',
            'no heat signatures', 'infrared negative result'
        ]),
        ("Crop Circle Physics of Formation Mechanism", [
            'crop circle physics formation', 'spin and counter-spin',
            'how crop circles are created', 'swirled', 'spin vortex lifted',
            'creation mechanism', 'rotating magnetic field creation'
        ]),
        ("Specific Crop Circle Formations", [
            'barbury castle 1991', 'july 2012 crop pictures device',
            'may 1999 crop pictures six', '1999 crop pictures six formations',
            'brazil 2024 2025 2016', 'spinning vortex 2018', 'culliford tree barrow',
            'dorset may 18 2025', 'lyme regis crop circle june 28 2025',
            'lyme regis 2025', 'ipuacu brazil', 'brazil crop circle ipuacu',
            'hackpen hill 2021', 'metatron cube sugar hill august 2007',
            'metatron cube 2007', 'silbury hill august 2009',
            'arecibo reply chilbolton 2001', 'chilbolton 2001 arecibo',
            'crabwood 2002', 'crabwood farm binary', '1998 crop circle sequence',
            'august 1998 crop pictures', '1998 1999 crop pictures',
            '1999 crop pictures dc current lorentz',
            'two 1999 crop pictures', 'roundway 2010',
            '2014 avebury crop', 'avebury 2014', 'august 2014 avebury',
            'wayland smithy 2005', 'lane end down 2005',
            'frieding germany 2025', 'frieding july 20 2025',
            'comet exploding crop 2005', '2005 crop picture comet',
            '2025 german crop picture', 'lyme regis 2025 crop six coils',
            'quetzalcoatl headdress july 5 2009', 'july 5 2009 silbury hill',
            'pi crop circle 2008', 'disco colgante 2008',
            'crop circles teach ufo physics', 'jesus christ face 2010',
            'two crop pictures precisely superimposed', 'avebury 2014 westwoods 2007',
            'crop circles simultaneous equation', 'hexagonal ufo correlation ipuacu',
            'california sighting april 25 hexagonal', 'spinning diamond medellin',
            'spinning top diagram barbury', '1929 spinning top barbury',
            'six coils central spinning crop 1998 2014 2007'
        ]),
        ("Crop Circle Encoding Systems", [
            'binary encoding crop circles', 'binary encoded ascii', 'binary coding system',
            '4 symbol alien code', 'four symbol alien code', 'dod knowledge alien code',
            'quaternary computing dna analogy', 'alien 4 symbol code dod',
            'return coded 0000 1101', 'ring 26 27 binary',
            'crabwood 2002 binary code', 'binary ascii crabwood',
            'base 16 mayan symbols', 'base 16 et coded messages',
            'mayan calendar encoded crop', 'euler identity crop formations',
            'kruskal coordinates crop', 'crop circle encoded prediction 6 spike 10 spike',
            'fractal space antenna symbolism', 'fractal antenna crop pictures',
            'crop pictures teach ufo physics',
            'five thin lines five phase power', 'five phase ac roundway',
            'alien face head antenna coil', 'ufo coil architecture crop pictures',
            'dickerson dodecamer dna reference', 'dcgcgaattcgcg',
            'two crop pictures superimposed 2014 2007'
        ]),
        ("Mayan Calendar and Astronomical Encoding", [
            'mayan venus calendar', 'mayan calendar cycle 18980',
            '18980 day mayan venus calendar', 'mayan calendar round',
            'venus calendar et contact', 'mayan calendar base 16',
            'mayan calendar astronomical encoding', 'el caracol observatory',
            'calendar round 52 year cycle', 'mayan calendar delta 20 year',
            '20 year crop picture sequence', 'wayland smithy comet holmes mayan',
            'mayan long count', 'mayan symbols crop encoding'
        ]),
        ("Comet 17P Holmes Prediction", [
            'comet 17p holmes', 'holmes outburst 2007', 'holmes predictive claim',
            'comet holmes prediction', '17p holmes october 2007',
            'november 20 2007 conjunction', 'crop pictures predicted holmes',
            'crop picture 2005 comet 2007', 'comet exploding 2005 crop',
            'toni scarmato calabria', 'comet lemmon vs 3i atlas'
        ]),
        ("3I/ATLAS Interstellar Object", [
            '3i atlas', '3i/atlas', 'interstellar object 3i', 'atlas interstellar',
            'trajectory analysis 3i', '3i/atlas optical', '3i atlas image',
            '3i atlas shiny sphere', '3i atlas anti-tail', 'anti-tail persistence',
            '3i atlas not comet', '3i atlas seti irrelevance',
            '3i atlas nasa hiding', 'nasa hiding 3i', '3i atlas video suppression',
            '3i atlas october 2025', '3i atlas mars flyby',
            '3i atlas threat assessment', '3i atlas image suppression',
            '3i atlas orbital mechanics perihelion', '3i atlas loeb discussion',
            'interstellar object atlas', '3i/atlas photometric tail',
            'avi loeb 3i atlas', 'avi loeb quote scientific denial',
            'nickel alloy 3i atlas', 'green glow nickel 3i',
            '3i atlas thrusters six jets', '3i atlas practically zero',
            'ray astrophotography 3i', 'leaked photograph 3i',
            '3i atlas jwst image controversy', 'phobos size comparison 3i',
            'outburst comet holmes vs 3i'
        ]),
        ("ET Factions and Alien Groups", [
            'emerthere', 'emerther', 'emerther council', 'emerther warning',
            'eben threat', 'eben sent threat', 'alien faction claims',
            'council of five', 'grey alien eben', 'friendly alien group',
            'emerthere message fragments', 'emerther message', 'eben adversarial',
            'grey ebens adversarial', 'grey aliens orion zeta reticuli',
            'alien moral classification', 'et good evil framing',
            'annunaki', 'annunaki enki', 'yahweh vs enki',
            'pleiadean plejaren', 'buga sphere colombia',
            'orb sphere crop circle', 'orb sphere buga',
            'identification crop circle makers', 'who makes crop circles'
        ]),
        ("Alien Communication via Military Contactee CJ", [
            'alien coded message decoding military contactee',
            'cj alien coded', 'us military contactee cj',
            'military contactee cj', 'emerther communication cj',
            'imminent coded message', 'elizondo imminent', 'luis elizondo imminent',
            'emerther warning cj', 'binary encoding cj', 'four symbol cj',
            'beware orion 1350', 'z reticuli 39170', 'zeta reticuli distance',
            'evolutionary advancement imperative', 'expose hidden knowledge',
            'full text emerther communication', 'emerther warning full text',
            'dod visits jeremy weeks', 'jeremy weeks dod',
            'encoded message imminent', 'scif discussion contactee',
            'encoded message beware bearers false gifts',
            'beware bearers false gifts'
        ]),
        ("Crop Circle Witness Requests and Responses", [
            'bert janssen request test 2005', 'templar cross request',
            'six templar crosses', 'janssen request',
            'angels signs earth biblical', 'crop circles signs on earth',
            'angels making signs', 'crop circles as signs'
        ]),
        ("Skinwalker Ranch and NIDS", [
            'bigelow aerospace skinwalker', 'skinwalker ranch',
            'colm kelleher bigelow', 'roger leir', 'nids',
            'bigelow personal visit 2002'
        ]),
        ("Bob Lazar and 65 Genetic Steps", [
            'bob lazar reference', 'bob lazar 65 steps', 'lazar genetic engineering',
            'alien genetic engineering bob lazar', '65 steps genetic',
            '65 genetic engineering', 'lazar said 65 steps'
        ]),
        ("DNA and ET Genetic Engineering of Humanity", [
            'alien genetic engineering humanity', 'et genetic engineering',
            'genetic engineering hypothesis', 'creator god selected abraham',
            'abraham sarah genetic upgrade', 'genesis 18 et',
            'enki ninmah human creation', 'annunaki genetic creator',
            'blue eyed genetics et hybridization', 'blonde red hair annunaki',
            'dna double helix babylon', 'pre modern dna knowledge',
            'babylon dna temple', 'caduceus dna helix sumerian',
            'sumerian theology enki ninmah', 'enki lord earth',
            'enki eya genetic creator', 'yahweh emerthere prince',
            'yahweh enki distinction', 'aum symbol signature ea enki',
            'dream revealed device design'
        ]),
        ("Q Anon Quetzalcoatl Trump Narrative", [
            'q and quetzalcoatl', 'quetzalcoatl et contact', 'q djt alien',
            'q is quetzal', 'quetzalcoatl et visitor', 'billy meier quetzal sfath',
            'trump q alien', 'q anon alien', 'first horseman 2027',
            'morning star q', '2027 eschatological prediction',
            'eschatological religious statement', 'q contact history',
            'q crop pictures 2008', 'trump q plus'
        ]),
        ("Whitley Strieber and Scientific Paradigm Shock", [
            'whitley strieber', 'ontological shock', 'scientific paradigm shock',
            'strieber quote', 'world being overturned',
            'somebody here technologically superior'
        ]),
        ("Suppression of UAP Evidence and Physics Research", [
            'personal safety suppression claims', 'suppression of uap evidence',
            'cover up uap', 'fierce violent cover up',
            'trial of galileo', 'nothing changed galileo',
            'uap debunking tactics', 'debunking tactics',
            'three body problem liu cixin', 'aliens kill frontier physicists',
            'suppress frontier physicists', 'et friends sent to australia lab',
            'avi loeb scientific denial'
        ]),
        ("Historical UAP Incidents and Witness Accounts", [
            'edwin fuhr ufo contact', 'fuhr canada 1974', 'fuhr rapeseed',
            'counter rotating uap eyewitness', 'eyewitness counter rotating',
            'spinning counterclockwise grass clockwise',
            'norman paulsen ufo', 'paulsen rode saucer', 'paulsen 1970',
            'paulsen 12 magnet', 'norman paulsen 12 magnet',
            'spinning diamond medellin colombia june 2020',
            'uap sighting spinning diamond medellin',
            'portal wormhole cgi visualization', 'kruskal coordinates wormhole crop',
            'wormhole spacetime crop formation', 'entering spacetime wormhole'
        ]),
        ("New Jersey Drones December 2024", [
            'new jersey drone sightings december 2024', 'new jersey drones',
            'nj drone sightings', 'nj drone december 2024'
        ]),
        ("Flatland 4D 5D ET Perception", [
            'flatland 4d 5d spacetime', '3d flatland', 'crop artists live 4d 5d',
            'flatland analogy', 'four dimensional five dimensional'
        ]),
        ("Euler Identity and Mathematical Encoding in Crop Circles", [
            'euler identity crop', 'euler identity et', 'euler identity 3d thinking',
            'nasa astronaut monkey euler', 'euler identity universal language'
        ]),
        ("Electromagnetic Induction Historical Parallel", [
            'electromagnetic induction historical', 'faraday discovery analogy',
            'electromagnetic induction 1800 analogy', 'faraday 1831 analogy'
        ]),
        ("Edwin Fuhr UFO Sighting Canada 1974", [
            'edwin fuhr', 'fuhr 1974', 'fuhr sighting'
        ]),
        ("Galinstan and Experimental Materials", [
            'galinstan mercury substitute', 'galinstan eutectic',
            'galinstan density', 'galinstan lorentz',
            'ferrofluid ferrolens', 'ferrolens visualization',
            'liquid metal propulsion galinstan',
            'trial spin setup materials', 'aluminum disc dc motor',
            'spin vortex video experiment', 'hackpen hill authentication',
            'lab experiment spin vortex video'
        ]),
        ("Lithium Orotate Biochemistry and Alzheimer's", [
            'lithium orotate', 'alzheimer', 'blood brain barrier',
            'lithium carbonate', 'orotic acid', 'orotate hydrophobic',
            'lithium deficiency brain', 'lithium orotate alzheimers',
            'biochemistry neuroscience lithium', 'minocycline pharmacology',
            'minocycline hydrophobic', 'drug biodistribution hydrophobic'
        ]),
        ("DNA Base-4 and Quaternary Computing", [
            'dna base 4 system', 'quaternary computing dna', 'four base dna analog',
            'dna four nucleotide', 'four symbol dna alphabet',
            'quaternary computing software', 'base 4 computing dna',
            'ac versus dc computing', 'quaternary computing ac dc',
            'four base information density', 'dna base 4 quaternary',
            'cgcgaattcgcg dickerson dodecamer', 'dickerson dodecamer dna'
        ]),
        ("Drew's DNA Research Background", [
            '2 5 oligonucleotide', 'dna structure research background',
            '2 5 oligo helical periodicity', 'helical periodicity',
            'leslie orgel san diego', 'frank drake arecibo reply fake',
            'struther arnott polymorphism nucleic acids',
            'dna curved crop picture', 'curved dna england 2002',
            'cambridge curved dna seminar', 'dickerson dodecamer reference'
        ]),
        ("Zeta Reticuli and Star Distances", [
            'zeta reticuli distance', 'zeta reticuli 39 light years',
            'beware orion 1350 z reticuli', 'travel time zeta reticuli',
            'protector race 12 light year', '12 light year journey',
            'spacetime wormhole navigation', 'nearby spacetime wormhole networks',
            'emerthere 12 light years star', 'stars within 12 light years'
        ]),
        ("Mars Life and Imagery", [
            'mars life imagery', 'nasa opportunity rover sol 3954',
            'mars biological structures', 'mars life pets'
        ]),
        ("Arecibo Reply Crop Picture 2001", [
            'arecibo reply crop 2001', 'arecibo reply chilbolton', 'arecibo reply analysis',
            'chilbolton 2001 arecibo', 'chilbolton radio telescope 2001',
            'arecibo reply alien figure', 'emerthers arecibo', 'chilbolton 1999 2000 2001'
        ]),
        ("CERN Mayan Radar Anomaly", [
            'radar anomaly mayan heartland cern', 'cern collider mayan radar',
            'cern crop picture 2011', 'lhc ring crop circle', 'radar anomaly cern'
        ]),
        ("Travel and Personal Content", [
            'katoomba falls video', 'katoomba falls', 'leura video personal',
            'macao photo', 'winter australia video', 'fishing moffat beach',
            'personal travel content', 'storm photo personal'
        ]),
        ("Suppression of Physicists — Three Body Problem", [
            'three body problem liu cixin', 'aliens track kill physicists',
            'bush administration chinese sci fi', 'alien suppress scientists',
            'e.t. friends australia lab work'
        ]),
        ("Comet 3I/ATLAS and Wormhole Deployment Hypothesis", [
            '3i atlas wormhole deployment', 'release payload 3i atlas sun',
            'blind spot sun deployment', 'stealth deployment hypothesis 3i',
            'small spaceships docked 3i atlas', 'detach solar occultation'
        ]),
        ("Buga Sphere Details", [
            'buga sphere colombia', 'buga orb sphere', 'ct scan buga',
            'buga sphere five lunar crescent', 'buga orb five coils',
            'buga orb glyphs', 'jaime maussan buga'
        ]),
        ("Teaching Lesson 3-Phase Ball Magnet Spin", [
            'teaching lesson 3-phase ball magnet', 'teaching lesson 3 phase',
            'spin baby spin ball magnet', 'lyme regis teaching 3 phase'
        ]),
        ("Australian Politics and Social Commentary", [
            'australian politics comment', 'australian multiculturalism',
            'einstein not muslim', 'sarcastic political', 'response elon musk daniel',
            'uk politics comment', 'political commentary uk'
        ]),
        ("Other Miscellaneous Non-Physics Content", [
            'religious philosophical quotes', 'ecclesiastes citations',
            'crop circle aesthetic argument banal', 'crop circles banal',
            'consider lilies field', 'response mr pool', 'angels theological',
            'reply to mr pool', 'sirona healing goddess',
            'first horseman revelation', 'white horse revelation'
        ]),
    ]

    # Build a lookup from normalized key to category
    cat_lookup = {}
    for cat_name, keywords in categories:
        for kw in keywords:
            cat_lookup[normalize_key(kw)] = cat_name

    def assign_category(topic_key, heading, body_snippet):
        """Find which category a topic belongs to."""
        combined = normalize_key(heading + ' ' + body_snippet[:200])
        # Direct keyword match
        for kw_norm, cat_name in cat_lookup.items():
            if kw_norm in combined:
                return cat_name
        # Fallback: look for category names in content
        return "Other Content"

    # Group subsections by category
    cat_contents = {}  # category_name -> list of (heading, body)
    cat_order = []  # track first appearance order

    for topic_key in ordered_keys:
        entry = registry[topic_key]
        heading = entry['heading']
        body = entry['body']
        body_snippet = body[:300]

        cat = assign_category(topic_key, heading, body_snippet)

        if cat not in cat_contents:
            cat_contents[cat] = []
            cat_order.append(cat)
        cat_contents[cat].append((heading, body))

    return cat_contents, cat_order

def render_output(cat_contents, cat_order, header):
    """Render the final organized output."""
    parts = [header]

    # Define the preferred section order
    preferred_order = [
        "Author Profile and Credentials",
        "Personal UFO Sighting and Attacks",
        "Crop Circle Evidence for Non-Human Origin",
        "Crop Circle Physics of Formation Mechanism",
        "Specific Crop Circle Formations",
        "Crop Circle Encoding Systems",
        "Mayan Calendar and Astronomical Encoding",
        "Comet 17P Holmes Prediction",
        "3I/ATLAS Interstellar Object",
        "Comet 3I/ATLAS and Wormhole Deployment Hypothesis",
        "ET Factions and Alien Groups",
        "Alien Communication via Military Contactee CJ",
        "Crop Circle Witness Requests and Responses",
        "Skinwalker Ranch and NIDS",
        "Bob Lazar and 65 Genetic Steps",
        "DNA and ET Genetic Engineering of Humanity",
        "Q Anon Quetzalcoatl Trump Narrative",
        "Whitley Strieber and Scientific Paradigm Shock",
        "Suppression of UAP Evidence and Physics Research",
        "Historical UAP Incidents and Witness Accounts",
        "New Jersey Drones December 2024",
        "Flatland 4D 5D ET Perception",
        "Euler Identity and Mathematical Encoding in Crop Circles",
        "Electromagnetic Induction Historical Parallel",
        "Zeta Reticuli and Star Distances",
        "CERN Mayan Radar Anomaly",
        "Mars Life and Imagery",
        "Arecibo Reply Crop Picture 2001",
        "Teaching Lesson 3-Phase Ball Magnet Spin",
        "Galinstan and Experimental Materials",
        "Lithium Orotate Biochemistry and Alzheimer's",
        "DNA Base-4 and Quaternary Computing",
        "Drew's DNA Research Background",
        "Buga Sphere Details",
        "Skinwalker Ranch and NIDS",
        "Travel and Personal Content",
        "Australian Politics and Social Commentary",
        "Other Miscellaneous Non-Physics Content",
        "Other Content",
    ]

    # Render sections in preferred order, then any remaining
    rendered_cats = set()
    final_order = preferred_order.copy()
    for cat in cat_order:
        if cat not in final_order:
            final_order.append(cat)

    for cat_name in final_order:
        if cat_name in rendered_cats:
            continue
        if cat_name not in cat_contents:
            continue
        rendered_cats.add(cat_name)

        subsections = cat_contents[cat_name]
        if not subsections:
            continue

        # Section header
        parts.append(f"---\n\n## {cat_name}\n")

        # Track within-category duplicates by body similarity
        seen_bodies = []  # list of normalized body snippets

        for heading, body in subsections:
            body_snippet_norm = normalize_key(body[:150])

            # Within-category dedup: skip if very similar to something already written
            is_dup = False
            for seen in seen_bodies:
                # Simple overlap: if 70%+ of words in snippet match
                words_new = set(body_snippet_norm.split())
                words_seen = set(seen.split())
                if len(words_new) > 0 and len(words_seen) > 0:
                    overlap = len(words_new & words_seen) / min(len(words_new), len(words_seen))
                    if overlap > 0.65:
                        is_dup = True
                        break

            if is_dup:
                continue

            seen_bodies.append(body_snippet_norm)

            # Write the subsection
            if heading != '__PREAMBLE__':
                parts.append(f"{heading}\n")
            parts.append(f"{body}\n\n")

    return '\n'.join(parts)

def main():
    print("Phase 4+5: Reading CONCAT_FILE...")
    text = read_file(CONCAT_FILE)
    print(f"  File size: {len(text):,} bytes, {text.count(chr(10)):,} lines")

    print("Splitting into 100 source sections...")
    sections = split_into_sections(text)
    print(f"  Found {len(sections)} source sections")

    print("Deduplicating subsections...")
    registry, ordered_keys = deduplicate_sections(sections)
    print(f"  Unique topics: {len(ordered_keys)}")

    print("Grouping into logical sections...")
    cat_contents, cat_order = group_into_sections(registry, ordered_keys)
    print(f"  Categories: {len(cat_contents)}")
    for cat in cat_order:
        print(f"    [{len(cat_contents[cat])} items] {cat}")

    print("Rendering Phase 4 output (TEMP_FILE)...")
    output = render_output(cat_contents, cat_order, HEADER)
    write_file(TEMP_FILE, output)
    print(f"  TEMP_FILE: {len(output):,} bytes, {output.count(chr(10)):,} lines")

    # Phase 5: Final polish - read temp, do one more pass
    print("Phase 5: Final polish pass...")
    # The render_output already produces clean output without Source separators.
    # Do a final cleanup pass:
    final_output = output

    # Remove any residual '--- Source: N/M ---' markers that might have slipped through
    final_output = re.sub(r'--- Source: \d+/\d+ ---\n?', '', final_output)

    # Remove any residual file path artifacts
    final_output = re.sub(r'Source directory:.*?\n', '', final_output)
    final_output = re.sub(r'Generated from END_DIR:.*?\n', '', final_output)

    # Clean up excessive blank lines (max 2)
    final_output = re.sub(r'\n{4,}', '\n\n\n', final_output)

    # Ensure header is present
    if not final_output.startswith('# overall_other'):
        final_output = HEADER + final_output

    write_file(FINAL_FILE, final_output)
    print(f"  FINAL_FILE: {len(final_output):,} bytes, {final_output.count(chr(10)):,} lines")

    print("\nPhase 4+5 complete for overall_other.mdx. Final file written.")

if __name__ == "__main__":
    main()
