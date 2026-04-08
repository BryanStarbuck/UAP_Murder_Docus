---
name: UAP_X_add_link
description: Download an X/Twitter post by URL, determine which investigation it belongs to (UAPs, Energy, or Physics), add the information to the appropriate Docusaurus investigation pages, and download any video or images
invocable: true
---

You are helping the user add content to the UAPMurders.com investigation website.

The user provides arguments: $ARGUMENTS

These arguments may contain ANY COMBINATION of the following components. Parse them
carefully and identify which ones are present:

============================
INPUT COMPONENTS
============================

**Component 1: X/Twitter URL**
* A URL to an X.com or Twitter.com post (contains /status/ in the path)
* If present, fetch the post data using the X API (Step 1)
* May be a text post, a video post, or both
* Example: https://x.com/username/status/1234567890

**Component 2: Video URL**
* A direct video URL or a second X URL specifically for a video
* Sometimes provided separately from the main post URL
* If the main X post already has a video, this is redundant — use the post's video
* If provided separately, download this video and associate it with the investigation

**Component 2b: Image URL**
* A direct image URL (e.g., https://pbs.twimg.com/media/... or any .jpg/.png/.webp URL)
* Sometimes provided separately from the main post URL
* If the main X post already has image attachments, those are handled automatically in Step 5b
* If provided separately, download this image and associate it with the investigation

**Component 3: Investigation Name**
* Which investigation to add content to: "UAPs", "Energy", or "Physics"
* May be provided as a directory name ("UAPs", "Energy", "Physics"), a label ("uap murders",
  "energy systems murders", "physics murders"), or implied by context ("this is about
  zero-point energy" -> Energy, "this is about UAP propulsion physics" -> Physics)
* If provided, skip auto-detection and use this investigation directly
* If NOT provided, auto-detect from content (Step 2)

**Component 4: Text Block**
* A block of text with information to add, context, or instructions
* IMPORTANT: A text block may contain TWO distinct things mixed together:
  1. INSTRUCTIONS — directives telling you to do something specific
     (e.g., "add this to the Phil Schneider page", "update the timeline", "create a new profile for X")
  2. CONTENT — investigative information to add to pages
     (e.g., "According to declassified documents...", quotes, facts, connections, claims)
* Parse the text block carefully and SEPARATE these two types before proceeding
* Execute any instructions found. Use the content for investigation updates.
* Content may reference people, organizations, events, or claims that already have pages —
  check existing pages and update them
* Content may describe someone new who warrants a new profile — evaluate and create if appropriate

**Component 5: Transcribe Video**
* If the input contains the phrase "transcribe video" (case-insensitive), set
  TRANSCRIBE_REQUESTED = true
* This triggers Step 6 (transcription) AFTER the video has been downloaded in Step 5
* If transcribe is requested but no video is found or download fails, skip transcription
  and inform the user

ROOT_DIR dir is ~/BGit/Bryan_git/UAP_Murder_Docus
TRANSCRIBE_JS is file ~/BGit/act3/tools/Transcription/Transcribe.js

============================
DIRECTORY HIERARCHY
============================

This is a Docusaurus website (uapmurders.com, dev port 3847).
All content lives under {ROOT_DIR}.

```
{ROOT_DIR}/
├── UAPs/                               # UAPs Murders (General) investigation
│   ├── index.md                        # Master table, intro, overview
│   ├── books.md
│   ├── podcasts.md
│   ├── youtube_channels.md
│   ├── images/                         # Investigation-level images
│   └── Details/                        # One .md file per person (~152 files)
│       └── FirstName_LastName.md
├── Energy/                             # UAP Energy Systems Murders investigation
│   ├── index.md                        # Master table, intro, overview
│   ├── books.md
│   ├── podcasts.md
│   ├── youtube_channels.md
│   └── Details/                        # One .md file per person
│       └── FirstName_LastName.md
├── Physics/                            # UAP Physics Murders investigation
│   ├── index.md                        # Master table, intro, overview
│   └── Details/                        # One .md file per person
│       └── FirstName_LastName.md
├── src/
│   ├── css/custom.css                  # Global styles
│   ├── pages/index.tsx                 # Landing page
│   └── theme/TOC/                      # Swizzled TOC — right sidebar "The Dead & Missing" list
│       ├── index.tsx
│       └── styles.module.css
├── static/
│   ├── img/                            # Site images (logos, etc.)
│   ├── videos/                         # Downloaded videos (served at /videos/filename)
│   └── images/                         # Downloaded post images (served at /images/filename)
├── skills_storage/
│   └── UAP_X_add_link.md               # This skill
├── docusaurus.config.ts
├── sidebarsGeneral.ts
├── sidebarsEnergySystems.ts
├── sidebarsPhysics.ts
└── package.json
```

============================
INVESTIGATION REGISTRY
============================

Use this registry to match content against the three investigations.
When auto-detecting, scan all available text for these keywords and topics.

**Investigation 1: UAPs** (`UAPs/`, URL path `/uaps/`)
* Scope: People killed, disappeared, or retaliated against for connection to UAP/UFO
  information, recovered non-human craft, reverse-engineering programs, classified
  aerospace/defense tech with UAP overlap, government knowledge of non-human intelligence,
  UAP testimony and disclosure, UAP encounters causing physical harm
* Keywords: UAP, UFO, unidentified aerial phenomena, non-human craft, reverse engineering,
  AATIP, AAWSAP, Roswell, crash retrieval, disclosure, whistleblower UAP, alien technology,
  non-human intelligence, NHI, Bob Lazar, Phil Schneider, William Cooper, John Lear,
  Milton Torres, Steven Greer, David Grusch, Luis Elizondo, Hal Puthoff, remote viewing,
  MJ-12, Majestic 12, Project Blue Book, classified aircraft, SDI, Star Wars program,
  extraterrestrial, Area 51, S-4, Skinwalker Ranch, cattle mutilation, abduction, implant,
  USO, underwater UAP, directed energy weapon UAP

**Investigation 2: Energy** (`Energy/`, URL path `/energy/`)
* Scope: People killed, died suspiciously, disappeared, or retaliated against for work on
  advanced energy breakthroughs — zero-point energy, cold fusion/LENR, water fuel cells,
  radiant energy, over-unity devices, magnetic motors, antigravity/field propulsion,
  unconventional fuel systems, electromagnetic harvesting, orgone energy, scalar waves
* Keywords: zero-point energy, free energy, cold fusion, LENR, water fuel cell, Stanley
  Meyer, Eugene Mallove, Tom Bearden, Nikola Tesla suppression, over-unity, radiant energy,
  orgone, scalar wave, electromagnetic harvesting, magnetic motor, Joe Cell, hydrogen on
  demand, suppressed energy, energy suppression, inventor killed, patent suppression,
  Bedini, Don Smith, Dennis Lee, John Bedini, Howard Johnson, John Hutchison

**Investigation 3: Physics** (`Physics/`, URL path `/physics/`)
* Scope: The claim that public physics stopped advancing circa 1950 while classified physics
  leapt ahead via recovered UAP technology — covers classified propulsion, energy sources,
  space warping/gravity manipulation, FTL travel, dimensional shifting, inertial mass
  reduction, exotic materials, and the scientists/whistleblowers involved
* Keywords: classified physics, black budget physics, inertial mass reduction, gravity
  manipulation, space warping, warp drive, FTL, faster than light, metamaterials, exotic
  materials, antigravity propulsion, classified propulsion, physics suppressed, Alcubierre,
  Eric Davis, Hal Puthoff classified, Salvatore Pais, Advanced Aerospace Weapons, ADAPT,
  gravity wave, torsion field, dimensional physics, UAP propulsion mechanism, Podkletnov,
  electrogravitics, T. Townsend Brown

* Some people appear in MULTIPLE investigations (e.g., a scientist killed for zero-point
  energy work tied to UAP reverse-engineering spans both Energy and UAPs). When content
  spans multiple investigations, update all relevant ones.

============================
STEP 0: PARSE INPUT
============================

* Read through $ARGUMENTS and identify all components present:
  - Any URLs? Classify each as X post URL, video URL, image URL, or other
  - Investigation name specified?
  - A text block? If so, separate INSTRUCTIONS from CONTENT within it
  - The phrase "transcribe video"?

* Output:
  ```
  ============================================
  Input Parsed
  ============================================
  X Post URL: {url or "none"}
  Video URL: {url or "none"}
  Image URL: {url or "none" or "from post attachments"}
  Investigation: {UAPs / Energy / Physics / auto-detect}
  Text block: {yes/no — summarize content in one line}
  Instructions found in text: {list any explicit instructions, or "none"}
  Transcribe video: {yes/no}
  ============================================
  ```

============================
STEP 1: FETCH THE POST (if X URL provided)
============================

* Skip this step if no X/Twitter URL was provided.

* Extract the post ID from the URL. X URLs look like:
  - https://x.com/{username}/status/{post_id}
  - https://twitter.com/{username}/status/{post_id}
  - The post_id is the numeric string after /status/

* Fetch the full post data using xurl with expanded fields:
  ```bash
  xurl "/2/tweets/{post_id}?tweet.fields=created_at,author_id,public_metrics,text,entities,conversation_id,lang,note_tweet,attachments&expansions=author_id,attachments.media_keys&user.fields=name,username,description,public_metrics&media.fields=url,preview_image_url,type,width,height,duration_ms,variants" --auth app
  ```

* If xurl fails or returns an error, inform the user and stop.

* Output:
  ```
  ============================================
  X Post Fetched Successfully
  ============================================
  Author: @{username} ({display_name})
  Date: {created_at}
  Text: {full text of post}
  Likes: {like_count} | Retweets: {retweet_count} | Views: {impression_count}
  Has Video: {yes/no}
  Has Images: {yes/no — count if yes}
  ============================================
  ```

============================
STEP 2: DETERMINE THE INVESTIGATION
============================

* If an investigation was specified in the input (Component 3), use it directly.
  Resolve to the correct path under {ROOT_DIR}:
  - "UAPs" → {ROOT_DIR}/UAPs/
  - "Energy" → {ROOT_DIR}/Energy/
  - "Physics" → {ROOT_DIR}/Physics/

* Otherwise, analyze ALL available content (post text + text block) against the
  INVESTIGATION REGISTRY above. Scan for keywords, people names, organizations.

* Check if any people mentioned already have files in any investigation's Details/
  directory — this is a strong match signal.

* Content may span MULTIPLE investigations. If so, update all that apply.

* Output:
  ```
  Investigation: {UAPs / Energy / Physics / Multiple}
  Path(s): {full path(s)}
  Confidence: HIGH / MEDIUM / LOW
  Reason: {why this matches}
  ```

* If no investigation matches, inform the user:
  ```
  No matching investigation found for this content.
  This content may not belong to uapmurders.com — consider
  the sister Intelligence site at ~/BGit/Bryan_git/Intel_Murder_Docus/ (intelligencemurders.com —
  Epstein and Intelligence Service Murders investigations). That is a separate repo and a
  separate Docusaurus site.
  ```
  Then stop.

============================
STEP 3: SAVE POST DATA AS YAML (if X post was fetched)
============================

* Skip this step if no X post was fetched.

* Create x_posts directory if needed under the investigation:
  ```bash
  mkdir -p {ROOT_DIR}/{investigation}/other/x_posts
  ```
  (The `other/` subdirectory may not exist for all investigations — `mkdir -p` handles it.)

* Save the post as a YAML file: {ROOT_DIR}/{investigation}/other/x_posts/{post_id}.yaml
  Format:
  ```yaml
  id: '{post_id}'
  url: '{original_url}'
  author:
    username: '{username}'
    name: '{display_name}'
    id: '{author_id}'
  text: |
    {full text of the post}
  created_at: '{created_at}'
  lang: '{lang}'
  public_metrics:
    retweet_count: {n}
    reply_count: {n}
    like_count: {n}
    quote_count: {n}
    bookmark_count: {n}
    impression_count: {n}
  has_video: {true/false}
  has_image: {true/false}
  investigation: '{UAPs or Energy or Physics}'
  added_date: '{today YYYY-MM-DD}'
  ```

  If multiple investigations are being updated, save a copy in each.

============================
STEP 4: ADD INFORMATION TO INVESTIGATION
============================

* Combine ALL available content into a single analysis:
  - X post text (if fetched)
  - Content portion of the text block (instructions were separated in Step 0)
  - Video description (if video present)

* Execute any INSTRUCTIONS found in Step 0 first before general content placement.

* Read the investigation's index.md (first 60 lines) to understand its structure,
  categories, and sorting rules.

* List all existing files in Details/ to know what profiles already exist.

* Also check these supplementary files if they exist:
  - UAPs: books.md, podcasts.md, youtube_channels.md
  - Energy: books.md, podcasts.md, youtube_channels.md
  - Physics: (no supplementary files currently)

* Analyze the combined content for:

  **People mentioned:**
  - Check if they already have a file in Details/ across all three investigations
    (match by name variations)
  - If a person is notable and new to the investigation, create a profile using
    the investigation's profile template (see Profile Structure below). Web search
    them first — never create a profile from a single social media post alone.
  - If a person already has a file, add new information and the source link
  - DEFAMATION RULE: For people who are ALIVE, follow strict defamation prevention:
    * Never accuse them of crimes or unethical actions as fact
    * Use attribution language throughout ("according to...", "allegedly", "reportedly")
    * Include their denials and counterarguments
    * Never present speculation as fact

  **Topics, events, and patterns:**
  - UAPs: check if books.md, podcasts.md, or youtube_channels.md should be updated
    with newly mentioned resources
  - Energy: same as UAPs
  - Physics: no supplementary resource files currently exist — add resource context
    directly to relevant person profiles or index.md as appropriate
  - If the content reveals a new witness, program, or key event, consider whether
    it warrants a mention in the investigation's index.md

  **Multiple pages may need updating:**
  - A single content block may update 3–10 different pages. Consider EACH existing
    page and whether this content adds to it.
  - Information about a person goes on that person's page
  - A new book, podcast, or YouTube channel goes on the relevant supplementary page
  - Cross-cutting information may appear on multiple pages with different emphasis

* For each person or entity identified:
  - Existing Details/ file: Add the source URL to their Sources section. Add any
    new information not already in their profile to the appropriate section.
  - No Details/ file + notable enough: Create a new profile. Research via web search.
    Add a row to the appropriate table in index.md. Follow sorting rules.

* Sorting rules for index.md tables and sidebar:
  1. Americans killed on American soil first
  2. Americans killed abroad second
  3. Non-intelligence people above intelligence service employees
  4. Victim role priority: civilians/whistleblowers/insiders > scientists/researchers >
     political activists
  5. Decade (most recent first)
  6. Suspicion level (highest first)
  7. Year (most recent first)

* If the people added are highly impactful (shocking death, important figure), consider
  adding them to the right sidebar people list in {ROOT_DIR}/src/theme/TOC/index.tsx.
  Read that file first to understand how the `people` array is structured. Only add if
  the new person ranks above the least impactful current entry. Blurb must be 28 words
  or fewer. All sidebar links point into the UAPs section (most comprehensive profiles).

* Output what was done:
  ```
  ============================================
  Investigation Updated: {UAPs / Energy / Physics / Multiple}
  ============================================
  Files modified: {list}
  Files created: {list}
  People added: {list or "none"}
  Sidebar updated: {yes — added {name} | no}
  Sources added to: {list}
  Instructions executed: {list or "none"}
  ============================================
  ```

============================
PROFILE STRUCTURE (for new Detail pages)
============================

When creating a new person profile under Details/, use this structure.
Read the CLAUDE.md in this repo for full defamation and sorting rules.
Minimum required sections:

```markdown
---
title: Full Name
---

# Full Name
One-line summary: who they were and how they died/disappeared.

| Field | Details |
|-------|---------|
| **Full Name** | Legal name |
| **Born** | Date or year |
| **Died** | Full date (or "Missing since {date}") |
| **Age at Death** | Number (or age when disappeared) |
| **Location of Death** | City, State/Country |
| **Cause of Death** | How they died / manner of disappearance |
| **Official Ruling** | Suicide / Accidental / Homicide / Missing / Natural / etc. |
| **Nationality** | American / British / Russian / etc. |
| **Killed on US Soil** | Yes / No |
| **Category** | Scientist / Whistleblower / Researcher / Inventor / Civilian / etc. |
| **Investigation** | UAPs / Energy / Physics (or multiple) |

## Assessment: SUSPICION LEVEL

2-3 sentence summary of why this death/disappearance is or isn't suspicious.
Use ratings: CONFIRMED / HIGHLY SUSPICIOUS / SUSPICIOUS / MODERATE SUSPICION /
UNCERTAIN / OFFICIALLY DENIED

## Circumstances of Death

Narrative of what happened.

## Background

Who this person was and why they mattered.

## UAP Connections / Energy Connections / Physics Connections

What links this person's death to the investigation.

## Why This Death Raises Questions

- Bullet points of suspicious elements

## Key Quotes

> Blockquoted quotes with attribution

## See Also

- Links to related profiles

## Other Shocking Stories

- [Person Name](Person_Name.md): 18 words or less — most shocking hook.
- [Person Name](Person_Name.md): 18 words or less — different person.
- [Person Name](Person_Name.md): 18 words or less — different person.
- [Person Name](Person_Name.md): 18 words or less — different person.

## Sources

- Source links, one per line (minimum 3-5)

**Status:** Alive / Deceased (YYYY) / Unknown

*This information was built by Grok and Claude AI research.*
```

============================
STEP 5: DOWNLOAD VIDEO (if video present)
============================

* Videos go to: {ROOT_DIR}/static/videos/
  They are served by Docusaurus at URL path /videos/{filename}

* Check for a video from:
  - The X post's media attachments (type "video")
  - A separate video URL provided in the input
  - A URL in the text block that points to video content

* If a video is available:

  5-pre. CHECK FOR DUPLICATE before downloading:
    Check whether {ROOT_DIR}/static/videos/{post_id}.mp4 (or similar) already exists:
    ```bash
    ls {ROOT_DIR}/static/videos/{post_id}* 2>/dev/null
    ```
    If the file exists, skip steps 5a–5b and use the existing file for embedding.
    Output: "Video already exists: {filename} — skipping download"

  5a. Download using yt-dlp:
    ```bash
    mkdir -p {ROOT_DIR}/static/videos
    yt-dlp "{video_source_url}" -o "{ROOT_DIR}/static/videos/{post_id}.%(ext)s"
    ```
    If yt-dlp fails, try with cookies or inform the user.

  5b. IPFS pin (optional but preferred for censorship resistance):
    - Ensure the IPFS daemon is running (start with: ipfs daemon &)
    - Add and pin the video:
      ```bash
      ipfs add --pin {ROOT_DIR}/static/videos/{filename}
      ```
    - Capture the CID from the output
    - If IPFS is not available, skip pinning and note this in the summary

  5c. Embed video in the relevant investigation page:
    - Determine which Details/ file should show this video
    - If the file is .md, rename it to .mdx and update all sidebars/links to it
    - Add the video embed after the metadata table, before the first content section.
    - If IPFS was pinned, use this pattern (multiple fallback sources):
      ```
      ## Video Evidence

      <video controls width="100%" style={{maxWidth: '720px'}}>
        <source src="/videos/{filename}" type="video/mp4" />
        <source src="https://ipfs.io/ipfs/{CID}" type="video/mp4" />
        <source src="https://dweb.link/ipfs/{CID}" type="video/mp4" />
        Your browser does not support the video tag.
      </video>

      *{Description}. Source: [@{username} on X]({original_url}), {date}.*
      ```
    - If IPFS was NOT pinned, use only the local source:
      ```
      ## Video Evidence

      <video controls width="100%" style={{maxWidth: '720px'}}>
        <source src="/videos/{filename}" type="video/mp4" />
        Your browser does not support the video tag.
      </video>

      *{Description}. Source: [@{username} on X]({original_url}), {date}.*
      ```

  5d. Output:
    ```
    ============================================
    Video Downloaded
    ============================================
    File: {ROOT_DIR}/static/videos/{filename}
    Size: {file size}
    IPFS CID: {CID or "not pinned"}
    Embedded in: {path to .mdx file}
    ============================================
    ```

* If no video, skip this step and note: "No video in this post."

============================
STEP 5B: DOWNLOAD IMAGES (if images present)
============================

* Images go to: {ROOT_DIR}/static/images/
  They are served by Docusaurus at URL path /images/{filename}

* Check for images from:
  - The X post's media attachments (type "photo") — may be 1 or more images
  - A direct image URL provided in the input (Component 2b)
  - A URL in the text block that points to an image

* Image URL extraction from X API response:
  - Images appear in the "includes.media" array with type "photo"
  - The image URL is in the "url" field
  - For highest quality, append "?format=jpg&name=4096x4096" to the base URL
  - Record width and height from the API response for aspect ratio

* If one or more images are available:

  5B-pre. CHECK FOR DUPLICATES:
    ```bash
    ls {ROOT_DIR}/static/images/{post_id}* 2>/dev/null
    ```
    Skip downloading any that already exist.

  5B-a. Download each image:
    ```bash
    mkdir -p {ROOT_DIR}/static/images
    curl -L -o "{ROOT_DIR}/static/images/{post_id}_{index}.jpg" "{image_url}"
    ```
    Where {index} is 1, 2, 3... for multiple images from the same post.

  5B-b. IPFS pin (optional):
    ```bash
    ipfs add --pin {ROOT_DIR}/static/images/{filename}
    ```
    Capture the CID. Skip if IPFS is not available.

  5B-c. Embed images in the relevant investigation page:
    - Determine which Details/ file should show these images
    - If .md, rename to .mdx
    - Single image embed pattern:
      ```
      ## Image Evidence

      <img
        src="/images/{filename}"
        alt="{description}"
        style={{maxHeight: '25vh', width: 'auto', aspectRatio: '{width}/{height}'}}
      />

      *{Description}. Source: [@{username} on X]({original_url}), {date}.*
      ```
    - Multiple images:
      ```
      ## Image Evidence

      <div style={{display: 'flex', flexWrap: 'wrap', gap: '1rem'}}>
      <img src="/images/{filename_1}" alt="{desc_1}" style={{maxHeight: '25vh', width: 'auto', aspectRatio: '{w1}/{h1}'}} />
      <img src="/images/{filename_2}" alt="{desc_2}" style={{maxHeight: '25vh', width: 'auto', aspectRatio: '{w2}/{h2}'}} />
      </div>

      *{Description}. Source: [@{username} on X]({original_url}), {date}.*
      ```

  5B-d. Output:
    ```
    ============================================
    Image(s) Downloaded
    ============================================
    Files: {list of filenames}
    IPFS CIDs: {list or "not pinned"}
    Embedded in: {path to .mdx file}
    ============================================
    ```

* If no images, skip this step and note: "No images in this post."

============================
STEP 6: TRANSCRIBE VIDEO (if TRANSCRIBE_REQUESTED = true AND video was downloaded)
============================

* Skip this step entirely if TRANSCRIBE_REQUESTED is not true.
* Skip if no video was downloaded in Step 5 — inform the user.

* TRANSCRIBE_JS is file ~/BGit/act3/tools/Transcription/Transcribe.js

* Create a temp directory:
  ```bash
  TRANSC_TMPDIR=$(mktemp -d /tmp/uap_transcribe_XXXXXX)
  ```

* Run the transcription:
  ```bash
  cd "$TRANSC_TMPDIR" && node ~/BGit/act3/tools/Transcription/Transcribe.js "{ROOT_DIR}/static/videos/{video_filename}" transcription.txt
  ```

* Wait for completion (may take several minutes for long videos).

* Verify:
  ```bash
  ls -la "$TRANSC_TMPDIR/transcription.txt"
  ```

* If transcription fails, inform the user and continue to final summary.

* Read the transcription into memory for Step 7.
  Store: TRANSCRIPTION_FILE = {TRANSC_TMPDIR}/transcription.txt

* Output:
  ```
  ============================================
  Video Transcribed
  ============================================
  Video: {video_filename}
  Transcription: {TRANSCRIPTION_FILE}
  Word count: {approximate word count}
  ============================================
  ```

============================
STEP 7: PROCESS TRANSCRIPTION INTO INVESTIGATION (if transcription succeeded)
============================

* Skip if Step 6 was skipped or failed.

* Read the full transcription from {TRANSCRIPTION_FILE}.

* Step 4 has already processed post text and text block content. The transcription
  adds information from the SPOKEN video content. Only process what is NEW.

* Analyze the transcription for:

  **People mentioned in the video not in the post text:**
  - Check Details/ for existing profiles across all three investigations
  - If notable and new, create a profile (web search first)
  - Follow all defamation rules for living people

  **New facts, quotes, or claims:**
  - Add direct quotes: "In a video posted on {date}, {speaker} stated: '...'"
    with source link to the X post
  - Add factual claims with attribution language

  **New topics, events, or patterns:**
  - Consider updating books.md, podcasts.md, or youtube_channels.md if new
    resources are mentioned (UAPs and Energy investigations)
  - Consider updating the relevant person's profile or index.md

  **Do NOT duplicate** information already added in Step 4.

* Save transcription to investigation transcript directory:
  ```bash
  mkdir -p {ROOT_DIR}/{investigation}/other/transcripts
  cp {TRANSCRIPTION_FILE} {ROOT_DIR}/{investigation}/other/transcripts/{post_id}_transcript.txt
  ```

* Clean up temp directory:
  ```bash
  rm -rf {TRANSC_TMPDIR}
  ```

* Output:
  ```
  ============================================
  Transcription Processed
  ============================================
  Pages updated from transcription: {list}
  Pages created from transcription: {list or "none"}
  New people identified: {list or "none"}
  Transcript saved to: {ROOT_DIR}/{investigation}/other/transcripts/{post_id}_transcript.txt
  ============================================
  ```

============================
STEP 8: GIT ADD CHANGES
============================

* Stage all new and modified files in this repo:
  ```bash
  git -C {ROOT_DIR} add UAPs/ Energy/ Physics/ src/ static/
  ```
  Use the top-level investigation dirs rather than specific subdirs — `static/videos/`
  and `static/images/` may not exist yet and git add on a missing path errors.

* Output the staged file list:
  ```bash
  git -C {ROOT_DIR} diff --cached --name-only
  ```

* Do NOT commit — leave committing to the user or the /commit skill.

============================
STEP 9: FINAL SUMMARY
============================

* Output a complete summary:
  ```
  ============================================
  UAP_X_add_link Complete
  ============================================
  Post: {post_id by @username, or "none"}
  Investigation: {UAPs / Energy / Physics / Multiple}
  YAML saved: {path or "none"}
  Video: {static/videos/filename or "none"}
  Video IPFS CID: {CID or "not pinned"}
  Images: {static/images/filenames or "none"}
  Image IPFS CIDs: {CIDs or "not pinned"}
  Transcription: {yes — saved to other/transcripts/ | no — not requested | failed}
  Instructions executed: {list or "none"}
  Investigation changes:
    - {list each file modified or created, from Steps 4, 7}
  Sidebar updated (src/theme/TOC/index.tsx): {yes — added {name} | no}
  Staged for commit: {yes | no}
  ============================================
  ```

============================
IMPORTANT RULES
============================

* Always follow the investigation's defamation prevention rules (see CLAUDE.md).
* For ANY living person: never accuse them of crimes or unethical actions as fact.
  Use attribution language. Include denials. Note legitimate roles before any allegations.
* Always use attribution language for claims from social media posts.
* Always web search to research people before creating profiles — never create a
  profile based solely on a single social media post.
* Always cross-link new profiles to related existing profiles.
* Never remove existing content — only add to it.
* Keep the investigation's writing tone: investigative, not conspiratorial.
* Use suspicion ratings: CONFIRMED / HIGHLY SUSPICIOUS / SUSPICIOUS /
  MODERATE SUSPICION / UNCERTAIN / OFFICIALLY DENIED.
* Include counterarguments and denials where relevant.
* Separate INSTRUCTIONS from CONTENT in any text block before processing.
* When processing a text block, think carefully about WHICH pages each piece
  of information belongs on — not everything goes on one page.
* Docusaurus URL paths: UAPs profiles are at /uaps/Details/Name,
  Energy profiles are at /energy/Details/Name, Physics profiles are at /physics/Details/Name.
  Use these in cross-links.
* Cross-link between investigations when a person appears in multiple.
* Cross-link to intelligencemurders.com using full URLs (e.g., https://intelligencemurders.com/epstein-murders/
  or https://intelligencemurders.com/intelligence-service-murders/) when content overlaps
  with Epstein or Intel investigations. That site lives in a separate repo at
  ~/BGit/Bryan_git/Intel_Murder_Docus/ — do NOT edit files there from this skill.
  Use full URLs only; never relative paths.
