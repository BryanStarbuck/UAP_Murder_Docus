ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

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


====================================================================
GOAL
====================================================================

This skill processes one END_DIR. It is called by p_knowledge_from_dirs.md,
once per leaf directory, up to 8 in parallel. It reads every file in the given
END_DIR, extracts PhD-level physics and mathematics knowledge, and grows the
knowledge output files in the LEVEL_2_KNOWLEDGE subdirectory of that END_DIR.

Input: the full absolute path to one END_DIR, plus any optional focus text
describing what additional topics to pay attention to when reading.

Called by: p_knowledge_from_dirs.md


====================================================================
INPUT PARAMETERS
====================================================================

This skill accepts either:
* One parameter: the full absolute path to the END_DIR to process.
* Two parameters: {Dir_Level_1} and {Dir_Level_2} — the last two directory names
  of the path, used to construct the full END_DIR path as shown in the pattern above.

Additionally, free-form text may be provided as supplemental focus guidance.
That text narrows what to pay special attention to while reading the source files.
It does not limit what gets captured — it only adds emphasis.


====================================================================
CONTEXT: WHAT THIS SKILL IS DOING
====================================================================

The END_DIR contains raw tweet data, YAML files, and any associated text files
downloaded from X research on UAP physics and propulsion. This skill reads every
file in that directory and grows the topic knowledge files in LEVEL_2_KNOWLEDGE.

Do not summarize. Do not talk down. Write at PhD physics level throughout. Any and
all claims of new techniques, math connections, physical phenomena, math equations,
device descriptions, pieces that create other pieces — capture them all, as
specifically as possible, with all correlations preserved. Capture every single piece
of knowledge possible out of the source files.


====================================================================
LIST_OF_OUTPUT_FILES
====================================================================

These are the files grown into LEVEL_2_KNOWLEDGE. Create any that do not exist.
Append to any that already exist. Never overwrite or delete existing content.

All definitions below are word-for-word from the pipeline specification and are
the authoritative description of what each file must contain.

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
PHASE 1: RESOLVE THE INPUT DIRECTORY
====================================================================

* Determine the full absolute path to END_DIR from the input parameters.
  If given two values for {Dir_Level_1} and {Dir_Level_2}, construct the path:
    {ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/
  If given a full path directly, use that path as END_DIR.
* Confirm the directory exists. If it does not exist, output an error to stdout
  and stop.
* Ensure LEVEL_2_KNOWLEDGE exists (the knowledge/ subdirectory under END_DIR).
  Create it if it does not exist.


====================================================================
PHASE 2: READ AND PROCESS EVERY SOURCE FILE IN END_DIR
====================================================================

* List every file directly inside END_DIR (not recursively into subdirectories,
  except we do NOT read from the knowledge/ subdirectory as input).
* For each source file in END_DIR, carry out the following steps:

  Step 1. Read the full content of the file.

  Step 2. For each file in LIST_OF_OUTPUT_FILES, determine what content from this
  source file belongs in that output topic file.

  Step 3. Write any discovered content into the appropriate output file in
  LEVEL_2_KNOWLEDGE. Append to the file; do not overwrite.

  Step 4. If any focus text was provided as a supplemental input parameter, pay
  special attention to content matching that focus when extracting. Still capture
  everything else.

  Extraction standards:
  * Do not summarize. Do not talk down. Write at PhD physics level.
  * Capture every math equation, physics claim, device description, correlation,
    and physical phenomenon found in the source file.
  * When multiple pieces are related, name each piece and describe how piece A
    relates to piece B through math or logic or both.
  * Distinguish what is theory vs. what is experimental result.
  * Preserve exact mathematical notation where present in the source file.
  * Do not invent content that is not in the source file.


====================================================================
PHASE 3: VERIFY OUTPUT FILES
====================================================================

* After processing all source files in END_DIR, verify that each file in
  LIST_OF_OUTPUT_FILES exists in LEVEL_2_KNOWLEDGE.
* For any file that does not exist (meaning no content was found for that topic
  in this directory's source files), create an empty file with a comment noting
  that no content was found for this topic in this END_DIR.
* Output to stdout: "Completed END_DIR: {full path}. Output files: {count}."
