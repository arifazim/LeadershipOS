# Skill: RICE Scoring

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint planning + Quarterly roadmap + On-demand (feature comparison)

---

## Purpose

Score features using the RICE framework (Reach × Impact × Confidence ÷ Effort) and automatically rank competing items — so that the highest-value features rise to the top of the backlog and low-value, high-effort work is surfaced for deferral or removal.

**What the EM does automatically**: Given a feature list with minimal input data, the EM:
1. Calculates RICE scores for each item with explicit assumptions
2. Ranks by score and highlights the order mismatch against current roadmap sequence
3. Flags items that are high-effort but low-RICE (candidates for delay)
4. Flags items that are low-effort but high-RICE (candidates to accelerate)

The RICE score doesn't make the decision — it makes the trade-off visible. Two features with different RICE scores represent a known trade-off, not an obvious choice. But at least the trade-off is explicit.

---

## RICE Formula

```
RICE Score = (Reach × Impact × Confidence) ÷ Effort

Where:
  Reach     = Number of customers or users affected per period (count)
  Impact    = Business value per affected user (1–5 scale or $ estimate)
  Confidence = How certain are we about Reach and Impact? (0.0–1.0)
  Effort    = Engineering cost in person-weeks (or story points for sprints)
```

### Scoring Scales

**Impact scale** (standardized):

| Score | Meaning | Example |
|---|---|---|
| 5 | Massive — core workflow; high churn/revenue risk | Login broken for segment; checkout flow |
| 4 | High — significant workflow improvement or revenue enabler | New pricing tier; major UX improvement |
| 3 | Medium — meaningful but not critical | Dashboard enhancement; reporting feature |
| 2 | Low — nice to have; minimal workflow change | UI polish; minor convenience |
| 1 | Minimal — edge case; very few users benefit | Keyboard shortcut; obscure setting |

**Confidence scale:**

| Value | Meaning |
|---|---|
| 1.0 | High confidence — validated by data or customer research |
| 0.8 | Medium-high — multiple customer signals; some data |
| 0.6 | Medium — one or two signals; informed assumption |
| 0.4 | Low — hypothesis; no direct validation |
| 0.2 | Speculative — gut feel; no evidence |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Feature list** | The items to score and rank |
| **Reach estimate** | Affected users or customers per quarter (approximation is fine) |
| **Impact estimate** | Business value using the 1–5 scale, or $ if estimable |
| **Effort estimate** | Engineering weeks using team's historical velocity |

### Optional
| Input | Description |
|---|---|
| **Confidence signal** | Customer research, user data, or market signal |
| **Business context** | OKR or company bet this feature serves |
| **Revenue at stake** | Specific $ value if known (converts directly to Impact) |

---

## Analysis

### Step 1 — Score Each Item

For each feature, fill in all four variables. When data is unavailable, make the assumption explicit and use a conservative confidence multiplier.

```
Example calculation:
Feature: Enhanced search filters
  Reach:      2,400 users/quarter (all users who use search)
  Impact:     3 (significant workflow improvement)
  Confidence: 0.6 (multiple support requests; no formal research)
  Effort:     3 person-weeks

RICE = (2,400 × 3 × 0.6) ÷ 3 = 4,320 ÷ 3 = 1,440
```

### Step 2 — Rank and Detect Order Mismatches

Sort all features by RICE score. Compare to current roadmap sequence.

**Mismatch detection rules:**
- Item with RICE score >2× the item above it in the roadmap → flag as sequencing candidate
- Item with RICE score in bottom quartile but scheduled in next sprint → flag as delay candidate
- Item with RICE score in top quartile but scheduled 2+ quarters out → flag as acceleration candidate

### Step 3 — Auto-Flag Delay Candidates

**Delay candidate criteria** (any one triggers a flag):
```
RICE score < 500 AND effort > 4 person-weeks → high cost, low return — recommend delay
RICE score in bottom 25% of ranked list AND not a Must → recommend delay
Confidence ≤ 0.4 → validate before building — de-risk before scheduling
```

**Acceleration candidate criteria:**
```
RICE score > 2× median AND effort < 2 person-weeks → quick win — recommend accelerating
RICE score in top 25% AND currently 2+ sprints out → consider pulling forward
```

### Step 4 — Estimate Business Value

When a dollar value can be estimated, convert RICE to expected value:

```
Expected value = Reach × (Revenue per affected user) × Confidence

Example:
Feature: Reduce checkout abandonment by 15%
  Reach:      4,000 transactions/month affected by abandonment
  Revenue/user: $45 average order value
  Confidence: 0.7 (based on A/B test data from similar feature)

Expected value = 4,000 × $45 × 15% × 0.7 = $18,900/month
Annual value = $226,800
```

When annual expected value is calculable, it provides direct justification for engineering investment.

---

## Decision Tree

```
What is the RICE scoring context?

├── SPRINT BACKLOG RANKING
│   └── Score all candidate stories
│       Sort by RICE score
│       Fill sprint with highest-RICE stories until capacity is reached
│       Auto-flag: Any story with RICE < 200 AND effort > 2 weeks → delay candidate
│       Auto-flag: Any story where confidence ≤ 0.4 → needs validation before sprint

├── QUARTERLY ROADMAP SEQUENCING
│   └── Score all initiatives
│       Detect: Items where current sequence doesn't match RICE ranking
│       Present mismatch to PM: "Based on RICE scoring, [X] should come before [Y].
│       Here is the rationale. Do we want to re-sequence?"
│       → Invoke: skills/product/roadmap-health.md for full roadmap assessment

├── FEATURE COMPARISON (PM asks "should we build X or Y?")
│   └── Score both options
│       Calculate: RICE score for X vs. Y
│       Calculate: Opportunity cost if choosing one over the other
│       Present: "X scores [N]; Y scores [N]. At current velocity, building X
│       defers Y by [N weeks]. Y's deferred value is [$X or RICE units]."
│       → Invoke: skills/product/opportunity-cost.md for the deferral calculation

└── NEW FEATURE REQUEST ARRIVES
    └── Auto-score the request against the current backlog
        Compare: Where does it rank?
        If it outranks current Sprint/Q items: "This scores higher than [items].
        If we add it, we defer [item]. Here is the trade-off."
        If it scores lower: "This ranks below current commitments. Recommend next quarter."
```

---

## Output

### RICE Score Table

```
RICE SCORING — {{Sprint N / Q{{N}} Roadmap}} — {{date}}

FEATURE RANKINGS (sorted by RICE score, highest first)

Rank | Feature              | Reach  | Impact | Conf | Effort | RICE  | Flag
 1   | {{feature}}          | {{N}}  | {{N}}  | {{N}}| {{N}}w | {{N}} | 🚀 Accelerate
 2   | {{feature}}          | {{N}}  | {{N}}  | {{N}}| {{N}}w | {{N}} |
 3   | {{feature}}          | {{N}}  | {{N}}  | {{N}}| {{N}}w | {{N}} |
 4   | {{feature}}          | {{N}}  | {{N}}  | {{N}}| {{N}}w | {{N}} | ⚠️ Validate (low conf)
 5   | {{feature}}          | {{N}}  | {{N}}  | {{N}}| {{N}}w | {{N}} | 🔴 Delay (low RICE, high effort)

MEDIAN RICE SCORE: {{N}}
TOP QUARTILE THRESHOLD: {{N}}
BOTTOM QUARTILE THRESHOLD: {{N}}

ROADMAP SEQUENCE MISMATCHES
⚠️ {{Item}} is scheduled BEFORE {{Item}} but scores {{N}}% lower. Consider re-sequencing.
⚠️ {{Item}} is scheduled in Q3 but is in the top RICE quartile. Consider accelerating.

DELAY CANDIDATES (auto-flagged)
🔴 {{Item}}: RICE {{N}}, Effort {{N}} weeks — recommend deferral to next quarter
🔴 {{Item}}: Confidence {{N}} — recommend validation before scheduling

QUICK WINS (high RICE, low effort — auto-flagged)
🚀 {{Item}}: RICE {{N}}, Effort {{N}} days — consider pulling into next sprint

ESTIMATED BUSINESS VALUE (where calculable)
{{Item}}: ${{X}}/month expected value ({{reach}} × ${{revenue/user}} × {{conf}})
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All four RICE variables populated | Base: 65% |
| Confidence ≥ 0.6 for top items (validated) | +15% |
| Roadmap sequence compared to RICE ranking | +10% |
| Business value calculated in $ where possible | +10% |
| Delay and acceleration candidates flagged | +5% |
| Confidence 1.0 for all items (unrealistic) | −15% |
| Reach estimated without any data basis | −10% |
| Items not ranked against each other | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Confidence inflation** | Every item has confidence = 1.0 | Challenge: "What data validates this?" Default to 0.6 without evidence. |
| **Effort underestimation** | Effort column is consistently lower than actuals | Apply historical accuracy factor. If team delivers 80% of estimate, multiply effort by 1.25. |
| **RICE used alone** | Highest-RICE items built regardless of strategic fit | RICE ranks value. OKR alignment and Must-classification still override. |
| **No business value conversion** | Scores are relative numbers without $ anchoring | Convert to $ wherever reach × revenue/user is estimable. |
| **Score without reranking** | Items are scored but roadmap sequence isn't updated | The output of RICE is a recommended re-sequence. Produce it. |

---

## References

- `skills/product/moscow-prioritization.md` — MoSCoW classification uses RICE as input
- `skills/product/opportunity-cost.md` — Deferral cost for items dropped by RICE ranking
- `skills/product/value-vs-cost.md` — Value/cost ratio complements RICE for investment decisions
- `docs/engineering-playbook.md` → Prioritization section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/moscow-prioritization.md` | RICE scores feed MoSCoW classification |
| `skills/product/opportunity-cost.md` | What are we not building because we built the top-RICE item? |
| `skills/product/feature-sizing.md` | Effort variable in RICE comes from feature sizing |
| `skills/product/okr-alignment.md` | OKR alignment can override pure RICE ranking for strategic items |
