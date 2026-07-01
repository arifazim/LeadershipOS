# Skill: Roadmap Health

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly (monitoring) + Quarterly (full assessment) + On-demand (milestone risk)

---

## Purpose

Assess the health of the engineering roadmap — detecting misalignment between roadmap content and company strategy, sequencing problems, confidence gaps, and capacity reality — and automatically surfacing what needs to change before it's too late to change it.

**What the EM does automatically**: Without being asked, the EM monitors the roadmap and alerts when:
- A roadmap item has no OKR mapping (strategy gap)
- The plan requires more capacity than is available (capacity mismatch)
- High-RICE items are sequenced behind low-RICE items (value inversion)
- Confidence is uniformly high for far-future items (false precision)
- A Must item has no owner or unclear delivery path (execution risk)

A healthy roadmap is not one where everything is Green. It's one where problems are visible early enough to act on them.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Current roadmap** | All committed and targeted items with owners, dates, and confidence |
| **Company OKRs or strategy bets** | The strategic priorities that the roadmap should serve |
| **Team capacity** | Available engineering capacity by quarter |
| **Current delivery data** | Actual vs. plan from the last 2–4 quarters (accuracy baseline) |

### Optional
| Input | Description |
|---|---|
| **RICE scores** | Value rankings for roadmap items |
| **Dependency map** | Cross-team dependencies that affect roadmap delivery |
| **Technical risk register** | Known technical risks that could affect roadmap items |

---

## Analysis

### Step 1 — Run the Five Health Checks

For each roadmap item and for the roadmap as a whole, run all five checks:

#### Check 1: OKR Alignment
```
For each roadmap item:
  Does it map to at least one company OKR or strategic bet?

Healthy: >90% of roadmap items map to an OKR
Warning: 75–90% of items have OKR mapping
Critical: <75% of items — roadmap has drift from strategy

Unmapped items are candidates for removal or deferral.
An OKR with no roadmap items is strategy without execution — flag separately.
```

#### Check 2: Capacity Realism
```
Sum of all committed item estimates ÷ Available capacity = Load ratio

Healthy: Load ratio ≤ 0.85 (15% buffer for unplanned work)
Warning: Load ratio 0.85–1.0 (no buffer — any surprise causes slippage)
Critical: Load ratio > 1.0 (committed more than capacity — guaranteed slippage)

Apply historical accuracy correction:
  If team historically delivers 80% of estimates, effective capacity = capacity × 0.8
  Adjusted load ratio = committed work ÷ effective capacity
```

#### Check 3: Confidence Distribution
```
Healthy confidence pattern:
  Now (current quarter): High confidence
  Next (next quarter):   Medium confidence  
  Later (2+ quarters):   Low confidence

Warning signals:
  High confidence uniformly across all horizons → false precision
  Low confidence in current quarter → execution risk
  Medium/Low confidence on Must items in current quarter → escalation needed
```

#### Check 4: Value Sequencing
```
Sort roadmap items by RICE score (or estimated business value)
Compare to current delivery sequence

Mismatch flag: A lower-value item is scheduled before a higher-value item,
              AND there is no technical dependency requiring that sequence.

These mismatches are candidates for re-sequencing.
```

#### Check 5: Ownership and Clarity
```
For each Must item in the current quarter:
  - Named owner? (engineer or squad responsible)
  - Clear acceptance criteria?
  - Known dependencies resolved?
  - No item older than 2 sprints without progress

Missing ownership on a Must item = delivery risk — name owner this week.
```

### Step 2 — Calculate the Roadmap Health Score

```
ROADMAP HEALTH SCORE (out of 100):

OKR alignment:      (% items with OKR mapping) × 20
Capacity realism:   If ≤0.85: 20pts | 0.85–1.0: 10pts | >1.0: 0pts
Confidence accuracy: Appropriate distribution: 20pts | Uniform high: 10pts | Low in current Q: 0pts
Value sequencing:    No inversions: 20pts | ≤2 inversions: 10pts | >2 inversions: 0pts
Ownership clarity:  All Musts owned: 20pts | 1 unowned Must: 10pts | >1 unowned: 0pts

Score interpretation:
  85–100: Healthy
  70–84:  Yellow — address before next sprint
  50–69:  Red — address this week
  <50:    Critical — roadmap is not executable as written
```

---

## Decision Tree

```
What does the roadmap health check reveal?

├── CAPACITY MISMATCH (load ratio > 1.0)
│   └── This is the highest-priority finding — everything else is secondary
│       Calculate: How many engineer-weeks over capacity?
│       Options: Reduce scope / acquire capacity / extend timeline
│       Auto-recommendation: "We are committed to {{N}} weeks of work on {{N}}
│       available. Recommend deferring [lowest-value items] totaling {{N}} weeks."
│       → Invoke: skills/product/moscow-prioritization.md to identify what to cut

├── OKR ALIGNMENT GAP (items without OKR mapping)
│   └── For each unmapped item: is this a Must? (If yes, check if OKRs need updating)
│       If not a Must: Flag for deferral or removal
│       If OKRs are wrong (outdated, not reflecting real company direction):
│         Surface to VP — the strategy-roadmap connection is broken
│       → Invoke: skills/product/okr-alignment.md for full alignment assessment

├── VALUE INVERSION (lower-value item before higher-value item)
│   └── Auto-surface: "Item [X] is scheduled before [Y] but scores [N]% lower.
│       No technical dependency requires this sequence. Recommend re-sequencing."
│       Confirm with PM before re-sequencing — there may be context not in the data
│       → Invoke: skills/product/rice-scoring.md to compare values

├── CONFIDENCE UNIFORMLY HIGH ON FAR FUTURE
│   └── Flag: "Q3 and Q4 items all show High confidence. Recommend updating to
│       Medium for Q3 and Low for Q4 — false precision erodes trust when actuals diverge."
│       Rewrite with Now/Next/Later confidence framework

└── UNOWNED MUST ITEM
    └── Immediate: Name an owner by end of week
        Frame: "{{Item}} is a Must for {{date}} with no named owner. Who owns this?"
        Do NOT: Leave ownership implicit for Must items
```

---

## Output

### Roadmap Health Dashboard

```
ROADMAP HEALTH ASSESSMENT — {{Date}} | {{Team / Product}}

OVERALL HEALTH SCORE: {{N}}/100 | {{Healthy 🟢 | Yellow 🟡 | Red 🔴 | Critical 🔴🔴}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
HEALTH CHECKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OKR Alignment:     {{N}}% items mapped | {{N}}/20 pts | {{🟢/🟡/🔴}}
  Unmapped items: {{list — candidates for removal}}
  OKRs with no roadmap items: {{list — strategy without execution}}

Capacity Realism:  Load ratio {{N}} ({{N}} committed ÷ {{N}} available) | {{N}}/20 pts | {{🟢/🟡/🔴}}
  Adjusted for {{N}}% historical accuracy: Effective load = {{N}}
  Recommendation: {{None | Defer N weeks of work}}

Confidence Dist:   {{Appropriate / Uniform-high / Low-in-current-Q}} | {{N}}/20 pts | {{🟢/🟡/🔴}}
  Items to recalibrate: {{list with suggested confidence level}}

Value Sequencing:  {{N}} inversions detected | {{N}}/20 pts | {{🟢/🟡/🔴}}
  Inversions: {{Item A (RICE: N) before Item B (RICE: N) — no technical dependency}}

Ownership Clarity: {{N}} Must items with gaps | {{N}}/20 pts | {{🟢/🟡/🔴}}
  Unowned items: {{list with urgency}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TOP 3 RECOMMENDED ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Highest priority fix — specific action}}
2. {{Second fix}}
3. {{Third fix}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All five health checks run | Base: 65% |
| Capacity calculation uses historical accuracy | +15% |
| OKR mapping checked for all items | +10% |
| Value sequence compared to RICE ranking | +10% |
| Specific recommendations produced | +5% |
| Capacity check not run | −25% |
| OKR alignment not assessed | −15% |
| Health score calculated but no recommendations | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Overloaded roadmap** | Load ratio > 1.0; everyone "knows" but no one says it | Calculate and name the load ratio. Make the overcommitment explicit. |
| **Strategy drift** | Items built that don't map to any OKR | OKR mapping is a required field for every roadmap item. |
| **False precision** | High confidence on items 6+ months out | Apply the Now/Next/Later confidence framework. Later horizon = Low confidence by definition. |
| **Invisible inversions** | Lower-value work delivered before higher-value work | RICE-sort the roadmap quarterly. Surface mismatches to PM. |
| **Health check as retrospective** | Roadmap assessed after a miss | Run weekly monitoring. Roadmap health is a leading indicator, not a lagging one. |

---

## References

- `skills/product/okr-alignment.md` — Full OKR mapping assessment
- `skills/product/rice-scoring.md` — Value sequencing analysis
- `skills/product/moscow-prioritization.md` — Scope reduction when capacity is exceeded
- `skills/presentation/roadmap-presentation.md` — Presenting roadmap health to stakeholders

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/okr-alignment.md` | Alignment check feeds into roadmap health score |
| `skills/product/moscow-prioritization.md` | Invoked when capacity mismatch requires cuts |
| `skills/product/rice-scoring.md` | Value sequencing requires RICE scores |
| `skills/product/opportunity-cost.md` | Inversions have an opportunity cost — quantify it |
