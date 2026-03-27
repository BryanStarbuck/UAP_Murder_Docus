# UAP Physics Murders — Project Instructions

This directory is part of the Docusaurus site at **https://UAPMurders.com/** powering the "UAP Physics Murders" section.

## Scope

This project investigates the claim that **public physics effectively stopped advancing around 1950** — that when the US military recovered UAPs (Unidentified Aerial Phenomena), they discovered physics so fundamentally different from mainstream science that breakthroughs were classified and public physics was allowed to stagnate.

This is about **physics beyond the normal public physics** (Relativity and Quantum Mechanics). This is what the government keeps classified because it may be what powers UAP propulsion systems, the ability to travel inter-dimensionally, or the power source UAPs use. It may be other physics the government wants to keep classified.

### The Core Claim

According to statements made by senior military officials — including a top general's disclosure to venture capitalist Marc Andreessen — the classified world has made massive breakthroughs in physics that the public has never seen. The claim is:

* **Public physics froze circa 1950** — Between Einstein's relativity and quantum mechanics, the publicly funded physics establishment stopped making fundamental progress
* **String theory may have been a distraction** — Decades of theoretical physics investment may have been directed toward a dead end, whether by accident or design
* **Classified physics leapt ahead** — Military and intelligence programs studying recovered UAP technology developed an entirely different understanding of physics
* **The gap is enormous** — 70+ years of classified research has produced physics far beyond anything in the public domain

### What We're Investigating

This project catalogs and evaluates the different **theses** for what that classified physics might be. Each thesis addresses one or more of these core questions:

* **Energy sources** — What powers UAPs? What energy generation methods exist beyond conventional physics?
* **Propulsion and movement** — How do UAPs achieve observed flight characteristics (instant acceleration, right-angle turns, transmedium travel)?
* **Space warping and local gravity manipulation** — Can craft create localized gravitational distortions, effectively "falling" in any direction?
* **Faster-than-light travel** — How might craft traverse vast distances without violating (or by circumventing) the speed of light?
* **Dimensional shifting** — Do UAPs transition between dimensions, and what does that imply about the structure of reality?
* **Inertial mass reduction** — How do craft and occupants survive extreme accelerations?
* **Material science** — What metamaterials or exotic matter have been recovered, and what do they reveal?

### The Audience

The audience is **researchers, physicists, engineers, journalists, and curious citizens** who take the possibility of classified physics breakthroughs seriously. They understand that the US government has a documented history of classifying transformative technologies for decades (nuclear weapons, stealth aircraft, signals intelligence capabilities).

This is **serious investigative documentation**, not science fiction or entertainment. We approach these topics the way an investigative journalist would: we don't require peer-reviewed publication to document a claim, but we do require meaningful evidence, credible sources, and indicators that something deviates from what conventional physics predicts. Congressional testimony, whistleblower accounts, military sensor data, patent filings, declassified documents, and credible researcher analysis are all legitimate indicators worth documenting.

**We measure a thesis not because there's 100% solid proof on everything, but because there are meaningful facts that deviate from something normal.** We document those deviations thoroughly and let the reader assess the weight of the evidence.

### Inclusion Rule

If a thesis, person, or piece of evidence addresses any aspect of UAP physics — energy, propulsion, gravity manipulation, spacetime warping, dimensional phenomena, exotic materials, or the suppression of public physics — it belongs in this project. We document **all credible theses** and let readers evaluate the evidence.

---

## Docusaurus Site Structure

This directory is rendered by the Docusaurus site at https://UAPMurders.com/. The site is configured in the parent directory at `~/BGit/Bryan/UAP_Murder_Docus/`.

### Directory Layout

```
Physics/
├── index.md          # Main overview page (the list of all theses and people)
├── claude.md         # This file — project instructions and templates
└── Details/          # One markdown file per thesis, person, or evidence category
    ├── Alcubierre_Warp_Drive.md
    ├── Zero_Point_Energy.md
    ├── Bob_Lazar.md
    ├── Hal_Puthoff.md
    └── ...
```

### What Goes Where

| File | Purpose |
|------|---------|
| **index.md** | The main overview page. Contains all theses and people in categorized tables with ~35-word summaries. This is the entry point — visitors land here from the top nav. (Equivalent to README.md in the source repo.) |
| **Details/Thesis_Name.md** | One file per physics thesis. Full profile with overview, evidence, key figures, mathematical framework (if any), counterarguments, and sources. |
| **Details/FirstName_LastName.md** | One file per person. Full profile with required sections plus any additional information. **Pages on people can and should have MORE information than just the required sections.** |
| **claude.md** | This file. Project instructions, templates, writing guidelines. Not rendered by Docusaurus. |

### Rules

- **One thesis per file** in `Details/`. Never combine multiple theses into one file.
- **One person per file** in `Details/`. Never combine multiple people into one file.
- **No non-profile files** in `Details/`. Research notes, essays, and other content go elsewhere.
- **File naming**: `Details/FirstName_LastName.md` for people — underscores for spaces, no special characters. `Details/Thesis_Name.md` for physics theses.

---

## Content Sync

The authoritative content source for this section is `~/BGit/Bryan/Deep_State/other/UAP_Physics/`. See the parent `CLAUDE.md` for sync procedures. Local formatting (frontmatter, Docusaurus-specific links) is preserved during syncs.

---

## Links Between Pages

All pages should be interconnected. Cross-linking creates the investigative web that makes this project valuable.

### Within This Section

- **index.md -> Details**: Every thesis/person in an index table links to their profile: `[Name](Details/Name.md)`
- **Details -> Details**: When one profile mentions another person or thesis documented here, link to them: `[Bob Lazar](Bob_Lazar.md)` (relative path within Details/)

### To Other Sections on the Site

- **To UAPs Murders section**: `[Person Name](/uaps/Details/Person_Name)`
- **To Energy Systems section**: `[Person Name](/energy/Details/Person_Name)`

### When to Create Cross-Links

- When a person is **mentioned by name** in another person's profile
- When two theses **share underlying physics** or are competing explanations
- When people **worked together** or are in the **same research program**
- When a person is a **key proponent** of a documented thesis
- When a thesis **builds on or contradicts** another documented thesis
- When a person appears in **another section** of the site under a different context

### Overlap Rules

People can appear in multiple sections when they fit multiple scopes. When a person appears in multiple sections:
- Each section has its own full profile (not a stub that links elsewhere)
- Each profile emphasizes the angle relevant to that section
- Each profile links to the version in the other section
- The "See Also" section explicitly notes the cross-listing

---

## index.md Structure

The index.md is the main overview page. It follows this structure:

### 1. Title and Introduction
- Project title
- 2-4 paragraphs of context: The claim that public physics stopped circa 1950, what this project investigates, the different categories of UAP physics

### 2. Categorized Tables

Theses and people are organized into **category tables**, not one giant list. Each table covers a logical grouping.

**Thesis categories:**

1. **Energy & Power Sources** — Theses about what powers UAPs
2. **Propulsion & Movement** — Theses about how UAPs achieve observed flight characteristics
3. **Spacetime & Gravity Manipulation** — Theses about warping space and creating local gravity
4. **Faster-Than-Light & Dimensional Physics** — Theses about FTL travel and dimensional shifting
5. **Exotic Materials & Metamaterials** — Theses about recovered materials and their physics
6. **Unified Frameworks** — Theses that attempt to explain multiple UAP capabilities under one physics model

**People categories:**

7. **Whistleblowers & Insiders** — Military, intelligence, and government insiders with direct knowledge claims
8. **Scientists & Researchers** — Physicists, engineers, and researchers investigating UAP physics
9. **Journalists & Investigators** — People documenting and publicizing UAP physics claims

Each table uses this column format:

**For theses:**
```markdown
| Thesis | Category | Evidence Rating | Details |
|--------|----------|-----------------|---------|
| [Name](Details/Filename.md) | Category | **RATING** | ~35-word summary of the thesis. |
```

**For people:**
```markdown
| Name | Role | Platform | Evidence Rating | Details |
|------|------|----------|-----------------|---------|
| [Full Name](Details/Filename.md) | Role | Platform | **RATING** | One-line summary of their claims. |
```

### 3. Patterns and Cross-Connections
After all tables, a `## Patterns Worth Noting` section documents recurring patterns across theses with inline links to relevant detail profiles.

### 4. Key Reference Points
Major events providing context: Marc Andreessen disclosure, Grusch congressional testimony, 2017 NYT AATIP revelations, Navy patent filings, etc.

### 5. Sources
Bulleted list of primary references with URLs.

### 6. Footer
```markdown
*Last Updated: [Date] — [Brief note on what was added]*
```

---

## Detail Profile Templates

Every thesis and person gets a full profile in `Details/`. Templates below.

### Template A: Physics Thesis

```markdown
# Thesis Name
One-line summary of this physics thesis.

| Field | Details |
|-------|---------|
| **Category** | Energy / Propulsion / Spacetime / FTL / Materials / Unified Framework |
| **Key Proponents** | Who advocates for or researches this thesis |
| **First Proposed** | When this thesis was first publicly articulated |
| **Key Claim** | One-sentence summary of what this thesis proposes |
| **Evidence Rating** | See Evidence Strength Ratings below |

## Overview

Detailed explanation of this physics thesis. What it proposes, how it differs from
conventional physics, what it would explain about UAP capabilities. Include historical
context and how the thesis has evolved over time.

## The Physics

Explain the theoretical framework in accessible terms. Include:
- How it differs from mainstream physics
- What conventional physics principles it modifies, extends, or replaces
- Mathematical frameworks or equations (if publicly available)
- Predicted observable effects
- How it explains specific UAP capabilities (acceleration, transmedium travel, etc.)

## Evidence & Documentation

- Military sensor data and observations
- Patent filings (cite patent numbers and assignees)
- Declassified documents (cite specific document numbers and dates)
- Whistleblower testimony (name witnesses, date, context)
- Scientific papers and preprints
- Laboratory experiments or demonstrations
- Congressional testimony and investigations

## Key Figures

- People associated with this thesis (link to their Details page if they have one)
- Include both proponents and critics

## Relationship to Other Theses

- How this thesis relates to, builds on, or contradicts other documented theses
- Whether multiple theses could be describing the same underlying phenomenon

## Criticisms & Counter-Arguments

- What mainstream physicists say
- Alternative explanations within conventional physics
- Known weaknesses in the evidence or theoretical framework
- Why some researchers find the thesis unfounded or overstated

This section is important for credibility. Including counterarguments shows
intellectual honesty and helps the reader weigh the evidence.

## See Also

- [Related Thesis](Related_Thesis.md) — Brief description of connection
- [Related Person](Related_Person.md) — Brief description of connection

## Sources

- [Source Title](URL) — one per line
- At least 3-5 sources
- Diverse source types: scientific papers, patents, journalism, government documents

*This information was compiled by Claude AI research.*
```

### Template B: Person (Whistleblower, Scientist, Journalist)

Person pages have **required sections** listed below, but pages on people **can and should include MORE information** beyond these sections. If there is additional relevant information — deeper biographical context, detailed timelines of their work, extended analysis of their contributions, additional quotes, connections to other cases, circumstances of their death or disappearance, family impact, legacy — **include it**. The required sections are the minimum, not the maximum.

```markdown
# Full Name
One-line summary: who they are and their UAP physics claims.

| Field | Details |
|-------|---------|
| **Full Name** | Legal name |
| **Role** | Physicist / Engineer / Whistleblower / Intelligence Insider / Journalist / etc. |
| **Platform** | Where they primarily discuss this (conferences, podcast, publication, testimony) |
| **Notable Works** | Papers, patents, books, documentaries, testimony on the topic |

## Their Claims

What this person says about UAP physics. Their specific claims, research, or testimony.
Be detailed and specific — capture their unique contribution.

For insiders/whistleblowers: describe their clearance level, programs, and direct knowledge.
For scientists: describe their research, publications, and experimental results.
For journalists: describe their investigative methodology and key discoveries.

## Key Quotes

> Blockquoted quotes with attribution and source links.
> — **Speaker Name**, Source, Date

Include quotes from: the person's papers, patents, interviews, speeches, congressional
testimony, podcast appearances. Date and source each quote.

## Key Arguments & Evidence They Cite

- Bullet points of the evidence and arguments they present
- Specific UAP incidents, sensor data, or documents they reference
- Physics principles or experiments they cite
- Programs or facilities they claim knowledge of

## Where They've Said It

- Specific interviews, papers, patents, testimony, conferences
- Include dates when possible
- Links to sources
- Congressional testimony or official proceedings

## The Counterargument

- Mainstream physics explanations and rebuttals
- Alternative interpretations of the evidence they cite
- Known issues with the person's credibility or methodology (if any)
- Why some critics find their claims overstated or unfounded

## Related Perspectives

- [Related Person](Related_Person.md) — Brief description of how their work connects
- [Related Thesis](Thesis_Name.md) — Link to thesis they advocate for
- Links to other people in this project who share similar or contrasting views

## Sources

- [Source Title](URL) — one per line
- Minimum 3-5 sources per profile; more for major figures

*This information was compiled by Claude AI research.*
```

**Additional sections to consider adding to person pages (beyond the required sections above):**

- **Biography / Background** — Early life, education, career path, how they came to UAP research
- **Death / Disappearance / Silencing** — Detailed circumstances, timeline, suspicious indicators, official cause vs. disputed cause
- **Family Impact** — Spouse, children, how the death/disappearance affected them
- **Career Timeline** — Chronological list of key career events and milestones
- **Research Contributions** — Detailed breakdown of their scientific or investigative work
- **Government / Military Service** — Specifics of their service record, clearances, programs
- **Threats & Intimidation** — Documented threats before death/disappearance
- **Investigation & Aftermath** — What happened after their death — investigations, cover-ups, FOIA requests
- **Legacy** — How their work has influenced the field since their death
- **Media Coverage** — Documentaries, news reports, podcasts that have covered their case
- Any other section that provides meaningful context about the person

---

## Person Categories

Use one of these categories in the metadata table:

- **Physicist / Scientist** — PhD-level researcher with relevant physics or engineering background
- **Engineer** — Applied engineering background, often from defense or aerospace
- **Intelligence Insider / Whistleblower** — Military, CIA, DIA, NRO, or contractor personnel who went public
- **Military Officer** — Active or retired military with direct UAP program knowledge
- **Former Government Official** — Held government positions relevant to UAP programs
- **Journalist / Investigative Reporter** — Professional journalist covering UAP physics topics
- **Author / Researcher** — Independent researcher or book author investigating UAP physics
- **Podcaster / Commentator** — Media personality discussing UAP physics topics
- **Patent Holder** — Individual or organization with relevant exotic physics patents

---

## Evidence Strength Ratings

Rate every thesis, person claim, and piece of evidence. The rating captures the strength of evidence supporting the claim.

| Rating | Meaning |
|--------|---------|
| **WELL-DOCUMENTED** | Declassified documents, official investigations, military sensor data, or peer-reviewed science confirm it. Can state as fact. |
| **STRONG EVIDENCE** | Multiple credible sources, whistleblower testimony under oath, military observations, patent filings. Strong case but not officially confirmed. |
| **MODERATE EVIDENCE** | Circumstantial evidence, credible whistleblower claims, theoretical physics frameworks with some experimental support. Plausible but other explanations exist. |
| **EMERGING** | New thesis with some supporting evidence but not yet thoroughly investigated or tested. |
| **SPECULATIVE** | Theoretical framework with limited direct evidence. Included because the framework is influential, widely discussed, or addresses observed phenomena. |
| **DEBATED** | Significant evidence on both sides; physicists and researchers disagree. |

---

## Writing Style

### Lead with Facts

Every profile leads with verified facts before presenting claims or theories. State what is documented and sourced before discussing what is alleged or theorized.

### Evidence-Based Analysis

We take UAP physics claims seriously — but we document them honestly:

- **State what the evidence actually is** — "Navy sensor data from the 2004 Nimitz incident showed...," "testified under oath before the Senate Intelligence Committee on [date]...," "US Patent No. XXXXX filed by the Navy describes..."
- **Don't editorialize** — let the facts speak. "The Nimitz encounter objects demonstrated instantaneous acceleration from hovering to hypersonic speeds" is more powerful than "obviously these craft have anti-gravity"
- **Include counterarguments** — document mainstream physics objections, alternative explanations, criticisms. This strengthens credibility, not weakens it
- **Distinguish tiers of evidence** — what is sensor data vs. what is testimony vs. what is theoretical vs. what is claimed in interviews

### Defamation Prevention

This project documents real people, real organizations, and real claims. Defamation-safe language is mandatory:

| Evidence Tier | How to Frame It |
|--------------|-----------------|
| Peer-reviewed publications | State as published research |
| Military sensor data (official releases) | State as fact with source citation |
| US Patent filings | State as fact with patent number |
| Declassified government documents | State as fact with document citation |
| Sworn congressional testimony | "testified under oath that..." |
| Major outlet journalism (NPR, BBC, etc.) | "reported by [outlet]..." |
| Books and documentaries | "claimed in [title] by [author]..." |
| Whistleblower statements (not under oath) | "stated that..." or "claimed that..." |
| Podcast/interview statements | "stated on [show] that..." |
| Unverified online accounts | "unverified claims circulated that..." |

**Always:**
- Use "allegedly," "reportedly," "according to" for all unconfirmed claims
- Attribute claims to their source — "According to [book/article/testimony]..." not stated as fact
- Include denials when the accused party has denied allegations
- For living persons and active organizations: note legitimate roles and credentials before discussing controversial claims
- For intelligence services: frame as "alleged" unless confirmed by declassified documents or official inquiries
- For defense contractors: note their current legitimate operations before discussing allegations
- For currently operating companies: note their current legitimate operations before discussing allegations
- Never present speculation as fact — if the connection is circumstantial, say so explicitly

### Tone

- **Investigative, not conspiratorial** — write like a science journalist, not an advocate
- **Specific, not vague** — cite dates, patent numbers, sensor data, document numbers
- **Respectful** — these are real people and real organizations; write with gravity
- **No emojis** — professional tone throughout
- **Straightforward** — avoid hedging language when facts are established; avoid certainty language when they're not
- **Scientifically literate** — use correct physics terminology; explain complex concepts accessibly

### Additional Writing Guidelines

* Include the person's own words when available (quotes from interviews, lectures, podcasts, papers, patents, congressional testimony)
* Include colleagues' and collaborators' statements when they corroborate or dispute claims
* Note when evidence was destroyed, classified, sealed, or went missing
* Note when research was defunded, shut down, or its researchers discredited
* Always include the "See Also" or "Related Perspectives" section linking to related profiles — this creates the web of connections
* Cross-link to group files when a person is connected to a documented program or organization
* When citing patents, always include the patent number, assignee, and filing date
* When citing sensor data, always include the incident name, date, and platform (e.g., "USS Nimitz, November 2004, AN/SPY-1 radar")
* When discussing classified programs, distinguish between confirmed existence (e.g., AATIP confirmed by DoD) and alleged existence (e.g., legacy SAPs described by whistleblowers)

### Footer

Every profile ends with:
```markdown
*This information was compiled by Claude AI research.*
```

---

## Sources and Research Standards

### Preferred Sources (in order of credibility)

1. **Peer-reviewed scientific papers** — Physical Review, Nature, Science, arXiv preprints by credentialed physicists
2. **US Patent filings** — Navy patents, DARPA-adjacent patents, exotic propulsion patents
3. **Congressional testimony and hearing records** — Senate Intelligence Committee, House Oversight UAP hearings
4. **Declassified government documents** — AATIP/AAWSAP reports, FOIA releases, inspector general reports
5. **Military sensor data** — Official releases of radar, infrared, and visual data
6. **Major news outlets** — NYT, Washington Post, NPR, BBC, Politico (especially the 2017 NYT AATIP revelations)
7. **Quality investigative journalism** — Leslie Kean, Ralph Blumenthal, Ross Coulthart, George Knapp
8. **Books by credentialed authors** — Hal Puthoff, Eric Davis, Jacques Vallee, Garry Nolan
9. **Documentary films and series** — with title, director, year
10. **Academic conferences** — SCU (Scientific Coalition for UAP Studies), AIAA presentations, SSE conferences
11. **Podcasts and interviews** — Lowest credibility tier; use for documenting claims, not as primary evidence

### Minimum Source Requirements

- **Every profile**: At least 3-5 sourced links
- **Major theses** (warp drives, zero-point energy, etc.): 5-10+ sources preferred
- **Living persons**: Extra sourcing required due to defamation concerns
- **Sources should be diverse** — don't rely solely on UFO community sources; include mainstream science and journalism when available

### Research Tools

- Use **web search** extensively — this is a research-heavy project where current sources matter
- Search for thesis names + "UAP," "propulsion," "physics," "classified"
- Check USPTO and Google Patents for exotic propulsion and energy patents
- Check congressional hearing archives for UAP testimony
- Search for arXiv papers on related physics topics
- Check SCU and AIAA conference proceedings
- Search for podcast archives for specific episodes and timestamps

---

## Adding a New Thesis

### Step 1: Research
Use web search to gather thorough information before writing.

### Step 2: Create the Detail Profile
- Filename: `Details/Thesis_Name.md`
- Use Template A above
- Include at least 3-5 sources and cross-links to related profiles

### Step 3: Add to index.md
- Add a row to the appropriate category table in index.md
- Write a ~35-word summary for the Details column
- Include the evidence rating

### Step 4: Cross-Link
- Link from the new thesis to any related existing profiles
- Update existing profiles to link back to the new thesis when relevant

---

## Adding a New Person

### Step 1: Research
Use web search to gather thorough information before writing.

### Step 2: Create the Detail Profile
- Filename: `Details/FirstName_LastName.md`
- Use Template B above as the **minimum required sections**
- **Include additional sections** with any relevant information beyond the template — biography, death circumstances, family impact, career timeline, legacy, media coverage, etc.
- Include at least 3-5 sources and cross-links to related profiles

### Step 3: Add to index.md
- Add a row to the appropriate category table in index.md
- Place it in the correct table based on the person's category

### Step 4: Cross-Link
- Link from the new profile to any related existing profiles
- Update existing profiles to link back to the new one when relevant

---

## Patterns to Watch For

When adding new entries, check if they fit documented patterns:

- **Classification as suppression** — Over-classification used to prevent public physics from advancing
- **Controlled opposition in physics** — Whether string theory or other programs were encouraged as distractions
- **Convergent theses** — Multiple independent researchers arriving at the same physics through different paths
- **Patent clustering** — Groups of exotic physics patents filed by the same organizations
- **Whistleblower consistency** — Whether independent whistleblowers describe the same phenomena
- **Historical suppression** — Cases where promising physics research was defunded, classified, or discredited
- **Reverse engineering programs** — Evidence of classified programs to reverse-engineer recovered UAP technology
- **Academic gatekeeping** — How mainstream institutions discourage UAP-related research
- **Sensor data correlation** — Cases where military sensor data matches predictions of specific theses
- **International convergence** — Whether classified programs in other countries reached similar conclusions

---

## Key Concepts for Contributors

### The Central Question

**Did public physics stall around 1950, and has classified research advanced far beyond it?**

Indicators we look for:
- **Stagnation in fundamental physics** — Are there measurable indicators that public physics has not made fundamental breakthroughs comparable to 1900-1950?
- **Classified programs** — AATIP, AAWSAP, and predecessor programs; what they studied and concluded
- **Exotic patents** — Navy and defense contractor patents describing physics beyond the standard model
- **Whistleblower testimony** from credible insiders describing classified physics breakthroughs
- **Recovered materials** — Metamaterials and exotic matter with properties not explained by conventional physics
- **Observed phenomena** — UAP flight characteristics that defy known physics
- **Suppression evidence** — Cases where promising public physics research was shut down or classified

### What We're NOT Doing

- We are not claiming every UAP physics theory is correct
- We are not ignoring evidence that contradicts a thesis
- We are not treating all claims as equally credible — that's what the evidence ratings are for
- We ARE documenting the full spectrum of UAP physics theses with their evidence
- We ARE noting when observed phenomena don't match conventional physics predictions
- We ARE taking seriously the testimony and research of credible scientists, military personnel, and whistleblowers

### The Standard of Evidence

We don't require peer-reviewed proof. We document cases where **meaningful facts deviate from what conventional physics predicts**. The evidence strength rating tells the reader how strong the case is.

---

## Groups and Programs

### Known Programs
- **AATIP** (Advanced Aerospace Threat Identification Program) — confirmed by DoD, ran 2007-2012
- **AAWSAP** (Advanced Aerospace Weapon System Applications Program) — DIA program, broader than AATIP
- **Legacy SAPs** — alleged Special Access Programs predating AATIP, described by whistleblowers
- **Bigelow Aerospace / BAASS** — contractor for AAWSAP, stored metamaterials

### Key Organizations
- **TTSA** (To The Stars Academy) — founded by Tom DeLonge, released Navy UAP videos
- **SCU** (Scientific Coalition for UAP Studies) — peer-reviewed UAP research
- **Disclosure Project** — Steven Greer's whistleblower testimony initiative
- **AIAA** (American Institute of Aeronautics and Astronautics) — mainstream aerospace, increasing UAP engagement

### Defense Contractors (Alleged UAP Involvement)
- **Lockheed Martin / Skunk Works** — alleged reverse-engineering programs
- **Northrop Grumman** — alleged UAP material analysis
- **Battelle Memorial Institute** — alleged metamaterial analysis (historical)
- **Raytheon** — sensor systems that have detected UAPs

When referencing these groups:
- Use attribution language: "allegedly involved in..." unless confirmed by official documents
- Note when a program's existence is confirmed vs. when its scope or activities are alleged
- Distinguish between what the organization officially acknowledges and what whistleblowers claim
