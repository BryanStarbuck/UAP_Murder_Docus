# Suppressed Energy Breakthroughs — Docusaurus Site Instructions

This directory is part of the Docusaurus site at **https://UAPMurders.com/** and powers the **UAP Energy Systems Murders** section.

## Charter

This directory tracks **people who were killed, died suspiciously, disappeared, or were retaliated against** because of their work on advanced energy breakthroughs and non-traditional energy technology. **Murders are the highest priority.**

These are the kinds of energy sources the government often wants to prevent getting to the mass population.

We document:

* **People murdered for developing advanced energy technology** — inventors, physicists, engineers, and researchers who built or demonstrated devices that threatened established energy paradigms
* **People murdered for funding or supporting advanced energy work** — investors, backers, and advocates who were targeted for enabling breakthrough energy research
* **People whose work was seized, classified, or destroyed** — devices confiscated by government agencies, patents placed under secrecy orders, labs raided or ransacked
* **People who disappeared or were silenced** under circumstances suggesting their energy work made them a target
* **People retaliated against** — threatened, blacklisted, discredited, defunded, sued, imprisoned, or otherwise punished for their energy research or commercialization efforts
* **Living persons at credible risk** — current researchers, inventors, or whistleblowers whose work or public statements put them in danger

### What Technologies We Track

This project covers ALL forms of advanced energy that go beyond what is currently available on the market, including but not limited to:

* **Zero-point energy** — vacuum energy extraction, quantum vacuum fluctuations
* **Cold fusion / LENR** — low-energy nuclear reactions, palladium-deuterium systems
* **Water fuel cells** — electrolysis-based systems, hydrogen-on-demand, water-powered engines
* **Radiant energy** — Tesla-derived systems, Moray valves, atmospheric energy capture
* **Over-unity devices** — systems claiming output exceeding input (regardless of thermodynamic debate)
* **Magnetic motors** — permanent magnet motors, magnetic flux generators
* **Antigravity and field propulsion** — electrogravitics, Biefeld-Brown effect, inertial drives
* **Advanced propulsion** — exotic propulsion with energy implications
* **Unconventional fuel systems** — vapor carburetors, extreme-efficiency engines, suppressed automotive technology
* **Electromagnetic energy harvesting** — devices capturing ambient EM fields
* **Orgone energy** — Reich-derived systems and related bioenergetic research
* **Scalar wave technology** — longitudinal wave systems, Tesla-derived EM research

Whether these technologies actually worked is a separate question from whether the people behind them were silenced. Some of these devices were almost certainly fraudulent. Others were backed by credentialed scientists with reproducible results. What is documented here is the pattern of what happened to the *people* — not whether their inventions violated thermodynamics.

### Priority Order

1. **Murdered** — highest priority. People killed and deaths made to look like suicides, accidents, or natural causes
2. **Disappeared** — vanished under suspicious circumstances
3. **Physically harmed** — poisoned, irradiated, assaulted, injured in suspicious "accidents"
4. **Work seized / classified** — devices, prototypes, or research confiscated by government or unknown parties
5. **Institutionalized** — committed to psychiatric facilities to discredit and silence
6. **Career destroyed / defunded / blacklisted** — professional retaliation for energy research
7. **Threatened** — explicit threats, surveillance, intimidation, break-ins, lab arsons
8. **Imprisoned** — jailed on questionable charges related to their energy work
9. **Living and at risk** — current researchers and whistleblowers in danger

### The Audience

The audience is **investigators, researchers, journalists, and members of the public** who take these cases seriously. They are open to the possibility that advanced energy technologies have been systematically suppressed by governments, corporations, intelligence services, and other powerful interests.

This is **serious investigative documentation**, not speculation or entertainment. We approach these cases the way an investigative journalist would: we don't require courtroom-level proof to document a case, but we do require meaningful facts that deviate from what would be normal. Suspicious timing, forensic anomalies, missing evidence, contradicted official rulings, patterns across multiple cases — these are all legitimate indicators worth documenting.

**We measure a thesis not because there's 100% solid proof on everything, but because there are meaningful facts that deviate from something normal.** We document those deviations thoroughly and let the reader assess the weight of the evidence.

### What Belongs Here

A person qualifies for this list if there is a credible argument that their death, disappearance, suppression, or retaliation is connected to:

- Development of a non-traditional energy device or technology
- Research into advanced energy (academic or independent)
- Attempting to commercialize or patent advanced energy technology
- Financially backing or publicly supporting advanced energy work
- Exposing suppression of energy technology (whistleblowing)
- Classified government programs related to advanced energy or exotic propulsion
- Patent secrecy orders issued against energy inventions
- Corporate or government campaigns to discredit or destroy energy researchers

The connection can range from **strong** (e.g., Stanley Meyer dying at dinner with investors, his last words: "They poisoned me") to **speculative** (e.g., a scientist whose work overlaps energy-adjacent fields but has no direct suppression evidence). Both belong here — the suspicion level rating captures the strength of the link.

### What Does NOT Belong Here

- UAP/UFO deaths with **no energy technology connection** — those go in the UAPs section
- General conspiracy deaths with no plausible energy suppression connection
- Deaths that belong in the Physics section (UAP physics research without an energy device angle)

---

## Directory Structure

```
Energy/
├── index.md           # Master list: all energy suppression deaths, events, and at-risk persons
├── books.md           # Books on energy suppression
├── podcasts.md        # Podcasts covering these topics
├── youtube_channels.md # YouTube channels covering these topics
├── claude.md          # This file — project instructions and templates
└── Details/           # One markdown file per person (nothing else goes here)
    ├── Stanley_Meyer.md
    ├── Nikola_Tesla.md
    ├── Eugene_Mallove.md
    └── ...
```

### What Goes Where

| File | Purpose |
|------|---------|
| **index.md** | The master index. Contains all persons in categorized tables with one-line summaries. Contains pattern analysis sections, key reference points, and a sources list. This is the entry point — visitors start here. Replaces what would be README.md in the source repo. |
| **Details/FirstName_LastName.md** | One file per person. Full investigative profile with metadata table, assessment, narrative, evidence, quotes, cross-links, and sources. File names use underscores, no spaces. |
| **books.md** | Books related to energy suppression |
| **podcasts.md** | Podcasts related to energy suppression |
| **youtube_channels.md** | YouTube channels related to energy suppression |
| **claude.md** | This file. Project instructions, templates, writing guidelines. Not rendered by Docusaurus. |

### Rules

- **One person per file** in `Details/`. Never combine multiple people into one file.
- **No non-person files** in `Details/`. Research notes, physics articles, essays, and other content go elsewhere.
- **File naming**: `Details/FirstName_LastName.md` — underscores for spaces, no special characters. For people known by nicknames, use the name they're most commonly identified by.
- **Pages on people can include MORE information** than the required sections below. The templates define the **minimum required sections** — contributors are encouraged to add additional sections, subsections, evidence, timelines, or context beyond what the template specifies.

---

## Docusaurus-Specific Notes

- This site uses **Docusaurus** for rendering. Files need appropriate frontmatter for proper rendering.
- The master list is `index.md` (not `README.md`). It includes Docusaurus frontmatter (title, sidebar_label, sidebar_position, slug).
- Detail files do **not** include back-navigation links (e.g., `[< Back to ...]`) — Docusaurus handles navigation via sidebars.
- Internal links should use Docusaurus-compatible relative paths.
- The site lives at https://UAPMurders.com/ and this section is under the `/energy/` URL path.

---

## index.md Structure

The index.md is the master document. It follows this structure:

### 1. Docusaurus Frontmatter
```markdown
---
title: "UAP Energy Systems Murders"
sidebar_label: "Overview"
sidebar_position: 1
slug: /
---
```

### 2. Title and Introduction
- Project title
- 2-4 paragraphs of context: What this project documents, why it matters, the historical pattern of energy suppression, scale of documented cases
- Scope clarifiers: links to sibling sections for cases that don't belong here
- Profile count

### 3. Categorized Tables
People are organized into **category tables**, not one giant list. Each table covers a logical grouping. Current categories include:

- **Cold Fusion and Low-Energy Nuclear Reactions (LENR)**
- **Water Fuel Cell and Hydrogen Technology**
- **Zero-Point Energy and Radiant Energy**
- **Magnetic Motors and Over-Unity Devices**
- **Automotive Fuel Efficiency Suppression**
- **Antigravity and Field Propulsion**
- **Orgone and Bioelectric Energy**
- **Electromagnetic and Plasma Energy**
- **Nuclear and Advanced Physics**
- **GEC-Marconi / SDI "Star Wars" Scientists** (overlap with UAPs)
- **Government Classification and Patent Suppression**
- **Corporate and Institutional Suppression**
- **Living Persons at Risk / Suppressed**

Each table uses this column format:

**For deceased persons:**
```markdown
| Name | Year | Cause of Death | Suspicion Level | Details |
|------|------|----------------|-----------------|---------|
| [Full Name](Details/Filename.md) | YYYY | How they died | **LEVEL** | One-line summary with key facts. |
```

**For living/suppressed persons:**
```markdown
| Name | Year | Cause of Death | Suspicion Level | Details |
|------|------|----------------|-----------------|---------|
| [Full Name](Details/Filename.md) | — | **ALIVE** | **SUPPRESSED** | One-line summary of suppression/threat. |
```

**For disappeared persons:**
```markdown
| Name | Year | Circumstances | Details |
|------|------|---------------|---------|
| [Full Name](Details/Filename.md) | YYYY | Missing since [date] | Summary of disappearance. |
```

### 4. Patterns Worth Noting
After all tables, a `## Patterns Worth Noting` section documents recurring patterns across cases. Each pattern is a bold-titled paragraph with inline links to relevant detail profiles. Patterns include things like:
- Inventor dies shortly after successful demonstration
- Lab arsons and ransacked workshops
- Patents seized under secrecy orders
- "Suicide" or "accident" after refusing buyout offers
- Coroner rules natural causes despite suspicious circumstances
- Working prototypes vanish after inventor's death
- Carbon monoxide "suicides" cluster
- Multiple researchers in the same field dying in a short period
- Career destruction preceding death: Discredit → isolate → destroy → death
- Government agencies appearing at death scenes to remove materials

### 5. Key Reference Points
Major events and documents that provide context: patent secrecy order statistics, Invention Secrecy Act of 1951, key compilations (Vesperman's list), congressional actions, major suppression incidents.

### 6. Sources
Bulleted list of primary references with URLs. Include:
- Court documents and patent office records
- Major news outlets (NPR, BBC, Fox News, Washington Post, Newsweek)
- Wikipedia articles for well-documented cases
- Books (author, title, year)
- Specialized sources (Infinite Energy magazine, New Energy Times, Vesperman compilation, etc.)
- Academic papers and declassified documents where available
- Congressional records related to patent suppression or energy policy

### 7. Footer
```markdown
*Last Updated: [Date] — [Brief note on what was added]*
```

---

## Detail Profile Templates

Every person gets a full profile in `Details/`. The templates below define the **minimum required sections**. Pages on people can and should include MORE information beyond these sections — additional evidence, deeper timelines, extra context, supplementary research, related patents, technology descriptions, witness statements, or any other relevant material. The templates are a floor, not a ceiling.

### Template A: Deceased Person

```markdown
# Full Name
One-line summary: who they were and how they died. Include their connection to advanced energy research.

| Field | Details |
|-------|---------|
| **Full Name** | Legal name |
| **Born** | Date or year |
| **Died** | Full date |
| **Age at Death** | Number |
| **Location of Death** | City, State/Country |
| **Cause of Death** | How they died |
| **Official Ruling** | Suicide / Accidental / Homicide / Natural causes / etc. |
| **Category** | See person categories below |

## Assessment: [SUSPICION LEVEL]

2-3 sentence summary of why this death is or isn't suspicious. State the strongest
evidence. This is the most important section — it tells the reader immediately whether
this case has strong indicators or is speculative.

## Circumstances of Death

Narrative of what happened. Where found, when, by whom. What was unusual about the
scene, the timing, or the official ruling. Include specific forensic details when
available (e.g., "no fingerprints on the weapon," "coroner found no natural cause
but ruled natural causes anyway").

## Background

Who this person was. Their career, credentials, and qualifications. Their specific
energy technology, findings, and stage of development. What they were working on and
what stage it had reached (concept, prototype, demonstrated, commercializing).

For inventors: describe their specific device, how it allegedly worked, and any
demonstrations or test results.
For researchers: describe their field, publications, and findings.
For supporters/funders: describe what they backed and why they were targeted.

## Why This Death Possibly Raises Questions

- Bullet points of each suspicious element
- Timing coincidences (e.g., died before scheduled demonstration or funding deal)
- Forensic anomalies (e.g., no fingerprints on weapon)
- Missing or destroyed evidence — devices, prototypes, notes vanished
- Contradictions between official story and physical evidence
- Warnings the person gave before dying ("if I die, it wasn't suicide")
- Parallel deaths of associates or collaborators
- Pattern connections to other cases in this project
- Who allegedly suppressed them (government agency, corporation, unknown actors)
- What happened to their work/devices after their death

## The Counterargument

- Official explanation and its supporting evidence
- Alternative plausible scenarios
- Known issues with the person's credibility (if any)
- Health conditions, personal problems, or other factors
- Fraud findings or court rulings against the technology
- Why some skeptics find the official ruling adequate

This section is important for credibility. Including counterarguments shows
intellectual honesty and helps the reader weigh the evidence.

## Key Quotes from Media Coverage

> Blockquoted quotes with attribution and source links.
> — **Speaker Name**, Source, Date

Include quotes from: family members disputing rulings, colleagues, investigators,
the person themselves (especially pre-death warnings), official statements.

## See Also

- [Related Person](Related_Person.md) — Brief description of connection

## Other Shocking Stories

- [Person Name](Person_Name.md): 18 words or less — the most shocking, suspicious, or unjust hook about this person. Maximum impact to make the reader click.
- [Person Name](Person_Name.md): 18 words or less — different person, different hook.
- [Person Name](Person_Name.md): 18 words or less — different person, different hook.
- [Person Name](Person_Name.md): 18 words or less — different person, different hook.

Pick 4 other people from the Details/ directory (not the current person). Choose a diverse mix — different categories, different eras. Write the hook to maximize reader engagement: focus on injustice, suspicious indicators, powerful motives for murder, or the most disturbing facts. Keep each hook to 18 words or fewer. Link each name to their profile using relative paths (e.g., `[Name](Name.md)`).

## Sources

- [Source Title](URL) — one per line
- Prefer: major news outlets, court documents, Wikipedia, patent records
- Include: specialized energy sources (Infinite Energy, New Energy Times, etc.)
- Include: books (Author, *Title*, Year)
- Minimum 3-5 sources per profile; more for major cases

*This information was built by Grok and Claude AI research.*
```

**Additional sections are welcome and encouraged.** Examples of extra sections contributors may add:

- **Technology Description** — detailed explanation of the device or research
- **Patent History** — patent numbers, filing dates, secrecy orders
- **Suppression Timeline** — chronological sequence of events
- **Witness Statements** — statements from people who saw the technology or the events
- **Related Incidents** — connected events not covered in other sections
- **Government Documents** — declassified or FOIA documents related to the case
- **Financial Trail** — funding sources, buyout offers, financial pressure
- **Media Coverage Timeline** — how media covered (or didn't cover) the story
- **Family Impact** — what happened to family members after the death
- **Technology Status** — current state of the technology or research line

### Template B: Living / Suppressed / At-Risk Person

Same structure as Template A with these modifications:

- **Metadata table**: Replace death fields with:
  - `| **Status** | ALIVE / AT RISK / THREATENED / SURVEILLED / Suppressed / Work Seized / Imprisoned / etc. |`
  - `| **Current Location** | Where they are now (if public) |`
- **Replace "Circumstances of Death"** with **"Suppression Timeline"** or **"Current Situation"** — describe threats, retaliation, work seizure, career destruction, surveillance
- **Replace "Why This Death Possibly Raises Questions"** with **"Evidence of Suppression"** or **"Why This Person Matters"**
- Include: **What technology they were working on** — specific device, stage of development
- Include: **Who allegedly suppressed them** — government agency, corporation, unknown actors
- Include: **What happened to their work/devices after suppression**
- Include: **Protective measures** — public statements, legal protections, relocated

### Template C: Disappeared Person

Same as Template A with:
- `| **Status** | MISSING since [date] |`
- `| **Last Known Location** | Where they were last seen |`
- Replace "Circumstances of Death" with **"Circumstances of Disappearance"**
- Include timeline of last known movements
- Include search efforts and their outcomes
- Include what happened to their research and devices

### Template D: Institutionalized / Imprisoned / Targeted Individual

Same as Template A with:
- `| **Status** | INSTITUTIONALIZED / IMPRISONED / TARGETED |`
- Replace "Circumstances of Death" with **"How They Were Neutralized"**
- Document the specific legal, regulatory, disinformation, or psychiatric tactics used
- Name the agencies or actors involved (with attribution language)
- Document what happened to their technology during and after their neutralization

---

## Person Categories

Use one of these categories in the metadata table:

- **Energy Inventor** — Developed a non-traditional energy device or technology
- **Energy Researcher** — Conducted research into advanced energy (academic or independent)
- **Energy Whistleblower** — Exposed suppression of energy technology
- **Energy Business** — Attempted to commercialize or patent advanced energy technology
- **Energy Supporter / Funder** — Financially backed or publicly supported advanced energy work
- **Physicist / Scientist** — Academic or industrial researcher in energy-adjacent physics
- **Automotive Inventor** — Developed suppressed fuel efficiency or alternative fuel technology
- **Defense Scientist** — Worked on classified energy or propulsion programs (e.g., GEC-Marconi, SDI)
- **Government Contractor** — Civilian with classified access to energy-related programs
- **Journalist / Investigator** — Reported on energy suppression topics
- **Patent Holder** — Held patents that were seized, classified, or suppressed

---

## Suspicion Ratings

Rate every case. The rating captures the strength of evidence connecting the death/incident to energy suppression, not whether the death itself is suspicious in a general sense.

| Rating | Meaning |
|--------|---------|
| **HIGHLY SUSPICIOUS** | Strong evidence of foul play connected to energy work. Forensic anomalies, missing evidence, died before demonstration/funding/publication, work seized, multiple corroborating indicators. |
| **SUSPICIOUS** | Multiple red flags, timing coincidences, or contested official rulings. Reasonable to suspect suppression connection but not conclusive. |
| **MODERATE SUSPICION** | Some concerning details but partial explanations exist. Suppression connection is plausible but other motives may also explain the death. |
| **UNCERTAIN** | Possible connection but largely speculative. Included because the person's work overlaps with suppressed energy topics. |
| **Research seized** | Death may have been natural but government or unknown parties seized research materials afterward. |
| **Career destroyed** | Person survived but was professionally destroyed — defunded, blacklisted, discredited, driven from their field. |
| **Attacked and suppressed** | Person survived physical attacks or threats but their work was stopped. |
| **Not suspicious** | Person had energy connections but death appears genuinely natural or accidental. Included for completeness or because their work was suppressed posthumously. |

For living persons:
- **AT RISK** — Active researcher/whistleblower in potential danger
- **SUPPRESSED** — Work actively blocked, devices seized, or career destroyed
- **THREATENED** — Has received explicit threats related to energy work
- **SURVEILLED** — Under confirmed or suspected surveillance
- **IMPRISONED** — Jailed on charges related to their energy work

For suppression events:
- **CONFIRMED SUPPRESSION** — Suppression is documented and verifiable (e.g., patent secrecy order on record)
- **WORK SEIZED** — Devices, prototypes, or research confiscated
- **BLOCKED** — Patents denied, funding cut, projects shut down through institutional action
- **DISCREDITED** — Subject of smear campaigns or professional blacklisting
- **CLASSIFIED** — Research placed under government secrecy orders

---

## Writing Style

### Lead with Facts

Every profile leads with verified facts before presenting suspicions. State what is documented and sourced before discussing what is alleged or theorized.

### Evidence-Based Suspicion

We take suspicious indicators seriously — but we document them honestly:

- **State what the suspicious facts actually are** — "coroner found no natural cause of death but ruled natural causes," "died the week before signing a major funding deal," "prototype vanished from the lab within 24 hours of his death"
- **Don't editorialize** — let the facts speak. "His last words were 'they poisoned me'" is more powerful than "obviously someone poisoned him"
- **Include counterarguments** — document fraud findings, court rulings against the technology, health conditions, personal problems, alternative explanations. This strengthens credibility, not weakens it
- **Distinguish tiers of evidence** — what is court-proven vs. what is testimony vs. what is claimed in books vs. what circulates online
- **Separate the person from the technology** — a person can be murdered even if their device didn't work. Document what happened to the person regardless of whether the technology was legitimate

### Defamation Prevention

This project documents real people, real deaths, and real organizations. Defamation-safe language is mandatory:

| Evidence Tier | How to Frame It |
|--------------|-----------------|
| Court findings, convictions, official inquiries | State as fact |
| Declassified government documents | State as fact with document citation |
| Patent office records and secrecy orders | State as fact with document citation |
| Sworn testimony and depositions | "testified under oath that..." |
| Major outlet journalism (NPR, BBC, etc.) | "reported by [outlet]..." |
| Investigative journalism from major outlets | "reported by [outlet]..." |
| Books and documentaries | "claimed in [title] by [author]..." |
| Whistleblower statements (not under oath) | "stated that..." or "claimed that..." |
| Compilations and lists (e.g., Vesperman) | "listed in [compilation] as..." or "according to [author]'s compilation..." |
| Unverified online accounts | "unverified claims circulated that..." |
| Social media theories (X/Twitter) | "X theorists allege..." or "social media speculation suggests..." |

**Always:**
- Use "allegedly," "reportedly," "according to" for all unconfirmed claims
- Attribute claims to their source — "According to [book/article/testimony]..." not stated as fact
- Include denials when the accused party has denied allegations
- For living persons and active organizations: note legitimate roles before allegations
- For intelligence services: frame as "alleged" unless confirmed by declassified documents or official inquiries
- For currently operating companies: note their current legitimate operations before discussing allegations
- Never present speculation as fact — if the connection is circumstantial, say so explicitly
- When citing fraud findings against a technology, include them prominently — this is not a technology advocacy project

### Additional Writing Guidelines

* Include the person's own words when available (quotes from interviews, patents, court filings, letters)
* Include family members' statements when they dispute official rulings
* Note when evidence was destroyed, sealed, or went missing
* Note when devices, prototypes, or research materials vanished
* Always include the "See Also" section linking to related profiles — this creates the web of connections
* For each technology, briefly explain what it allegedly did — don't assume the reader knows what a "water fuel cell" or "Moray valve" is

### Tone

- **Investigative, not conspiratorial** — write like a journalist, not an advocate
- **Specific, not vague** — cite dates, locations, names, patent numbers, document numbers
- **Respectful of the dead** — these are real people; write with gravity
- **No emojis** — professional tone throughout
- **Straightforward** — avoid hedging language when facts are established; avoid certainty language when they're not
- **Technology-neutral** — document what happened to the person without endorsing or debunking their technology

### Footer

Every profile ends with:
```markdown
*This information was built by Grok and Claude AI research.*
```

---

## Cross-Linking

Cross-linking creates the investigative web that makes this project valuable. Every connection between people, events, and organizations should be a clickable link.

### Within This Section

- **index.md → Details**: Every person in an index table links to their profile: `[Name](Details/Name.md)`
- **Details → Details**: When one person's profile mentions another person documented here, link to them: `[Stanley Meyer](Stanley_Meyer.md)` (relative path within Details/)
- **index.md patterns → Details**: Pattern analysis sections use inline links to every referenced profile

### To Other Sections (Docusaurus cross-section links)

- **To UAPs section**: Use Docusaurus path `/uaps/Details/Person_Name`
- **To Physics section**: Use Docusaurus path `/physics/Details/Person_Name`

### When to Create Cross-Links

- When a person is **mentioned by name** in another person's profile
- When two people **died under similar circumstances** (e.g., same method, same time period)
- When people **worked together** or were in the **same organization/field**
- When a person's death is part of a **documented cluster** (e.g., Marconi scientists, cold fusion researchers)
- When a person appears in a **sibling section** under a different context
- When a person's technology is **related to another's** (e.g., multiple water fuel cell inventors)

### Overlap Rules

People can appear in multiple sections when they fit multiple scopes:
- **Stanley Meyer** — appears in both Energy and UAPs (water fuel cell, suppressed technology)
- **Marconi scientists** — may appear in both Energy and UAPs (SDI "Star Wars" connection)
- **Nikola Tesla** — could appear in Energy and UAPs (energy research, alleged government seizure)

When a person appears in multiple sections:
- Each section has its own full profile (not a stub that links elsewhere)
- Each profile emphasizes the angle relevant to that section
- Each profile links to the version in the other section
- The "See Also" section explicitly notes the cross-listing

---

## Adding a New Person

### Step 1: Research

Use web search to gather thorough information before writing. Look for:
- News articles about the death/incident/suppression
- Wikipedia pages
- Court documents or official rulings (especially fraud cases — include these)
- Patent records and secrecy orders
- Family member statements
- Books and documentaries that cover the case
- Congressional testimony or declassified documents
- Existing coverage in alternative energy research communities
- Compilations (e.g., Gary Vesperman's list of suppressed energy inventions)

Search for the person's name + "death," "murder," "suicide," "suspicious," "suppressed," "energy," "invention," "patent," or relevant technology keywords.

### Step 2: Create the Detail Profile

- Filename: `Details/FirstName_LastName.md` (underscores, no spaces)
- Use the appropriate template (A, B, C, or D above)
- Include at least 3-5 sources
- Include cross-links to related profiles
- Add any additional sections beyond the template that provide value

### Step 3: Add to index.md

- Add a row to the appropriate category table in index.md
- Place it in the correct table based on the person's technology area
- Within each table, order by recency by decade first (2020s above 2010s above 2000s, etc.), then by suspicion level (highest first) within the same decade, then by year
- Deceased go in the relevant technology table
- Living/missing/at-risk go in the appropriate table with status noted
- Include the one-line summary in the Details column
- Update the profile count in the introduction

### Step 4: Update Patterns

- Check if the person fits any existing pattern in the "Patterns Worth Noting" section of index.md
- Add them to relevant pattern lists with inline links
- If they reveal a new pattern, add a new pattern section

### Step 5: Cross-Link

- Link from the new profile to any related existing profiles
- Update existing profiles to link back to the new one
- Add cross-references to other Docusaurus sections if applicable

---

## Patterns to Watch For

When adding new entries, check if they fit these documented patterns (and add new patterns when they emerge):

- **Death shortly after successful demonstration** — Inventor shows a working device, then dies within weeks or months
- **Death before funding, publication, or going public** — Inventor scheduled to close a deal, publish results, or appear publicly
- **"Suicide" or "accident" after refusing buyout** — Offered money to stop, refused, then died
- **Lab arsons and ransacked workshops** — Research destroyed before or after the inventor's death
- **Prototypes vanish after death** — Working devices disappear from the lab, home, or storage
- **Carbon monoxide "suicides" cluster** — Multiple energy researchers found dead of CO poisoning
- **Patents seized under secrecy orders** — Invention Secrecy Act of 1951 used to classify energy patents
- **Coroner contradictions** — Coroner finds no natural cause but rules natural causes anyway
- **Multiple researchers in same field dying** — Cluster deaths among cold fusion, water fuel, or other specific technology groups
- **Career destruction preceding death** — Discredit → isolate → defund → death
- **Government agencies at the scene** — FBI, military, or unnamed officials appearing to remove materials
- **Associates and collaborators also targeted** — When multiple people in the same research group are harmed
- **Buyout-then-shelve** — Corporation buys the technology and buries it
- **Extreme-efficiency automotive patents** — Inventors of high-MPG carburetors or engines dying or disappearing
- **Deathbed warnings** — "If I die, it wasn't natural" or "if anything happens to me, investigate"
- **Identical death methods in same family** — e.g., father and son both dying of carbon monoxide

---

## Sources and Research Standards

### Preferred Sources (in order of credibility)

1. **Court documents** — rulings, depositions, evidence records, patent disputes, fraud findings
2. **Patent office records** — patent filings, secrecy orders, classification actions
3. **Declassified government documents** — FOIA releases, official inquiries
4. **Congressional testimony and hearing records** — related to patent suppression, energy policy
5. **Major news outlets** — NPR, BBC, CNN, NBC, Washington Post, Fox News, Newsweek
6. **Quality investigative journalism** — specialized investigative reporters
7. **Wikipedia** — for well-documented historical cases
8. **Books by credentialed authors** — with author, title, and year cited
9. **Specialized energy sources** — Infinite Energy magazine, New Energy Times, New Energy Foundation
10. **Compilation lists** — Gary Vesperman's compilation, similar catalogs (note: these are starting points for research, not primary sources)
11. **Documentary films and series** — with title, director, year
12. **Social media and forums** — lowest tier; use only for documenting claims others have made, not as evidence

### Minimum Source Requirements

- **Every profile**: At least 3-5 sourced links
- **Major cases** (HIGHLY SUSPICIOUS): 5-10+ sources preferred
- **Living persons at risk**: Extra sourcing required due to defamation concerns
- **Sources should be diverse** — don't rely solely on alternative energy community sources; include mainstream coverage when available
- **Include fraud findings** — if a court ruled against the technology, cite it. This project documents suppression of people, not advocacy for technologies

### Research Tools

- Use **web search** extensively — this is a research-heavy project where current sources matter
- Search for the person's name + "death," "murder," "suicide," "suspicious," "energy," "invention," "patent"
- Check Find a Grave for death details and family statements
- Check court record databases for legal proceedings and fraud cases
- Check patent databases (USPTO, Google Patents) for patent records and secrecy orders
- Check congressional hearing archives for relevant testimony

---

## Key Concepts for Contributors

### What Makes an Energy-Related Death Suspicious

The core question is always: **Did this person's energy research or technology put them at risk, and does the evidence suggest their death was not what it appeared?**

Indicators we look for:
- Death occurred **shortly before or after** a scheduled demonstration, funding deal, publication, or patent filing
- **Forensic anomalies** that contradict the official ruling
- **Missing or destroyed evidence** — devices, prototypes, notes, research materials vanished
- The person **publicly predicted** they would be killed ("if I die, it wasn't suicide")
- **Associates or collaborators** also died under suspicious circumstances or were threatened
- Death fits a **documented pattern** (same method, same technology field, same time period)
- **Official investigation** was unusually brief, incomplete, or refused to consider alternatives
- **Government agencies** appeared at the scene unusually quickly or removed materials
- The person had **refused buyout offers** or **turned down pressure to stop their work**
- Their **technology threatened major economic interests** — oil, gas, nuclear, utility industries
- **Working prototypes disappeared** after the inventor's death

### What We're NOT Doing

- We are not claiming every death here was a murder
- We are not claiming every suppressed technology actually worked
- We are not ignoring evidence that contradicts our thesis (including fraud findings)
- We ARE documenting patterns that deserve investigation
- We ARE noting when official stories don't match physical evidence
- We ARE taking seriously the testimony of family members, colleagues, and witnesses who say people were targeted
- We ARE documenting what happened to the people regardless of whether their technology was legitimate

### The Standard of Evidence

We don't require courtroom-level proof. We document cases where **meaningful facts deviate from what would be normal**. An inventor who dies the week before a major funding deal is worth documenting. A cluster of cold fusion researchers dying in a short period is worth documenting. A lab that burns down the night after a successful demonstration is worth documenting. A prototype that vanishes from a dead inventor's workshop is worth documenting.

The suspicion level rating tells the reader how strong the evidence is. A reader can filter for only HIGHLY SUSPICIOUS cases if they want the strongest leads, or include UNCERTAIN cases if they want the full picture.
