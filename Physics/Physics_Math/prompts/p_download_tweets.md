ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

OUTPUT_BASE_DIR dir is {ROOT_DIR}/patents_intl/

TRACK_DIR is dir {OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

END_DIR is the end directory of this pattern:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/

LEVEL_2_DIR is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/

LEVEL_2_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/knowledge/

LEVEL_1_TWEET_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/knowledge/

TOTAL_TWEET_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/

CONCAT_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/concat/

TEMP_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/temp/

FINAL_KNOWLEDGE is dir:
{OUTPUT_BASE_DIR}/1_Track/Tweets_RedCollie1/tweets/knowledge/final/

X_ACCOUNT_URL is: https://x.com/chjkfddd20703

X_ACCOUNT_HANDLE is: chjkfddd20703


====================================================================
GOAL
====================================================================

This prompt downloads 100% of the tweets from the X account defined in
X_ACCOUNT_URL. It downloads all post text, all metadata, and all images
attached to each post. Every tweet is saved as structured data. This is
the first step in the full physics knowledge extraction pipeline — raw
tweet data goes into TRACK_DIR where p_skill_one_dir.md can then process
each directory of tweets into knowledge files.


====================================================================
CONTEXT
====================================================================

The X account at X_ACCOUNT_URL is a research account focused on UAP physics,
propulsion systems, magnetic field experiments, and anomalous energy claims. The
tweets may contain physics diagrams, equations in image form, experimental setups,
and claims about UAP propulsion systems. This is the upstream raw data source for
the entire Physics_Math knowledge pipeline.

Downloading 100% of the tweets means not stopping at 100 or any other pagination
limit. The command line tool must be invoked to fetch the full history.

Every image attached to every post must be downloaded and saved alongside the
post data. Images may contain physics diagrams and equations not found in the
post text — they are first-class data for this pipeline.


====================================================================
WHAT TO DOWNLOAD
====================================================================

* All tweets from X_ACCOUNT_URL.
  * 100% of the account's tweet history. No limit on count.
  * For each tweet: post text, post ID, timestamp, reply count, retweet count,
    like count, any other available metadata.
* All images attached to those posts.
  * Download every image file attached to every tweet.
  * Save images alongside the post data they belong to.
* All data with every post.
  * Each post's complete data package (text + metadata + images) should be saved
    together so that p_skill_one_dir.md can read them as a unified unit.


====================================================================
PHASE 1: VERIFY DOWNLOAD TOOL IS AVAILABLE
====================================================================

* Check that the command line download tool is available and callable.
  Common tools for this: gallery-dl, yt-dlp, twint, snscrape, or similar.
  Use whichever tool is installed and capable of downloading full X account history
  including images.
* If no tool is available, output an error to stdout listing what tools were
  checked and stop. Do not attempt to proceed without a working download tool.


====================================================================
PHASE 2: SET UP OUTPUT DIRECTORY STRUCTURE
====================================================================

* Ensure OUTPUT_BASE_DIR exists. Create it if it does not. All output from
  this prompt — tweets, images, metadata, knowledge directories — must be
  written inside OUTPUT_BASE_DIR. Nothing is written outside of it.
* Ensure TRACK_DIR exists inside OUTPUT_BASE_DIR. Create it if it does not.
* The downloaded tweets will be organized under TRACK_DIR using the two-level
  directory structure: {Dir_Level_1}/{Dir_Level_2}/
* If the download tool outputs to a flat directory, organize the output into
  subdirectories after download. Group approximately 10 tweets per END_DIR so
  that the total directory count stays near 100 across all permutations of
  Dir_Level_1 (1-10) and Dir_Level_2 (1-10).
* Each END_DIR will hold the raw tweet files (text, YAML, and images) for a
  batch of tweets.
* Create the knowledge/ subdirectory (LEVEL_2_KNOWLEDGE) inside each END_DIR.
  Leave it empty — it will be populated later by p_skill_one_dir.md.


====================================================================
PHASE 3: DOWNLOAD ALL TWEETS AND IMAGES
====================================================================

* Run the download tool targeting X_ACCOUNT_URL.
* Download 100% of the tweet history — every single post ever made by the
  account. Do not stop at any count limit. Do not stop at 100, 200, or any
  default pagination cap. Use cursor-based or page-based iteration to exhaust
  the full account history all the way back to the first post.
* Download all images attached to posts. Every image file on every post must
  be downloaded. Save each image to the same directory as the post data it
  belongs to.
* Download all videos attached to posts where the tool supports it.
* Save all post data (text + metadata + images) together per tweet. All output
  goes inside OUTPUT_BASE_DIR — no files are written anywhere else.
* If the download tool supports YAML or JSON output per post, use that format.
  If not, save the raw text and record metadata in a summary file.


====================================================================
PHASE 4: ORGANIZE DOWNLOADS INTO TRACK_DIR STRUCTURE
====================================================================

* After download completes, organize all downloaded files into the two-level
  directory structure under TRACK_DIR:
    {TRACK_DIR}/{Dir_Level_1}/{Dir_Level_2}/
* Group tweets so each END_DIR contains approximately 10 tweets, distributing
  evenly across directories. Dir_Level_1 and Dir_Level_2 each run from 1 to 10.
* Within each END_DIR, each tweet should have:
  * One text or YAML file with the post content and all metadata.
  * Any image files attached to that post, saved in the same directory.
* Ensure filenames are clean: no special characters, use underscores. Include
  the tweet ID or timestamp in the filename to prevent collisions.


====================================================================
PHASE 5: VERIFY DOWNLOAD COMPLETENESS
====================================================================

* Count the total number of tweets downloaded and organized.
* Count the total number of images downloaded.
* Output to stdout:
  * Total tweets downloaded.
  * Total images downloaded.
  * Total END_DIR directories created.
  * Path to OUTPUT_BASE_DIR root and TRACK_DIR root.
  * "Download complete. Ready for p_skill_one_dir.md processing."
* If the download appears incomplete (tool reported errors, pagination stopped
  early, or total count seems too low), output a warning and describe the issue.


====================================================================
LIST_OF_OUTPUT_FILES (for context — produced later by p_skill_one_dir.md)
====================================================================

After this download prompt completes, the pipeline continues with p_skill_one_dir.md
which reads the raw tweet data from each END_DIR and grows the following topic files
into each LEVEL_2_KNOWLEDGE directory. Listed here for full context.

* overall_Explain.mdx — bridging file: beneficial outputs, advancements beyond
  Newtonian mechanics, what advancement we get from this research at the physics level.

* overall_Magnetics.mdx — magnetic field theory and applied experiments. What was
  going on with magnetism. All math and physics claims related to magnetics.

* overall_Physics.mdx — physics equations and how physics accomplishes everything.
  Theory and experimental. Beyond-Newtonian sections included.

* overall_Math.mdx — math equations, their pieces, how they relate. Full PhD-level
  derivations and chain of reasoning. Horizontal and vertical direction analysis.

* overall_Lift.mdx — everything about lift as a propulsion goal. Z-axis rise,
  X-Y plane dynamics, how horizontal motion causes vertical altitude change.

* overall_Energy.mdx — anomalous energy production beyond conservation-of-energy.
  Zero-point energy, ether fields, external energy harvesting. Full physics and math.

* overall_Beyond_Nutton.mdx — everything found beyond Newtonian Mechanics. What
  experiments claim to show, what correlations exist, what physics is described.

* overall_other.mdx — every remaining claim, fact, or math not fitting above topics.
