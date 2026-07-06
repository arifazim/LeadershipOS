# Building Your EM OS Instance

This guide covers how to configure and instantiate the Engineering Manager OS for your specific context. "Building" here means adapting the generic system to your team, org, and tooling — not compiling code.

**If you've never used this repo before, start with the section immediately below.** It assumes you know nothing about AI coding tools. Once you've confirmed everything is working (end of "Prove It Works"), the numbered Step 1–6 configuration guide picks up exactly where BUILD.md always started.

---

## Before You Begin: Get an AI Tool Running

There is nothing to install *from this repo*. No `npm install`, no server, no build. The entire "setup" is: get an AI chat tool that can read the Markdown files in this folder, then fill in your team's real details (that's Steps 1–6 below). This section is the part that's never been written down before — how to actually get to the point where you can type your first message.

### 1. Choose your tool

You need exactly one of these. Every option can read this repo's files and follow the instructions inside — they differ in cost, whether you install anything, and whether the tool reads files on its own or you paste them in by hand.

| Tool | Install? | Reads repo files on its own? | Cost | Best for |
|---|---|---|---|---|
| **Claude Code** (recommended) | Yes — one terminal command | Yes — reads any file in the folder the moment it's asked | Included with a Claude Pro/Max subscription, or pay-as-you-go API usage | Anyone willing to type in a terminal; the smoothest fit for this repo specifically |
| **Cursor** | Yes — download an app | Yes, similar to Claude Code | Free tier + paid plans | Same as above, if you'd rather work in a full editor window than a terminal |
| **Claude.ai (web, Projects)** | No | No — you upload or paste files into the chat yourself | Free tier + paid plans | Zero-install, but more manual work each session |
| **ChatGPT (web, Projects/Custom GPTs)** | No | No — same as above | Free tier + paid plans | If your organization already standardized on ChatGPT |

`CLAUDE.md` (the file governing every response in this repo) is written specifically for **Claude Code** — it's picked up automatically as project-wide instructions the instant you open this folder with it. Other tools work too; you'll just paste `CLAUDE.md`'s contents into the chat yourself at the start of each session.

**If you don't know which to pick: install Claude Code.** Instructions below. If you'd rather not install anything, skip to "No-install path" underneath.

### 2. Get this repo onto your computer

Skip this if you already have the folder open (someone sent it to you, or you already cloned it).

**With git:**
```
git clone <this repo's URL>
cd engineering-manager-os
```

**Without git:** on GitHub, click the green "Code" button → "Download ZIP," then unzip it anywhere on your computer. There is no code to compile inside — it's a folder of text files.

### 3. Install Claude Code

1. Install Node.js if you don't have it already — [nodejs.org](https://nodejs.org), the "LTS" download, takes about 2 minutes.
2. Open a terminal (macOS: the **Terminal** app; Windows: **PowerShell** or **Git Bash**; Linux: your usual shell).
3. Run:
   ```
   npm install -g @anthropic-ai/claude-code
   ```
4. Move into the repo folder:
   ```
   cd path/to/engineering-manager-os
   ```
5. Start it:
   ```
   claude
   ```
6. The first time, it opens a browser tab to sign in with your Claude account. Approve it, come back to the terminal.

You're now in a chat session that can read every file in this repo on request.

**No-install path (Claude.ai or ChatGPT web):** open a new chat in your browser. You'll paste file contents in manually — see "Prove It Works" below for exactly what to paste.

### 4. Prove it works

**Claude Code / Cursor** — type this exactly, in the session you just opened:

```
Read CLAUDE.md and subagents/engineering-manager.md, then introduce yourself
as my engineering manager assistant and tell me what you can help with.
```

**Claude.ai / ChatGPT (web)** — first copy the full contents of `CLAUDE.md`, paste it into the chat, then in the same message add:

```
The above is CLAUDE.md from my Engineering Manager OS repo. Treat it as your
operating instructions for the rest of this conversation. Introduce yourself
as my engineering manager assistant and tell me what you can help with.
```

If you get back a response describing the EM OS and asking what's going on with your team, it's working — everything from here is configuration and usage, not setup. If instead it responds like a generic assistant with no awareness of subagents, loops, or kaizen, it didn't actually read the file — check that you're in the right folder (Claude Code/Cursor) or that the paste went through (web tools).

---

## Step 1: Define Your Context

Before configuring anything, capture these facts. They'll be referenced throughout the system:

```
Team size:
Tech stack:
Product domain:
Sprint cadence (1w / 2w / 4w):
On-call rotation (yes/no):
Reporting chain (your manager's role):
Key stakeholders:
Organization-wide OKR cycle:
```

Add this context block to the top of `subagents/engineering-manager.md`.

## Step 2: Configure Integrations

Work through each file in `integrations/` and fill in the required details:

| Integration | Required Config |
|---|---|
| `github.md` | Org name, repo list, team slug |
| `jira.md` | Project keys, board IDs, sprint field name |
| `slack.md` | Channel IDs (#team, #incidents, #eng-leadership) |
| `datadog.md` | Dashboard IDs, SLO names, alert policy IDs |
| `pagerduty.md` | Service IDs, escalation policy, on-call schedule URL |

## Step 3: Customize Commands and Loops

Each file in `commands/` is a thin pointer into the matching `loops/*.md` file, which holds the actual orchestration logic (trigger conditions, steps, thresholds). Review both together:

- **Timing**: Update day/time references in the loop's Cadence field to match your actual schedule
- **Stakeholders**: Replace placeholder names with real contacts
- **Thresholds**: Set your team's specific SLO targets, velocity baselines, and escalation criteria in the loop's Steps and in the skills it invokes

## Step 4: Calibrate Subagents

Each file in `subagents/` defines a role persona. For each one you'll use:

1. Add team-specific context (stack, domain, known risks)
2. Specify decision boundaries (what this agent can decide vs. must escalate)
3. List the commands this subagent is authorized to run

## Step 5: Validate with a Dry Run

Before using the system for real, run through one command manually:

1. Load `subagents/engineering-manager.md` into your AI tool
2. Execute `commands/daily.md` using yesterday's real data
3. Compare the output against what you'd have written yourself
4. Note gaps in `kaizen/failures.md`

## Step 6: Set Your Kaizen Cadence

Schedule recurring reviews:

- **Weekly** (Friday or Monday): `kaizen/weekly-review.md`
- **Monthly** (last day of month): `kaizen/monthly-review.md`
- **Quarterly**: `kaizen/quarterly-review.md` — rolls up the quarter's monthly reviews, revisits `docs/principles.md`
- **After incidents**: `kaizen/failures.md` entry within 48 hours

---

## Your First Real Week — What "ROI" Actually Looks Like

Configuration alone doesn't produce value — running it does. Here's the concrete shape of a first week, and what you should actually have to show for it by the end.

| Day | Do this | You now have |
|---|---|---|
| Mon | Run `commands/daily.md` with real standup data | A blocker triage you can compare against what you'd have caught yourself |
| Tue–Thu | Same, each morning | A pattern: is the same blocker recurring? The OS should flag it by day 3 |
| Fri | Run `kaizen/weekly-review.md` | Your first logged entry — a wrong prediction, a bad recommendation, or confirmation nothing needed fixing |
| Sprint boundary | Run `commands/weekly.md` then `commands/retrospective.md` | A sprint review with a named root cause and DORA snapshot, plus retro action items with owners and dates |
| Before your next 1:1 with your manager or a stakeholder update | Run `commands/executive.md` | A status update that leads with a real confidence level, not a vague summary |

**What "ROI" means here, concretely**: not a dashboard, not a score — it's the difference between catching a blocker on day 2 instead of day 4, having a documented reason for a sprint miss instead of a shrug, and a paper trail (`memory/`, `decision-memory/`, `kaizen/`) that means you stop re-litigating the same mistake every quarter. If a week goes by and none of that happened, something's mis-set-up — check Step 1–3 above before assuming the OS itself doesn't work.

**Don't take "it works" on faith.** This repo has a real, dated example of exactly this kind of scrutiny paying off: the first time its own diagnostic modules were tested against their own reference outputs, it found 5 real scoring bugs that had been shipping silently (see `HOWTORUN.md`'s "Proof This Works" section). That's what treating this as a system worth verifying — not a magic box — actually looks like in practice. Apply the same standard to your own instance: if an output doesn't match your judgment, that's a `kaizen/failures.md` entry, not something to shrug off.

**Where to go next**: `HOWTORUN.md` has the full daily/weekly rhythm, all 8 subagents, all 11 loops, and 24 copy-paste worked examples covering everything from standup triage to board summaries to promotion cycles. This file (`BUILD.md`) is setup; `HOWTORUN.md` is everything after setup.

## Ongoing Maintenance

The OS degrades if not updated. Signs it needs attention:
- A command produces output you wouldn't actually send
- A template is consistently edited before use
- A subagent gives advice that conflicts with how your org actually works

When this happens, update the source file — not just the output.
