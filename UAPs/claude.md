# UAP Deaths & Silenced Witnesses — Docusaurus Site Instructions

> This directory powers the **UAPs Murders (General)** section of [https://UAPMurders.com/](https://UAPMurders.com/), built with Docusaurus. See the [parent CLAUDE.md](../CLAUDE.md) for site-wide config, sync procedures, and directory mapping.

## Charter

This directory tracks **people killed, disappeared, or retaliated against** for their connection to UAP/UFO information. **Murders are highest priority.**

We document:
* People **murdered** for exposing or possessing UAP information
* People **disappeared or silenced** due to UAP knowledge
* People **retaliated against** — fired, threatened, blacklisted, discredited, institutionalized
* **Living persons at risk** — current whistleblowers and insiders in danger

The US government has historically classified UAP-related information and, according to sworn congressional testimony, people have been killed to maintain that secrecy.

### Priority Order

1. **Murdered** — deaths disguised as suicides, accidents, or natural causes
2. **Disappeared** — vanished suspiciously
3. **Physically harmed** — poisoned, irradiated, assaulted
4. **Institutionalized** — committed to psychiatric facilities to silence
5. **Career destroyed** — professional retaliation for UAP knowledge
6. **Threatened** — explicit threats, surveillance, intimidation
7. **Living and at risk** — current whistleblowers in danger

### Audience

Investigators, researchers, journalists, and public who take these cases seriously. This is **serious investigative documentation** — we don't require courtroom-level proof but do require meaningful facts deviating from normal. We document deviations and let readers assess.

### What Belongs Here

A person qualifies if their death/disappearance/retaliation credibly connects to:
- Recovered non-human craft or materials
- Reverse-engineering programs (AATIP, AAWSAP, legacy SAPs)
- Classified aerospace/defense tech with UAP overlap (SDI/Star Wars)
- Zero-point energy or exotic propulsion linked to UAP reverse-engineering
- Government knowledge of non-human intelligence
- UAP testimony, disclosure efforts, or congressional investigations
- UAP encounters causing physical harm (radiation, burns)

Connection can range from **strong** (Phil Schneider lecturing about DUMBs before death) to **speculative** (scientists with UAP-adjacent work). The suspicion rating captures link strength.

### What Does NOT Belong Here

- Energy suppression with **no UAP connection** → belongs in the Energy section of this site
- General conspiracy deaths with no UAP connection

---

## Directory Structure

```
UAPs/
├── index.md         # Master table of all UAP deaths, disappearances, at-risk persons
├── claude.md        # This file
├── books.md         # Recommended books
├── podcasts.md      # Recommended podcasts
├── youtube_channels.md  # Recommended YouTube channels
└── Details/         # One markdown file per person (nothing else)
```

**Rules:** One person per file. No non-person files in Details/. Filename: `Details/FirstName_LastName.md` (underscores, no spaces). Use most common name (e.g., `William_Cooper.md` not `Bill_Cooper.md`).

---

## index.md Structure

The `index.md` file is the master list of all people (replaces README.md from the source repo). It contains:

1. **Title and Introduction** — 2-4 paragraphs, key testimony (Grusch), historical precedent (Binder's 137 researchers)
2. **Categorized Tables** — organized by grouping (see table categories below)
3. **Patterns Worth Noting** — bold-titled paragraphs with inline links
4. **Key Reference Points** — Grusch testimony, Disclosure Project, GEC-Marconi inquiry, Binder, UAP Disclosure Act
5. **Sources** — bulleted list with URLs
6. **Footer** — `*Last Updated: [Date] — [what was added]*`

### Table Categories
- Government Officials and Military Insiders
- Political Figures and Scientists Killed (Speculative UAP Connection)
- UFO/UAP Researchers and Investigators
- Aerospace Whistleblowers and Disclosure Witnesses
- Scientists and Energy Researchers (Suppressed Technology)
- GEC-Marconi / SDI "Star Wars" Scientists (1982-1990)
- Targeted Individuals and Institutionalized
- Military Pilot Deaths and Disappearances
- Disappeared
- Unexplained Deaths from UAP Encounters

### Table Formats

**Deceased:** `| Name | Year | Cause of Death | Suspicion Level | Details |`
**Living/at-risk:** Same columns, use `**ALIVE**` and `**AT RISK**`
**Disappeared:** `| Name | Year | Circumstances | Details |`

---

## Detail Profile Template (Deceased)

Each person's page **must** contain the following required sections. However, pages **may include additional sections beyond these** — more information is always welcome. These are the *minimum* sections, not the maximum. Add whatever additional context, testimony, connections, or analysis is relevant.

```markdown
# Full Name
One-line summary: who they were, how they died, UAP connection.

| Field | Details |
|-------|---------|
| **Full Name** | Legal name |
| **Born** | Date or year |
| **Died** | Full date |
| **Age at Death** | Number |
| **Location of Death** | City, State/Country |
| **Cause of Death** | How they died |
| **Official Ruling** | Suicide / Accidental / Homicide / Natural / etc. |
| **Category** | See categories below |

## Assessment: [SUSPICION LEVEL]
2-3 sentences: why suspicious or not. State strongest evidence.

## Circumstances of Death
Narrative: where found, when, by whom. Forensic details. What was unusual.

## Background
Career, credentials, UAP connection. What they knew/claimed. What they worked on.
- Researchers: specific work/technology/findings
- Military/intel: clearance level, programs, access
- Witnesses: what they saw, when they went public

## Why This Death Possibly Raises Questions
- Timing coincidences, forensic anomalies, missing evidence
- Contradictions with official story, pre-death warnings
- Parallel deaths, pattern connections

## The Counterargument
- Official explanation, alternative scenarios, credibility issues
- Health conditions, personal problems

## Key Quotes from Media Coverage
> Blockquoted quotes with attribution.

## See Also
- Links to related profiles in this site

## Other Shocking Stories
- 4 entries from Details/, 18 words each max, diverse mix, maximize engagement

## Sources
- 3-5+ sourced links minimum; major cases 5-10+

*This information was built by Grok and Claude AI research.*
```

**Additional sections are encouraged.** If you have more information — additional testimony, detailed timelines, family statements, FOIA documents, related incidents, photographic evidence, career chronologies, etc. — add more sections. The template above is the **floor**, not the ceiling.

### Template Variants

**B: Living/At-Risk** — Replace death fields with `Status` and `Current Location`. Replace "Circumstances of Death" with "Current Situation"/"Suppression Timeline". Include: what they disclosed, protective measures, programs accessed, disclosure stage, who retaliated, career/safety impact.

**C: Disappeared** — Add `MISSING since [date]` and `Last Known Location`. Replace with "Circumstances of Disappearance". Include timeline and search efforts.

**D: Institutionalized/Targeted** — Add `INSTITUTIONALIZED / COMMITTED / TARGETED`. Replace with "How They Were Neutralized". Document disinformation, legal, or psychiatric tactics used.

---

## Person Categories

- **Government Official / Military Insider** — classified access, military rank, government position
- **Government Contractor / Whistleblower** — civilian with classified access who went public
- **Intelligence Officer** — CIA, DIA, NSA, foreign intel with UAP knowledge
- **UFO/UAP Researcher** — civilian researcher, author, investigator
- **Aerospace Illustrator / Disclosure Witness** — testimony or visual documentation
- **Scientist / Engineer** — academic/industrial, UAP-adjacent technology
- **Military Pilot** — encountered or pursued UAPs
- **Journalist / Investigator** — reported on UAP topics
- **Contactee / Experiencer** — claimed direct contact or abduction
- **Defense Scientist (GEC-Marconi)** — 1982-1990 cluster
- **Energy Inventor** — technology with UAP reverse-engineering overlap
- **Targeted Individual** — confirmed government harassment/disinformation

---

## Suspicion Ratings

Rates strength of evidence connecting death/incident to UAP-related silencing (not general suspicion).

| Rating | Meaning |
|--------|---------|
| **HIGHLY SUSPICIOUS** | Strong foul play evidence: forensic anomalies, missing evidence, died before testimony, multiple indicators |
| **SUSPICIOUS** | Multiple red flags, timing coincidences, contested rulings. Not conclusive |
| **MODERATE SUSPICION** | Concerning details but partial explanations exist. Other motives possible |
| **UNCERTAIN** | Largely speculative. Work/knowledge overlaps UAP topics |
| **UNCERTAIN (UAP link)** | Death suspicious but UAP connection speculative |
| **NOT SUSPICIOUS** | UAP connections but death appears natural. Included for completeness |
| **NOT SUSPICIOUS (UAP link debunked)** | UAP connection debunked |
| **CONFIRMED** | Government harassment confirmed by documents/judicial findings (e.g., AFOSI vs Bennewitz) |

**Living persons:** AT RISK, THREATENED, SURVEILLED, Radiation-injured witness

---

## Cross-Linking

Within this Docusaurus site, use relative links between pages:

| From → To | Path Format |
|-----------|-------------|
| index.md → Details | `[Name](Details/Name.md)` |
| Details → index.md | `[< Back](../index.md)` |
| Details → Details (same dir) | `[Name](Name.md)` |
| → Energy section | `[Name](/energy/Details/Name)` |
| → Physics section | `[Name](/physics/Details/Name)` |

Cross-link when: person mentioned by name, similar death circumstances, worked together, part of a cluster, or appears in another section of this site.

---

## Adding a New Person

1. **Research** — web search for name + "death," "murder," "suicide," "UFO," "UAP," "classified," "whistleblower." Check news, Wikipedia, court docs, family statements, books, congressional testimony, UAP research communities.
2. **Create profile** — `Details/FirstName_LastName.md`, appropriate template, 3-5+ sources, cross-links. Include all required sections, plus any additional sections with extra information.
3. **Add to index.md** — correct category table, ordered by suspicion level then year
4. **Update patterns** — add to relevant pattern lists; add new patterns if needed
5. **Cross-link** — link from/to related profiles and other site sections

---

## Patterns to Watch For

- **"Suicide" before testimony/disclosure**
- **Staged suicides with forensic anomalies** — missing fingerprints, wrong-hand notes, impossible methods
- **Career destruction preceding death** — discredit → isolate → destroy → death
- **Disclosure Project witness deaths** — 2001 National Press Club testifiers
- **Cancer cluster among UFO researchers** — unusually fast-acting cancers
- **GEC-Marconi cluster (1982-1990)** — 25 defense scientists in 8 years, SDI-connected
- **Pilot deaths/disappearances** — military/civilian pilots encountering UAPs
- **Area 51 / Groom Lake worker harm** — toxic exposure, state secrets blocking lawsuits
- **Deathbed confessions** — insiders waiting until dying to speak
- **Disinformation campaigns** — AFOSI-style operations driving targets to breakdown
- **Suppressed energy technology deaths** — overlaps with Energy section
- **Congressional testimony on killings** — officials acknowledging harm under oath

---

## UAP-Specific Sources

Use these in addition to general research:
- **Congressional UAP testimony** — House Oversight, Senate Intelligence
- **UAP-specialized sources** — The Black Vault, MUFON, Paranormal Insight, The Sentinel Network (thesentinel.network — tracks defense-sector death clusters and anomalous institutional responses around UAP disclosure; strong data on people killed)
- **Books** — Nick Redfern, Nick Cook, Greg Bishop, H.P. Albarelli

---

## Key Concepts

### What Makes a UAP-Related Death Suspicious

The core question is always: **Did this person's UAP-related knowledge or activities put them at risk, and does the evidence suggest their death was not what it appeared?**

Indicators we look for:
- Death occurred **shortly before or after** scheduled testimony, publication, or disclosure
- **Forensic anomalies** that contradict the official ruling
- **Missing or destroyed evidence** — files, recordings, research materials vanished
- The person **publicly predicted** they would be killed ("if I die, it wasn't suicide")
- **Associates or collaborators** also died under suspicious circumstances
- Death fits a **documented pattern** (same method, same time period, same program)
- **Official investigation** was unusually brief, incomplete, or refused to consider alternatives
- **Government agencies** appeared at the scene unusually quickly or removed materials
- The person had **classified access** to programs related to UAP recovery or reverse-engineering

### What We're NOT Doing

- We are not claiming every death here was a murder
- We are not claiming every UAP theory is true
- We are not ignoring evidence that contradicts our thesis
- We ARE documenting patterns that deserve investigation
- We ARE noting when official stories don't match physical evidence
- We ARE taking seriously the sworn testimony of government officials who say people have been killed

### The Standard of Evidence

We don't require courtroom-level proof. We document cases where **meaningful facts deviate from what would be normal**. A "suicide" where the gun has no fingerprints is worth documenting. A cluster of 25 defense scientists dying in 8 years is worth documenting. A whistleblower who said "if I die, investigate" and then died is worth documenting.

The suspicion level rating tells the reader how strong the evidence is. A reader can filter for only HIGHLY SUSPICIOUS cases if they want the strongest leads, or include UNCERTAIN cases if they want the full picture.
