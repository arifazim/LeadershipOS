# Skill: Quarterly Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: End of each quarter (planning the next) + Mid-quarter replan trigger

---

## Purpose

Convert the annual plan into a quarter-level delivery commitment — with sprint-resolution sequencing, dependency identification, capacity reality check, and explicit risk buffer — so that each quarter starts with a grounded, executable plan rather than a list of intentions.

**What the EM does automatically**: At the start of each quarter, the EM:
1. Pulls the current quarter's initiatives from the annual plan
2. Validates capacity against actual team state (attrition, new hires ramping, leave)
3. Sequences work by dependency order and strategic priority
4. Flags initiatives that cannot fit without trade-offs
5. Produces a sprint-by-sprint load view for the quarter
6. Recommends which items to commit vs. target vs. explore (using Now/Next/Later within the quarter)

A quarterly plan that says "we'll do A, B, C, D" without sequencing is a backlog, not a plan. The EM turns the backlog into a delivery sequence with explicit trade-offs named.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Annual plan initiatives** | Initiatives allocated to this quarter |
| **Current team state** | Who is on the team, availability this quarter (leave, ramp, part-time) |
| **Sprint calendar** | Number of sprints in the quarter; any planned holidays |
| **Carry-forward work** | Items from prior quarter not completed |

### Optional
| Input | Description |
|---|---|
| **Dependency map** | Cross-team dependencies that gate any quarterly items |
| **Current roadmap health** | Prior quarter's health score and open issues |
| **PM priorities** | Any re-ranking from product since annual plan was set |
| **Tech debt register** | Deferred reliability work that must be addressed this quarter |

---

## Analysis

### Step 1 — Calculate Quarter Capacity

```
Quarter capacity = Available engineers × Sprint weeks × (1 − maintenance load)

Sprint weeks per quarter: typically 6 sprints × 2 weeks = 12 engineer-weeks/person
Adjustment for carry-forward: subtract incomplete prior-quarter work first

Example: 5 engineers, 30% maintenance load, 12 sprints weeks
  Gross: 5 × 12 = 60 person-weeks
  Net of maintenance: 60 × 0.70 = 42 person-weeks
  Accuracy-corrected (80%): 42 × 0.80 = 34 person-weeks effective

Individual adjustments this quarter:
  Engineer on leave 2 weeks: −2 person-weeks
  New hire ramping (50% capacity for 6 weeks): −3 person-weeks
  Net effective: 34 − 5 = 29 person-weeks
```

### Step 2 — Sequence by Dependency and Value

**Dependency-first sequencing rule**: Work that is a prerequisite for other work is scheduled before the work it enables — regardless of its own RICE score.

```
Sequencing order:
  1. Blockers: Work that other Q items depend on
  2. Must items: Non-negotiable commitments
  3. High-RICE items: Highest value work without blocking dependencies
  4. Should items: Planned but deferrable under pressure
  5. Buffer: Unallocated capacity (15% target)
```

### Step 3 — Classify Quarterly Commitments

| Commitment tier | Criteria | Communication language |
|---|---|---|
| **Commit** | High confidence, capacity confirmed, no blocking dependencies | "We will deliver this in Q{{N}}" |
| **Target** | Medium confidence, capacity exists, dependencies identified but not confirmed | "We plan to deliver this in Q{{N}}, barring dependencies" |
| **Explore** | Low confidence, aspirational, dependent on Commit items completing ahead of schedule | "We will begin this in Q{{N}} if Commit items finish early" |

**Rule**: Never commit to more than 85% of effective capacity. The remainder is buffer for unplanned work, incidents, and scope surprises.

### Step 4 — Mid-Quarter Replan Triggers

Automatically trigger a quarter replan when:
- An engineer leaves unexpectedly (capacity loss >10%)
- A blocking dependency slips by >1 sprint
- A new P0/P1 incident consumes >1 sprint of capacity
- Product reprioritizes a Must item mid-quarter
- Actual velocity is tracking >20% below plan after sprint 2

---

## Decision Tree

```
What does the quarterly capacity check reveal?

├── CARRY-FORWARD > 20% OF QUARTER CAPACITY
│   └── Flag immediately: "We start Q{{N}} {{N}} person-weeks behind.
│       Before adding new work, we must account for this debt."
│       Recalculate available capacity for new Q{{N}} initiatives
│       Surface to PM: carry-forward crowd-out effect on new commitments

├── DEPENDENCY CHAIN UNRESOLVED
│   └── For each cross-team dependency:
│       - Is it confirmed (owner named, date agreed)?
│       - If not confirmed: classify as Target, not Commit
│       - If blocking a Must item: escalate immediately
│       → Invoke: skills/cross-functional/dependency-management.md

├── CAPACITY ALLOWS ONLY COMMIT ITEMS (no room for Target/Explore)
│   └── Surface to PM: "Q{{N}} is fully committed at {{N}} person-weeks.
│       Any new request displaces existing work. There is no free capacity."
│       Do NOT: Absorb new requests without naming the trade-off

├── REPLAN TRIGGER ACTIVATED MID-QUARTER
│   └── Calculate: What is the remaining effective capacity for the quarter?
│       Re-triage: What can still be delivered at Commit confidence?
│       Downgrade: Items no longer achievable move to Target or next quarter
│       Communicate: PM and stakeholders within 24 hours of trigger
│       → Invoke: skills/product/moscow-prioritization.md to retriage
│       → Invoke: skills/product/opportunity-cost.md to rank remaining options

└── PLAN IS EXECUTABLE (capacity sufficient, dependencies mapped)
    └── Publish the quarterly plan with tiered commitments
        Sprint-by-sprint load view (see Output)
        Weekly cadence: track against plan, flag variances by sprint 2
```

---

## Output

### Quarterly Plan

```
QUARTERLY PLAN — Q{{N}} {{Year}} — {{Team}} — {{date}}

EXECUTIVE SUMMARY
Quarter capacity: {{N}} person-weeks (effective, adjusted for team state)
Committed work: {{N}} person-weeks ({{N}}% of capacity)
Buffer: {{N}} person-weeks ({{N}}%)
Carry-forward: {{N}} person-weeks from Q{{N−1}}
Confidence: {{High | Medium | Low}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMMITMENT TIERS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMMIT (will deliver):
  {{item}} | {{N}}w | Owner: {{name}} | OKR: {{ref}} | Dependencies: {{confirmed/none}}
  {{item}} | {{N}}w | ...

TARGET (plan to deliver, dependencies pending):
  {{item}} | {{N}}w | Owner: {{name}} | Dependency: {{team/item}} — status: {{confirmed/pending}}

EXPLORE (if Commit items complete ahead of schedule):
  {{item}} | {{N}}w | Owner: TBD

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SPRINT LOAD VIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Sprint 1: {{items}} | Load: {{N}}w / {{N}}w available
Sprint 2: {{items}} | Load: {{N}}w / {{N}}w available
Sprint 3: {{items}} | Load: {{N}}w / {{N}}w available
Sprint 4: {{items}} | Load: {{N}}w / {{N}}w available
Sprint 5: {{items}} | Load: {{N}}w / {{N}}w available
Sprint 6: {{items}} | Load: {{N}}w / {{N}}w available

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RISKS AND FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Dependency risk, capacity risk, or sequencing risk}}
⚠️ Replan trigger thresholds: Velocity <80% by sprint 2, or any dependency slip >1 sprint
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Capacity calculated with individual adjustments | Base: 65% |
| Commit/Target/Explore tiers applied | +15% |
| Sprint-level load view produced | +10% |
| Carry-forward accounted for explicitly | +10% |
| Replan triggers defined | +5% |
| No capacity calculation (just item list) | −25% |
| No buffer maintained (100% committed) | −20% |
| Dependencies unverified | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No commitment tiers** | Everything is "planned" — no distinction between certain and aspirational | Apply Commit/Target/Explore. Stakeholders need to know what is guaranteed. |
| **No buffer** | 100% of capacity committed to items | Always maintain 15% buffer. Incidents and surprises are not optional. |
| **Carry-forward invisible** | Q starts without acknowledging prior-quarter incomplete work | Carry-forward consumes new quarter capacity. Make it visible and subtract it first. |
| **Dependencies not confirmed** | Plan assumes cross-team work will be available | Confirmed dependency ≠ mentioned dependency. Get a named owner and date. |
| **No replan protocol** | Mid-quarter surprise handled ad hoc, stakeholders surprised late | Define replan triggers in advance. Communicate within 24 hours of trigger activation. |

---

## References

- `skills/strategy/annual-planning.md` — Annual plan provides the initiative inputs to quarterly planning
- `skills/strategy/capacity-planning.md` — Detailed capacity model feeds quarterly calculation
- `skills/product/moscow-prioritization.md` — MoSCoW drives the Commit/Target/Explore tiers
- `skills/cross-functional/dependency-management.md` — Dependency confirmation for quarterly items

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/annual-planning.md` | Quarterly plan draws from annual plan |
| `skills/strategy/capacity-planning.md` | Capacity model underlies quarterly load calculation |
| `skills/product/roadmap-health.md` | Quarterly plan feeds roadmap health check |
| `skills/product/opportunity-cost.md` | Trade-off decisions during replan require OC analysis |
