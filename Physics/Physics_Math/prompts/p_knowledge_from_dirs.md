ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

TRACK_DIR is dir {ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/

END_DIR is the end directory of this pattern:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/

LEVEL_2_DIR is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/

LEVEL_2_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/knowledge/

LEVEL_1_TWEET_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/knowledge/

TOTAL_TWEET_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/

CONCAT_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/concat/

TEMP_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/temp/

FINAL_KNOWLEDGE is dir:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/final/

SKILL_ONE_DIR is file {PROMPTS_DIR}/p_skill_one_dir.md

MAX_PARALLEL is the number: 8


====================================================================
GOAL
====================================================================

This prompt drives the full knowledge-extraction pipeline across approximately 100
tweet directories organized under TRACK_DIR. For every END_DIR, it calls the skill
defined in SKILL_ONE_DIR, running up to MAX_PARALLEL agents at a time, queuing any
remainder. After all directories are processed it runs the post-processing stages:
deduplication, diff-based removal, and final consolidation into FINAL_KNOWLEDGE.

The output is a set of knowledge files, one per topic in LIST_OF_OUTPUT_FILES, that
accumulate everything learned from every tweet directory across the full tree.


====================================================================
CONTEXT: WHAT THIS PIPELINE IS DOING
====================================================================

The tweet directories under TRACK_DIR are organized as a two-level hierarchy. Each
combination of {Dir_Level_1} and {Dir_Level_2} is a leaf directory (END_DIR) that
contains raw tweet data from X account research related to UAP physics and propulsion.

The goal is to extract PhD-level physics and mathematics knowledge out of those raw
tweet files and grow it into structured topic files. The topic files are defined in
LIST_OF_OUTPUT_FILES below. Every topic file gets contributions from every one of the
~100 leaf directories. After per-directory extraction is done, the concat stage merges
all contributions by filename, and the post-processing stages remove redundancy and
produce the final clean output.

Do not summarize. Do not simplify. Write at PhD physics level throughout.
Any math equation, physics claim, device description, correlation, or physical
phenomenon gets captured in full. This is research-grade documentation of the
physics and mathematics of UAP propulsion and energy systems.


====================================================================
LIST_OF_OUTPUT_FILES
====================================================================

These are the output files written into each LEVEL_2_KNOWLEDGE directory by
SKILL_ONE_DIR, and concatenated into CONCAT_KNOWLEDGE by the JS tool, and
deduplicated into FINAL_KNOWLEDGE by the post-processing stages below.

All file descriptions below are the gold-standard definition of what each file
must contain. Every prompt and skill in this pipeline must honor these definitions
exactly.

* overall_Explain.mdx
  This file will explain overall. We are trying to learn the physics and mathematics.
  This one will focus on bridging. What is the benefit we get out of it as far as
  propulsion or getting energy or some benefit beyond Newtonian mechanics or what
  normal engine propulsion and physics systems are able to accomplish. It will be
  bridging: what is the beneficial output, what is the advancement we are getting
  from this one person's research or any of this research at the physics level, and
  then what are the specific advancements at the physics level that are being learned
  out of the bigger detail.

* overall_Magnetics.mdx
  The focus of this topic is: magnetics within physics — what was going on with a
  magnetic field, both at a theory level and applied. When they are doing
  experimentation, what are they doing about the magnetic things they are testing and
  using? From all the input files, we want to learn everything about this topic. Any
  math claims, any physics claims, any math we can learn out of it. We want to track
  anything that is correlated to what. It might be a number of pieces, and we might
  give those pieces names and then explain that this piece is related to that piece
  with math or logic, or try to accomplish this or that. We should explain both high
  level and then every detail. What was it trying to accomplish, and what was it doing
  with physics to accomplish that? We want to have a section of what is beyond normal
  Newtonian mechanics. What is beyond the normal physics classical model. All chain of
  reasoning. What is going on in two directions, as things are kind of moving around
  horizontally to the ground, and then what is going on vertically.

* overall_Physics.mdx
  The focus of this topic is: physics and physics equations — what was going on related
  to everything else. How is physics accomplishing this? How do different other pieces,
  mechanical pieces or other things, apply to the physics, and then the math, the
  physics equations for that. Both at a theory level and applied. When they are doing
  experimentation. From all the input files, we want to learn everything about this
  topic. Any math claims, any physics claims, any math we can learn out of it. We want
  to track anything that is correlated to what. It might be a number of pieces, and we
  might give those pieces names and then explain that this piece is related to that
  piece with math or logic, or try to accomplish this or that. We should explain both
  high level and then every detail. What was it trying to accomplish, and what was it
  doing with physics to accomplish that? We want to have a section of what is beyond
  normal Newtonian mechanics. What is beyond the normal physics classical model. All
  chain of reasoning. What is going on in two directions, as things are kind of moving
  around horizontally to the ground, and then what is going on vertically.

* overall_Math.mdx
  The focus of this topic is: what are the math equations that make everything work,
  and what are their pieces and how they relate. The mathematics was going on related to
  everything else. From all the input files, we want to learn everything about this
  topic. Any math claims, any physics claims, any math we can learn out of it. We want
  to track anything that is correlated to what. It might be a number of pieces, and we
  might give those pieces names and then explain that this piece is related to that
  piece with math or logic, or try to accomplish this or that. We should explain both
  high level and then every detail. What was it trying to accomplish, and what was it
  doing with physics to accomplish that? We want to have a section of what is beyond
  normal Newtonian mechanics. What is beyond the normal physics classical model. All
  chain of reasoning. What is going on in two directions, as things are kind of moving
  around horizontally to the ground, and then what is going on vertically.

* overall_Lift.mdx
  The focus of this topic is: everything about this being a propulsion system to get
  lift — lifting off the ground. Ending with gravity, anything that they are claiming.
  Why would UAPs want this to lift off the ground? What parts of the physics, or all
  the other pieces? How did that map to this, especially about the goal of lifting? A
  lot of this stuff has things moving around horizontally to the ground, but then they
  seem to cause the lift aspect of this. What are all the aspects going on, kind of
  horizontal to the ground or different layers of horizontal above the ground, and then
  what was kind of that z-axis, that axis of creating raising altitude of lift? What
  other things are going on in the X-Y plane, parallel to the ground, and then how are
  those things interacting in a way that causes the altitude or z-axis rise? Do other
  pieces relate to that, both mathematically and logically, in physics-wise? How is
  physics accomplishing this? How do different other pieces, mechanical pieces or other
  things, apply to the physics, and then the math, the physics equations for that. Both
  at a theory level and applied. When they are doing experimentation. From all the input
  files, we want to learn everything about this topic. Any math claims, any physics
  claims, any math we can learn out of it. We want to track anything that is correlated
  to what. We should explain both high level and then every detail. We want to have a
  section of what is beyond normal Newtonian mechanics. What is beyond the normal
  physics classical model. All chain of reasoning.

* overall_Energy.mdx
  The focus of this topic is: everything about this being an energy system to get
  energy out beyond what would be normally within our normal world or within normal
  conservation of energy laws. Are we getting any energy externally? Any energy out of
  zero-point energy or some ether field or anything beyond what we normally have
  accessible. What parts of the physics, or all the other pieces, relate to this goal?
  How did that map to this, especially about the goal of producing or harvesting
  anomalous energy? What are all the aspects going on, kind of horizontal to the ground
  or different layers of horizontal above the ground, and then what was kind of that
  z-axis? What other things are going on in the X-Y plane, parallel to the ground, and
  then how are those things interacting in a way that causes the altitude or z-axis
  rise? Do other pieces relate to that, both mathematically and logically, in
  physics-wise? How is physics accomplishing this? How do different other pieces,
  mechanical pieces or other things, apply to the physics, and then the math, the
  physics equations for that. Both at a theory level and applied. When they are doing
  experimentation. From all the input files, we want to learn everything about this
  topic. Any math claims, any physics claims, any math we can learn out of it. We want
  to track anything that is correlated to what. We should explain both high level and
  then every detail. We want to have a section of what is beyond normal Newtonian
  mechanics. What is beyond the normal physics classical model. All chain of reasoning.

* overall_Beyond_Nutton.mdx
  The focus of this topic is: everything about this beyond Newtonian Mechanics. What
  is he saying? That his experiments are finding something new beyond a normal physics
  textbook. What is his work trying to prove? Either physics or correlations or things
  he is able to accomplish. How is physics accomplishing this? How do different other
  pieces, mechanical pieces or other things, apply to the physics, and then the math,
  the physics equations for that. Both at a theory level and applied. When they are
  doing experimentation. From all the input files, we want to learn everything about
  this topic. Any math claims, any physics claims, any math we can learn out of it. We
  want to track anything that is correlated to what. It might be a number of pieces,
  and we might give those pieces names and then explain that this piece is related to
  that piece with math or logic, or try to accomplish this or that. We should explain
  both high level and then every detail. What was it trying to accomplish, and what was
  it doing with physics to accomplish that? We want to have a section of what is beyond
  normal Newtonian mechanics. What is beyond the normal physics classical model. All
  chain of reasoning. What is going on in two directions, as things are kind of moving
  around horizontally to the ground, and then what is going on vertically.

* overall_other.mdx
  We want to learn every other claim, fact, math, explanation, or anything else that
  appears in the YAML or source files that is not covered by the above documents. This
  is where everything that does not fit in the above documents gets collected. We want
  to make sure it gets captured somewhere, and that is here in this file.


====================================================================
PHASE 1: ENUMERATE ALL END DIRECTORIES
====================================================================

* Enumerate every leaf directory matching the pattern END_DIR under TRACK_DIR.
  The pattern is: {Dir_Level_1} ranges 1 to 10, {Dir_Level_2} ranges 1 to 10.
  Only include directories that actually exist on disk.
* Build the full list before starting any agents. Call this the WORK_QUEUE.
* Output to stdout the total count of directories found.


====================================================================
PHASE 2: PROCESS ALL DIRECTORIES VIA SKILL_ONE_DIR (MAX 8 PARALLEL)
====================================================================

* For every path in WORK_QUEUE, spawn one agent that runs the skill defined in
  SKILL_ONE_DIR. Pass the full absolute path to that END_DIR as input.
* Run no more than MAX_PARALLEL (8) agents at a time.
* Queue up any remainder so every directory in WORK_QUEUE is eventually processed.
  Never skip a directory. Never process the same directory more than once.
* Each agent receives: the full END_DIR path it is responsible for.
* Wait until all agents have completed before advancing to Phase 3.
* Output to stdout a summary of how many directories were processed.


====================================================================
PHASE 3: CONCAT STAGE - MERGE ALL LEVEL_2_KNOWLEDGE INTO CONCAT_KNOWLEDGE
====================================================================

* Ensure CONCAT_KNOWLEDGE directory exists. Create it if it does not.
* For each filename in LIST_OF_OUTPUT_FILES, concatenate the contents of that
  filename from every LEVEL_2_KNOWLEDGE directory (across all Dir_Level_1 and
  Dir_Level_2 combinations) into a single output file in CONCAT_KNOWLEDGE with
  the same filename.
  * Input: {ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/knowledge/{filename}
  * Output: {CONCAT_KNOWLEDGE}/{filename}
* The concatenation tool for this is produced by p_js_concatonate.md and is named
  js_concaatinate.js. Run it now if it exists and has not already been run.
  If it does not exist, perform the concatenation directly by reading each source
  file and appending its contents to the matching output file in CONCAT_KNOWLEDGE.
* Each output file in CONCAT_KNOWLEDGE is the raw union of all contributions from
  all leaf directories for that topic. Deduplication happens in Phase 4.


====================================================================
PHASE 4: TEMP STAGE - COPY CONCAT TO TEMP AND FIND DUPLICATES
====================================================================

* Delete all files currently in TEMP_KNOWLEDGE. Then copy all files from
  CONCAT_KNOWLEDGE to TEMP_KNOWLEDGE.
* For each file in TEMP_KNOWLEDGE, search the file for duplicate or redundant
  sections. A duplicate section is one where the same physics concept, math
  equation, or explanation appears more than once in essentially the same form.
* For each duplicate or redundant section found, produce a modification instruction
  file in TEMP_KNOWLEDGE named:
    modify_and_then_{original_filename}.txt
  This instruction file lists every section to delete from the corresponding content
  file. Use diff-style syntax to describe what to remove: include enough surrounding
  context to uniquely identify the section. May contain multiple delete instructions
  if multiple redundant sections were found.
* Apply each modify_and_then_{filename}.txt instruction file to its target content
  file in TEMP_KNOWLEDGE, removing the redundant sections from the content files.
* After applying all modifications, the content files in TEMP_KNOWLEDGE should
  match the concat directory in filenames but have redundant sections removed.


====================================================================
PHASE 5: FINAL STAGE - COPY TEMP TO FINAL AND POLISH
====================================================================

* Copy the content files listed in LIST_OF_OUTPUT_FILES from TEMP_KNOWLEDGE to
  FINAL_KNOWLEDGE. Do not copy the modify_and_then_ instruction files.
* For each file in FINAL_KNOWLEDGE, make one more pass. Search for any two passages
  that are written differently but convey the exact same information.
  * If both passages are purely duplicative and neither adds unique content: remove
    one, keep one.
  * If both passages are similar but each contains unique content not in the other:
    keep both intact. Do not merge and do not remove unique information.
* The result is that FINAL_KNOWLEDGE contains one file per topic from LIST_OF_OUTPUT_FILES.
  Each file contains only unique knowledge. Nothing is redundantly explained twice.
  All PhD-level math, physics, equations, and device descriptions are preserved in full.


====================================================================
PHASE 6: DONE
====================================================================

* Output to stdout the count of files written to FINAL_KNOWLEDGE.
* Output to stdout the name of each file in FINAL_KNOWLEDGE.
* Output to stdout "Pipeline complete."
