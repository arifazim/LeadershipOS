# Skill: Annual Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (Q4 for next fiscal year) + Mid-year replan if company strategy shifts materially

---

## Purpose

Translate company strategy into an engineering annual plan — with capacity-grounded initiative sequencing, OKR mapping, investment allocation, and explicit risk buffer — so that the engineering team enters the year with a realistic, defensible, board-level plan rather than an optimistic wish list.

**What the EM does automatically**: During annual planning, the EM:
1. Converts company strategy bets into engineering capability requirements
2. Calculates available engineering capacity (not headcount — effective delivery capacity)
3. Sizes all planned initiatives against that capacity
4. Detects when the plan requires more capacity than exists (overcommitment)
5. Produces a ranked initiative list with explicit sequencing rationale
6. Names what is NOT in the plan and why — omissions are as strategic as inclusions

Annual plans that don't account for capacity are aspirations. Annual plans that don't name what's excluded are incomplete. The EM's job is to make the plan honest before it becomes a commitment.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Company strategy / bets** | Stated company priorities, OKRs, or strategic themes for the year |
| **Current team composition** | Engineers by seniority, role, and team |
| **Historical delivery data** | Actual delivery vs. plan from the prior 2 years |
| **Known initiative backlog** | All initiatives being considered for the year |

### Optional
| Input | Description |
|---|---|
| **Approved headcount plan** | Confirmed new hires and timing |
| **Vendor/contractor budget** | Augmentation capacity available |
| **Technical debt register** | Known reliability or platform work that must be planned |
| **Carry-forward items** | Prior-year initiatives that didn't complete |

---

## Analysis

### Step 1 — Calculate True Annual Capacity

```
Annual engineering capacity = Total engineers × Effective weeks/year

Effective weeks/year per engineer:
  52 weeks
  − 10 weeks PTO + holidays (industry standard)
  − 3 weeks ceremonies (planning, retros, meetings across 26 sprints)
  − 2 weeks ramp/context switching
  = ~37 effective engineering weeks/year per engineer

Maintenance load adjustment:
  Effective delivery capacity = 37 weeks × (1 − maintenance load)
  Typical maintenance load: 25–35% (support, on-call, incidents, tech debt)

Example: 8 engineers, 30% maintenance load
  Total capacity = 8 × 37 × (1 − 0.30) = 207 person-weeks/year

Historical accuracy correction:
  Adjusted capacity = 207 × historical accuracy rate
  If team delivers 80% of estimates: 207 × 0.80 = 166 person-weeks effective
```

### Step 2 — Map Strategy to Engineering Capability

For each company strategic bet, identify the engineering capability required:

| Company Bet | Engineering Capability Required | Status | Est. Person-Weeks |
|---|---|---|---|
| {{bet 1}} | {{capability}} | Exists / Partial / Gap | {{N}} |
| {{bet 2}} | {{capability}} | Exists / Partial / Gap | {{N}} |
| {{bet 3}} | {{capability}} | Exists / Partial / Gap | {{N}} |

**Strategy-execution gap**: Any bet with a "Gap" status requires planned investment. If no initiative addresses a Gap, that bet will fail.

### Step 3 — Classify and Size All Initiatives

Classify every initiative before sequencing:

| Classification | Description | Planning treatment |
|---|---|---|
| **Strategic** | Directly enables a company bet | Must appear in plan; effort is non-negotiable |
| **Foundational** | Enables multiple strategic initiatives (platform, API, infra) | Sequence before strategic items it enables |
| **Operational** | Keeps the product reliable and the team productive | Reserve capacity (don't plan away) |
| **Exploratory** | R&D, spikes, innovation investment | Allocate fixed time-box; don't overcommit |
| **Deferred** | Named, conscious out-of-scope decisions | Document explicitly; do not leave as implicit |

### Step 4 — Build the Capacity Allocation Model

```
Recommended capacity allocation (annual):
  Strategic initiatives:    50–60% of effective capacity
  Foundational/platform:    15–20%
  Operational/maintenance:  20–25% (already excluded from effective capacity above)
  Exploratory/R&D:          5–10%

Sum of planned initiatives must not exceed available effective capacity.
If it does: initiatives must be cut, deferred, or headcount added.
```

### Step 5 — Detect Overcommitment

```
Load ratio = Sum of planned initiative person-weeks ÷ Effective capacity

  ≤ 0.85: Healthy — 15% buffer for unplanned work
  0.85–1.0: At limit — any surprise causes slippage
  > 1.0: Overcommitted — guaranteed misses; reduce scope before communicating to leadership
```

---

## Decision Tree

```
What does the annual capacity analysis reveal?

├── OVERCOMMITMENT (load ratio > 1.0)
│   └── This must be resolved before the plan is published — not after
│       Calculate: How many person-weeks over capacity?
│       Options in order:
│         1. Defer lowest-value initiatives
│         2. Reduce scope of largest initiatives (MVP approach)
│         3. Add headcount (if approved; factor in ramp time — typically 2–3 months)
│         4. Extend timeline (shift delivery to next year)
│       Do NOT: Publish an overcommitted plan and "hope it works out"
│       → Invoke: skills/strategy/capacity-planning.md for detailed allocation
│       → Invoke: skills/product/opportunity-cost.md to rank deferrals by cost

├── STRATEGY-EXECUTION GAP (company bet with no engineering coverage)
│   └── Surface immediately: "Bet '{{X}}' has no engineering initiative supporting it.
│       Achieving this requires approximately {{N}} person-weeks.
│       Current plan has no capacity for this. Decision required."
│       → Invoke: skills/executive/investment-proposal.md to formalize the ask

├── INITIATIVE WITHOUT STRATEGIC MAPPING
│   └── Question each unmapped initiative: Why is this in the plan?
│       If no strong justification: defer or remove
│       If valid: map to an OKR or accept as explicit operational investment
│       → Invoke: skills/product/okr-alignment.md to check full alignment score

├── CARRY-FORWARD ITEMS CONSUMING NEW CAPACITY
│   └── Treat as existing debt against new capacity — not as "free"
│       Calculate: Carry-forward work as % of Year 1 effective capacity
│       If > 20%: flag — year starts behind before any new work begins

└── PLAN IS REALISTIC (load ratio ≤ 0.85, all bets covered)
    └── Document the plan with explicit deferred items list
        Present confidence level per initiative using Now/Next/Later framework:
          H1 initiatives: High confidence
          H2 initiatives: Medium confidence (conditions may change)
        → Invoke: skills/executive/annual-planning.md to prepare executive presentation
```

---

## Output

### Annual Engineering Plan

```
ANNUAL ENGINEERING PLAN — {{Year}} — {{Team}} — {{date}}

EXECUTIVE SUMMARY
Strategy alignment: {{N}}% of company bets have engineering coverage
Available capacity: {{N}} person-weeks (effective, accuracy-adjusted)
Planned capacity: {{N}} person-weeks
Load ratio: {{N}} | {{🟢 Healthy | 🟡 At limit | 🔴 Overcommitted}}
Confidence: {{High | Medium | Low}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAPACITY MODEL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineers: {{N}} | Effective weeks/person: {{N}} | Maintenance load: {{N}}%
Gross capacity: {{N}} person-weeks
Historical accuracy rate: {{N}}%
Effective delivery capacity: {{N}} person-weeks

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INITIATIVE PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Priority | Initiative          | Weeks | Type        | OKR    | H1/H2 | Confidence
1        | {{initiative}}      | {{N}} | Strategic   | {{OKR}} | H1   | High
2        | {{initiative}}      | {{N}} | Foundational| {{OKR}} | H1   | High
3        | {{initiative}}      | {{N}} | Strategic   | {{OKR}} | H2   | Medium
...

Capacity used: {{N}} person-weeks ({{N}}% of effective capacity)
Buffer remaining: {{N}} person-weeks ({{N}}%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WHAT IS NOT IN THIS PLAN (and why)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Initiative}}: Deferred — lower strategic value than {{higher-priority item}} ({{N}} person-weeks)
{{Initiative}}: Out of scope — requires capability not available until {{date}}
{{Initiative}}: Moved to H2 replan — dependent on {{condition}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Strategy gap, overcommitment, or carry-forward risk}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Capacity calculated with accuracy correction | Base: 65% |
| All company bets mapped to engineering initiatives | +15% |
| Load ratio ≤ 0.85 (buffer maintained) | +10% |
| Deferred items explicitly documented | +10% |
| Historical delivery data used for calibration | +5% |
| Capacity not calculated (headcount only) | −25% |
| No deferred items list (plan implies everything fits) | −15% |
| No OKR mapping | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Headcount ≠ capacity** | Plan uses "8 engineers × 52 weeks" without adjustments | Always subtract PTO, ceremonies, maintenance load, and apply accuracy correction. |
| **No explicit deferrals** | Plan appears complete; missing items are invisible | Every annual plan must name what was cut and why. Omissions are strategic choices. |
| **H2 confidence inflation** | H2 items shown at same confidence as H1 | H2 is Medium confidence by definition. Plans change. Don't overcommit the second half. |
| **No strategy-execution gap check** | Company bets exist with no engineering investment | Run the two-directional check: roadmap → OKR and OKR → roadmap. |
| **Carry-forward ignored** | Prior-year incomplete work treated as zero | Carry-forward consumes Year N capacity. Account for it before planning Year N+1. |

---

## References

- `skills/strategy/capacity-planning.md` — Detailed capacity allocation and shortage detection
- `skills/strategy/investment-planning.md` — Investment portfolio construction for the year
- `skills/product/okr-alignment.md` — OKR coverage check for all planned initiatives
- `skills/executive/annual-planning.md` — Executive presentation of the annual plan

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/capacity-planning.md` | Annual plan requires capacity model as foundation |
| `skills/strategy/investment-planning.md` | Investment allocation decisions within annual plan |
| `skills/product/okr-alignment.md` | Alignment score validates strategy coverage |
| `skills/strategy/risk-planning.md` | Annual risk register feeds into plan confidence |
| `skills/executive/annual-planning.md` | Presentation layer for the annual plan output |
