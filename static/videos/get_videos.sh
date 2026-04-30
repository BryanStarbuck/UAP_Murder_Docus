#!/bin/sh
# get_videos.sh — Download and pin all UAP Murders investigation videos via IPFS
#
# Usage: curl -fsSL https://uapmurders.com/videos/get_videos.sh | sh
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
echo "  Fetching and pinning UAP Murders videos"
echo "========================================"

# 'ipfs pin add' fetches the video from the IPFS network and pins it to your node.
# Pinning means your machine becomes a host — others can fetch it from you.
# Videos are stored in your IPFS datastore (~/.ipfs/) and accessible at
# http://127.0.0.1:8080/ipfs/<CID> while your daemon is running.

# ============================================================
# Investigation: UAPs Murders (General)
# ============================================================

# VIDEO: Rep. Eric Burlison warned he may be killed for pursuing UAP truth
ipfs pin add QmQg1wqnejWf3yydTQHd15QUmVkMgvZ7TmdCBNC18BUx5z

# VIDEO: Loosh farm thesis — grid around Earth, UAP journalist cancers, Karla Turner, Monroe
ipfs pin add QmV8tjeZN7Bu33JA1KdkaK2TiB7ch9mNfcinJpCfcKt7K5

# VIDEO: Dr. Steven Greer recounts Stanley Meyer water fuel cell and engineering team killed
ipfs pin add QmZ7GEkrpSAgCw3wr2k4p8SQR9NuKdmCPfM64o56uB6vhp

# VIDEO: 5 people who could have changed the world but disappeared
ipfs pin add QmWPNCj7TqYZ98TLy66aHrQvn7TLXt3tR6dj3ev8Sq5zHK

# VIDEO: Matthew Sullivan UAP researcher suspicious death
ipfs pin add QmXtZ3NRDPvmueEFhG2DfdxK7mTjCx3Cm3e3wGavWJ5Cjy

# ============================================================
# Investigation: UAP Physics Murders
# ============================================================

# VIDEO: Viktor Schauberger implosion vortex propulsion concept
ipfs pin add QmeprsxqG4W4YexuHFHMwLcLEMgafNGzGvWueNZJxAskj7

# VIDEO: Dr. Drew lab experiment — spinning magnet oscillates matching crop formations
ipfs pin add Qme83xoC5KUVWFvN5PxFqhAjFSdnpY6rdFAHSuV75nwauK

# VIDEO: Dr. Drew — non-spinning magnetic attraction to spinning magnetic repulsion
ipfs pin add QmTKV6BTy2Sa6WsrJmfykvERmvUnTZmAnXJapCW8LXouj9

# VIDEO: Dr. Drew comprehensive UFO physics presentation — device construction, crop circles
ipfs pin add QmR1CSWjrUbAka9LfbMXejjRtjGW2M7ENYpd25FRFmwWnS

# VIDEO: MIT plasma physicist Nuno Loureiro murdered — TAE fusion deal, SPARC rivalry
ipfs pin add QmPUTSoChvkH1XVcbpGoPR6Y2yKwcxUcxs6QPcE4FRHKEZ

# VIDEO: Amy Eskridge death, ultraterrestrial hypothesis, Project Looking Glass
ipfs pin add QmQoaog415qopfvin5mgKkNc65sof9TPnU5uBfRSvGY93Q

# VIDEO: Amy Eskridge YouTuber clip — time travel discussion from her exotic physics YouTube channel
ipfs pin add QmcWGbrcRvZWsNPYJmy5VQBX2BDMn9U9Dh7nNVKcjWBCRc

# ============================================================
# Investigation: UAP Energy Systems Murders
# ============================================================

# VIDEO: John Hutchison — Hutchison Effect (levitation, metal fusion, electromagnetic fields)
ipfs pin add Qmc8ob97zYLyLxDGsDDrm5LycuN3BfLNiJvcSBFCS95dv9

# VIDEO: John Christie and Lou Britz Lutec 1000 free energy device — both inventors died
ipfs pin add Qmd9bpZie1ZaWBwKJrV5tgEJqrXSLnXJozza1SuTfR5ZEb

# ============================================================
# Investigation: UAPs Murders (General)
# ============================================================

# VIDEO: The Nine channeling through Indian psychic Vinod at the Round Table Foundation (Andrija Puharich / Chinese Scientists page)
ipfs pin add QmdUkbaUXKAPBzW5KiVP3SczG5kravfQAdPJBGLVYLHxY9

echo "========================================"
echo "  Done. All videos fetched and pinned."
echo "========================================"
