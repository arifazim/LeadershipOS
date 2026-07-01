# Skill: Capacity Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (headcount model) + Quarterly (revalidation) + On-demand (hiring ask, reorg, attrition)

---

## Purpose

Model current and projected engineering capacity — by team, role, and time horizon — to detect shortages before they become misses, quantify the cost of gaps, and provide the data foundation for hiring, contractor, and investment decisions.

**What the EM does automatically**: Given team composition and planned work, the EM:
1. Calculates effective capacity (not headcount — delivery capacity)
2. Forecasts capacity 2–4 quarters forward using hiring pipeline and attrition signals
3. Detects shortage before it becomes visible in missed deliveries
4. Translates capacity gaps into business cost (delayed initiatives × value)
5. Produces data-driven hiring recommendations with timing and role specification

The most common planning failure mode is confusing headcount with capacity. Eight engineers does not mean eight person-weeks per week. Capacity planning makes the gap between those two numbers visible and actionable.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Team roster** | All engineers, role, seniority, and FTE status |
| **Planned initiatives** | Work committed for the planning horizon |
| **Historical velocity** | Actual delivery rate vs. estimated (past 4 quarters) |
| **Maintenance load** | % of capacity consumed by keep-lights-on, support, on-call |

### Optional
| Input | Description |
|---|---|
| **Hiring pipeline** | Open reqs, interview stage, expected start dates |
| **Attrition signals** | Known departures, flight risk indicators, tenure distribution |
| **Leave schedule** | Planned PTO, parental leave, sabbaticals |
| **Contractor availability** | Augmentation budget and pre-qualified vendors |

---

## Analysis

### Step 1 — Calculate Current Effective Capacity

```
Per-engineer effective capacity (per quarter):
  Working weeks in quarter:         12 weeks (6 × 2-week sprints)
  − Average PTO/holidays:           −2.5 weeks (10 days)
  − Ceremony overhead (10–15%):     −1.5 weeks
  Net working weeks:                ~8 weeks/quarter per engineer

Maintenance load adjustment:
  Effective delivery weeks = 8 × (1 − maintenance load)
  At 30% maintenance: 8 × 0.70 = 5.6 delivery weeks per engineer per quarter

Historical accuracy correction:
  Accuracy-adjusted capacity = 5.6 × historical accuracy rate
  At 80% accuracy: 5.6 × 0.80 = 4.5 effective person-weeks per engineer per quarter

Team effective capacity = 4.5 × number of engineers
Example: 8 engineers = 36 effective person-weeks/quarter
```

### Step 2 — Build the Capacity Projection

Project capacity 4 quarters forward incorporating:

```
Quarter N capacity = (Current engineers − Projected attrition + New hires at full capacity
                     + New hires at partial capacity × ramp factor)
                     × per-engineer effective rate

Ramp factor by quarter:
  Q1 on team: 40% effective (onboarding, context building)
  Q2 on team: 70% effective (productive but not fully independent)
  Q3 on team: 90% effective (fully independent)
  Q4+ on team: 100% effective

Example: New hire joining Week 1 of Q2
  Q2 contribution: 4.5 × 0.40 = 1.8 person-weeks
  Q3 contribution: 4.5 × 0.70 = 3.2 person-weeks
  Q4 contribution: 4.5 × 0.90 = 4.1 person-weeks
  Full capacity: Q5+ at 4.5 person-weeks
```

### Step 3 — Calculate the Capacity Gap

```
Capacity gap per quarter = Planned work (person-weeks) − Effective capacity (person-weeks)

Gap > 0: Shortage — planned work exceeds capacity
Gap ≤ 0: Sufficient — buffer available for unplanned work

For each quarter with a gap:
  Business cost of gap = Gap (weeks) × Average initiative value per week
  Time to close with hiring = Lead time (posting + interview + notice + ramp) typically 4–6 months
```

### Step 4 — Auto-Detect Shortage Signals

The EM flags these patterns automatically:

| Signal | Threshold | Action |
|---|---|---|
| **Sustained overload** | Load ratio >1.0 for 2+ consecutive quarters | Flag: chronic overcommitment — hiring or scope reduction required |
| **Seniority gap** | <20% senior engineers on team | Flag: delivery risk — senior engineers disproportionately unblock others |
| **Key-person concentration** | >30% of delivery capacity from 1 engineer | Flag: single-point-of-failure — cross-training or backfill planning required |
| **Attrition cliff** | >25% of team tenure < 1 year | Flag: knowledge risk — team is rebuilding; capacity estimates should be conservative |
| **Ramp debt** | >2 engineers in ramp period simultaneously | Flag: effective capacity significantly lower than headcount suggests |
| **Maintenance load creep** | Maintenance load increasing >5% quarter-over-quarter | Flag: operational work is crowding out delivery — investigate and cap |

---

## Decision Tree

```
What does the capacity model reveal?

├── SHORTAGE IN CURRENT QUARTER
│   └── Immediate triage — no time for hiring
│       Options: Defer lowest-value committed work / Bring in contractor / 
│                Reduce scope of in-flight initiatives
│       Frame to PM: "We have {{N}} person-weeks of planned work and {{N}} available.
│       Gap: {{N}} person-weeks. Recommend deferring {{item}} ({{N}}w, lowest value).
│       This preserves commitment to {{higher-value items}}."
│       → Invoke: skills/product/opportunity-cost.md to rank deferrals

├── SHORTAGE IN 1–2 QUARTERS
│   └── Hiring window: Immediate posting required (4–6 month lead time)
│       Calculate: What role fills the gap most efficiently?
│         - Skills gap: what work is blocked by missing expertise?
│         - Seniority gap: is the team junior-heavy and blocked on reviews?
│       → Invoke: skills/strategy/succession-planning.md for seniority analysis
│       → Invoke: skills/executive/headcount-justification.md to build the ask

├── SHORTAGE IN 3–4 QUARTERS (planning horizon)
│   └── Inform annual plan — adjust initiative scope or headcount ask
│       Calculate fully loaded cost of hire vs. cost of delayed initiative
│       Include in annual plan as investment proposal
│       → Invoke: skills/strategy/investment-planning.md

├── KEY-PERSON CONCENTRATION DETECTED
│   └── Immediate: Identify the specific risk (who, what knowledge, what would break)
│       Short-term: Pair programming, documentation, cross-training
│       Medium-term: Succession planning; hiring to redistribute load
│       → Invoke: skills/strategy/succession-planning.md

└── CAPACITY IS SUFFICIENT (current and projected)
    └── Publish capacity model as foundation for planning
        Flag any quarters approaching the 0.85 load threshold
        Review quarterly — capacity models degrade with time
```

---

## Output

### Capacity Planning Dashboard

```
CAPACITY PLANNING MODEL — {{Team}} — {{date}}

CURRENT QUARTER (Q{{N}} {{Year}})
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team size: {{N}} FTE | Maintenance load: {{N}}% | Historical accuracy: {{N}}%
Gross capacity: {{N}} person-weeks
Effective capacity: {{N}} person-weeks
Planned work: {{N}} person-weeks
Load ratio: {{N}} | {{🟢 | 🟡 | 🔴}}
Buffer: {{N}} person-weeks

4-QUARTER PROJECTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Quarter | Team | Ramp Adj | Effective Cap | Planned Work | Gap  | Signal
Q{{N}}  | {{N}} | {{N}}w  | {{N}}w        | {{N}}w       | {{N}}w | {{🟢/🟡/🔴}}
Q{{N+1}}| {{N}} | {{N}}w  | {{N}}w        | {{N}}w       | {{N}}w | {{🟢/🟡/🔴}}
Q{{N+2}}| {{N}} | {{N}}w  | {{N}}w        | {{N}}w       | {{N}}w | {{🟢/🟡/🔴}}
Q{{N+3}}| {{N}} | {{N}}w  | {{N}}w        | {{N}}w       | {{N}}w | {{🟢/🟡/🔴}}

ROSTER ANALYSIS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Senior engineers: {{N}} ({{N}}%) | Target: ≥20%
Engineers in ramp: {{N}} | Ramp capacity penalty: {{N}} person-weeks
Key-person risk: {{Name}} — {{N}}% of delivery capacity | {{🟢 Safe | 🟡 Watch | 🔴 Risk}}
Attrition signal: {{Low | Medium | High}} — rationale: {{}}

SIGNALS
⚠️ {{Specific shortage, concentration, or ramp risk}}
🔴 {{Hiring recommendation with timing}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Effective capacity calculated (not headcount) | Base: 65% |
| Ramp factor applied to new hires | +15% |
| 4-quarter projection produced | +10% |
| Key-person concentration assessed | +10% |
| Business cost of gap calculated | +5% |
| Headcount used as capacity proxy | −30% |
| No ramp factor applied | −15% |
| Only current quarter modeled | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Headcount = capacity** | "We have 8 engineers so we have 8 weeks/sprint" | Apply maintenance load, accuracy rate, ramp factor. Always. |
| **New hire counted at full capacity** | Plan includes new hire as 100% productive from day 1 | Apply 40%/70%/90% ramp curve for first three quarters. |
| **Attrition ignored** | Plan assumes no departures over the year | Annual plans should include a 10–15% attrition assumption unless evidence says otherwise. |
| **Maintenance load fixed** | Maintenance load treated as stable at 25–30% | Track maintenance load quarterly. Creep erodes delivery capacity silently. |
| **Shortage discovered at miss** | Team misses delivery commitment; capacity gap identified retroactively | Run capacity projections 4 quarters forward. Shortage must be detected before it becomes a miss. |

---

## References

- `skills/strategy/annual-planning.md` — Annual plan consumes capacity model as its foundation
- `skills/strategy/quarterly-planning.md` — Quarterly plans draw from current capacity model
- `skills/executive/headcount-justification.md` — Capacity gap → headcount justification
- `skills/strategy/succession-planning.md` — Key-person risk analysis and mitigation

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/annual-planning.md` | Annual plan requires capacity model |
| `skills/executive/headcount-justification.md` | Capacity gap is the evidence for headcount asks |
| `skills/strategy/succession-planning.md` | Key-person risk detected in capacity model |
| `skills/strategy/platform-strategy.md` | Platform investment reduces maintenance load over time |
