import React, { useState } from 'react';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';

const CURL_CMD = 'curl -fsSL https://uapmurders.com/videos/get_videos.sh | sh';
const SCRIPT_URL = 'https://uapmurders.com/videos/get_videos.sh';

const SCRIPT_CONTENT = `#!/bin/sh
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

# VIDEO: Amy Eskridge — antigravity discovered by four different people and suppressed each time; her father also discovered antigravity; Amy murdered 2022
ipfs pin add QmdEY5U4HjXFNriDoEboezC8ZiXQoi1yN9wXoKoNMSc3Ta

# VIDEO: The Nine channeling through Indian psychic Vinod at the Round Table Foundation (Andrija Puharich / Chinese Scientists page)
ipfs pin add QmdUkbaUXKAPBzW5KiVP3SczG5kravfQAdPJBGLVYLHxY9

# ============================================================
# Investigation: UAP Physics Murders
# ============================================================

# VIDEO: Nassim Haramein — physics of what comes next, quantum vacuum energy breakthroughs, ISF research
ipfs pin add QmaHCY7tgLqi44QGjBSuMWozUihHid6ELkJSK27HGuA31J

# VIDEO: Charles Buhler (NASA Kennedy / Exodus Propulsion) — Biefeld-Brown "new force": 2 mN thrust at 6 kV in hard vacuum, 2000+ trials, Deep Tech Week NYC 2026
ipfs pin add QmeYHst1K8GiPkztNY7jpMXQvmdG5mSbNmuS191qm5x3iS

echo "========================================"
echo "  Done. All videos fetched and pinned."
echo "========================================"`;

function CopyBox() {
  const [copied, setCopied] = useState(false);

  function handleCopy() {
    navigator.clipboard.writeText(CURL_CMD).then(() => {
      setCopied(true);
      setTimeout(() => setCopied(false), 2000);
    });
  }

  return (
    <div
      onClick={handleCopy}
      title="Click to copy"
      style={{
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'space-between',
        background: 'var(--ifm-code-background)',
        border: '1px solid var(--ifm-color-emphasis-300)',
        borderRadius: '8px',
        padding: '0.9rem 1.2rem',
        cursor: 'pointer',
        userSelect: 'none',
        maxWidth: '680px',
        gap: '1rem',
      }}
    >
      <code style={{ fontSize: '0.95rem', fontFamily: 'var(--ifm-font-family-monospace)', flexGrow: 1 }}>
        {CURL_CMD}
      </code>
      <span style={{
        fontSize: '0.78rem',
        fontWeight: 600,
        color: copied ? 'var(--ifm-color-success)' : 'var(--ifm-color-primary)',
        whiteSpace: 'nowrap',
        minWidth: '60px',
        textAlign: 'right',
      }}>
        {copied ? 'Copied' : 'Copy'}
      </span>
    </div>
  );
}

export default function IpfsPage(): React.ReactElement {
  return (
    <Layout
      title="IPFS Video Network"
      description="Help keep UAP Murders investigation videos alive by running one command to download and pin them via IPFS."
    >
      <main>
        <div className="container margin-vert--lg" style={{ maxWidth: '860px' }}>

          <h1>IPFS Video Network</h1>
          <p style={{ fontSize: '1.1rem', lineHeight: 1.6 }}>
            Every investigation on this site includes video evidence. Those videos are stored
            on <strong>IPFS</strong> — the InterPlanetary File System — a decentralized network
            where files are identified by their content, not by a server address. That means no
            single company can take them down.
          </p>
          <p>
            When you run the script below, you pin the videos to your local IPFS node.
            Pinning fetches the content from the network and makes your machine a host for
            it — anyone else who wants the videos can get them from you, just like BitTorrent.
            The more people who run this, the harder the videos become to censor or lose.
          </p>

          <div style={{
            background: 'var(--ifm-color-info-contrast-background)',
            border: '1px solid var(--ifm-color-info-contrast-foreground)',
            borderRadius: '8px',
            padding: '1rem 1.25rem',
            marginBottom: '2rem',
          }}>
            <strong>Why this matters:</strong> YouTube, Twitter, and other platforms regularly
            remove videos that challenge official narratives. Once a video is pinned on IPFS by
            enough people, no platform can delete it. Running this script makes you part of
            the preservation network.
          </div>

          <h2>Run it</h2>
          <p>
            Paste this command in your terminal. It installs IPFS if needed, starts the daemon,
            and pins all videos to your node. Works on Mac (requires{' '}
            <a href="https://brew.sh" target="_blank" rel="noopener noreferrer">Homebrew</a>)
            and Linux. Windows users: run in WSL or Git Bash.
          </p>

          <CopyBox />

          <div style={{ marginTop: '1rem', display: 'flex', gap: '0.75rem', flexWrap: 'wrap' }}>
            <a
              href={SCRIPT_URL}
              target="_blank"
              rel="noopener noreferrer"
              style={{
                display: 'inline-block',
                padding: '0.5rem 1.1rem',
                background: 'var(--ifm-color-primary)',
                color: '#fff',
                borderRadius: '4px',
                fontWeight: 600,
                textDecoration: 'none',
                fontSize: '0.9rem',
              }}
            >
              View get_videos.sh
            </a>
            <Link
              to="/"
              style={{
                display: 'inline-block',
                padding: '0.5rem 1.1rem',
                border: '1px solid var(--ifm-color-primary)',
                color: 'var(--ifm-color-primary)',
                borderRadius: '4px',
                fontWeight: 600,
                textDecoration: 'none',
                fontSize: '0.9rem',
              }}
            >
              Back to Home
            </Link>
          </div>

          <h2 style={{ marginTop: '2.5rem' }}>What the script does</h2>
          <ol style={{ lineHeight: 2 }}>
            <li>Checks if IPFS (kubo) is installed — installs it via Homebrew if not</li>
            <li>Initializes your local IPFS repository if this is your first run</li>
            <li>Starts the IPFS daemon in the background if it isn't already running</li>
            <li>Fetches and pins each video to your node by content hash (CID)</li>
            <li>Your node becomes a host — others can retrieve the videos from you</li>
          </ol>
          <p>
            After running it, keep the daemon running (or set it to auto-start with{' '}
            <code>brew services start kubo</code>) so your node stays connected and serves
            videos to others. Videos are accessible locally at{' '}
            <code>http://127.0.0.1:8080/ipfs/{'<CID>'}</code>.
          </p>

          <h2 style={{ marginTop: '2.5rem' }}>Script contents</h2>
          <p>
            Review what will run before you run it:
          </p>
          <pre style={{
            background: 'var(--ifm-code-background)',
            border: '1px solid var(--ifm-color-emphasis-300)',
            borderRadius: '8px',
            padding: '1.25rem',
            overflowX: 'auto',
            fontSize: '0.78rem',
            lineHeight: 1.55,
          }}>
            <code>{SCRIPT_CONTENT}</code>
          </pre>

        </div>
      </main>
    </Layout>
  );
}
