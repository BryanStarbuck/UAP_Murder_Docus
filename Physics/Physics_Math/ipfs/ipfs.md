# Physics_Math — IPFS Video Network

This directory tracks UAP physics and math research videos via IPFS
(the InterPlanetary File System). Videos are stored on the decentralized
IPFS network so no single platform can take them down.

These videos are **local research reference material** documenting UAP
propulsion theories, classified physics whistleblower testimony, advanced
energy systems, and related physics research. They are separate from the
murder/profile content in the main UAP Physics investigation.

## How to Get the Videos

Pin all videos to your local IPFS node with one command:

```sh
sh get_videos.sh
```

Or, if you have the script hosted, fetch and run it directly:

```sh
curl -fsSL https://raw.githubusercontent.com/.../get_videos.sh | sh
```

Running this makes your machine a host for these videos — anyone else
can retrieve them from you, similar to BitTorrent. The more people who
run this, the harder the videos become to censor or lose.

## What the Script Does

1. Checks if IPFS (kubo) is installed — installs via Homebrew if not
2. Initializes your local IPFS repository if this is your first run
3. Starts the IPFS daemon in the background if it is not running
4. Fetches and pins each video to your node by content hash (CID)
5. Your node becomes a host — others can retrieve videos from you

After running, keep the daemon active with:

```sh
brew services start kubo
```

Videos are accessible locally at `https://ipfs.io/ipfs/<CID>`
while your daemon is running.

## Video Categories

All videos document UAP physics research across these areas:

* UAP propulsion theories — how craft achieve observed flight characteristics
* Classified physics whistleblower testimony — insiders describing programs
* Advanced energy systems — zero-point energy, free energy devices
* Crop circle physics encoding — non-human intelligence teaching propulsion
* Magnetic and electromagnetic propulsion experiments
* Warp field and spacetime manipulation research

## Files in This Directory

| File | Purpose |
|------|---------|
| `manifest.yaml` | Full index of all videos — CIDs, source URLs, descriptions, dates |
| `get_videos.sh` | Shell script to pin all videos to your IPFS node |
| `build_manifest.sh` | Build/rebuild the manifest and script from the local videos directory |
| `ipfs.md` | This file |

## Why IPFS

YouTube, X/Twitter, and other platforms regularly remove videos that
challenge official narratives. IPFS addresses files by their content
hash — not by server location — so the content itself is the address.
Once enough people pin a file, no platform can delete it from the network.

These research videos document claims made by physicists, engineers,
military insiders, and whistleblowers about classified physics programs.
Some of this content has already been removed from social platforms.
IPFS preservation ensures the record survives.

## Adding New Videos

1. Add the video file to `../videos/`
2. Run `ipfs add --pin=true <file>` to get the CID
3. Add an entry to `manifest.yaml`
4. Add an `ipfs pin add <CID>` line with a comment to `get_videos.sh`

Or re-run `build_manifest.sh` to regenerate both files from scratch.
