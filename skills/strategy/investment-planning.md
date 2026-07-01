# Skill: Investment Planning

**Domain**: Strategy
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (portfolio construction) + Quarterly (rebalance) + On-demand (new investment proposal)

---

## Purpose

Build and manage the engineering investment portfolio — allocating capacity and budget across strategic, foundational, operational, and innovation categories — so that every dollar and every engineering week earns its place in the plan with a measurable return.

**What the EM does automatically**: When constructing or reviewing the investment plan, the EM:
1. Categorizes every investment by type and time horizon
2. Calculates the value/cost ratio for each significant investment
3. Detects portfolio imbalance (over-invested in operations, under-invested in strategy)
4. Flags investments with negative expected ROI or unbounded cost
5. Tracks actual returns against forecast, recalibrating future estimates

Engineering organizations that don't manage investment portfolios make the same mistake every year: they chronically underinvest in foundation and overinvest in tactical firefighting, then wonder why they can't accelerate.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **All planned engineering work** | Every initiative, project, and operational category |
| **Estimated effort** | Person-weeks per initiative |
| **Fully loaded engineer cost** | Loaded cost per engineer-week ($3,500–$5,000 for senior, $4,000 default) |
| **Expected business value** | Revenue enabled, cost avoided, or risk reduced per initiative |

### Optional
| Input | Description |
|---|---|
| **Prior year investment actuals** | What was actually spent vs. planned; actual returns delivered |
| **Competitor investment signals** | Where competitors are investing engineering capacity |
| **Technical debt severity** | Severity and cost of unaddressed technical debt |
| **Innovation pipeline** | Early-stage R&D bets under consideration |

---

## Analysis

### Step 1 — Categorize the Investment Portfolio

Every engineering investment fits one of four categories:

| Category | Definition | Target allocation | ROI horizon |
|---|---|---|---|
| **Strategic** | Enables new revenue or protects existing ARR | 50–60% | 1–3 quarters |
| **Foundational** | Reduces future delivery cost; enables strategic work | 15–20% | 2–6 quarters |
| **Operational** | Keeps systems running; prevents value destruction | 20–25% | Ongoing (cost avoidance) |
| **Exploratory** | R&D bets with uncertain but potentially high upside | 5–10% | 4–8 quarters |

**Portfolio health check**: If Operational exceeds 30% of investment, the organization is in maintenance mode and losing strategic ground. If Exploratory is 0%, the organization has no innovation pipeline.

### Step 2 — Calculate Investment ROI

```
ROI per investment = (Expected annual value − Engineering cost) ÷ Engineering cost × 100%

Value types:
  Revenue enabled: ARR or deal value unlocked
  Churn prevented: Customers × ARPU × Churn reduction %
  Cost avoided: Manual hours × loaded labor cost; incident reduction × avg incident cost
  Delivery acceleration: Time-to-market reduction × monthly revenue × market window

Payback period = Engineering cost ÷ Monthly value
  <3 months: Excellent
  3–6 months: Good
  6–12 months: Acceptable
  >12 months: Scrutinize — long-horizon investments need strong strategic justification
```

### Step 3 — Detect Portfolio Imbalance

Auto-flag these imbalance patterns:

| Pattern | Threshold | Risk | Recommended rebalance |
|---|---|---|---|
| Operational overweight | >30% of investment | Team in maintenance mode; strategic atrophy | Reduce operational load through automation or platform investment |
| Strategic underweight | <40% of investment | Missing growth opportunities | Identify and add strategic initiatives; review what is crowding them out |
| No exploratory investment | 0% in R&D | No innovation pipeline; strategic surprise risk in 2–3 years | Allocate time-boxed R&D capacity (even 5% compounds) |
| Low foundational investment | <10% | Technical debt accumulating; future delivery increasingly expensive | Schedule foundational investment before strategic velocity degrades |
| Concentrated portfolio | One initiative >40% of total investment | Single point of failure; if it misses, the whole plan misses | Diversify; no single initiative should dominate annual investment |

### Step 4 — Build the Investment Accountability Model

Every investment must have:
- Named owner (not "team")
- Measurable success criterion (not "improve performance")
- Review gate (quarterly check-in: is the investment delivering?)
- Kill criteria (at what point do we stop if value isn't materializing?)

---

## Decision Tree

```
What does the investment portfolio analysis reveal?

├── OPERATIONAL WEIGHT > 30%
│   └── Root cause analysis: Why is so much capacity in operations?
│       Likely causes: Technical debt, poor on-call hygiene, lack of automation
│       Recommendation: Foundation investment to reduce operational load
│       Frame: "We are spending {{N}}% of engineering investment on operations.
│       Industry target is 20–25%. This is costing us {{N}} person-weeks/quarter
│       in strategic capacity. Recommend {{N}} weeks of platform/automation work
│       to reclaim {{N}} weeks annually."
│       → Invoke: skills/strategy/platform-strategy.md
│       → Invoke: skills/quality/assess-tech-debt.md

├── LOW-ROI INVESTMENT ON PLAN (payback > 12 months, ratio < 1.0)
│   └── Challenge the investment: Is the value estimate defensible?
│       Options: Reduce scope / Phase the investment / Remove
│       Frame: "{{Initiative}} has a {{N}}× value/cost ratio and {{N}}-month payback.
│       This is below threshold. Recommend scope reduction or deferral."
│       → Invoke: skills/product/value-vs-cost.md

├── NO EXPLORATORY INVESTMENT
│   └── Flag: "Engineering has no R&D allocation. Innovation pipeline is empty.
│       In 2–3 years, competitors with exploratory investment will have
│       capabilities we cannot match without a catch-up investment."
│       Recommendation: Allocate 5% of engineering capacity to time-boxed R&D
│       → Invoke: skills/strategy/innovation-roadmap.md

├── FOUNDATIONAL INVESTMENT CROWDED OUT
│   └── Calculate: Technical debt cost accumulation rate
│       Frame: "We deferred {{N}} weeks of foundational investment last year.
│       Estimated delivery cost increase: {{N}}% (slower builds, more incidents).
│       Deferring again adds {{$X}} in compounding debt service cost."
│       → Invoke: skills/strategy/platform-strategy.md

└── PORTFOLIO IS BALANCED (all categories within target)
    └── Publish investment plan with per-initiative accountability
        Set quarterly review gates for investments >$50K equivalent
        Track forecast vs. actual value quarterly
```

---

## Output

### Investment Portfolio

```
INVESTMENT PORTFOLIO — {{Year/Quarter}} — {{Team}} — {{date}}

PORTFOLIO SUMMARY
Total investment: {{N}} person-weeks | ${{X}} fully loaded
  Strategic:     {{N}}w ({{N}}%) | Target: 50–60% | {{🟢/🟡/🔴}}
  Foundational:  {{N}}w ({{N}}%) | Target: 15–20% | {{🟢/🟡/🔴}}
  Operational:   {{N}}w ({{N}}%) | Target: 20–25% | {{🟢/🟡/🔴}}
  Exploratory:   {{N}}w ({{N}}%) | Target: 5–10%  | {{🟢/🟡/🔴}}

Portfolio health: {{Balanced 🟢 | Rebalance needed 🟡 | Imbalanced 🔴}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INVESTMENT REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Initiative      | Category   | Weeks | Cost    | Value/yr | Ratio | Payback | Owner
{{initiative}}  | Strategic  | {{N}} | ${{X}}  | ${{X}}   | {{N}}× | {{N}}mo | {{name}}
{{initiative}}  | Foundation | {{N}} | ${{X}}  | ${{X}}   | {{N}}× | {{N}}mo | {{name}}
{{initiative}}  | Exploratory| {{N}} | ${{X}}  | TBD      | TBD    | TBD     | {{name}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FLAGS AND RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Category imbalance or low-ROI investment}}
🔴 {{Cut candidate or kill recommendation}}
🚀 {{High-ROI quick win to accelerate}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Portfolio categorized with target allocations | Base: 65% |
| ROI calculated per investment | +15% |
| Portfolio imbalance detected and flagged | +10% |
| Payback period calculated | +10% |
| Kill criteria defined for each investment | +5% |
| No ROI calculation (effort only) | −25% |
| No category allocation check | −15% |
| No accountability owner per investment | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No portfolio view** | Investments evaluated individually, not as a portfolio | Always build the full portfolio view. Individual investments look reasonable; the portfolio reveals imbalance. |
| **Operational crowding** | Operational work consumes ever-increasing share of capacity | Treat operational load as a system to fix, not a constant. Platform and automation investment reclaims capacity. |
| **No kill criteria** | Investments continue past their value window because "we've already started" | Define kill criteria at investment inception. Sunk cost is not a reason to continue. |
| **Value forecast not tracked** | Business case value estimates are made and never measured | Track forecast vs. actual value quarterly. Recalibrate confidence for future estimates. |
| **Exploratory investment = zero** | R&D line absent from portfolio | Protect exploratory investment even when under capacity pressure. This is the organization's future capability. |

---

## References

- `skills/strategy/annual-planning.md` — Annual plan frames the investment envelope
- `skills/strategy/platform-strategy.md` — Platform investment is the primary lever for reducing operational load
- `skills/strategy/innovation-roadmap.md` — Exploratory investments originate in innovation roadmap
- `skills/product/value-vs-cost.md` — Per-investment ROI calculation methodology
- `skills/executive/investment-proposal.md` — Formal proposal for high-cost investments

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/annual-planning.md` | Annual plan establishes investment envelope |
| `skills/strategy/platform-strategy.md` | Platform is the key foundational investment category |
| `skills/product/value-vs-cost.md` | ROI calculation methodology |
| `skills/executive/investment-proposal.md` | Formalizes individual investment proposals |
| `skills/strategy/innovation-roadmap.md` | Exploratory investment portfolio |
