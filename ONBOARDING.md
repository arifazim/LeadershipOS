# Onboarding: Engineering Manager OS

This is a practical "how do I actually use this" guide. For the philosophy and full architecture, see `README.md`, `docs/vision.md`, and `CLAUDE.md`. For configuring it to your team, see `BUILD.md`.

---

## What this is, in one paragraph

A library of markdown files that tell an AI how to think and act like a senior engineering manager. There is no app, no server, no UI — you load a file into an AI tool (Claude Code, Codex CLI, Cursor, claude.ai, or any LLM that can read the repo) and talk to it. Every output is text: tables, scorecards, status labels. See the note at the bottom on why that's a deliberate design choice, not a missing feature.

## The fastest way to start

Don't try to learn all 240+ files first. Just talk to the orchestrator:

> Load `subagents/engineering-manager.md`, then say: *"My delivery velocity dropped 20% this sprint and two engineers seem burned out — what should I do?"*

`engineering-manager` reads its own routing table, invokes `delivery-manager` and `engineering-coach` in parallel, and synthesizes a single answer with a status, a confidence level, and ranked recommendations. You almost never need to know which specialist or skill handles something — say what's actually happening, and the orchestrator routes it.

## The daily/weekly rhythm

These are the five cadence-bound cycles (`loops/`) with a thin command trigger already wired up:

| Cadence | Say / run | What happens |
|---|---|---|
| Daily, at standup | `commands/daily.md` | Blocker triage — surfaces and routes anything that can't be resolved on the spot |
| Sprint boundary | `commands/weekly.md` | Full sprint review — DORA snapshot, root cause, recommendations |
| An incident is declared | `commands/incident.md` | Takes routing priority over everything else; runs through post-mortem |
| Sprint/incident ends | `commands/retrospective.md` | Blameless retro or sprint retro, depending on trigger |
| Before exec syncs/board updates | `commands/executive.md` | Status report or board summary, honest signal first |

Six more loops exist with no command trigger — invoke them directly through the matching subagent when the need arises: `delivery-loop` (rolling DORA trend), `career-loop` / `promotion-loop` (people development), `architecture-loop` (ADR review), `stakeholder-loop` (relationship mapping), `prediction-loop` (forecast calibration).

## The 8 subagents

| Subagent | Owns | Talk to it directly when... |
|---|---|---|
| `engineering-manager` | Routing, synthesis, cross-team calls | You're not sure which specialist you need — default entry point |
| `delivery-manager` | Sprint health, velocity, DORA, releases | You have a specific delivery question |
| `incident-manager` | P1/P2 response, post-mortems, on-call | An incident is active |
| `tech-lead` | Technical quality, architecture risk | A technical tradeoff needs a call |
| `engineering-coach` | Career growth, burnout, coaching | It's about one person, not the team |
| `product-partner` | Roadmap, prioritization, stakeholders | The question is about priorities, not delivery |
| `architecture-reviewer` | Deep ADR review | Only reachable via `tech-lead` — don't invoke directly |
| `executive-summary` | Translating anything into exec-ready text | You have data and need a status update or board memo |

## The four deeper assessments (run monthly/quarterly, not daily)

These synthesize many signals into one scored report. Each has 5-13 dimension-specific skills feeding a master pad:

| Module | Answers | Master file |
|---|---|---|
| `leadership-health/` | Am I leading well, across 13 dimensions? | `skills/leadership-health/leadership-health-engine.md` |
| `confidence-engine/` | Can leadership trust this team to deliver? | `confidence-engine/executive_confidence.md` |
| `political-signals/` | Are there organizational risk patterns (exclusion, reversals, incentive misalignment)? | `skills/organizational/political-intelligence.md` |
| `decision-memory/` | Have we made this mistake before? | `decision-memory/decision-memory.md` |

Each produces a Green/Yellow/At Risk/Red status with named root causes and ranked recommendations — say *"run a leadership health assessment"* and provide the inputs it asks for (or your best estimates).

## Worked examples — prompts you can actually type

- *"Run `commands/daily.md`."* — standup blocker triage.
- *"Assess my leadership health this quarter — here's my 360 feedback and dimension scores: [...]"* — full 13-dimension synthesis.
- *"We're about to commit to a Q4 architecture migration — check decision memory for similar past decisions first."* — pattern-detection before a repeat mistake.
- *"Draft a board-level summary of this quarter's engineering performance."* — jargon-free, one-page output via `skills/executive/board-level-summary.md`.
- *"I'm seeing decisions get reversed after the fact and I keep getting left out of key meetings — what's going on?"* — routes to `political-signals/`.

## How the OS improves itself (kaizen)

Every significant activity is supposed to feed back: `kaizen/weekly-review.md` asks what prediction was wrong, what failed, what the playbook should change — and cascades fixes through Playbook → Prompt → Skill → Memory. `kaizen/monthly-review.md` and `kaizen/quarterly-review.md` roll that up. This is the mechanism that's supposed to make the OS measurably better over time, not just accumulate files. It has real infrastructure now (as of 2026-07-01) but needs to actually be run against real weeks to prove out — see Limitations below.

## Quick reference: "I want to..." → "go here"

| I want to... | Look at |
|---|---|
| See every available capability | `skills/<domain>/` — organized by career, conflict, cross-functional, delivery, executive, meetings, mentoring, organizational, people, performance, presentation, product, strategy |
| Understand the full architecture | `CLAUDE.md` → Repository Architecture + Request Lifecycle |
| See how agents route to each other | The diagram from this session (ask me to regenerate it, or see `subagents/*.md`'s Scope tables) |
| Check whether a skill's output is trustworthy | `contracts/` — Inputs/Required Outputs/Failure Conditions/Quality Checks per skill |
| Recall a past decision or lesson | `decision-memory/` (formal records) or `memory/<domain>/` (relational/behavioral patterns) |
| Log a failure or lesson learned | `kaizen/failures.md` |
| Configure this for your actual team | `BUILD.md` — includes setup instructions for Claude Code and Codex CLI |

## What's not built yet — read this so you don't hit a dead end

- **Live metrics are optional.** `python3 scripts/ingest_metrics.py` writes `memory/current_metrics.json`. Missing tokens use mock. See `integrations/README.md`. Conversational loops can still take pasted Jira/GitHub context.
- **A handful of skills are referenced but not built** (e.g. `skills/operations/postmortem.md`, `skills/delivery/track-sprint.md`). They're explicitly marked "(planned — not yet built)" wherever referenced — if you hit one, treat it as a gap, not a bug.
- **Only 5 of ~200+ skills have regression test coverage** (sprint-review + the 4 assessment modules). Everything else hasn't been run against real golden outputs — treat first-time output from an untested skill with a bit more scrutiny.
- **No weekly/monthly kaizen review has actually been run in production yet** — the mechanism is built and tested, not yet proven on live data.

## The one rule that governs everything

`CLAUDE.md` applies to every single interaction with this repo: executive summary before details, confidence level on every claim, tradeoffs named explicitly, hidden risks surfaced even if you didn't ask. You don't invoke this — it's always on.

If you're using **Claude Code**, `CLAUDE.md` is loaded automatically. If you're using **Codex CLI or any OpenAI-based tool**, `AGENTS.md` is loaded automatically and it sources `CLAUDE.md`. If you're using a web tool (claude.ai, ChatGPT), paste `CLAUDE.md`'s contents at the start of each session.
