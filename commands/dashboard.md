# Command: Dashboard

**Trigger**: Manual — run on Monday morning before standup, or any time a health snapshot is needed
**Owner**: `subagents/engineering-manager.md`
**Loop**: `loops/daily-leadership-loop.md` (partial — dashboard is a read-only synthesis, not a full daily loop execution)
**Output**: Weekly at-a-glance health snapshot — DORA status, delivery signals, incident risk, and a single recommended action

---

## What This Command Does

Produces a structured, stakeholder-sendable snapshot of the team's current operational health across four dimensions:

1. **Executive Confidence** — composite score (0–100) from DORA metrics + sprint predictability
2. **Delivery** — sprint velocity, commitment accuracy, unplanned work ratio, PR cycle time
3. **Reliability** — MTTR, change failure rate, incident frequency
4. **Risk** — top risks derived from the above signals with confidence levels

The dashboard command is the lightweight entry point: it reads `memory/current_metrics.json` (populated by `scripts/ingest_metrics.py`) and produces output in < 5 minutes without requiring any specialist agents unless a Yellow or Red signal is found.

---

## Web UI

**Preferred**: Open the interactive dashboard at `http://localhost:8080` after starting the server:

```bash
# Install dependencies (first time only)
pip install -r requirements.txt

# Start the dashboard server
uvicorn dashboard.server:app --reload --port 8080
```

Then open `http://localhost:8080` in your browser. The dashboard auto-loads current metrics, computes bands and trends, and surfaces the priority action for the week.

To refresh metrics (re-ingest from configured sources):

```bash
# Via the web UI: click "Refresh Data" in the sidebar
# Via CLI:
python scripts/ingest_metrics.py
```

---

## CLI / Conversational Use

If you are running this repo via Claude Code, Codex CLI, or a web chat tool rather than the web server, load the command by pasting or referencing this file:

```
Run commands/dashboard.md with the current metrics from memory/current_metrics.json
and team context from config/team.json.
```

The Engineering Manager agent will:
1. Read `memory/current_metrics.json`
2. Compute DORA bands (Elite / High / Medium / Low) for each metric
3. Compute the Executive Confidence Score
4. Identify the single highest-priority action
5. Produce the output below

---

## Output Format

```
DASHBOARD — Week of: {{YYYY-MM-DD}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EXECUTIVE CONFIDENCE: {{score}}/100 — {{Green | Yellow | At Risk | Critical}}

DORA SNAPSHOT:
  Deployment Frequency : {{value}} — {{Elite | High | Medium | Low}}
  Lead Time for Changes: {{value}} — {{Elite | High | Medium | Low}}
  Change Failure Rate  : {{value}} — {{Elite | High | Medium | Low}}
  MTTR                 : {{value}} — {{Elite | High | Medium | Low}}
  Overall DORA Band    : {{Elite | High | Medium | Low}}

DELIVERY:
  Sprint Velocity      : {{value}} pts (4-wk avg: {{baseline}} pts) — {{↑ | ↓ | →}}
  Commitment Accuracy  : {{value}}% — {{Green | Yellow | Red}}
  Unplanned Work       : {{value}}% — {{Green | Yellow | Red}}
  PR Cycle Time        : {{value}}h — {{Green | Yellow | Red}}

INCIDENTS (30d):
  Count   : {{N}} — {{Green | Yellow | Red}}
  MTTR    : {{value}}
  CFR     : {{value}}%

RISK REGISTER:
  {{severity}} | {{risk title}} | Confidence: {{High | Medium | Low}}
  ...

PRIORITY ACTION THIS WEEK:
  {{Single highest-leverage action the EM should take, specific and named}}
```

---

## Inputs

### Required
- `memory/current_metrics.json` — populated by `scripts/ingest_metrics.py`
- `config/team.json` — team context (size, cadence, on-call status)

### Optional
- `memory/retrospectives/retrospective-memory.md` — prior retro themes inform risk assessment
- `memory/decision-history/decision-history.md` — prior decisions in context
- Integration tokens in `.env` (GitHub, Jira, PagerDuty) for live ingestion vs. mock data

---

## DORA Band Thresholds

These are the Accelerate research-derived thresholds used to classify each metric:

| Metric | Elite | High | Medium | Low |
|---|---|---|---|---|
| Deployment Frequency | ≥ 1/day | ≥ 1/week | ≥ 1/month | < 1/month |
| Lead Time | < 1 day | < 1 week | < 1 month | > 1 month |
| Change Failure Rate | < 5% | < 10% | < 15% | ≥ 15% |
| MTTR | < 1 hour | < 1 day | < 1 week | > 1 week |

---

## When to Escalate Beyond Dashboard

The dashboard command is read-only synthesis. If any signal is Yellow or Red, escalate to the appropriate specialist:

| Signal | Escalate To |
|---|---|
| MTTR > 1 day OR incident count elevated | `subagents/incident-manager.md` |
| Commitment accuracy < 70% OR velocity drop ≥ 20% | `subagents/delivery-manager.md` |
| Unplanned work > 20% for 2+ consecutive sprints | `subagents/delivery-manager.md` + `subagents/product-partner.md` |
| Any risk at High severity | `subagents/engineering-manager.md` for full routing |

---

## Kaizen Integration

After running the dashboard:
1. If any metric changed band (e.g., Yellow → Green), log the change in `kaizen/continuous-improvement.md`
2. If a risk is recurring (same risk appeared last week), log in `kaizen/failures.md`
3. If the priority action is the same as last week and hasn't been executed, escalate it — this is a kaizen failure

---

## Related

- `loops/daily-leadership-loop.md` — fuller daily loop with agent routing
- `memory/current_metrics.json` — the data source
- `scripts/ingest_metrics.py` — populates the data source
- `dashboard/server.py` — web server for the interactive UI
- `dashboard/dashboard.html` — the interactive dashboard UI
- `analytics/master-leadership-dashboard.md` — full 5-view analytics spec (v0.6 implements Views 1–2; Views 3–5 require v0.5 memory accumulation)
