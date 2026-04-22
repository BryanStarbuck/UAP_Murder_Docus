#!/usr/bin/env bash
# download_images.sh
# Reads all YAML files in ./yaml/ and downloads every attached image and video thumbnail.
# Run AFTER download_redcollie1.sh has completed.
#
# Images saved to: ./images/{tweet_id}/{filename}
# No API calls made — reads URLs from local YAML files only. Zero credit cost.

set -euo pipefail

SAVE_DIR="$(cd "$(dirname "$0")" && pwd)"
YAML_DIR="$SAVE_DIR/yaml"
IMAGES_DIR="$SAVE_DIR/images"
LOG_FILE="$SAVE_DIR/images_download.log"

mkdir -p "$IMAGES_DIR"

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" | tee -a "$LOG_FILE"
}

log "=== Starting image download ==="
log "Reading YAML files from: $YAML_DIR"
log "Saving images to: $IMAGES_DIR"

TOTAL_IMAGES=0
TOTAL_TWEETS=0
SKIPPED=0

for yaml_file in "$YAML_DIR"/*.yaml; do
  [ -f "$yaml_file" ] || continue
  TOTAL_TWEETS=$((TOTAL_TWEETS + 1))

  # Extract tweet ID from filename
  TWEET_ID=$(basename "$yaml_file" .yaml)

  # Parse URLs from YAML using Python
  python3 - "$yaml_file" "$IMAGES_DIR/$TWEET_ID" <<'PYEOF'
import sys, yaml, os, urllib.request, urllib.error, time

yaml_file = sys.argv[1]
out_dir = sys.argv[2]

with open(yaml_file) as f:
    record = yaml.safe_load(f)

media_items = record.get('media', [])
if not media_items:
    sys.exit(0)

os.makedirs(out_dir, exist_ok=True)

downloaded = 0
for m in media_items:
    media_key = m.get('media_key', 'unknown')
    media_type = m.get('type', 'unknown')

    urls_to_fetch = []

    # Photo URL
    if m.get('url'):
        ext = m['url'].split('?')[0].rsplit('.', 1)[-1] if '.' in m['url'] else 'jpg'
        urls_to_fetch.append((m['url'], f"{media_key}.{ext}"))

    # Video/GIF preview image
    if m.get('preview_image_url'):
        urls_to_fetch.append((m['preview_image_url'], f"{media_key}_preview.jpg"))

    # Video variants — download highest bitrate mp4
    if m.get('variants'):
        mp4_variants = [v for v in m['variants'] if v.get('content_type') == 'video/mp4' and v.get('url')]
        if mp4_variants:
            best = max(mp4_variants, key=lambda v: v.get('bit_rate', 0))
            urls_to_fetch.append((best['url'], f"{media_key}_video.mp4"))

    for url, filename in urls_to_fetch:
        out_path = os.path.join(out_dir, filename)
        if os.path.exists(out_path):
            continue  # Skip already downloaded
        try:
            req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
            with urllib.request.urlopen(req, timeout=30) as resp:
                with open(out_path, 'wb') as f:
                    f.write(resp.read())
            print(f"  Downloaded: {filename}")
            downloaded += 1
            time.sleep(0.1)  # Polite delay
        except Exception as e:
            print(f"  FAILED: {filename} — {e}", file=sys.stderr)

if downloaded:
    print(f"Tweet {os.path.basename(sys.argv[2])}: {downloaded} file(s)")
PYEOF

  RESULT=$?
  if [ $RESULT -ne 0 ]; then
    log "Warning: error processing $TWEET_ID"
  fi
done

log "=== Image download complete ==="
log "Processed $TOTAL_TWEETS tweets"
log "Images saved to: $IMAGES_DIR"
