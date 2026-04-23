ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math

PROMPTS_DIR is dir {ROOT_DIR}/prompts
TRACK_OVERVIEW_YAML_FILE is file {ROOT_DIR}/Track_Overview.yaml
MANUAL_FILE is file {ROOT_DIR}/manual_UAP_Physics.mdx
ATTEMPTS_DIR is dir {ROOT_DIR}/attempts
UI_DIR is dir {ROOT_DIR}/ui
UI_OVERVIEW_FILE is file {UI_DIR}/overview.mdx
UI_MAGNETIC_FILE is file {UI_DIR}/magnetic_propulsion.mdx


====================================================================
SKILL: p_update_ui
====================================================================

Update the public-facing UI wiki under {UI_DIR} to reflect the current
state of all attempts and simulation results. Run this after any work
day that produces new simulation findings, adds a new attempt, or
changes the status of an existing attempt.

This skill produces no new physics. It reads existing technical files
and uses them to update the public-facing overview and attempt pages.
It never removes technical detail from attempt overview_ui.mdx files.
It adds new summaries on top. It updates status, findings tables, and
links as things change.


====================================================================
PHASE 1: READ CURRENT STATE
====================================================================

* Read {TRACK_OVERVIEW_YAML_FILE}
  Note: current_day, current_attempt, total_attempts, status of each attempt

* Read {MANUAL_FILE} Section 4 (key empirical data points) and
  Section 9 (physics reference notes with critical learnings)
  Note any new sections added since the last UI update

* For each attempt number N from 1 to total_attempts:
  * Read {ATTEMPTS_DIR}/{N}/Attempt.yaml
  * Note: name, status, summary, simulation_results_* sections,
    open_questions, status_notes
  * List all .mdx files present in {ATTEMPTS_DIR}/{N}/
    These are the documents that overview_ui.mdx must link to


====================================================================
PHASE 2: UPDATE ATTEMPT OVERVIEW_UI FILES
====================================================================

For each attempt N:

* Check whether {ATTEMPTS_DIR}/{N}/overview_ui.mdx exists
  If it does not exist: create it from scratch using the template
  structure defined in PHASE 4 below.
  If it exists: update it as follows.

* At the top of the file, update the status line in bold:
  Write the current status (Active / Secondary / Stalled / Complete)
  and the single most important current finding in one sentence.

* In the "What We Found" or "What the Simulations Showed" section:
  Add any new simulation_results_* blocks from Attempt.yaml that are
  not yet reflected in the overview_ui.mdx.
  Do not remove existing findings. Append to the table. Add new rows.

* Update the open questions section if open_questions in Attempt.yaml
  has changed. Mark answered questions as answered with the answer.

* In the Technical Investigation Record table:
  Add any new .mdx files from the attempt directory that are not yet
  listed. Each entry needs: filename, and one-line description of
  what that document contains.
  Link format: [Document Title](/physics/Physics_Math/attempts/{N}/{filename_without_extension})

* Do not delete any content from overview_ui.mdx. Only add.


====================================================================
PHASE 3: UPDATE UI MAGNETIC PROPULSION PAGE
====================================================================

* Read {UI_MAGNETIC_FILE}

* Check the numbered alternative list. Verify:
  * All attempts from total_attempts are listed
  * Each attempt's status line is current (matches Attempt.yaml status field)
  * Each attempt's 15-word-or-less description reflects the current
    most important single finding
  * Each attempt links to the correct overview_ui.mdx page

* If any attempt is missing: add it to the list as a new numbered entry.
  Format:
    ** N. [Attempt Name] — [One-Word Drive Category]**
    *Status: [status]. [Key finding in 15 words or fewer.]*
    [Two-sentence public summary of what this attempt investigates and
    what the most important result was.]
    <a href="/physics/Physics_Math/attempts/{N}/overview_ui">→ Full Investigation Record: Attempt {N}</a>

* If any attempt status has changed: update the status line.

* Update the "Core Barrier" section if new mechanisms have been
  confirmed or ruled out since the last update.


====================================================================
PHASE 4: UPDATE UI OVERVIEW PAGE
====================================================================

* Read {UI_OVERVIEW_FILE}

* In the "What the Investigation Has Established So Far" section:
  Add any new confirmed results from the most recent work days.
  Keep this section as a running bulleted summary. Do not delete
  prior entries. Mark superseded findings with (updated: Day N).

* Update the "The open question" line to reflect the current Day's
  primary open question from the most recent reflection file.

* If any new propulsion approach has been started (a new attempt
  with a different physics mechanism than rotating magnetic fields):
  Add a new top-level section under "Propulsion Approaches Under
  Investigation" with a button linking to a new sub-page.

* The "Approaches on the Horizon" list: move any item off this list
  and into a proper approach section once an attempt for it is created.


====================================================================
PHASE 5: TEMPLATE FOR NEW OVERVIEW_UI.MDX
====================================================================

When creating a new overview_ui.mdx from scratch, use this structure:

--- (frontmatter)
title: "Attempt {N}: {attempt_name_human_readable}"
--- (end frontmatter)

# Attempt {N}: {attempt_name} — {one-line drive category name}

**Status: {status}.** {One sentence: the single most important finding so far.}

---

## What We Were Trying to Do

[3-5 paragraphs: public-accessible explanation of the physics being
tested. What mechanism was the hypothesis. Why it might work.
What would have to be true for it to produce external thrust.
Connection to documented UAP research or experimental results.]

---

## What We Found

[Simulation results table or bullet list. Be specific: numbers,
units, scaling laws, comparison to lift target. For each major
finding, state whether it supports or contradicts the hypothesis.]

---

## What This Means

[2-3 paragraphs: interpretation of the findings. What is ruled out.
What is still open. What the next step is. What the path to
measurable thrust would require.]

---

## Technical Investigation Record

[Table of all .mdx files in the attempt directory with descriptions.
Link format: [Document Title](/physics/Physics_Math/attempts/{N}/{filename})]

---

*Back to: [Rotating Magnetic Field Propulsion](/physics/Physics_Math/ui/magnetic_propulsion) | [UAP Physics, Propulsion, and Energy](/physics/Physics_Math/ui/overview)*


====================================================================
PHASE 6: VERIFY NAVIGATION BUTTONS ON INVESTIGATION INDEX PAGES
====================================================================

Verify that the following three files each contain a button linking
to {UI_OVERVIEW_FILE} at URL /physics/Physics_Math/ui/overview:

* ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/index.mdx
* ~/BGit/Bryan_git/UAP_Murder_Docus/UAPs/index.mdx
* ~/BGit/Bryan_git/UAP_Murder_Docus/Energy/index.mdx

The button format must be:
<div style="margin-top: 1.25rem; margin-bottom: 0.5rem;">
<a href="/physics/Physics_Math/ui/overview" class="button button--primary button--lg">UAP Physics, Propulsion, and Energy →</a>
</div>

If any of these files is missing the button, add it after the
cross-links block (the bold paragraph links to other investigations)
and before the first horizontal rule (---) or first ## heading.

Do not change any other content in these files.


====================================================================
PHASE 7: REPORT WHAT CHANGED
====================================================================

After completing all updates, output a summary report to stdout:

Output to stdout:
====================================================================
UI UPDATE REPORT
====================================================================

OVERVIEW PAGE: {UI_OVERVIEW_FILE}
  * [List changes made]

MAGNETIC PROPULSION PAGE: {UI_MAGNETIC_FILE}
  * [List changes made, including any new attempts added]

ATTEMPT OVERVIEW_UI FILES UPDATED:
  * Attempt {N}: [one-line description of what changed]
  * [repeat for each updated file]

ATTEMPT OVERVIEW_UI FILES CREATED:
  * Attempt {N}: [created from scratch]

NAVIGATION BUTTONS: [verified / added to which files]

NO CHANGES NEEDED: [list any files that were already current]
====================================================================
