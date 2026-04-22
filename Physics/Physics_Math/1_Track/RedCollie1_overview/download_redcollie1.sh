#!/usr/bin/env bash
# download_redcollie1.sh
# Downloads all retrievable posts from @RedCollie1 via X API v2.
#
# CREDIT COST: ~3,200 tweet reads (32 pages × 100 tweets).
# X API v2 hard limit: 3,200 most recent tweets per account via this endpoint.
# @RedCollie1 has 22,024 total posts — only the most recent 3,200 are accessible
# on Basic tier. Full archive requires Pro ($5,000/month) or Academic Research access.
#
# Usage: bash download_redcollie1.sh
# Auth:  Bearer token (app-only) from ~/.xurl — no OAuth2 needed for public accounts.

set -euo pipefail

XURL="/opt/homebrew/bin/xurl"
SAVE_DIR="$(cd "$(dirname "$0")" && pwd)"
RAW_DIR="$SAVE_DIR/raw_json"
YAML_DIR="$SAVE_DIR/yaml"
IMAGES_DIR="$SAVE_DIR/images"
LOG_FILE="$SAVE_DIR/download.log"

USER_ID="1070522825646063617"
USERNAME="RedCollie1"
MAX_RESULTS=100

# All tweet fields — packed into every request, no separate calls
TWEET_FIELDS="created_at,author_id,public_metrics,source,entities,conversation_id,referenced_tweets,text,lang,possibly_sensitive,attachments,note_tweet,reply_settings,withheld"

# Expansions — media keys, author, referenced tweet objects
EXPANSIONS="attachments.media_keys,author_id,referenced_tweets.id,referenced_tweets.id.author_id,in_reply_to_user_id"

# Media fields — full resolution URLs, variants (for video), dimensions
MEDIA_FIELDS="url,preview_image_url,type,width,height,alt_text,duration_ms,variants,media_key,public_metrics"

# User fields for author expansion
USER_FIELDS="name,username,id,description,public_metrics,created_at,profile_image_url,verified,location"

# Build the full query string (shared across all pages)
QUERY_BASE="max_results=${MAX_RESULTS}&tweet.fields=${TWEET_FIELDS}&expansions=${EXPANSIONS}&media.fields=${MEDIA_FIELDS}&user.fields=${USER_FIELDS}"

mkdir -p "$RAW_DIR" "$YAML_DIR" "$IMAGES_DIR"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "=== Starting @RedCollie1 download ==="
log "User ID: $USER_ID | Max per page: $MAX_RESULTS"
log "Save directory: $SAVE_DIR"
log "NOTE: X API v2 hard limit = 3,200 most recent tweets. Total account posts = 22,024."

PAGE=0
TOTAL=0
NEXT_TOKEN=""
DONE=false

while [ "$DONE" = false ]; do
  PAGE=$((PAGE + 1))

  if [ -z "$NEXT_TOKEN" ]; then
    ENDPOINT="/2/users/${USER_ID}/tweets?${QUERY_BASE}"
  else
    ENDPOINT="/2/users/${USER_ID}/tweets?${QUERY_BASE}&pagination_token=${NEXT_TOKEN}"
  fi

  log "Fetching page $PAGE (token: ${NEXT_TOKEN:-none})..."

  RAW_FILE="$RAW_DIR/page_$(printf '%03d' $PAGE).json"

  # Capture stderr separately so API errors don't corrupt the JSON
  RESPONSE=$("$XURL" --auth app "$ENDPOINT" 2>>"$LOG_FILE")

  # Save raw JSON immediately
  printf '%s' "$RESPONSE" > "$RAW_FILE"

  # Count tweets on this page
  PAGE_COUNT=$(python3 -c "
import json, sys
try:
    d = json.loads(open('$RAW_FILE').read())
    print(len(d.get('data', [])))
except Exception as e:
    print(0)
" 2>/dev/null || echo "0")

  TOTAL=$((TOTAL + PAGE_COUNT))
  log "Page $PAGE: $PAGE_COUNT tweets (running total: $TOTAL)"

  # Extract next_token for pagination
  NEXT_TOKEN=$(python3 -c "
import json, sys
try:
    d = json.loads(open('$RAW_FILE').read())
    print(d.get('meta', {}).get('next_token', ''))
except:
    print('')
" 2>/dev/null || echo "")

  if [ -z "$NEXT_TOKEN" ]; then
    DONE=true
    log "No next_token — all pages retrieved."
  fi

  # Courtesy sleep between pages (well within rate limits)
  if [ "$DONE" = false ]; then
    sleep 0.5
  fi
done

log "=== All pages downloaded: $TOTAL tweets across $PAGE pages ==="

# Convert raw JSON pages to individual YAML files
log "Converting to YAML..."
python3 "$SAVE_DIR/convert_to_yaml.py" "$RAW_DIR" "$YAML_DIR" "$USERNAME" 2>&1 | tee -a "$LOG_FILE"

YAML_COUNT=$(ls "$YAML_DIR"/*.yaml 2>/dev/null | wc -l | tr -d ' ')
log "=== Complete: $YAML_COUNT YAML files in $YAML_DIR ==="
log "Raw JSON: $RAW_DIR/"
log ""
log "Next step: run  bash download_images.sh  to fetch all attached images and videos."
