#!/usr/bin/env node
/**
 * transcribe_videos.js
 * Transcribes all videos in ./videos/ to ./1_Track/video_transcriptions/*.mdx
 * Runs up to 20 parallel workers. Skips already-transcribed files.
 *
 * Usage: node transcribe_videos.js
 */

const fs = require('fs');
const path = require('path');
const { spawn } = require('child_process');

const ROOT_DIR       = __dirname;
const VIDEOS_DIR     = path.join(ROOT_DIR, 'videos');
const OUTPUT_DIR     = path.join(ROOT_DIR, '1_Track', 'video_transcriptions');
const TRANSCRIBE_JS  = path.join('/Users/bryan/BGit/act3/tools/Transcription/Transcribe.js');
const LOG_FILE       = path.join(ROOT_DIR, 'transcribe_videos.log');
const MAX_JOBS       = 20;

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function log(msg) {
  const line = `[${new Date().toISOString().replace('T', ' ').slice(0, 19)}] ${msg}\n`;
  fs.appendFileSync(LOG_FILE, line);
}

function printf(msg) {
  process.stdout.write(msg + '\n');
}

/** Run one transcription job; resolves true on success, false on failure. */
function runJob(videoPath, outputPath, label) {
  return new Promise((resolve) => {
    const child = spawn(process.execPath, [TRANSCRIBE_JS, videoPath, outputPath], {
      stdio: ['ignore', 'pipe', 'pipe'],
    });

    let stdout = '';
    let stderr = '';
    child.stdout.on('data', (d) => { stdout += d; });
    child.stderr.on('data', (d) => { stderr += d; });

    child.on('close', (code) => {
      const combined = (stdout + stderr).trim();
      if (combined) {
        log(`--- ${label} ---\n${combined}`);
      }
      if (code === 0) {
        log(`OK: ${label}`);
        resolve(true);
      } else {
        log(`FAILED (exit ${code}): ${label}`);
        resolve(false);
      }
    });

    child.on('error', (err) => {
      log(`ERROR launching job for ${label}: ${err.message}`);
      resolve(false);
    });
  });
}

/** Run an array of async tasks with at most `concurrency` running at once. */
async function runPool(tasks, concurrency) {
  let index = 0;
  let done = 0;
  let failed = 0;
  const total = tasks.length;

  async function worker() {
    while (index < tasks.length) {
      const i = index++;
      const { videoPath, outputPath, label, displayIndex } = tasks[i];
      printf(`[${displayIndex}/${total + /* skipped already deducted */ 0}] Starting : ${label}`);
      const ok = await runJob(videoPath, outputPath, label);
      if (ok) {
        done++;
        printf(`[${displayIndex}] Done     : ${label}`);
      } else {
        failed++;
        printf(`[${displayIndex}] FAILED   : ${label}`);
      }
    }
  }

  // Spawn `concurrency` workers and wait for all of them to drain the queue
  const workers = Array.from({ length: concurrency }, () => worker());
  await Promise.all(workers);
  return { done, failed };
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  // Ensure output directory exists
  fs.mkdirSync(OUTPUT_DIR, { recursive: true });

  // Collect all .mp4 files
  let allVideos;
  try {
    allVideos = fs.readdirSync(VIDEOS_DIR)
      .filter(f => f.toLowerCase().endsWith('.mp4'))
      .sort()
      .map(f => path.join(VIDEOS_DIR, f));
  } catch (err) {
    console.error(`Cannot read videos directory: ${VIDEOS_DIR}\n${err.message}`);
    process.exit(1);
  }

  const total = allVideos.length;
  if (total === 0) {
    console.error(`No .mp4 files found in ${VIDEOS_DIR}`);
    process.exit(1);
  }

  printf(`Found ${total} videos  →  ${OUTPUT_DIR}`);
  printf(`Max parallel workers : ${MAX_JOBS}`);
  printf(`Log                  : ${LOG_FILE}`);
  printf('');

  log(`Starting transcription of ${total} videos`);

  // Build task list, skipping already-completed files
  const tasks = [];
  let skipped = 0;
  let displayIndex = 0;

  for (const videoPath of allVideos) {
    const basename = path.basename(videoPath, '.mp4');
    const outputPath = path.join(OUTPUT_DIR, `${basename}.mdx`);
    displayIndex++;

    if (fs.existsSync(outputPath) && fs.statSync(outputPath).size > 0) {
      printf(`[${displayIndex}/${total}] SKIP (exists): ${basename}`);
      skipped++;
      continue;
    }

    tasks.push({ videoPath, outputPath, label: basename, displayIndex });
  }

  printf('');
  printf(`${skipped} already done, queuing ${tasks.length} jobs across ${MAX_JOBS} workers...`);
  printf('');

  // Run the pool
  const { done, failed } = await runPool(tasks, MAX_JOBS);

  const summary = [
    '',
    '==============================',
    'Transcription run complete',
    `  Total videos : ${total}`,
    `  Skipped      : ${skipped}`,
    `  Completed    : ${done}`,
    `  Failed       : ${failed}`,
    `  Output dir   : ${OUTPUT_DIR}`,
    '==============================',
  ].join('\n');

  printf(summary);
  log(`Done. Completed=${done} Failed=${failed} Skipped=${skipped}`);
}

main().catch(err => {
  console.error('Fatal:', err.message);
  log(`FATAL: ${err.message}`);
  process.exit(1);
});
