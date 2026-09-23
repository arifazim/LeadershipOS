# HOW TO RUN: Engineering Manager OS

macOS/Linux uses `./bin/em-os`. Windows PowerShell uses `./bin/em-os.ps1`. Both call `python3 scripts/cli.py`. Run every command from the **repo root**.

---

## 1. Prerequisites

- **Python 3.9+**
- **AI API key** (required for `run`; `list` / `status` / ingest work without it)
  - **Google Gemini** (default): `GOOGLE_API_KEY` from [AI Studio](https://aistudio.google.com/)
  - Optional override: `GEMINI_MODEL` (default `gemini-flash-latest`)
- Conversational mode (Cursor, Claude Code, Codex): no local key needed — skip to section 4 if you only chat with the repo.

---

## 2. Setup (once)

```bash
cd /path/to/engineering-manager-os
pip install -r requirements.txt
cp .env.example .env
chmod +x bin/em-os
```

Edit `.env`:

```
GOOGLE_API_KEY=your_key_here
# GEMINI_MODEL=gemini-flash-latest
```

Optional live metrics (v0.6). Each source is independent; blank vars use mock and set `"_source": "mock"`:

```
GITHUB_TOKEN=
GITHUB_REPO=owner/repo
JIRA_TOKEN=
JIRA_BASE_URL=https://your-domain.atlassian.net
JIRA_EMAIL=
JIRA_PROJECT=
PAGERDUTY_TOKEN=
SLACK_TOKEN=
DATADOG_API_KEY=
DATADOG_APP_KEY=
```

Guides: `integrations/README.md`.

Edit `config/team.json` with your team (name, size, stack, reporting chain).

---

## 3. Every command (copy-paste)

Equivalent: `python3 scripts/cli.py …` instead of `./bin/em-os …`.

### Engine (no LLM)

```bash
python3 scripts/ingest_metrics.py
python3 scripts/validate_dashboard.py
python3 scripts/cadence.py
./bin/em-os list
./bin/em-os status
```

### Named loops (`commands/*.md`)

| Command | When | Agent |
|---|---|---|
| `daily` | Standup | engineering-manager |
| `weekly` | Sprint boundary | delivery-manager |
| `dashboard` | Monday health snapshot (CLI narrative) | engineering-manager |
| `executive` | Exec / board prep | executive-summary |
| `incident` | Technical P1/P2 | incident-manager |
| `retrospective` | Sprint end or post-incident | delivery-manager / incident-manager |
| `em-growth` | Monthly self-coaching (private) | engineering-manager |
| `crisis` | Org/people crisis (not an outage) | engineering-manager |

```bash
./bin/em-os run daily
./bin/em-os run weekly
./bin/em-os run dashboard
./bin/em-os run executive
./bin/em-os run incident
./bin/em-os run retrospective
./bin/em-os run em-growth
./bin/em-os run crisis
```

### Web dashboard (v0.6 UI)

```bash
python3 scripts/ingest_metrics.py
uvicorn dashboard.server:app --reload --port 8080
```

Open http://localhost:8080

Refresh data from the UI, or:

```bash
python3 scripts/ingest_metrics.py
```

### Ad-hoc (no command file)

```bash
./bin/em-os run "Our deployment frequency dropped by 40% this month. Identify the bottleneck."
./bin/em-os run "A senior engineer just resigned and the team does not know yet"
```

Use `crisis` for org/people events. Use `incident` for outages. Do not mix them.

---

## 4. Recommended weekly rhythm

```bash
# Monday
python3 scripts/ingest_metrics.py
./bin/em-os status
./bin/em-os run dashboard
# or open http://localhost:8080

# Each standup
./bin/em-os run daily

# Sprint boundary
./bin/em-os run weekly
./bin/em-os run retrospective

# Before exec sync
./bin/em-os run executive

# First Friday of the month
python3 scripts/cadence.py
./bin/em-os run em-growth
```

macOS reminder (optional):

```bash
# crontab -e
0 9 1 * * cd /path/to/engineering-manager-os && python3 scripts/cadence.py || true
```

---

## 5. Ad-hoc examples by category

### Delivery & velocity
- `./bin/em-os run "Our deployment frequency dropped by 40% this month. Identify the bottleneck."`
- `./bin/em-os run "Sprint velocity is inconsistent. Is this due to scope creep or technical debt?"`
- `./bin/em-os run "We have 5 P1 bugs blocking the release. Re-prioritize the sprint for maximum stability."`
- `./bin/em-os run "Lead time for changes is increasing. Analyze the PR review cycle for friction."`
- `./bin/em-os run "The legacy migration is stalling. How much capacity is being drained by dual-support?"`

### Team health
- `./bin/em-os run "On-call volume doubled this week. Which senior engineers are at critical burnout risk?"`
- `./bin/em-os run "Team sentiment is low after the reorg. Initiate the Trust Recovery Playbook."`
- `./bin/em-os run "Identify Key Person Risk in our current architecture."`
- `./bin/em-os run "The team is working late every night. Analyze disruption in on-call metrics."`
- `./bin/em-os run "Assess psychological safety during design reviews."`

### AI governance
- `./bin/em-os run "Are senior engineers losing their debugging edge due to Copilot? Check Skill Atrophy signals."`
- `./bin/em-os run "A pilot agent is now handling production PII. Run an AI Governance audit immediately."`
- `./bin/em-os run "Define HITL requirements for our new automated deployment agent."`
- `./bin/em-os run "Is AI-generated code increasing Change Failure Rate? Compare human vs AI PRs."`

### Strategy & product
- `./bin/em-os run "The AI Chat PoC has 50 users. Detect scope-drift and graduation requirements."`
- `./bin/em-os run "What percentage of capacity this quarter went to New Capabilities vs Maintenance?"`
- `./bin/em-os run "A stakeholder wants a quick fix that bypasses the ADR. Log the strategic risk."`
- `./bin/em-os run "Compare current work against the Q3 OKRs."`

### Talent
- `./bin/em-os run "Calibrate the Backend Engineer interview loop for system design and debugging."`
- `./bin/em-os run "Generate a 30-60-90 day onboarding plan for a Staff Engineer starting next week."`
- `./bin/em-os run "Analyze promotion readiness of the senior devs."`

### Political risk
- `./bin/em-os run "Decisions are being reversed by the VP. Is there ownership ambiguity?"`
- `./bin/em-os run "We are being excluded from Product Strategy meetings. How do we rebuild influence?"`
- `./bin/em-os run "A stakeholder raised concerns about my team to my director, not to me."`

### Memory & audit
- `./bin/em-os run "Why did we move away from the monolith 8 months ago? Recall the ADR rationale."`
- `./bin/em-os run "Identify patterns in failed projects. Is Low Evidence a recurring theme?"`

---

## 6. Agent routing

Named commands use a fixed map (not keyword scan). Ad-hoc text uses keywords.

| Situation | Agent |
|---|---|
| `run daily` / `dashboard` / `em-growth` / `crisis` | engineering-manager |
| `run weekly` | delivery-manager |
| `run executive` | executive-summary |
| `run incident` / words "incident" or "outage" | incident-manager |
| Sprint / DORA / velocity (ad-hoc) | delivery-manager |
| Architecture / ADR / tech debt | tech-lead |
| Burnout / 1:1 / coaching | engineering-coach |
| Roadmap / stakeholder / product | product-partner |
| Hire / interview / onboarding | talent-partner |
| History / audit / "why did we decide" | decision-provenance-agent |

Trailing 30-day incident counts do **not** force incident routing.

---

## 7. Troubleshooting

| Symptom | Fix |
|---|---|
| `./bin/em-os.ps1: syntax error near unexpected token` | You are in zsh/bash. Use `./bin/em-os`, not `.ps1`. |
| `cp: .env.example: No such file` | Recreate from HOWTORUN §2, or copy the template in the repo root. |
| `gemini-1.5-flash is not found` | Old SDK. `pip install -r requirements.txt` (package is `google-genai`). Default model is `gemini-flash-latest`. |
| FutureWarning `google.generativeai` | Same — uninstall the retired package if it is still installed: `pip uninstall google-generativeai` |
| `list`/`status` still load Gemini | Update to current `scripts/cli.py` (lazy import). |
| `run daily` goes to incident-manager | Fixed: named commands ignore 30-day incident counts. |
| No API key | `run` uses MOCK MODE. Ingest still writes metrics (live or mock per token). |
| Ingest always mock | Need tokens in `.env`. Confirm `"_source"` in `memory/current_metrics.json`. Dashboard Refresh uses the same ingestor (no global mock flag). |
| Permission denied on `./bin/em-os` | `chmod +x bin/em-os` |
| Windows `.ps1` blocked | `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` |
| Import errors | Run from repo root. |

Windows PowerShell equivalents: replace `./bin/em-os` with `./bin/em-os.ps1`.
