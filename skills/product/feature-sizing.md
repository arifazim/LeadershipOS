# Skill: Feature Sizing

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint planning + Roadmap planning + On-demand (investment proposal, scope decision)

---

## Purpose

Produce reliable feature size estimates — translating "how big is this?" into calendar time and business cost with calibrated confidence — so that roadmap commitments are grounded in reality, not optimism.

**What the EM does automatically**: Given a feature description, the EM:
1. Applies a sizing framework to produce a range estimate (not a point estimate)
2. Applies a historical accuracy correction
3. Converts to calendar time accounting for team velocity and maintenance load
4. Surfaces hidden complexity that inflates estimates
5. Flags when a size estimate is unjustifiably confident

The most expensive thing in engineering is committing to estimates that turn out to be wrong. The second most expensive is refusing to estimate because of that fear. The right answer is calibrated estimates with explicit uncertainty.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Feature description** | What needs to be built, in enough detail to identify complexity |
| **Team velocity** | Story points per sprint or person-weeks per sprint (historical average) |
| **Historical accuracy** | How does the team's actual delivery compare to estimates? |
| **Team composition** | Who is available — how many engineers, what seniority mix |

### Optional
| Input | Description |
|---|---|
| **Similar past features** | Comparable work the team has done before (best calibration data) |
| **Known unknowns** | Technical uncertainty, dependencies, or unclear requirements |
| **Maintenance load** | % of capacity consumed by keep-lights-on work |
| **Sprint ceremonies** | Time lost to planning, retros, code review in each sprint |

---

## Analysis

### Step 1 — Apply T-Shirt Sizing First

Before story points or weeks, classify the feature:

| Size | Story points | Person-weeks | Examples |
|---|---|---|---|
| **XS** | 1–2 pts | <0.5 weeks | Bug fix, copy change, minor UI tweak |
| **S** | 3–5 pts | 0.5–1 week | Small feature, config change, simple integration |
| **M** | 8–13 pts | 1–3 weeks | Medium feature, API endpoint, dashboard component |
| **L** | 20–40 pts | 3–6 weeks | Complex feature, multi-component, third-party integration |
| **XL** | 40–80 pts | 6–12 weeks | Major feature, new product area, platform change |
| **XXL** | >80 pts | >12 weeks | Should be broken down — estimates this large have very low confidence |

**Rule**: Any estimate >40 story points should be broken down. The larger the estimate, the more confidence degrades.

### Step 2 — Apply Complexity Multipliers

Base estimates assume well-understood, clean-slate work. Apply multipliers for common complexity factors:

| Complexity factor | Multiplier | When to apply |
|---|---|---|
| Unclear or incomplete requirements | 1.3× | When acceptance criteria aren't defined |
| Third-party integration | 1.25× | Any external API or service dependency |
| Legacy system interaction | 1.5× | Working in old codebase with poor test coverage |
| Multiple team dependency | 1.4× | Work requires another team's contribution |
| Security or compliance review needed | 1.3× | Legal/security must sign off before launch |
| First time implementing this type of work | 1.4× | Team hasn't built this kind of feature before |
| Multiple factors above | Multiply (not add) | 1.3 × 1.25 × 1.5 = 2.4× is realistic |

### Step 3 — Apply Historical Accuracy Correction

```
Corrected estimate = Base estimate ÷ Historical accuracy rate

Historical accuracy rate = (actual delivery) ÷ (estimated delivery), averaged over 4+ sprints

Example: Team estimates 40 pts/sprint; delivers 32 pts on average
  Historical accuracy = 32 ÷ 40 = 0.80

Corrected estimate = XL feature (8 weeks base) ÷ 0.80 = 10 weeks realistic
```

### Step 4 — Convert to Calendar Time

```
Calendar time = (Person-weeks of work) ÷ (Effective team capacity per week)

Effective capacity per week = Team size × (1 - maintenance load) × (1 - ceremony overhead)

Typical parameters:
  Maintenance load: 25–40% (keep-lights-on, support, on-call)
  Ceremony overhead: 10–15% (standups, planning, retro, code review)

Example: 3-engineer team, 30% maintenance, 10% ceremonies
  Effective capacity = 3 × (1 - 0.30) × (1 - 0.10) = 1.89 engineer-weeks/week
  For an 8-person-week feature: calendar time = 8 ÷ 1.89 = ~4.2 weeks
```

### Step 5 — Produce the Range Estimate

Never give a single point estimate for roadmap planning. Always give a range:

```
Optimistic (10th percentile): Base estimate × 0.8
Most likely (50th percentile): Base estimate (corrected for accuracy)
Pessimistic (90th percentile): Base estimate × 1.5 (for L/XL) or × 1.3 (for S/M)

Present as: "This is a {{size}} feature. Expect {{N}}–{{N}} weeks. Most likely: {{N}} weeks."
```

---

## Decision Tree

```
What is the sizing context?

├── SPRINT PLANNING (sizing candidate stories)
│   └── Apply T-shirt sizing to all candidates before committing
│       Check: Total committed size ≤ (team velocity × accuracy rate)
│       Flag: Any story >13 pts → break it down before committing
│       Auto-surface: "Sprint capacity is {{N}} pts. Current committed stories = {{N}} pts.
│       {{Over/At/Under}} capacity. Recommend: {{action}}"

├── QUARTERLY ROADMAP PLANNING
│   └── Apply sizing to all initiatives
│       Apply complexity multipliers
│       Calculate calendar time per initiative
│       Check: Does the sequence fit the quarter?
│       → Invoke: skills/product/roadmap-health.md for capacity realism check
│       Flag: Any XXL estimate — it must be broken down before it can be roadmapped

├── INVESTMENT PROPOSAL (how much will this cost?)
│   └── Convert to fully loaded cost for the business case
│       "This is an L feature: 4–6 weeks, 2 engineers = 8–12 person-weeks
│        Fully loaded cost: 10 person-weeks × $4,000/week = $40,000"
│       → Invoke: skills/product/value-vs-cost.md to frame against expected value

└── SCOPE DECISION (can we reduce the size to fit capacity?)
    └── Identify the MVP version: what is the minimum scope to deliver the Must value?
        Calculate: Size of MVP version
        Present: "Full feature = {{N}} weeks. MVP version = {{N}} weeks.
        MVP delivers {{N}}% of the value at {{N}}% of the cost."
        → Invoke: skills/product/moscow-prioritization.md to classify full vs. MVP scope
```

---

## Output

### Feature Sizing Report

```
FEATURE SIZING — {{Feature name}} — {{date}}

T-SHIRT SIZE: {{XS | S | M | L | XL | XXL}}
BASE ESTIMATE: {{N}} person-weeks

COMPLEXITY FACTORS
{{Factor}}: ×{{multiplier}} — reason: {{why}}
{{Factor}}: ×{{multiplier}}
Combined multiplier: ×{{N}}

ADJUSTED ESTIMATE: {{N}} person-weeks (base × {{N}})

HISTORICAL ACCURACY CORRECTION
Team accuracy rate: {{N}}% ({{N}}-sprint average)
Accuracy-corrected estimate: {{N}} person-weeks

CALENDAR TIME
Effective capacity: {{N}} engineer-weeks/calendar-week (team: {{N}}, maintenance: {{N}}%, ceremonies: {{N}}%)
Calendar duration: {{N}}–{{N}} weeks (range)

ESTIMATE RANGE
Optimistic: {{N}} weeks
Most likely: {{N}} weeks  ← Use this for roadmap planning
Pessimistic: {{N}} weeks

FULLY LOADED COST
Most likely: {{N}} person-weeks × ${{rate}}/week = ${{X}}
Range: ${{X}}–${{X}}

FLAGS
⚠️ {{Complexity factor flagged as hidden risk}}
⚠️ {{Any estimate >40 pts: "Break this down before committing"}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Range estimate produced (not point estimate) | Base: 65% |
| Historical accuracy correction applied | +15% |
| Complexity multipliers applied | +10% |
| Calendar time calculated with effective capacity | +10% |
| Similar past work used as calibration reference | +5% |
| Point estimate only (no range) | −20% |
| No accuracy correction | −15% |
| XXL feature estimated without breakdown | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Point estimate presented** | "This takes 3 weeks" without a range | Always give a range. Confidence in estimates decreases with size. |
| **No accuracy correction** | Estimates don't account for historical overestimation | Calculate team accuracy rate. Apply it to every estimate. |
| **Complexity factors ignored** | Legacy codebase + unclear requirements → 1× multiplier | Apply multipliers systematically. They prevent post-sprint surprises. |
| **XXL estimates committed** | Roadmap has items estimated at 3 months without breakdown | Anything >12 weeks must be broken down. Large estimates hide massive uncertainty. |
| **Maintenance load excluded** | Estimates assume 100% of team capacity is available | Always subtract maintenance load and ceremony time from available capacity. |

---

## References

- `skills/product/value-vs-cost.md` — Feature cost is the input to value/cost analysis
- `skills/product/moscow-prioritization.md` — Size drives Must/Should/Could classification when capacity is constrained
- `skills/product/opportunity-cost.md` — Effort feeds the delay period in opportunity cost

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/value-vs-cost.md` | Size → cost → value/cost ratio |
| `skills/product/rice-scoring.md` | Effort variable in RICE comes from feature sizing |
| `skills/product/opportunity-cost.md` | Sizing determines the delay period for alternatives |
| `skills/product/roadmap-health.md` | Capacity realism check requires sizing data |
