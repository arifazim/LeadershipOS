# Engineering Manager OS

An AI-augmented operating system for engineering managers. This repo defines the workflows, subagent personas, behavioral specs, and integration guides that together make up a coherent management practice — one that can be executed with or assisted by AI.

## What It Is

Most management systems are either too abstract (leadership books) or too tactical (task trackers). This OS bridges that gap: it encodes *how* an engineering manager thinks, decides, and acts into structured artifacts that can be queried, executed, and improved over time.

The OS has fifteen layers:

| Layer | Directory | Purpose |
|---|---|---|
| Philosophy | `docs/` | Vision, principles, decision frameworks |
| Actors | `subagents/` | Role definitions for AI-assisted execution |
| Behavior Specs | `features/` | BDD specs for management workflows |
| Commands | `commands/` | Runnable procedures (daily, weekly, incident) — thin pointers into `loops/` |
| Templates | `templates/` | Documents produced by running commands |
| Integrations | `integrations/` | Connections to GitHub, Jira, Slack, Datadog, PagerDuty |
| Improvement | `kaizen/` | Reviews and retrospectives on the OS itself |
| Leadership Health | `leadership-health/` | 13-dimension leadership diagnostics (dimension skills in `skills/leadership-health/`), trust, influence, delegation, coaching, and execution assessment |
| Executive Confidence | `confidence-engine/` | 6-dimension trust assessment (dimension skills in `skills/confidence-engine/`) answering "Can I trust this team?" across prediction, data, risk, delivery, roadmap, and architecture |
| Political Signals | `political-signals/` | 5-dimension organizational risk detection answering "What harmful patterns are present, and how should I respond ethically?" |
| Decision Memory | `decision-memory/` | Institutional learning and decision recall — captures decisions with full context and surfaces repeated patterns so the organization learns from experience |
| Loops | `loops/` | Reusable, cadence-bound orchestration — gathers inputs, sequences skill invocations, routes to subagent(s), logs outcomes |
| Contracts | `contracts/` | Specification schema (Inputs/Required Outputs/Failure Conditions/Quality Checks) formalizing what skills and subagents already do narratively |
| Memory | `memory/` | Leadership Memory recall engine — 10 domains of relational/organizational pattern capture, distinct from and cross-linked with `decision-memory/` |
| Analytics | `analytics/` | Cross-domain operational dashboards (career, executive, organization, people, stakeholder, strategy) |

## Who It's For

Engineering managers who want to:
- Run consistent, high-quality 1:1s, sprint reviews, and executive updates
- Delegate routine synthesis tasks to AI subagents
- Evolve their management practice through structured reflection
- Onboard a new EM context quickly (handoffs, role transitions)

## How to Use It

**As a CLI tool (Recommended)**: Run commands directly from your terminal.
```powershell
# Install dependencies
pip install -r requirements.txt

# (Optional) Set up your API key in .env
cp .env.example .env

# List available leadership commands
./bin/em-os.ps1 list

# Show current operational metrics (ingested from GitHub/Jira/etc)
./bin/em-os.ps1 status

# Execute a leadership command (e.g., Daily Leadership Loop)
./bin/em-os.ps1 run daily

# Process a custom situation through the AI Orchestrator
./bin/em-os.ps1 run "Our deployment frequency is dropping and the team seems tired"
```

**As a reference system**: Browse `docs/` for principles and `features/` for how specific scenarios should play out.

**As an AI-assisted workflow**: Load the relevant subagent definition from `subagents/` into your AI tool, then run a command from `commands/`. The subagent will produce output using the appropriate template from `templates/`.

**As a living practice**: Run `kaizen/weekly-review.md` each week and `kaizen/monthly-review.md` each month to refine the OS based on what's working.

## Quick Start

1. Read `docs/vision.md` to understand the intended end state
2. Read `docs/principles.md` to understand the beliefs that shape decisions
3. Configure your integrations in `integrations/`
4. Run your first command: load `subagents/engineering-manager.md` and execute `commands/daily.md`

## Building Your Instance

See `BUILD.md` for how to configure this OS for your specific team, tech stack, and organization. For the full step-by-step usage guide with copy-paste examples, see `HOWTORUN.md`.

## Visual Overview

`docs/diagrams/agent-architecture.html` — an interactive, offline-viewable schematic of how the 8 subagents, 11 loops, and shared layers (skills, contracts, memory, kaizen) route requests and feed back into each other. Open it directly in any browser; no server or build step needed.
