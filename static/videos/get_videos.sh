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

# VIDEO: Graham Birdsall (UFO Magazine UK editor) died at 49 after sharing NASA STS shuttle plasma-entity footage
ipfs pin add QmXcgFNbJuWGyKX35utMmksj1EkbfjCsP6nzWKYZ64MoPM

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

# VIDEO: John Herrington (Reagan Secretary of Energy) — reportedly briefed on UFOs in underground WV facility; "Aliens are real, they are here, and I've seen them"
ipfs pin add QmfMP3L6kk3pGwQmctZBJS583nL65gdkzTw1o74diZEXBi

# VIDEO: Amy Eskridge — antigravity discovered by four different people and suppressed each time; her father also discovered antigravity; Amy murdered 2022
ipfs pin add QmdEY5U4HjXFNriDoEboezC8ZiXQoi1yN9wXoKoNMSc3Ta

# VIDEO: Juliette Bryant — South African Epstein survivor claims Epstein shapeshifted into reptilian devil creature and UFOs seen over Zorro Ranch
ipfs pin add QmSXUa7W8edjW8tZD5GrZjGDyi7T6p9wsFM2rBSo4LoQr3

# VIDEO: The Nine channeling through Indian psychic Vinod at the Round Table Foundation (Andrija Puharich / Chinese Scientists page)
ipfs pin add QmdUkbaUXKAPBzW5KiVP3SczG5kravfQAdPJBGLVYLHxY9

# VIDEO: Nassim Haramein — physics of what comes next, quantum vacuum energy breakthroughs, ISF research
ipfs pin add QmaHCY7tgLqi44QGjBSuMWozUihHid6ELkJSK27HGuA31J

# VIDEO: Charles Buhler (NASA Kennedy / Exodus Propulsion) — Biefeld-Brown "new force": 2 mN thrust at 6 kV in hard vacuum, 2000+ trials, Deep Tech Week NYC 2026
ipfs pin add QmeYHst1K8GiPkztNY7jpMXQvmdG5mSbNmuS191qm5x3iS

echo "========================================"
echo "  Done. All videos fetched and pinned."
echo "========================================"

# Reconciled additions (2026-05-13)

# 2042686155469005307.mp3
ipfs pin add QmYKKa8StzHhGKioBEU5VnCWZkyq7hGViRccmTVdqZqhPK

# 2043979750209925538.mp3
ipfs pin add QmaWjdQaZeMTJemVD34HhUrLJAL67h1feeEWtuRGZ4GJ2S

# 2045203516499607822.mp3
ipfs pin add QmUpGdHtUP5av1Tf5oLsazym9TsqPBiBr56PCdpevh7jQC

# 2045757285939744844.mp3
ipfs pin add QmV5m9CKe5eikrmSLcbV8DHcDWMTDRv178HCZbrE4G8adV

# 2045960606478438848.mp3
ipfs pin add QmXtVRsPy6q2qSRdKs5Fj2nM6SvBFBbYu5Q3xqmfSKZqMr

# 2049457591097389338.mp3
ipfs pin add QmZ52MS3bS9Rrg5VtZDSuw52nSEQHVqZrWBfte2AVJeir3

# 2049485639142543816.mp3
ipfs pin add QmSyyVAEMCxnoAc3pfZBYBB6dWiYTCjczRrqpzKM6RHSCA

# 2049918159700836593.mp3
ipfs pin add QmXRfo4DhxHsT5E4MW3cDuysUGfuvyRxu7DiWQiRUUM1Z4

# 2049955307313602951.mp3
ipfs pin add QmSsouKCCSJb5vJ2wW6inva5QwvQ7EqGJErPtpoJSC2ef3

# 2050347650193506503.mp3
ipfs pin add QmYy4RKmg2DAmid2Jvam7L1CNxZNGioRCPYe3gCeEM1rGn

# 2050657458457371070.mp3
ipfs pin add QmUJPBBUveoiahtGiC9GFKjhmZuHexGUpft8RKJLJLrdUu

# 2050657458457371070.mp4
ipfs pin add QmQPCKkiwjWi6xNubAk2KKCMjpHPCUGCyDuCcNRzWoy65D

# 2054597813745365254.mp3
ipfs pin add QmU8ZCPckK82Qs7pGAAza6DM45VbiGa2CutxaX9pTqVv41

# 2054597813745365254.mp4
ipfs pin add QmQcfpv8UkPKSFfTWhbst15phKe7hWPWpoNLYRPvnENxAq

# VIDEO: Fred Bell — "reverse engineering" as cover for >100 years of classified development (quoted Mario Nawfal clip)
ipfs pin add QmbuEyJk6LRZDfjM1Eov6Zp8Lxy9gsDtyKWzZAqFPeYPXW
