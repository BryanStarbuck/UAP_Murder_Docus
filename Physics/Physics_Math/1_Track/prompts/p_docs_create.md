# p_docs_create — Wiki Creation & Update Prompt

## Purpose

This prompt creates and maintains a research wiki in the `docstructure/` directory (peer of this `prompts/` directory). The wiki synthesizes all knowledge files from the source directory into structured MDX documents that answer specific investigative questions about the physics work of @RedCollie1 (Dr. Horace Drew).

---

## Section 1 — Read All Source Files First

**Before doing anything else, read every file in this directory into the context window:**

```
~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets/knowledge/final/
```

List all `.mdx` files in that directory and read each one in full. Do not begin writing wiki content until all source files have been read and their contents are fully available in context. The source files currently include:

- `overall_Beyond_Nutton.mdx`
- `overall_Energy.mdx`
- `overall_Explain.mdx`
- `overall_Lift.mdx`
- `overall_Magnetics.mdx`
- `overall_Math.mdx`
- `overall_other.mdx`
- `overall_Physics.mdx`

If new files have been added since this prompt was written, read those as well. Always re-read the full set on each run — do not rely on cached content from a previous run.

---

## Section 2 — Destination Directory

Write all wiki output to:

```
~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/docstructure/
```

Create the directory if it does not exist. All files are `.mdx` format. File names use underscores in place of spaces (e.g., `Beyond_Classical_Physics.mdx`). Never use spaces in file names.

---

## Section 3 — Wiki Structure

The wiki consists of:

1. **`overview.mdx`** — The hub page. Contains:
   - A brief introduction to the research subject (Dr. Horace Drew / @RedCollie1 and his UAP propulsion thesis)
   - A **Table of Contents** with phrase-linked entries pointing to every other wiki document
   - A **"All Documents" section** with full hyperlinked phrases to every other wiki document (not just titles — use descriptive phrases as the link text)

2. **Topic pages** — One `.mdx` file per question answered (see Section 4). Each topic page:
   - Answers one question in full depth using only what the source files contain
   - Uses PhD-level physics language throughout (see content standard in `Physics/CLAUDE.md`)
   - Includes relevant equations, mechanism descriptions, and direct quotes from source material
   - Has a "Back to Overview" link at the top
   - Has a "See Also" section at the bottom linking to related topic pages within the wiki

---

## Section 4 — Questions to Answer (One Page Per Question)

For each question below, create a dedicated `.mdx` wiki page. The filename for each is specified. Answer entirely from the source files read in Section 1 — do not invent claims not present in the sources.

---

### Question 1 — Beyond Classical Physics

**File:** `Beyond_Classical_Physics.mdx`

**Question:** Does this person's work demonstrate, claim, or provide a theoretical basis for phenomena that go beyond Newtonian/Classical Physics? If so, what specifically are those phenomena?

**Answer must cover:**
- State clearly: yes or no — does the work claim phenomena beyond Newtonian and/or Classical Electrodynamics?
- List each claimed beyond-classical phenomenon specifically (e.g., Newton's Third Law violation in mechanical systems, anomalous Lorentz force behavior, gravitomagnetic coupling, etc.)
- For each phenomenon: state the theoretical basis Drew provides, the mathematical framework used (with equations), and what law or principle of classical physics it contradicts or extends
- Distinguish between: (a) claims that are extensions of known physics (GR effects, EM field momentum), (b) claims that require new physics not in the Standard Model, and (c) claims that are straightforwardly within classical physics but mischaracterized as beyond it
- Note the evidence tier: is each beyond-classical claim theoretical, experimental, observational (UAP sensor data), or speculative?
- Link to the Lift page and the Magnetics page for mechanism details

---

### Question 2 — Lift and Propulsion Validity

**File:** `Lift_And_Propulsion.mdx`

**Question:** Does the work claim to generate lift? Would the described mechanism actually produce lift as a valid propulsion system — one that could raise a craft off the ground, operate without ground support, and continue lifting to arbitrary altitude by scaling?

**Answer must cover:**

**Part A — Does it claim lift?**
- State Drew's exact claim about lift generation (quote from source)
- Describe the proposed mechanism in full: what physical configuration, what energy inputs, what the claimed output force is and in what direction

**Part B — Physical validity analysis**
- Does the mechanism as described produce a net upward force on the device itself (not just on a reaction mass or the ground)?
- Does it violate or comply with conservation of momentum when the full system (device + EM field + gravitational field) is considered?
- Is the Z-axis force generation from XY-plane rotation physically justified? What is the theoretical coupling mechanism?
- What does the spin/counter-spin configuration actually do to the stress-energy tensor T_μν and the local spacetime metric, if anything?
- Are there known analogues in established physics (e.g., gyroscopic precession, Lense-Thirring frame dragging, Magnus effect) that partially support or refute the claimed coupling?

**Part C — Can it scale?**
- Would the mechanism continue to produce lift if the device were not resting on or attached to the ground?
- What happens to the reaction force path when ground contact is removed? Does the mechanism still function?
- Would lift scale with device size, rotation speed, or field strength in the way Drew claims?
- What are the engineering constraints (materials, power density, heat dissipation, bearing loads) that limit scalability?

**Part D — Verdict**
- Summarize: is this a valid new propulsion system in principle? What would need to be true for it to work?
- What experimental result would confirm or falsify the core lift claim?

---

### Question 3 — New Energy Source

**File:** `New_Energy_Source.mdx`

**Question:** Does this work claim to produce energy output beyond the input energy supplied — i.e., is it claiming a new energy source that violates or circumvents conservation of energy? Yes or no, and what is the mechanism?

**Answer must cover:**

**Part A — Does Drew claim over-unity energy output?**
- Does the work explicitly or implicitly claim that the device produces more energy than is put in?
- Distinguish between: (a) claims about propulsion efficiency (force per watt), (b) claims about tapping zero-point energy or vacuum energy, (c) claims about gravitational potential energy release (falling in a new direction), and (d) explicit over-unity claims
- Quote directly from source material where relevant

**Part B — Where would the "extra" energy come from?**
- If the device produces lift without a reaction mass, where does the momentum/energy go according to Drew's theoretical framework?
- Does he invoke the electromagnetic field as an energy reservoir? The gravitational field? Zero-point energy? Vacuum fluctuations? Something else?
- What is the mathematical accounting — does his framework conserve total energy (mechanical + EM field + gravitational) or does it not close?

**Part C — Conservation of energy: compliant or not?**
- Taking his full theoretical framework at face value: does it conserve energy when all fields and degrees of freedom are included, or does it require a genuine violation?
- If compliant when extended fields are included: explain how
- If non-compliant: identify exactly where the accounting breaks down
- Note: a device that converts vacuum energy to mechanical energy does not violate conservation of energy if the vacuum energy is real and finite — explain how this distinction applies (or doesn't) to Drew's claims

**Part D — Verdict**
- Yes or no: does this constitute a claim for a new energy source beyond conservation of energy?
- What would need to be measured or demonstrated to settle the question?

---

## Section 5 — overview.mdx Structure

The `overview.mdx` file must follow this exact structure:

```
# @RedCollie1 Research Wiki — Overview

## Introduction
[2-3 paragraphs: who Dr. Horace Drew is, what his core thesis is, why this wiki exists]

## Table of Contents
- [Phrase describing Q1 page](./Beyond_Classical_Physics.mdx)
- [Phrase describing Q2 page](./Lift_And_Propulsion.mdx)
- [Phrase describing Q3 page](./New_Energy_Source.mdx)

## All Documents

**[Full descriptive phrase for Q1]** — [Beyond Classical Physics](./Beyond_Classical_Physics.mdx)

**[Full descriptive phrase for Q2]** — [Lift and Propulsion Validity](./Lift_And_Propulsion.mdx)

**[Full descriptive phrase for Q3]** — [New Energy Source](./New_Energy_Source.mdx)

## Source Material
[Note the source directory and what it contains]

---
*Last Updated: [date of run]*
```

Descriptive phrases must be sentence-style descriptions, not just titles. Example: "Whether Drew's spin/counter-spin mechanism claims phenomena beyond Newtonian and Classical Electrodynamics, and what those phenomena are" — not just "Beyond Classical Physics."

---

## Section 6 — Update Behavior

This prompt is designed to be run repeatedly as source files are updated. On each run:

1. Re-read all source files from Section 1
2. Check each wiki page: does it still accurately reflect the source content?
3. Update any page where the source has changed or new information is present
4. If new source files have been added, create new wiki pages and update `overview.mdx` to link them
5. Update the `Last Updated` footer in every file that was changed
6. Do NOT delete existing wiki pages unless the corresponding source topic has been entirely removed

---

## Section 7 — Content Standard

All wiki content is written at **PhD level** as specified in `Physics/CLAUDE.md`:

- Preserve full mathematical formalism: tensors, differential geometry, Lagrangians, field equations, operator algebra
- Never simplify or hand-wave steps
- Use precise technical terminology throughout
- Cite the specific source file and tweet ID when quoting or paraphrasing Drew's claims
- Include dimensional analysis and limiting cases where relevant
- Present Drew's framework honestly: note where it aligns with established physics and where it diverges
- The "Verdict" sections in each page must be scientifically honest — if the claim is unsupported, say so; if it is plausible within an extended framework, say that

---

*Prompt version: 2026-04-22*
