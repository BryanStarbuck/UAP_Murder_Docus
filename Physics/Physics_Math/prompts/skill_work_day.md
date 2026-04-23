ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math

PROMPTS_DIR is dir {ROOT_DIR}/prompts
SKILL_WORK_DAY_PROMPT_FILE is file {PROMPTS_DIR}/skill_work_day.md
NEW_PROMPTS_DIR is dir {PROMPTS_DIR}/other

TRACK_OVERVIEW_YAML_FILE is file {ROOT_DIR}/Track_Overview.yaml
DAY_STATUS_FILE_TEMPLATE is file {ROOT_DIR}/other/Day_Status_Template.mdx
MANUAL_FILE is file {ROOT_DIR}/manual_UAP_Physics.mdx
ATTEMPTS_DIR is dir {ROOT_DIR}/attempts
DAY_DIR is dir {ROOT_DIR}/day


====================================================================
SKILL: skill_work_day
====================================================================

This is the primary driving skill. Run this to advance the project by
one work day or to continue a partially completed day.

This skill is the engine. Run it. It runs the day. It finds where work
left off. It continues. It does not restart completed work. It produces
real output files. It writes real physics. It runs real simulations.

It does not summarize. It does not plan without acting. It acts.


====================================================================
STEP 0 — ALWAYS READ MANUAL FIRST
====================================================================

Before anything else, read {MANUAL_FILE} in full.

Do not skip this. The manual changes over time. Prior work days update
it. The manual defines how this skill operates.

Key sections to internalize before proceeding:
* Section 1 — Goal and philosophy
* Section 3 — All known experimental approaches (use these to drive work)
* Section 4 — Key empirical data points (priority simulation targets)
* Section 5 — Simulation framework and validation requirements
* Section 7 — Day operation rules
* Section 10 — Skill registry (what sub-skills exist)
* Section 11 — Simulation software registry

If the manual does not exist yet, stop and create it using the
template in {ROOT_DIR}/other/ before proceeding.


====================================================================
STEP 1 — FIND THE CURRENT DAY
====================================================================

* Read {TRACK_OVERVIEW_YAML_FILE}
* Get the value of current_day
* Compute the current day directory: {ROOT_DIR}/day/{current_day}/
* Compute the day status file: {ROOT_DIR}/day/{current_day}/status_day.mdx
* Check whether the status file exists

If the status file does NOT exist:
  * This is a new day. Go to STEP 2 (Create New Day).

If the status file EXISTS:
  * Read it fully
  * Scan for WORK_DAY_IS_NOW_FINISHED and check if it has [x]
  * If [x]: the day is complete. Go to STEP 2 (Create New Day).
  * If [ ]: the day is in progress. Go to STEP 3 (Continue Day).


====================================================================
STEP 2 — CREATE NEW DAY
====================================================================

2.1 INCREMENT THE DAY

* Read current_day from {TRACK_OVERVIEW_YAML_FILE}
* Set new_day = current_day + 1
* Update current_day in {TRACK_OVERVIEW_YAML_FILE} to new_day
* Create directory: {ROOT_DIR}/day/{new_day}/
* Copy {DAY_STATUS_FILE_TEMPLATE} to {ROOT_DIR}/day/{new_day}/status_day.mdx
* In the new status file, replace all template placeholders:
    * {WORK_DAY_NUMBER} with new_day
    * {DATE} with today's date
    * {ATTEMPT_NUMBER} with current_attempt from Track_Overview.yaml


2.2 READ CONTEXT FOR THE NEW DAY

Read all of the following before writing the plan:

* {MANUAL_FILE} — already read in Step 0

* Reflection files from last 10 days if they exist:
    {ROOT_DIR}/day/{N}/reflection_day_{N}.mdx for N = (new_day-1) down to (new_day-10)
    Weight most recent reflections most heavily.
    If fewer than 10 days exist, read all that do exist.
    If NO reflection files exist (Day 1 or early days), do the following instead:
      * Read all source data in {ROOT_DIR}/1_Track/ for known research content
      * Read {ROOT_DIR}/Track_2/ and {ROOT_DIR}/Track_3/ for additional tracks
      * Use Manual Section 3 (known approaches) as the strategic input

* All existing Attempt.yaml files in {ATTEMPTS_DIR}/:
    For each subdirectory N in {ATTEMPTS_DIR}/: read {ATTEMPTS_DIR}/{N}/Attempt.yaml
    Build a table in your working context of all attempts and their status.
    Know which are active, which are stalled, which have simulation results.

After reading all context, answer these strategic questions before
writing the plan:

  * Is any current attempt showing simulation-positive results?
  * Has any attempt been worked on for more than five days without a
    positive result? (If so, consider suspending it — see Manual Section 6.1)
  * Are there empirical data points from Manual Section 4 that have not
    been targeted by any simulation yet?
  * Are there approaches from Manual Section 3 that have no attempt
    directory yet?
  * What did the most recent reflection say to prioritize?

Write the plan file: {ROOT_DIR}/day/{new_day}/plan_day_{new_day}.mdx

The plan file must include:
  * Which attempt to focus on (or whether to start a new attempt)
  * What physics mechanism will be analyzed today
  * What simulation will be run today and using which software (Manual Section 11)
  * Whether any validation run is required before the main simulation
    (required if a simulation tool has not been validated yet — see Manual 5.3)
  * Any new approaches from research corpus to investigate
  * Any updates to attempt directories planned

Then continue to STEP 3 with the new day status file.


====================================================================
STEP 3 — CONTINUE DAY
====================================================================

3.1 SCAN FOR FIRST UNCHECKED STEP

* Read the day status file fully
* Find the first item with [ ] (unchecked) from top to bottom
* That is the active step
* Execute it using STEP 4 guidance
* When the step is complete, replace [ ] with [x] in the status file
* Write the updated status file to disk immediately (do not batch)
* Find the next [ ] item and repeat
* Continue until all items are [x] or a blocking error occurs (see 3.3)


3.2 READ THE ACTIVE ATTEMPT BEFORE TECHNICAL STEPS

Before executing any of the PHYSICS, MATH, ENGINEERING, or SIMULATION
steps, read the current attempt's Attempt.yaml:
  {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/Attempt.yaml

From the Attempt.yaml, extract:
* Physics basis and key equations
* Design parameters (exact values)
* Simulation plan (what software, what test cases)
* Open questions (these drive what to investigate)
* Status notes from prior days

Also read Manual Section 3 entry for this approach to understand the
full context for the mechanism being investigated.

Also read Manual Section 4 — check whether any key empirical data point
maps to the current attempt's mechanism. If yes, that empirical result
is a validation target for today's simulation.


3.3 BLOCKING ERROR HANDLING

A blocking error is any condition that prevents a step from completing
that cannot be resolved within the current session. Examples:
* Simulation software not installed and cannot be installed now
* Required input file missing with no way to create it
* Physics model is internally inconsistent and needs theory rework
* SIMULATION_PASS_COUNT reached 10 with no successful run

When a blocking error occurs:
* Document it in the status file immediately: write the error after
  the [ ] bracket before marking it
* Mark the step with [!] to indicate blocked, not [x] complete
* Write what was attempted and why it failed
* Continue to the REFLECTION step — do not halt the day
* The reflection step must address the blocking error


====================================================================
STEP 4 — EXECUTING SPECIFIC DAY STEPS
====================================================================

This step provides detailed guidance for executing each type of step
in the day status file.


4.1 PLAN FOR DAY (first step in every day)

Done in STEP 2 above. If resuming a day where this was not yet done:
* Perform the same context reading described in Step 2.2
* Write {ROOT_DIR}/day/{DAY_NUMBER}/plan_day_{DAY_NUMBER}.mdx
* Mark the plan step [x] and continue


4.2 ATTEMPT SELECTION STEP

If continuing an existing attempt:
* Verify the Attempt.yaml for that attempt is current
* If the Attempt.yaml says "status: stalled" or if the attempt has had
  more than five days of work with no positive result, consider whether
  this is still the right choice
* Update Attempt.yaml to set status: active and record which day is
  focusing on it

If creating a new attempt:
* Choose an approach from Manual Section 3 that has no attempt directory yet
* OR identify a variation of an existing approach based on simulation
  findings that justifies a distinct new design hypothesis
* Create directory: {ATTEMPTS_DIR}/{N+1}/
* Write Attempt.yaml using the template in Manual Section 6.3 guidance
* Update {TRACK_OVERVIEW_YAML_FILE}: add the new attempt, set current_attempt
* Update Manual Section 12 change log


4.3 THEORY WORK STEP

Theory work is not speculation. It is structured physics analysis.

Write or update {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/Theory.mdx

Theory.mdx must contain at minimum:
* The physical mechanism claimed to produce lift or thrust
* The specific equations governing the mechanism
* Dimensional analysis confirming the equations predict a force
* The specific geometry of the design and why it breaks symmetry to
  produce a net vertical force (symmetry argument is required — a
  symmetric design produces zero net force by Earnshaw's theorem)
* The key unknown: what simulation needs to verify
* Any prior day results that modified or constrained the theory

Write at PhD level. Every claim requires an equation or a cited source.
No hand-waving. See Manual Section 9 for reference physics notes.


4.4 PHYSICS FILES FOR THE DAY

File: {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/physics_day_{DAY_NUMBER}.mdx

This file contains:
* Date and attempt number at top
* The specific physics question investigated today
* Full derivation of any new equations (not just the result, every step)
* Connection to existing equations in the Theory.mdx
* Departure from Newtonian or standard EM framework, if any, with
  explicit statement of what conventional physics predicts vs. what
  the hypothesis predicts differently
* Any constraints or boundary conditions on the derivation
* What the physics analysis implies the simulation should show

Write at PhD level throughout.


4.5 MATH FILES FOR THE DAY

File: {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/math_day_{DAY_NUMBER}.mdx

This file contains:
* Full mathematical derivations for today's analysis
* Every step shown — no hand-waving of algebra or calculus
* Dimensional analysis: confirm units are consistent throughout
* Limiting cases: what does the formula reduce to at extreme limits?
* Numerical evaluation: compute actual numbers for the design parameters
  in Attempt.yaml to get expected force magnitude
* Comparison: how does the predicted force compare to the target lift
  mass times g? Is it within an order of magnitude? Multiple orders off?

If the numerical evaluation shows the predicted force is many orders of
magnitude below the lift target, document this. It is important data.
It means either the design parameters need radical change or the
physical mechanism is insufficient.


4.6 ENGINEERING FILES FOR THE DAY

File: {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/engineering_day_{DAY_NUMBER}.mdx

This file contains:
* What physical components implement today's design
* Material specifications for each component (use Attempt.yaml as base)
* Dimensional specifications: sizes, gaps, tolerances
* Power requirements: estimated current, voltage, field strength
* Mechanical constraints: centrifugal stress limits at operating RPM,
  thermal limits, structural requirements
* What aspects of the design can be simulated vs. require physical build
* What is the minimum build to test the key physics claim?

Engineering files inform the simulation setup. Simulation geometry
comes from here.


4.7 SIMULATION SETUP AND RUN

File: {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/sim_setup_day_{DAY_NUMBER}.mdx

Before running a simulation:
* Check Manual Section 11 (Simulation Software Registry)
* Select the simulation tool appropriate for the physics of the current attempt:
  * Rotating/static magnetic fields → Magpylib or Radia (magnetostatics)
  * Electrostatic thrust (Approach 3.4) → scipy/numpy electrostatic solver
  * Full 3D FEM (complex geometry) → ElmerFEM or GetDP
  * NEVER use a magnetostatics tool (Magpylib) to simulate electrostatics
* Verify the chosen simulation library is installed: run `python3 -c "import <package>"`.
  If not installed, run `pip install <package>` before proceeding. Do not skip this.
* Has the chosen software been validated yet?
  * If NO: run the validation case first (see Manual Section 5.3)
  * If YES: proceed to the main simulation setup

For every simulation run, record in sim_setup_day_{DAY_NUMBER}.mdx:
* Software name and version
* Geometry inputs (dimensions, materials, boundary conditions)
* Field source inputs (currents, magnet strengths, voltages)
* What force or field quantity is being computed
* Expected result (from math file)
* Actual result
* Whether result matches expectation
* If result is surprising: what does it imply for the theory?

Code files go in: {ROOT_DIR}/simulation/{SOFTWARE_NAME}/software/
Naming: run_{ATTEMPT_NUMBER}_{DAY_NUMBER}_{short_description}.py

Priority simulation targets from Manual Section 4:
* Buhler asymmetric electrostatic thrust result — validate framework
  against this real measured result before using for new physics
* BUGA anomalous mass readings — design simulation to test whether
  any electromagnetic configuration produces detectable weight change
* Cernohajev 32-solenoid spherical array — model field geometry and
  compute forces at stated parameters


4.8 SIMULATION PASS LOOP

For each pass through the simulation loop:

* Increment SIMULATION_PASS_COUNT in the status file
* If SIMULATION_PASS_COUNT is now greater than 10: stop the loop.
  Write in status file: "SIMULATION BLOCKED: 10 passes exhausted.
  Reason: [what failed]. Moving to reflection."
  Mark the loop block with [!] and continue to REFLECTION.

A "failed" simulation pass is any of these:
* Code errors that prevent the simulation from running
* Simulation runs but produces non-physical results
  (e.g., force that is infinite, negative energy, imaginary field)
* Simulation runs but produces zero force when force should be nonzero
  based on the design intent — this is a physics result, not a code
  error, document it as such

A pass is NOT a failure just because the result is smaller than desired.
A small force result is a real result. It is not a pass failure.


4.9 SIMULATION LEARNING STEP

File: {ATTEMPTS_DIR}/{ATTEMPT_NUMBER}/sim_learned_day_{DAY_NUMBER}.mdx

This file answers:
* What did the simulation confirm?
* What did the simulation contradict in the theory?
* What parameter changes would increase the predicted force?
* Are there any anomalous results that do not match standard physics
  predictions for this configuration?
* What should the next simulation test?
* Does this result suggest abandoning the approach or continuing?
* Does this result suggest modifying the design within the same approach?

Update Attempt.yaml after writing this file:
* Add simulation findings to status_notes field
* Update open_questions based on what the simulation answered or raised
* If the result is definitively negative: update status to "stalled"


4.10 REFLECTION AND POSTMORTEM STEP

File: {ROOT_DIR}/day/{DAY_NUMBER}/reflection_day_{DAY_NUMBER}.mdx

The reflection file is not a summary. It is analysis. Answer these
specific questions (from Manual Section 7.4):

  * What did simulation or analysis show today that was not expected?
  * Is the current attempt showing any sign of positive progress?
  * Has any attempt gone five or more days without a positive result?
  * Are there patterns across the last 10 days suggesting strategy change?
  * Should a new attempt be started? Which approach from Manual Section 3?
  * Should an old attempt be revisited? Why?
  * Are there empirical data points from Manual Section 4 not yet targeted?
  * Should the day template be updated with new steps?
  * Should this manual be updated with new learnings?
  * What should the next day focus on?

Be specific. Vague reflection produces vague planning. Name the attempt.
Name the approach. Name the physics mechanism. Name the parameter to
change.


4.11 MANUAL AND TEMPLATE IMPROVEMENT STEP

If the reflection identified improvements to make:

Updating the manual ({MANUAL_FILE}):
* Add the learning to the appropriate section
* Add a new section if the learning genuinely does not fit anywhere
* Update Section 12 change log with the date and what changed
* Never remove existing content — only add or refine

Updating the day template ({DAY_STATUS_FILE_TEMPLATE}):
* Add any new steps that proved valuable and should repeat in future days
* Do not remove steps — only add or annotate
* Future days created from this template will have the new steps

Creating a new skill in {NEW_PROMPTS_DIR}/:
* Create a skill when a step has become complex enough to benefit from
  its own reusable prompt file
* Register it in Manual Section 10 (Skill Registry)
* Name it descriptively: verb_noun.md (example: run_femm_validation.md)


====================================================================
STEP 5 — END OF DAY
====================================================================

When WORK_DAY_IS_NOW_FINISHED step is reached in the checklist:

* Verify all prior steps are [x] or [!] (blocked with note)
  If any step is still [ ] (not started), do not mark the day finished.
  Continue working those steps.

* Write the reflection file if not already written.
  Reflection is required even if the day was short or unproductive.

* Update {TRACK_OVERVIEW_YAML_FILE}:
  Under days:{day_number}:
    status: complete
    reflection_file: {ROOT_DIR}/day/{day_number}/reflection_day_{day_number}.mdx
    attempt_focus: {ATTEMPT_NUMBER}

* Mark WORK_DAY_IS_NOW_FINISHED as [x] in the status file

* This skill is now finished for this invocation.
  When run again, STEP 1 will detect the completed day and create a new one.


====================================================================
STEP 6 — GUARD RULES (always enforce)
====================================================================

* Never skip a step that has [ ] (unchecked)
* Never re-run a step that has [x] (already complete)
* Never mark a step [x] unless real work was done and output files exist
* Never write physics at below PhD level in any attempt file
* Never use a simulation tool without validating it first (Manual 5.3)
* Never run the simulation loop more than 10 times
* Always update Attempt.yaml after simulation work
* Always read the current Attempt.yaml before doing technical work on it
* Always read the manual at the start of a new day
* If the manual says to update itself, update it


====================================================================
STEP 7 — RESEARCH CORPUS REFERENCE
====================================================================

When planning or doing theory work, the input research content lives in:

* {ROOT_DIR}/1_Track/ — tweet transcriptions and knowledge files from
  @RedCollie1 (Dr. Horace Drew) research. Contains crop circle analysis,
  EM apparatus documentation, physics interpretations.

* {ROOT_DIR}/Track_2/ — additional research track content

* {ROOT_DIR}/Track_3/ — additional research track content

* {ROOT_DIR}/patents_intl/ — international patent reference files

* {ROOT_DIR}/images_description/ — text descriptions of research images
  including BUGA device construction stages and crop circle geometry

* {ROOT_DIR}/videos/ — reference video content

Use this corpus when:
* Identifying a new approach to add to Manual Section 3
* Looking for empirical data points to add to Manual Section 4
* Finding design parameters for a new attempt Attempt.yaml
* Verifying that a simulation target maps to an observed phenomenon


====================================================================
STEP 8 — APPROACH PRIORITY GUIDANCE
====================================================================

From highest to lowest simulation priority based on empirical strength:

Priority 1 — Buhler asymmetric electrostatic thrust (Manual Section 3.4)
  Most experimentally credible. Named researcher. Vacuum tested. Validate
  simulation framework against this result first.

Priority 2 — BUGA device anomalous mass readings (Manual Section 3.3)
  Documented scale measurements across construction stages. Rotating
  three-phase EM field above toroidal element. Podkletnov analog.
  Anomalous weight change claim deserves simulation test.

Priority 3 — Rotating asymmetric magnet array (Manual Section 3.1)
  Current Attempt 1. Kelvin body force mechanism. FEMM or magpylib.
  Most physically conservative approach.

Priority 4 — Counter-rotating disc (Paulsen/Searl) (Manual Section 3.2)
  Documented witness account with specific design parameters.
  12-magnet, two-disc configuration. Cross-references Searl Effect
  Generator experimental claims.

Priority 5 — Cernohajev 32-solenoid spherical array (Manual Section 3.5)
  Highly specific parameters. Source is secondary (engineer claims from
  recovered craft). Worth one dedicated simulation run.

Lower priority — Gravitomagnetic Podkletnov replica (Manual Section 3.7)
  Requires superconductor to reproduce; room-temperature analog unproven.
  Simulate the field geometry to see if it is structurally analogous.

Lower priority — Geometric harmonic resonance (Manual Section 3.8)
  Hypothesis-level. No direct experimental validation. Worth one test.


====================================================================
STEP 9 — SUB-SKILL EXECUTION
====================================================================

Some day steps may call for a sub-skill. Sub-skills live in {NEW_PROMPTS_DIR}/.

When a step calls for a sub-skill:
* Check if the relevant .md file exists in {NEW_PROMPTS_DIR}/
* If it exists: read it and execute its instructions as a sub-task
* If it does NOT exist: execute the step inline without a sub-skill.
  After completion, consider whether the step is complex enough to
  warrant writing a new sub-skill for future reuse. If yes, write it
  in {NEW_PROMPTS_DIR}/ and register it in Manual Section 10.

Do not block on missing sub-skills. Execute inline and create the skill
after the fact.
