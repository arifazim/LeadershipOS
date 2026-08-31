#!/usr/bin/env node
/**
 * EM OS setup — automates BUILD.md Steps 1, 2, and the data half of 3/4/6.
 *
 * First run: prompts for every field, writes them into the repo, saves
 * answers to .em-os-config.json.
 *
 * Rerun: shows each field's current value, press Enter to keep it or
 * type a new one to change it. Every file this script touches uses a
 * delimited marker block, so reruns replace that block instead of
 * duplicating content — safe to run as many times as you want.
 *
 * Steps 3/4 are only partly automatable: loop thresholds and subagent
 * decision boundaries are prose embedded in Decision Trees, which this
 * script deliberately does not rewrite. It handles the concrete,
 * commonly-needed values (velocity baseline, escalation days, a shared
 * team-context pointer in every subagent) and leaves the judgment calls
 * to you, per BUILD.md Step 4.
 *
 * Steps 5 and 6 are actions (run a dry run, schedule a recurring habit),
 * not data — this script prints what to do next instead of faking them.
 *
 * Usage:
 *   node scripts/setup.js          interactive setup / update
 *   node scripts/setup.js --show   print current saved config, no prompts
 */

const fs = require('fs');
const path = require('path');
const readline = require('readline/promises');

const ROOT = path.resolve(__dirname, '..');
const CONFIG_PATH = path.join(ROOT, '.em-os-config.json');
const MARK = 'EM-OS-CONFIG';

// ---------------------------------------------------------------------------
// Field definitions — mirrors BUILD.md Steps 1, 2, 3 (data subset), 6
// ---------------------------------------------------------------------------

const FIELD_GROUPS = [
  {
    id: 'context',
    label: 'Step 1 — Team Context',
    fields: [
      { key: 'teamSize', prompt: 'Team size' },
      { key: 'techStack', prompt: 'Tech stack' },
      { key: 'productDomain', prompt: 'Product domain' },
      { key: 'sprintCadence', prompt: 'Sprint cadence (1w / 2w / 4w)', fallback: '2w' },
      { key: 'onCallRotation', prompt: 'On-call rotation (yes/no)', fallback: 'yes' },
      { key: 'reportingChain', prompt: "Reporting chain (your manager's role)" },
      { key: 'keyStakeholders', prompt: 'Key stakeholders' },
      { key: 'okrCycle', prompt: 'Organization-wide OKR cycle' },
    ],
  },
  {
    id: 'github',
    label: 'Step 2 — GitHub',
    fields: [
      { key: 'githubOrg', prompt: 'GitHub org name' },
      { key: 'githubRepos', prompt: 'Repo list (comma-separated)' },
      { key: 'githubTeamSlug', prompt: 'Team slug' },
    ],
  },
  {
    id: 'jira',
    label: 'Step 2 — Jira',
    fields: [
      { key: 'jiraProjectKeys', prompt: 'Project keys (comma-separated)' },
      { key: 'jiraBoardIds', prompt: 'Board IDs (comma-separated)' },
      { key: 'jiraSprintField', prompt: 'Sprint field name' },
    ],
  },
  {
    id: 'slack',
    label: 'Step 2 — Slack',
    fields: [
      { key: 'slackTeamChannel', prompt: '#team channel ID' },
      { key: 'slackIncidentsChannel', prompt: '#incidents channel ID' },
      { key: 'slackLeadershipChannel', prompt: '#eng-leadership channel ID' },
    ],
  },
  {
    id: 'datadog',
    label: 'Step 2 — Datadog',
    fields: [
      { key: 'datadogDashboardIds', prompt: 'Dashboard IDs (comma-separated)' },
      { key: 'datadogSloNames', prompt: 'SLO names (comma-separated)' },
      { key: 'datadogAlertPolicyIds', prompt: 'Alert policy IDs (comma-separated)' },
    ],
  },
  {
    id: 'pagerduty',
    label: 'Step 2 — PagerDuty',
    fields: [
      { key: 'pagerdutyServiceIds', prompt: 'Service IDs (comma-separated)' },
      { key: 'pagerdutyEscalationPolicy', prompt: 'Escalation policy name' },
      { key: 'pagerdutyScheduleUrl', prompt: 'On-call schedule URL' },
    ],
  },
  {
    id: 'thresholds',
    label: 'Step 3 — Loop Thresholds (the data-shaped subset)',
    fields: [
      { key: 'velocityBaseline', prompt: 'Baseline sprint velocity (story points)' },
      { key: 'blockerEscalationDays', prompt: 'Days a blocker can sit before it must escalate', fallback: '2' },
    ],
  },
  {
    id: 'kaizen',
    label: 'Step 6 — Kaizen Cadence',
    fields: [
      { key: 'weeklyReviewDay', prompt: 'Preferred weekly kaizen review day', fallback: 'Friday' },
      { key: 'monthlyReviewDay', prompt: 'Preferred monthly kaizen review day', fallback: 'Last business day of the month' },
    ],
  },
];

const ALL_FIELDS = FIELD_GROUPS.flatMap((g) => g.fields);

// ---------------------------------------------------------------------------
// Config load/save
// ---------------------------------------------------------------------------

function loadConfig() {
  if (fs.existsSync(CONFIG_PATH)) {
    try {
      return JSON.parse(fs.readFileSync(CONFIG_PATH, 'utf8'));
    } catch {
      console.warn('Could not parse .em-os-config.json — starting fresh.');
    }
  }
  return {};
}

function saveConfig(config) {
  fs.writeFileSync(CONFIG_PATH, JSON.stringify(config, null, 2) + '\n', 'utf8');
}

// Imports Arif's already-hand-typed Step 1 answers from the top of
// engineering-manager.md on a true first run, so nobody has to retype
// what they already entered by following BUILD.md manually.
function importExistingContextBlock() {
  const emPath = path.join(ROOT, 'subagents', 'engineering-manager.md');
  if (!fs.existsSync(emPath)) return {};
  const content = fs.readFileSync(emPath, 'utf8');
  const preamble = content.split(/\n#\s/)[0];
  const labelToKey = {
    'Team size': 'teamSize',
    'Tech stack': 'techStack',
    'Product domain': 'productDomain',
    'Sprint cadence (1w / 2w / 4w)': 'sprintCadence',
    'On-call rotation (yes/no)': 'onCallRotation',
    "Reporting chain (your manager's role)": 'reportingChain',
    'Key stakeholders': 'keyStakeholders',
    'Organization-wide OKR cycle': 'okrCycle',
  };
  const imported = {};
  for (const [label, key] of Object.entries(labelToKey)) {
    // [ \t]*, not \s* -- \s matches newlines too, which would greedily swallow
    // the next line whenever a field's value is blank (e.g. "Product domain: ").
    const re = new RegExp('^' + label.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ':[ \\t]*(.*)$', 'm');
    const match = preamble.match(re);
    if (match && match[1].trim()) imported[key] = match[1].trim();
  }
  return imported;
}

// Removes a pre-existing, unmarked context block from a file's preamble
// (someone followed BUILD.md Step 1 by hand before ever running this script)
// so writeTeamContext doesn't end up with two copies of the same answers.
function stripUnmarkedContextPreamble(content, labels) {
  // The split's lookahead doesn't consume the '#', so every chunk after the
  // first already starts with its own heading -- do not re-prepend '#'.
  const h1Split = content.split(/\n(?=#\s)/);
  if (h1Split.length < 2) return content;
  const preamble = h1Split[0];
  // Already-managed block (upsertBlock owns it) -- must be a true no-op here,
  // otherwise this strips the marked block too (its labels match the same
  // regex) and relies on upsertBlock to blindly rebuild it in place, silently
  // losing anything that happened to sit between the block and the heading.
  if (preamble.includes(`<!-- ${MARK}:`)) return content;
  const looksLikeContextBlock = labels.some((label) =>
    new RegExp('^' + label.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + ':', 'm').test(preamble)
  );
  if (!looksLikeContextBlock) return content;
  return h1Split.slice(1).join('\n');
}

// ---------------------------------------------------------------------------
// Interactive prompting
// ---------------------------------------------------------------------------

async function promptAll(config) {
  const rl = readline.createInterface({ input: process.stdin, output: process.stdout });
  const isFirstRun = Object.keys(config).length === 0;

  if (isFirstRun) {
    const imported = importExistingContextBlock();
    if (Object.keys(imported).length > 0) {
      console.log('Found existing answers already typed into subagents/engineering-manager.md — using them as defaults.\n');
      Object.assign(config, imported);
    }
    console.log('First run — answer each question, or press Enter to skip a field.\n');
  } else {
    console.log('Rerunning setup. Press Enter to keep the current value, or type a new one.\n');
  }

  for (const group of FIELD_GROUPS) {
    console.log(`\n--- ${group.label} ---`);
    for (const field of group.fields) {
      const current = config[field.key];
      const shown = current !== undefined ? current : field.fallback;
      const suffix = shown ? ` [${current !== undefined ? 'current' : 'default'}: ${shown}]` : '';
      const answer = await rl.question(`${field.prompt}${suffix}: `);
      if (answer.trim()) {
        config[field.key] = answer.trim();
      } else if (current === undefined && field.fallback) {
        config[field.key] = field.fallback;
      }
      // else: keep whatever was already in config (or leave unset)
    }
  }

  rl.close();
  return config;
}

// ---------------------------------------------------------------------------
// File writing — delimited upsert so reruns replace, never duplicate
// ---------------------------------------------------------------------------

function upsertBlock(filePath, blockId, blockContent, { insertAtTop = true } = {}) {
  const startMarker = `<!-- ${MARK}:${blockId}:START -->`;
  const endMarker = `<!-- ${MARK}:${blockId}:END -->`;
  const wrapped = `${startMarker}\n${blockContent}\n${endMarker}`;

  let existing = fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : '';
  const pattern = new RegExp(
    startMarker.replace(/[.*+?^${}()|[\]\\]/g, '\\$&') + '[\\s\\S]*?' + endMarker.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  );

  let updated;
  if (pattern.test(existing)) {
    updated = existing.replace(pattern, wrapped);
  } else if (existing.trim() === '') {
    updated = wrapped + '\n';
  } else if (insertAtTop) {
    // Insert after the first H1 heading if one exists, otherwise at the very top.
    const h1Match = existing.match(/^(#[^\n]*\n)/);
    if (h1Match) {
      const idx = h1Match[0].length;
      updated = existing.slice(0, idx) + '\n' + wrapped + '\n\n' + existing.slice(idx).replace(/^\n+/, '');
    } else {
      updated = wrapped + '\n\n' + existing;
    }
  } else {
    updated = existing.trimEnd() + '\n\n' + wrapped + '\n';
  }

  fs.writeFileSync(filePath, updated, 'utf8');
}

function fmt(config, key) {
  return config[key] || '{{not set}}';
}

// --- Step 1: Team Context → subagents/engineering-manager.md ---

function writeTeamContext(config) {
  const c = FIELD_GROUPS.find((g) => g.id === 'context').fields;
  const rows = c.map((f) => `${f.prompt}: ${fmt(config, f.key)}`).join('\n');
  const block = ['```', rows, '```'].join('\n');

  const emPath = path.join(ROOT, 'subagents', 'engineering-manager.md');
  if (fs.existsSync(emPath)) {
    const content = fs.readFileSync(emPath, 'utf8');
    const cleaned = stripUnmarkedContextPreamble(content, c.map((f) => f.prompt));
    if (cleaned !== content) fs.writeFileSync(emPath, cleaned, 'utf8');
  }
  upsertBlock(emPath, 'team-context', block);
}

// --- Step 4 (data subset): lightweight team-context pointer in every subagent ---

function writeSubagentPointer(config) {
  const subagentsDir = path.join(ROOT, 'subagents');
  const files = fs.readdirSync(subagentsDir).filter((f) => f.endsWith('.md'));
  const pointer = `**Team Context**: see \`subagents/engineering-manager.md\`'s header block, or \`.em-os-config.json\` (${fmt(config, 'teamSize')}-person team, ${fmt(config, 'productDomain')}, ${fmt(config, 'sprintCadence')} sprints)`;
  for (const file of files) {
    if (file === 'engineering-manager.md') continue; // has the full block already
    upsertBlock(path.join(subagentsDir, file), 'team-context-pointer', pointer);
  }
}

// --- Step 2: Integrations ---

const INTEGRATION_TEMPLATES = {
  'github.md': (c) => ({
    title: '# Integration: GitHub',
    purpose:
      'Used by `skills/delivery/review-sprint.md` and `loops/delivery-loop.md` for PR cycle time, deployment frequency, and change failure rate — the DORA metrics behind sprint and delivery-trend loops.',
    rows: [
      ['Org name', fmt(c, 'githubOrg')],
      ['Repos', fmt(c, 'githubRepos')],
      ['Team slug', fmt(c, 'githubTeamSlug')],
    ],
  }),
  'jira.md': (c) => ({
    title: '# Integration: Jira',
    purpose:
      'Used by `loops/daily-leadership-loop.md` (blocker triage) and `loops/sprint-loop.md` (sprint commitment vs. completion) — the board-state source for both.',
    rows: [
      ['Project keys', fmt(c, 'jiraProjectKeys')],
      ['Board IDs', fmt(c, 'jiraBoardIds')],
      ['Sprint field name', fmt(c, 'jiraSprintField')],
    ],
  }),
  'slack.md': (c) => ({
    title: '# Integration: Slack',
    purpose:
      'Channel destinations for status updates and incident communication — referenced by `loops/executive-loop.md` and `loops/incident-loop.md`.',
    rows: [
      ['#team channel ID', fmt(c, 'slackTeamChannel')],
      ['#incidents channel ID', fmt(c, 'slackIncidentsChannel')],
      ['#eng-leadership channel ID', fmt(c, 'slackLeadershipChannel')],
    ],
  }),
  'datadog.md': (c) => ({
    title: '# Integration: Datadog',
    purpose:
      'SLO and alert data behind `loops/incident-loop.md` (system health) and `loops/architecture-loop.md` (stability trend evidence for architecture review).',
    rows: [
      ['Dashboard IDs', fmt(c, 'datadogDashboardIds')],
      ['SLO names', fmt(c, 'datadogSloNames')],
      ['Alert policy IDs', fmt(c, 'datadogAlertPolicyIds')],
    ],
  }),
  'pagerduty.md': (c) => ({
    title: '# Integration: PagerDuty',
    purpose: 'On-call and escalation data behind `loops/incident-loop.md` — service ownership and who gets paged.',
    rows: [
      ['Service IDs', fmt(c, 'pagerdutyServiceIds')],
      ['Escalation policy', fmt(c, 'pagerdutyEscalationPolicy')],
      ['On-call schedule URL', fmt(c, 'pagerdutyScheduleUrl')],
    ],
  }),
};

function writeIntegrations(config) {
  const integrationsDir = path.join(ROOT, 'integrations');
  for (const [file, build] of Object.entries(INTEGRATION_TEMPLATES)) {
    const filePath = path.join(integrationsDir, file);
    const { title, purpose, rows } = build(config);
    const table = ['| Field | Value |', '|---|---|', ...rows.map(([k, v]) => `| ${k} | ${v} |`)].join('\n');
    const block = table;

    const existing = fs.existsSync(filePath) ? fs.readFileSync(filePath, 'utf8') : '';
    if (existing.trim() === '') {
      // Give a genuinely empty file real structure, not just a bare config table.
      fs.writeFileSync(filePath, `${title}\n\n${purpose}\n\n`, 'utf8');
    }
    upsertBlock(filePath, 'config', block);
  }
}

// --- Step 3 (data subset): thresholds into the two most load-bearing loops ---

function writeLoopThresholds(config) {
  const block = [
    `Baseline sprint velocity: ${fmt(config, 'velocityBaseline')} points`,
    `Blocker escalation threshold: ${fmt(config, 'blockerEscalationDays')} days`,
  ].join('\n');
  for (const loopFile of ['daily-leadership-loop.md', 'sprint-loop.md']) {
    const filePath = path.join(ROOT, 'loops', loopFile);
    if (fs.existsSync(filePath)) {
      upsertBlock(filePath, 'thresholds', block);
    }
  }
}

// ---------------------------------------------------------------------------
// Main
// ---------------------------------------------------------------------------

async function main() {
  const args = process.argv.slice(2);

  if (args.includes('--show')) {
    const config = loadConfig();
    if (Object.keys(config).length === 0) {
      console.log('No saved configuration yet — run `node scripts/setup.js` first.');
      return;
    }
    console.log(JSON.stringify(config, null, 2));
    return;
  }

  let config = loadConfig();
  config = await promptAll(config);
  saveConfig(config);

  console.log('\nWriting configuration into the repo...');
  writeTeamContext(config);
  writeSubagentPointer(config);
  writeIntegrations(config);
  writeLoopThresholds(config);

  console.log(`
Done. Updated:
  subagents/engineering-manager.md      (Step 1 — team context)
  subagents/*.md (7 other files)        (Step 4 — team-context pointer)
  integrations/{github,jira,slack,datadog,pagerduty}.md   (Step 2)
  loops/{daily-leadership,sprint}-loop.md                  (Step 3 — thresholds)

Saved your answers to .em-os-config.json — rerun "node scripts/setup.js"
anytime to change a value; everything else stays as-is.

Not automated (these are judgment calls, not data — see BUILD.md):
  Step 3 — thresholds on the other 9 loops, and any prose-level Decision
           Tree tuning specific to your org
  Step 4 — decision boundaries and which commands each subagent may run
  Step 5 — run your first dry run: load subagents/engineering-manager.md
           into your AI tool and execute commands/daily.md with real data
  Step 6 — put "${fmt(config, 'weeklyReviewDay')}: kaizen/weekly-review.md" and
           "${fmt(config, 'monthlyReviewDay')}: kaizen/monthly-review.md" on your actual calendar
`);
}

main().catch((err) => {
  console.error('Setup failed:', err.message);
  process.exit(1);
});
