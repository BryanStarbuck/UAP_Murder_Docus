ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

OUTPUT_JS_FILE is file {PROMPTS_DIR}/js_concaatinate.js

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

TRACK_DIR is dir {ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/

DIR_LEVEL_1_RANGE is the range 1 to 10 inclusive.
DIR_LEVEL_2_RANGE is the range 1 to 10 inclusive.


====================================================================
GOAL
====================================================================

This prompt creates OUTPUT_JS_FILE: a JavaScript (Node.js) file that concatenates
all knowledge topic files from every LEVEL_2_KNOWLEDGE directory into matching
output files in CONCAT_KNOWLEDGE.

There are approximately 100 LEVEL_2_KNOWLEDGE directories (all permutations of
Dir_Level_1 and Dir_Level_2 from 1 to 10). Each contains up to 8 topic files
whose names match those in LIST_OF_OUTPUT_FILES. The JS file reads every input
directory, matches by filename, and appends content to the corresponding output
file in CONCAT_KNOWLEDGE.

This is one tool in the full pipeline. It is called from the concat stage of
p_knowledge_from_dirs.md after all LEVEL_2_KNOWLEDGE directories have been
populated by p_skill_one_dir.md.


====================================================================
CONTEXT
====================================================================

The tweet research directories are organized under TRACK_DIR in a two-level
hierarchy: {Dir_Level_1}/{Dir_Level_2}. Each leaf directory has a knowledge/
subdirectory (LEVEL_2_KNOWLEDGE) populated by p_skill_one_dir.md. Each topic
file inside has the same filename across all ~100 directories. This JS file's
job is to unite all of them by filename into CONCAT_KNOWLEDGE, so the full
accumulated knowledge for each topic lands in one file.

The filename-to-filename matching is the core rule: if the input file is named
overall_Physics.mdx then it concatenates into {CONCAT_KNOWLEDGE}/overall_Physics.mdx.
All ~100 input directories contribute to the same set of output files.


====================================================================
LIST_OF_OUTPUT_FILES
====================================================================

These are the exact filenames the JS file must look for and concatenate. Input
file name and output file name must match exactly. All definitions below are the
authoritative specification of each topic file's content, for context.

* overall_Explain.mdx
  Bridging file. What is the beneficial output, what advancement we get from this
  research at the physics level beyond Newtonian mechanics and normal propulsion.

* overall_Magnetics.mdx
  Everything about magnetic fields in this physics — theory and applied. What was
  going on with magnetism in the experiments, and what math and physics connect to it.

* overall_Physics.mdx
  Physics equations and how physics accomplishes everything described. Both theory
  and experimental. All math, all claims, beyond-Newtonian sections included.

* overall_Math.mdx
  The math equations that make everything work. How pieces relate mathematically.
  Full PhD-level equations and derivations. Chain of reasoning. Horizontal and
  vertical direction analysis.

* overall_Lift.mdx
  Everything about lift as a propulsion goal. Z-axis rise, X-Y plane dynamics,
  how horizontal motion causes vertical altitude change. Full physics and math.

* overall_Energy.mdx
  Everything about anomalous energy production beyond conservation-of-energy norms.
  Zero-point energy, ether fields, external energy harvesting. Full physics and math.

* overall_Beyond_Nutton.mdx
  Everything found that is beyond Newtonian Mechanics. What experiments claim to
  show, what correlations exist, what physics phenomena are described. Full math.

* overall_other.mdx
  Every remaining claim, fact, or math that does not fit in the above topic files.
  Catch-all for anything not covered elsewhere.


====================================================================
PHASE 1: CREATE OUTPUT_JS_FILE
====================================================================

* Create the file OUTPUT_JS_FILE at {PROMPTS_DIR}/js_concaatinate.js.
* The JS file must be a Node.js script. It uses only built-in Node.js modules
  (fs, path). No npm packages. Runs with: node js_concaatinate.js


====================================================================
PHASE 2: WHAT THE JS FILE MUST DO
====================================================================

The JS file when executed must carry out all of the following steps:

Step 1. Define the base TRACK_DIR path as a constant at the top of the file.
  This is the only path that needs to change if the directory moves.
  Value: ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets/
  Resolve the ~ to the actual home directory using os.homedir() or process.env.HOME.

Step 2. Define CONCAT_KNOWLEDGE as a constant derived from TRACK_DIR:
  {TRACK_DIR}/knowledge/concat/

Step 3. Define the LIST_OF_OUTPUT_FILES as a constant array of filenames:
  [
    "overall_Explain.mdx",
    "overall_Magnetics.mdx",
    "overall_Physics.mdx",
    "overall_Math.mdx",
    "overall_Lift.mdx",
    "overall_Energy.mdx",
    "overall_Beyond_Nutton.mdx",
    "overall_other.mdx"
  ]

Step 4. Ensure CONCAT_KNOWLEDGE directory exists. Create it with fs.mkdirSync
  recursively if it does not exist.

Step 5. For each filename in LIST_OF_OUTPUT_FILES, initialize the output file in
  CONCAT_KNOWLEDGE to empty (truncate if it already exists, create if it does not).

Step 6. Enumerate every LEVEL_2_KNOWLEDGE directory. Loop Dir_Level_1 from 1 to 10
  and Dir_Level_2 from 1 to 10. For each combination, build the path:
    {TRACK_DIR}/{Dir_Level_1}/{Dir_Level_2}/knowledge/
  Check if that path exists on disk. If it does not exist, skip it silently.

Step 7. For each existing LEVEL_2_KNOWLEDGE directory, loop through each filename
  in LIST_OF_OUTPUT_FILES. Build the input file path:
    {LEVEL_2_KNOWLEDGE_DIR}/{filename}
  Check if that input file exists. If it does not exist, skip it silently.
  If it exists, read its contents and append them to the matching output file in
  CONCAT_KNOWLEDGE. Append a newline separator between contributions.

Step 8. After processing all directories, print a summary to stdout:
  * Total LEVEL_2_KNOWLEDGE directories found and processed.
  * Total files appended per output filename (count per topic).
  * A final line: "Concatenation complete. Output: {CONCAT_KNOWLEDGE}"


====================================================================
PHASE 3: VALIDATE THE GENERATED JS FILE
====================================================================

* After writing OUTPUT_JS_FILE, read it back and verify:
  * It uses only built-in Node.js modules (fs, path, os or process.env.HOME).
  * The TRACK_DIR constant is set to the correct absolute path.
  * LIST_OF_OUTPUT_FILES contains all 8 filenames from the list above.
  * The double loop over Dir_Level_1 and Dir_Level_2 covers 1 to 10 each.
  * The output goes to CONCAT_KNOWLEDGE, not anywhere else.
  * It handles missing directories and missing files gracefully (skip, no crash).
* If any issue is found, fix it before finishing.
* Output to stdout: "OUTPUT_JS_FILE created and validated: {path}"
