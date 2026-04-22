// js_concaatinate.js
//
// Concatenates all knowledge topic files from every LEVEL_2_KNOWLEDGE directory
// into matching output files in CONCAT_KNOWLEDGE.
//
// Directory structure:
//   TRACK_DIR/{Dir_Level_1}/{Dir_Level_2}/knowledge/{topic_file}
//     => CONCAT_KNOWLEDGE/{topic_file}
//
// Dir_Level_1 and Dir_Level_2 each range from 1 to 10, covering ~100 leaf dirs.
// Input filenames and output filenames must match exactly.
//
// Usage: node js_concaatinate.js

const fs = require('fs');
const path = require('path');
const os = require('os');

// ============================================================
// CONFIGURATION — change TRACK_DIR if the root path moves
// ============================================================

const TRACK_DIR = path.join(
  os.homedir(),
  'BGit/Bryan_git/UAP_Murder_Docus/Physics/Physics_Math/1_Track/Tweets_RedCollie1/tweets'
);

const CONCAT_KNOWLEDGE = path.join(TRACK_DIR, 'knowledge', 'concat');

const LIST_OF_OUTPUT_FILES = [
  'overall_Explain.mdx',
  'overall_Magnetics.mdx',
  'overall_Physics.mdx',
  'overall_Math.mdx',
  'overall_Lift.mdx',
  'overall_Energy.mdx',
  'overall_Beyond_Nutton.mdx',
  'overall_other.mdx',
];

const DIR_LEVEL_RANGE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// ============================================================
// STEP 1: Ensure CONCAT_KNOWLEDGE directory exists
// ============================================================

fs.mkdirSync(CONCAT_KNOWLEDGE, { recursive: true });

// ============================================================
// STEP 2: Initialize (truncate) all output files in CONCAT_KNOWLEDGE
// ============================================================

for (const filename of LIST_OF_OUTPUT_FILES) {
  const outputPath = path.join(CONCAT_KNOWLEDGE, filename);
  fs.writeFileSync(outputPath, '', 'utf8');
}

// ============================================================
// STEP 3: Walk every LEVEL_2_KNOWLEDGE directory and concatenate
// ============================================================

let totalDirsProcessed = 0;
const appendCountByFile = {};
for (const filename of LIST_OF_OUTPUT_FILES) {
  appendCountByFile[filename] = 0;
}

for (const level1 of DIR_LEVEL_RANGE) {
  for (const level2 of DIR_LEVEL_RANGE) {
    const knowledgeDir = path.join(
      TRACK_DIR,
      String(level1),
      String(level2),
      'knowledge'
    );

    if (!fs.existsSync(knowledgeDir)) {
      continue;
    }

    totalDirsProcessed++;

    for (const filename of LIST_OF_OUTPUT_FILES) {
      const inputPath = path.join(knowledgeDir, filename);

      if (!fs.existsSync(inputPath)) {
        continue;
      }

      const content = fs.readFileSync(inputPath, 'utf8');
      if (!content || content.trim().length === 0) {
        continue;
      }

      const outputPath = path.join(CONCAT_KNOWLEDGE, filename);
      const separator = `\n\n--- Source: ${level1}/${level2} ---\n\n`;
      fs.appendFileSync(outputPath, separator + content, 'utf8');
      appendCountByFile[filename]++;
    }
  }
}

// ============================================================
// STEP 4: Print summary to stdout
// ============================================================

console.log('');
console.log('============================================================');
console.log('js_concaatinate.js — Concatenation Summary');
console.log('============================================================');
console.log(`TRACK_DIR:         ${TRACK_DIR}`);
console.log(`CONCAT_KNOWLEDGE:  ${CONCAT_KNOWLEDGE}`);
console.log(`Dirs processed:    ${totalDirsProcessed}`);
console.log('');
console.log('Files appended per topic:');
for (const filename of LIST_OF_OUTPUT_FILES) {
  console.log(`  ${filename}: ${appendCountByFile[filename]} source(s)`);
}
console.log('');
console.log('Concatenation complete. Output: ' + CONCAT_KNOWLEDGE);
console.log('============================================================');
