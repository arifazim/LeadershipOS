# Building Your EM OS Instance

This guide covers how to configure and instantiate the Engineering Manager OS for your specific context. "Building" here means adapting the generic system to your team, org, and tooling — not compiling code.

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

## Step 3: Customize Commands

Review each file in `commands/` and adjust:

- **Timing**: Update day/time references to match your actual schedule
- **Stakeholders**: Replace placeholder names with real contacts
- **Thresholds**: Set your team's specific SLO targets, velocity baselines, and escalation criteria

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
- **After incidents**: `kaizen/failures.md` entry within 48 hours
- **Quarterly**: Revisit `docs/principles.md` — are these still the right beliefs?

## Ongoing Maintenance

The OS degrades if not updated. Signs it needs attention:
- A command produces output you wouldn't actually send
- A template is consistently edited before use
- A subagent gives advice that conflicts with how your org actually works

When this happens, update the source file — not just the output.
