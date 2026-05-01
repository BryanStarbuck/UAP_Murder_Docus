ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

BREAK_THRUS_FILE is file {ROOT_DIR}/Break_thrus.mdx

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

TRACK_PATTERN is the naming convention for track directories:
  Track_{Number}  (examples: Track_5, Track_6, Track_7)
  Track numbers begin at 5 and go up. Numbers 1-4 are reserved and
  must never be created or overwritten by this prompt.

OVERVIEW_FILENAME is the string: overview.mdx


====================================================================
GOAL
====================================================================

This prompt processes BREAK_THRUS_FILE, which is a staging file where
raw research on breakthrough physics ideas is accumulated. Each time
new raw content is added to BREAK_THRUS_FILE, this prompt is run to
extract every distinct physics idea or breakthrough out of it, create
a new Track directory for each, and store the relevant content in an
overview.mdx inside that directory. When all ideas are extracted and
confirmed captured, the contents of BREAK_THRUS_FILE are cleared.

A "breakthrough" is any physics idea, propulsion method, energy system,
or principle that goes beyond traditional Newtonian mechanics, classical
engines, conventional electrical generation, and standard aeronautical
lift. Examples: zero-point energy harvesting, quantum vacuum coupling,
metric engineering, inertial mass reduction, rotating EM field anomalies,
Casimir force devices, exotic matter proposals, antigravity candidates.

Run this each time BREAK_THRUS_FILE has new content. It always picks up
where it left off by detecting which track numbers already exist.


====================================================================
PHASE 1: FIND THE NEXT AVAILABLE TRACK NUMBER
====================================================================

* List all directories directly inside ROOT_DIR whose names match the
  pattern Track_{Number} (case-insensitive, underscore-separated).
  Also match the variant 1_Track, 2_Track, etc. if present, treating
  the leading number as the track number.
* Collect all track numbers found (integers). The reserved range is
  1 through 4 inclusive — these always exist and must never be touched.
* The next available track number is the smallest integer >= 5 that
  is NOT already in use.
* Store this as NEXT_TRACK_NUMBER.
* Output to stdout: "Next available track number: {NEXT_TRACK_NUMBER}"


====================================================================
PHASE 2: READ BREAK_THRUS_FILE AND IDENTIFY DISTINCT IDEAS
====================================================================

* Read the full contents of BREAK_THRUS_FILE.
* If the file is empty or contains only whitespace, output to stdout:
  "Break_thrus.mdx is empty. Nothing to process." and stop.
* Analyze the content and identify every distinct physics idea,
  breakthrough, propulsion thesis, or energy system present in the
  file. Each distinct idea will become its own track directory.
* A distinct idea is a coherent physics thesis, mechanism, or approach
  that stands on its own — for example, quantum vacuum ZPF harvesting
  is one idea; rotating magnetic array lift is a separate idea.
* Count the ideas. Store this as IDEA_COUNT.
* Output to stdout: "Ideas found in Break_thrus.mdx: {IDEA_COUNT}"
* For each idea, write a one-sentence label describing it. These labels
  will be used in stdout progress messages only — they do not appear
  in the output files.


====================================================================
PHASE 3: CREATE A TRACK DIRECTORY FOR EACH IDEA
====================================================================

For each idea identified in Phase 2, in the order they appear in
BREAK_THRUS_FILE:

* The track directory name for this idea is:
    {ROOT_DIR}/Track_{NEXT_TRACK_NUMBER}/
  where NEXT_TRACK_NUMBER increments by 1 for each successive idea.
  First idea uses the NEXT_TRACK_NUMBER from Phase 1. Second idea uses
  that number plus 1. Third uses that plus 2. And so on.

* Create the directory if it does not already exist.

* Inside that directory, create OVERVIEW_FILENAME (overview.mdx).
  Write all content from BREAK_THRUS_FILE that belongs to this idea
  into overview.mdx. Do not truncate, summarize, or simplify.
  Preserve all mathematical formalism, equations, derivations, source
  citations, video tags, quotes, transcriptions, and key figures.
  Write at PhD physics level throughout. Never talk down.

  The content of overview.mdx must:
  * Include a top-level heading naming the physics thesis or idea
  * Preserve every equation exactly as it appears in the source
  * Include all cited sources with URLs
  * Include all named physicists and their contributions
  * Include any video embed tags or IPFS links found in the source
  * Include any full transcriptions found in the source
  * Preserve all thesis summary sections and supporting arguments
  * Preserve any related research thread references
  * Preserve all footnotes and attribution lines

* Output to stdout after each directory is created:
  "Created Track_{N}/ with overview.mdx — Idea: {one-sentence label}"


====================================================================
PHASE 4: VERIFY ALL IDEAS ARE CAPTURED
====================================================================

* After creating all track directories and overview.mdx files, verify:
  1. The number of new Track directories created equals IDEA_COUNT.
  2. Each new overview.mdx is non-empty and contains content from
     BREAK_THRUS_FILE that corresponds to its idea.
  3. Every major section from BREAK_THRUS_FILE appears in exactly one
     of the new overview.mdx files — nothing has been left behind.
* If any verification fails, fix it before proceeding to Phase 5.
  Do not clear BREAK_THRUS_FILE if any content was lost.
* Output to stdout: "Verification passed. {IDEA_COUNT} ideas captured
  across Track_{START} through Track_{END}."


====================================================================
PHASE 5: CLEAR BREAK_THRUS_FILE
====================================================================

* Only proceed here after Phase 4 verification passes.
* Overwrite BREAK_THRUS_FILE with empty content (zero bytes or a
  single blank line). Do not delete the file — it is a staging file
  that will be reused.
* Output to stdout: "Break_thrus.mdx cleared. Ready for next batch."


====================================================================
CONTENT STANDARDS FOR overview.mdx
====================================================================

* PhD-level physics throughout. Never simplify. Never omit equations.
* Preserve all tensor notation, differential geometry, Lagrangians,
  Hamiltonians, field equations, gauge theory, operator algebra.
* If the source contains a video tag (JSX or HTML), preserve it verbatim.
* If the source contains an IPFS hash or URL, preserve it verbatim.
* If the source contains a full transcription, preserve it in full.
* If the source contains Casimir, ZPF, or QED derivations, preserve
  every line of the derivation with units and limiting cases.
* Every source citation goes in a Sources section at the end.
* End each overview.mdx with the same attribution footer found in the
  source, or if none exists:
    *This information was compiled from Break_thrus.mdx staging file.*
* Do not add Docusaurus frontmatter. overview.mdx files are local
  research documents, not published to the website.


====================================================================
EXAMPLE STDOUT OUTPUT (for a two-idea run)
====================================================================

Next available track number: 6
Ideas found in Break_thrus.mdx: 2
Created Track_6/ with overview.mdx -- Idea: Quantum vacuum ZPF harvesting via ISF Haramein framework
Created Track_7/ with overview.mdx -- Idea: Rotating toroidal ferrite three-phase anomalous mass reduction
Verification passed. 2 ideas captured across Track_6 through Track_7.
Break_thrus.mdx cleared. Ready for next batch.
