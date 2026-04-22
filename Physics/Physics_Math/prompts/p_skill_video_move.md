ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/

PROMPTS_DIR is dir {ROOT_DIR}/prompts/

INPUT_DIR is dir {ROOT_DIR}/1_Track/video_transcriptions/

END_DIR is the end directory of this pattern:
{ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/


====================================================================
GOAL
====================================================================

This skill moves video transcription files out of INPUT_DIR and into
the END_DIR that best matches each file. It is given a list of files
(all in INPUT_DIR) as input. It loops through every file in that list,
finds the best matching END_DIR for each file, and moves the file there.

Nothing is deleted. Nothing is lost. Every file gets moved exactly once
to exactly one destination directory.


====================================================================
INPUT PARAMETERS
====================================================================

This skill accepts a list of filenames. Every filename in the list must
exist in INPUT_DIR. The list may be provided as:
* A newline-separated list of filenames (base names only, not full paths).
* A full list of absolute paths to files in INPUT_DIR.

If no list is provided, default to processing every file currently in
INPUT_DIR.

Do not process any file that is not in INPUT_DIR. Do not process
directories, only files.


====================================================================
CONTEXT: WHAT THIS SKILL IS DOING
====================================================================

INPUT_DIR contains video transcription files for videos that were
attached to tweets. Each filename encodes a tweet ID — typically in
the pattern:

    13_{tweet_id}_video.mdx

or a similar pattern where the numeric tweet ID appears in the filename.

The END_DIR directories under the tweet tree each contain YAML files
named after tweet IDs (e.g., {tweet_id}.yaml). The goal is to match
each transcription file to the END_DIR that references the same tweet
ID, or to the END_DIR whose contents are most topically similar to the
transcription content.

After the best END_DIR is found for a file, the file is moved from
INPUT_DIR into that END_DIR. The move is a filesystem move (not a copy).


====================================================================
PHASE 1: BUILD THE SEARCH INDEX
====================================================================

* Enumerate every END_DIR that exists on disk. The pattern is:
    {ROOT_DIR}/1_Track/Tweets_RedCollie1/tweets/{Dir_Level_1}/{Dir_Level_2}/
  where {Dir_Level_1} and {Dir_Level_2} each range from 1 to 10.
  Only include directories that actually exist.

* For each END_DIR, collect the list of YAML filenames inside it
  (direct children only, not recursive). These YAML filenames are tweet
  IDs. Store the mapping:
    END_DIR path -> list of tweet IDs present in that directory

* This index is used in Phase 2 to match input files to the right
  destination without running a slow filesystem search for every file.

Note: do not use the Mac OS file content indexing system or the `find`
command. Use command-line tools that operate directly on the filesystem
(e.g., ls, shell glob expansion, or equivalent brew-installed tools).


====================================================================
PHASE 2: MATCH AND MOVE EACH FILE
====================================================================

For every file in the input list, carry out these steps in order:

Step 1. Extract the tweet ID from the filename.
* The filename typically follows the pattern: 13_{tweet_id}_video.mdx
  or similar. Extract the longest numeric run that looks like a tweet ID
  (18-19 digit number is typical for Twitter/X IDs).
* If no tweet ID can be extracted, fall back to content matching in Step 3.

Step 2. Primary match: tweet ID lookup.
* Search the index built in Phase 1 for the END_DIR whose YAML file
  list contains a filename that matches or closely matches the extracted
  tweet ID.
* If an exact match is found, that END_DIR is the destination. Go to Step 4.
* If no exact match is found, try a partial match: does any YAML filename
  in any END_DIR begin with or end with the same numeric ID? If yes and
  the match is unambiguous, use that END_DIR. Go to Step 4.

Step 3. Fallback match: content similarity.
* If no tweet ID match was found, read the content of the input file.
* Read a sample of YAML files from candidate END_DIRs to find the one
  whose content is most topically similar to the transcription content.
* Select the END_DIR whose existing YAML content most closely matches
  the subject matter of the transcription file.
* If no reasonable match can be found, move the file to the END_DIR
  with the most content overall as a best-effort placement, and log a
  warning to stdout.

Step 4. Move the file.
* Move the input file from INPUT_DIR into the destination END_DIR.
* The destination path is:
    {destination END_DIR}/{original filename}
* Do not rename the file. Preserve the original filename exactly.
* Confirm the move succeeded. If the move fails, log an error to stdout
  and continue to the next file. Do not stop the loop on a single error.

Step 5. Log to stdout.
* Output one line per file:
    MOVED: {source path} -> {destination path}
  or on failure:
    ERROR: {source path} -> could not move ({reason})


====================================================================
PHASE 3: VERIFY AND SUMMARIZE
====================================================================

* After all files have been processed, output a summary to stdout:
    Total files processed: {count}
    Successfully moved:    {count}
    Errors:                {count}

* If any errors occurred, list each failed file and the reason.

* Do not remove any files from INPUT_DIR that were not processed
  (i.e., files not in the input list are left untouched).
