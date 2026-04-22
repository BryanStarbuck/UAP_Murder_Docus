#!/bin/sh
# build_manifest.sh — Add all Physics_Math videos to IPFS and generate manifest.yaml + get_videos.sh
#
# Run from Physics/Physics_Math/ipfs/ :
#   sh build_manifest.sh
#
# Requires: ipfs (kubo) installed and daemon running
# Output: manifest.yaml, get_videos.sh (both written to this directory)

set -e

VIDEOS_DIR="$(cd "$(dirname "$0")/../videos" && pwd)"
X_POSTS_DIR="$(cd "$(dirname "$0")/../../../../Physics/other/x_posts" && pwd)" 2>/dev/null || X_POSTS_DIR=""
OUT_DIR="$(cd "$(dirname "$0")" && pwd)"
MANIFEST="$OUT_DIR/manifest.yaml"
SCRIPT="$OUT_DIR/get_videos.sh"
TODAY=$(date '+%Y-%m-%d')

echo "========================================"
echo "  Physics_Math IPFS Manifest Builder"
echo "========================================"
echo "  Videos dir: $VIDEOS_DIR"
echo "  Output dir: $OUT_DIR"
echo "  Date: $TODAY"
echo "========================================"

# Verify IPFS daemon
if ! ipfs swarm peers >/dev/null 2>&1; then
  echo "ERROR: IPFS daemon is not running. Start it with: ipfs daemon &"
  exit 1
fi

# Write manifest header
cat > "$MANIFEST" << 'HEADER'
# UAP Physics Murders — Physics_Math Video Manifest
# https://uapmurders.com/physics/
#
# Physics & math research videos — local reference, not published to web.
# Videos are NOT committed to git. Each entry has an IPFS CID.
# Run get_videos.sh to download and pin all videos to your local IPFS node.
#
# These videos document UAP physics research, propulsion theories,
# whistleblower testimony, and advanced physics concepts.

videos:
HEADER

# Write get_videos.sh header
cat > "$SCRIPT" << 'SCRIPT_HEADER'
#!/bin/sh
# get_videos.sh — Download and pin all UAP Physics_Math research videos via IPFS
#
# Usage: sh get_videos.sh
# Works on Mac (Homebrew) and Linux. Windows users: run in WSL or Git Bash.

set -e

# Install IPFS (kubo) if not present
if ! command -v ipfs >/dev/null 2>&1; then
  echo "Installing IPFS (kubo)..."
  if command -v brew >/dev/null 2>&1; then
    brew install kubo
  else
    echo "Homebrew not found. Install IPFS manually: https://docs.ipfs.tech/install/"
    exit 1
  fi
fi

# Initialize IPFS repo if needed
if [ ! -d "$HOME/.ipfs" ]; then
  ipfs init
fi

# Start daemon in background if not running
if ! ipfs swarm peers >/dev/null 2>&1; then
  echo "Starting IPFS daemon..."
  ipfs daemon &
  sleep 6
fi

echo "========================================"
echo "  Fetching UAP Physics_Math research videos"
echo "========================================"

# 'ipfs pin add' fetches the video from the IPFS network and pins it to your node.
# Pinning means your machine becomes a host — others can fetch it from you.

# ============================================================
# UAP Physics Research Videos (Physics investigation)
# ============================================================
SCRIPT_HEADER

# Process each video file
TOTAL=0
DONE=0

# Count total
for f in "$VIDEOS_DIR"/*.mp4; do
  TOTAL=$((TOTAL + 1))
done

echo "  Processing $TOTAL video files..."
echo ""

for filepath in "$VIDEOS_DIR"/*.mp4; do
  filename=$(basename "$filepath")
  # Extract tweet ID: format is {inv_id}_{tweet_id}_video.mp4
  tweet_id=$(echo "$filename" | sed 's/^[0-9]*_//' | sed 's/_video\.mp4$//')
  DONE=$((DONE + 1))

  printf "  [%d/%d] Adding: %s ... " "$DONE" "$TOTAL" "$filename"

  # Add to IPFS and capture CID
  CID=$(ipfs add --quieter --pin=true "$filepath" 2>/dev/null)
  if [ -z "$CID" ]; then
    echo "FAILED (skipping)"
    continue
  fi
  echo "$CID"

  # Look for matching x_posts YAML for metadata
  description=""
  author=""
  if [ -n "$X_POSTS_DIR" ] && [ -f "$X_POSTS_DIR/${tweet_id}.yaml" ]; then
    # Extract fields from YAML (basic parsing)
    xpost="$X_POSTS_DIR/${tweet_id}.yaml"
    author=$(grep '^  username:' "$xpost" | head -1 | sed "s/.*username: '//;s/'.*//")
    # Get first line of text field (skip the | marker)
    description=$(grep -A1 '^text:' "$xpost" | tail -1 | sed 's/^ *//' | cut -c1-120)
    if [ -z "$author" ]; then
      author=""
    fi
  fi

  # Defaults if no x_posts YAML found
  if [ -z "$description" ]; then
    description="UAP physics research video — tweet ${tweet_id}"
  fi
  if [ -z "$author" ]; then
    author=""
  fi

  # Build source URL
  if [ -n "$author" ]; then
    source_url="https://x.com/${author}/status/${tweet_id}"
    source_author="@${author}"
  else
    source_url="https://x.com/i/status/${tweet_id}"
    source_author="unknown"
  fi

  # Append to manifest.yaml
  cat >> "$MANIFEST" << ENTRY
- filename: ${filename}
  ipfs_cid: ${CID}
  ipfs_gateway_url: https://ipfs.io/ipfs/${CID}
  source_url: ${source_url}
  source_author: '${source_author}'
  description: '${description}'
  investigation: Physics
  added_date: '${TODAY}'
  pinned: true

ENTRY

  # Append to get_videos.sh
  echo "# VIDEO: ${description}" >> "$SCRIPT"
  echo "ipfs pin add ${CID}" >> "$SCRIPT"
  echo "" >> "$SCRIPT"

done

# Write get_videos.sh footer
cat >> "$SCRIPT" << 'SCRIPT_FOOTER'
echo "========================================"
echo "  Done. All Physics_Math videos pinned."
echo "========================================"
SCRIPT_FOOTER

chmod +x "$SCRIPT"

echo ""
echo "========================================"
echo "  Done."
echo "  manifest.yaml: $MANIFEST"
echo "  get_videos.sh: $SCRIPT"
echo "  Total processed: $DONE"
echo "========================================"
