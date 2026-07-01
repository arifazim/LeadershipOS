# Skill: Value vs. Cost

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint planning + Investment decisions + On-demand (build vs. buy, tech debt)

---

## Purpose

Calculate the value/cost ratio of engineering investments and automatically surface low-ratio items as candidates for deferral, descoping, or removal — while identifying high-ratio opportunities that are being underinvested.

**What the EM does automatically**: For every significant engineering investment, the EM calculates the value/cost ratio and flags items where the investment is not earning its place in the roadmap. The EM never presents a cost without a value, and never presents a value without anchoring it to what the engineering work costs to produce.

**The business value imperative**: Engineering cost is always visible (salaries, infrastructure, sprint capacity). Engineering value is often invisible unless someone makes it explicit. The EM who makes value visible earns more trust, more investment, and more influence over what gets built.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Feature or investment** | What engineering work is being evaluated |
| **Engineering cost** | Fully loaded cost: person-weeks × loaded engineer rate |
| **Expected business value** | Revenue enabled, cost avoided, risk reduced, or churn prevented |
| **Time to value** | How long from engineering completion to value realization |

### Optional
| Input | Description |
|---|---|
| **Value confidence** | How certain is the business value estimate (0.0–1.0) |
| **Cost confidence** | How certain is the effort estimate (0.0–1.0) |
| **Recurring vs. one-time** | Is the value a one-time event or ongoing monthly/annual |
| **Risk-adjusted value** | Alternative calculations under pessimistic scenario |

---

## Analysis

### Step 1 — Estimate Engineering Cost

```
Engineering cost = Person-weeks × Fully loaded engineer cost per week

Fully loaded cost benchmarks (2025):
  Senior engineer:     $3,500–$5,000/week (fully loaded)
  Mid-level engineer:  $2,500–$3,500/week
  Junior engineer:     $1,500–$2,500/week

Conservative default: $4,000/week/engineer if specific data unavailable

Example: 3-engineer team, 4 weeks
  Cost = 3 × 4 × $4,000 = $48,000
```

### Step 2 — Estimate Business Value

Value sources and estimation methods:

| Value type | Estimation method |
|---|---|
| **Revenue enabled** | ARR or deal value enabled by this feature |
| **Revenue protected** | Churn risk × customer ARR × confidence |
| **Cost avoided** | Manual work hours saved × loaded labor cost |
| **Incident cost avoided** | (P1 frequency reduction) × (avg incident cost) |
| **Conversion improvement** | Traffic × conversion lift × average order value |
| **Support cost reduction** | Ticket reduction × cost per ticket |

### Step 3 — Calculate Value/Cost Ratio

```
Value/Cost ratio = Expected annual value ÷ Engineering cost

One-time value: ratio = value ÷ cost
Recurring value: ratio = (monthly value × 12) ÷ cost

Interpretation:
  Ratio > 3:    Strong investment — high return on engineering
  Ratio 1–3:    Reasonable investment — proceed
  Ratio 0.5–1:  Marginal — scrutinize; consider alternatives
  Ratio < 0.5:  Weak — recommend deferral or scope reduction
```

### Step 4 — Auto-Flag Investment Categories

**High value, low cost** (Quick wins — accelerate):
```
Annual value > 3× engineering cost
→ "This is a quick win. RICE score is high. Consider pulling forward."
```

**High value, high cost** (Strategic investments — validate before committing):
```
Annual value > 3× engineering cost but cost > $100K
→ "This is a strategic investment. Value is strong but requires validation.
   Run a spike or prototype before full commitment."
```

**Low value, low cost** (Nice-to-haves — deprioritize):
```
Annual value < 1× engineering cost, cost < $20K
→ "This is a nice-to-have. Not worth the prioritization attention it's getting.
   Move to backlog; schedule when there's genuine slack."
```

**Low value, high cost** (Cut candidates — always flag):
```
Annual value < 1× engineering cost, cost > $50K
→ "This is a cut candidate. Engineering cost exceeds expected business return.
   Requires justification or removal from plan."
```

---

## Decision Tree

```
What is the value/cost scenario?

├── LOW-VALUE, HIGH-COST ITEM ON ROADMAP
│   └── Immediate flag: "{{Item}} has a value/cost ratio of {{N}}. Engineering cost
│       is {{$X}}; expected annual value is {{$Y}}. This is a cut candidate."
│       Options: Remove / Reduce scope to improve ratio / Validate value estimate
│       Present to PM: "I want to challenge this item's position on the roadmap.
│       Here is the math. Can we discuss the business case?"
│       → Invoke: skills/product/opportunity-cost.md — what else could this capacity build?

├── HIGH-VALUE, LOW-COST ITEM IN BACKLOG
│   └── Auto-flag: "{{Item}} has a value/cost ratio of {{N}}.
│       It's a {{N}}-week project with estimated ${{X}} annual value.
│       This is a quick win. Recommend pulling forward."
│       Present to PM: Pull-forward recommendation with the math

├── TECH DEBT OR RELIABILITY INVESTMENT
│   └── Value frame: Translate to cost avoided
│       "This reliability investment reduces P1 frequency by {{N}}%.
│       At {{N}} P1s/quarter, each costing ${{X}}, that's ${{Y}}/year avoided.
│       Cost: ${{Z}}. Ratio: {{N}}. Payback: {{N}} months."
│       → Invoke: skills/product/opportunity-cost.md for the feature deferral cost

├── BUILD VS. BUY DECISION
│   └── Compare: Build cost vs. Buy cost (subscription × years + integration cost)
│       Calculate: At what year does build become cheaper than buy?
│       Factor in: Maintenance cost, vendor lock-in risk, control
│       Present: "Build costs ${{X}} upfront. Buy costs ${{Y}}/year.
│       Break-even is {{N}} years. Buy wins if we use this for <{{N}} years."

└── ESTIMATING VALUE FOR AN UNPROVEN FEATURE
    └── Use the uncertainty adjustment:
        Conservative value = Optimistic estimate × 0.4
        Base value = Optimistic estimate × 0.6
        Present: "If this performs as expected, value is ${{X}}/month.
        At 0.6 confidence, expected value is ${{Y}}/month. Ratio: {{N}}."
```

---

## Output

### Value vs. Cost Analysis

```
VALUE vs. COST ANALYSIS — {{Feature / Investment}} — {{date}}

INVESTMENT
Engineering cost: ${{X}} ({{N}} person-weeks × ${{rate}}/week)
Cost confidence: {{High | Medium | Low}} — {{rationale}}

VALUE
Value type: {{Revenue enabled | Cost avoided | Churn prevented | Conversion improvement}}
Expected value: ${{X}}/month (or ${{X}} one-time)
Annual value: ${{X}}
Value confidence: {{N}} — {{rationale / data source}}
Time to value: {{N}} months from engineering completion

VALUE/COST RATIO: {{N}}
Signal: {{🟢 Strong (>3) | 🟡 Reasonable (1-3) | 🟠 Marginal (0.5-1) | 🔴 Weak (<0.5)}}

PAYBACK PERIOD: {{N}} months
Break-even: {{date}}

RISK-ADJUSTED VALUE: ${{X}} (base case × {{confidence}} confidence)

RECOMMENDATION: {{Proceed / Validate first / Reduce scope / Defer / Remove}}
Rationale: {{one sentence}}

COMPARISON
Next-best-alternative for this capacity: {{item}} | Value/cost: {{N}}
Opportunity cost of choosing this over alternative: ${{X}}
```

---

## Example

```
VALUE vs. COST ANALYSIS — Automated Onboarding Emails — July 1, 2025

INVESTMENT
Engineering cost: $32,000 (2 person-weeks × 2 engineers × $4,000/week)
Cost confidence: Medium — onboarding flow is well-understood

VALUE
Value type: Churn prevention + conversion improvement
Expected value: $15,000/month
  - 200 signups/month × 15% who currently churn in week 1 × $50 ARPU × 12 months
  - Assumed 25% reduction in week-1 churn from automated onboarding
Annual value: $180,000
Value confidence: 0.6 — no A/B test; based on industry benchmark 20–30% churn reduction
Time to value: 2 weeks (quick to instrument)

VALUE/COST RATIO: 5.6 ($180K ÷ $32K)
Signal: 🟢 Strong

PAYBACK PERIOD: 2.1 months
Break-even: September 2025

RISK-ADJUSTED VALUE: $108,000/year ($180K × 0.6)

RECOMMENDATION: Proceed — strong ratio even under conservative assumptions
Rationale: Risk-adjusted ratio still exceeds 3. Quick to build and instrument.

COMPARISON
Next-best-alternative: Enhanced search filters | Value/cost: 2.1
Opportunity cost: $6,300 (search filters deferred 2 weeks = $5,250/month × 0.5 months × 0.6 conf × 40% of their value = small)
→ Onboarding emails win clearly.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Engineering cost calculated with fully loaded rate | Base: 65% |
| Value estimate has named source or data | +15% |
| Value/cost ratio calculated explicitly | +10% |
| Payback period calculated | +10% |
| Cut candidates flagged automatically | +5% |
| Cost is salary-only (not fully loaded) | −20% |
| Value is "intangible" with no estimate attempted | −20% |
| Ratio calculated but no recommendation produced | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Salary-only cost** | Engineering cost uses base salary, not fully loaded | Apply 1.3–1.5× multiplier for benefits, overhead, tooling. |
| **No value estimate** | "This is important" without a number | Attempt an estimate. A rough $X is better than "intangible." |
| **No payback calculation** | Ratio is calculated but decision window is unknown | Calculate break-even. Ratio alone doesn't show when the investment pays back. |
| **Weak items not challenged** | Low-ratio items stay on the roadmap unchallenged | Auto-flag every item with ratio < 1.0. Surface it to PM with the math. |
| **Value optimism** | Estimates consistently higher than actuals | Track forecast vs. actual value quarterly. Recalibrate confidence multipliers. |

---

## References

- `skills/product/rice-scoring.md` — RICE impact/effort ratio is a form of value/cost
- `skills/product/opportunity-cost.md` — What else could the capacity build?
- `skills/executive/investment-proposal.md` — Formal investment case using this analysis
- `docs/engineering-playbook.md` → Prioritization section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/rice-scoring.md` | RICE is a normalized value/cost metric |
| `skills/product/opportunity-cost.md` | Low-ratio items have a high opportunity cost |
| `skills/product/feature-sizing.md` | Effort estimates feed the cost side |
| `skills/executive/investment-proposal.md` | High-cost items need formal investment framing |
