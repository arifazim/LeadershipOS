# Skill: Engineering Budget

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (planning cycle) + Quarterly (review and reforecast)

---

## Purpose

Present, defend, and manage the engineering budget in terms that financial stakeholders understand — translating investment in engineering capacity into expected business outcomes and making variance explainable without requiring a finance background.

Engineering budget is one of the most visible signals of organizational trust. EMs who can articulate engineering spend in business terms earn more budget influence than those who cannot. EMs who cannot explain variance lose budget credibility.

**Budget credibility requires three things**:
1. You know your numbers without looking
2. You can explain variance — actual vs. plan — with specificity
3. You can connect every significant line item to a business outcome

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Headcount plan** | Engineering headcount by role, level, and planned start dates |
| **Compensation data** | Salary ranges by level (finance will provide; use their numbers) |
| **Infrastructure / cloud spend** | Current run rate and projected growth |
| **Tooling and licenses** | Developer tools, monitoring, SaaS subscriptions |
| **Prior year actuals** | What was actually spent vs. planned — the credibility baseline |

### Optional
| Input | Description |
|---|---|
| **Contractor spend** | Any non-employee engineering labor |
| **Training and development** | L&D budget for engineering team |
| **Recruiting costs** | If headcount growth is planned (often owned by HR budget) |
| **Capitalization policy** | Whether any engineering work is capitalized (affects P&L view) |
| **Industry benchmarks** | Engineering cost as % of revenue or ARR for comparable companies |

---

## Analysis

### Step 1 — Build the Three Budget Views

Executives and finance teams need budget in different frames. Prepare all three:

| View | What it shows | Who uses it |
|---|---|---|
| **By category** | People / Infrastructure / Tooling / Other | CFO / Finance team |
| **By outcome** | Product delivery / Reliability / Foundations / Innovation | CEO / Board |
| **By quarter** | Spend phased across the year | CFO / COO (cash planning) |

The **by outcome** view is the most powerful for EMs and the least natural. Build it.

### Step 2 — Calculate the Fully Loaded Cost

Engineers are frequently undercosted in proposals because only salary is counted.

```
Fully loaded cost = Salary + Benefits + Payroll taxes + Equipment + Software licenses
                   + Management overhead + Office/remote allocation
Typical multiplier: 1.25–1.40× salary (varies by company and location)
```

Always use fully loaded cost in investment proposals. If finance corrects you, they'll correct up — which weakens your case. Correct yourself first.

### Step 3 — Explain Variance

For any actual vs. plan variance above ±10%, prepare:
- **What category drove the variance** (headcount / infrastructure / tooling)
- **Why it happened** (delayed hiring / incident-driven infra spike / new tool)
- **Whether it continues** (one-time / ongoing)
- **What you're doing about it** (if it's unfavorable variance)

Unexplained variance signals loss of control. Explained variance with a correction signals management.

### Step 4 — Frame as Engineering Cost Efficiency

Executives compare engineering cost to output. Frame proactively:

| Metric | Formula | What it signals |
|---|---|---|
| Engineering cost per shipped feature | Budget ÷ features shipped | Absolute productivity |
| Engineering cost as % of revenue | Engineering opex ÷ revenue | Resource intensity |
| Infrastructure cost per user | Cloud spend ÷ active users | Scaling efficiency |
| Delivery ROI | Business value of shipped work ÷ engineering cost | Return on engineering |

These numbers invite conversation. Have them ready.

---

## Decision Tree

```
What is the budget conversation context?

├── ANNUAL PLANNING — Requesting a budget
│   └── Format: Prior year actuals → current year request → by category → by outcome
│       Key: Show the logic. Every increase has a rationale tied to a business outcome.
│       Anchor on: "Engineering cost as % of revenue" vs. industry benchmark.
│       → Also invoke: skills/executive/annual-planning.md for the full plan context

├── QUARTERLY REVIEW — Reporting actuals vs. plan
│   └── Format: Actuals vs. plan by category → variance explanation → reforecast
│       Green: within ±5% — brief statement of confidence
│       Yellow: 5–15% variance — explain cause, impact, correction
│       Red: >15% variance — full explanation + corrective action + revised forecast
│       Never report variance without explanation. Never explain variance without
│       the correction plan.

├── DEFENDING A BUDGET CUT REQUEST
│   └── Format: Impact analysis → what is preserved → what is cut → consequence
│       Show the math: "A 10% engineering cut reduces delivery by N engineer-quarters.
│       This delays [initiative] by [N weeks], which affects [business outcome]."
│       Do NOT: fight every cut. Prioritize what matters. Show you understand trade-offs.
│       → Name what you would cut first (protect the highest-value work)

└── REQUESTING MID-YEAR UNPLANNED SPEND
    └── Format: What happened → why it wasn't planned → what you're asking for
        → what happens if denied → which existing budget is offset (if any)
        → Also invoke: skills/executive/investment-proposal.md for the business case
        Rule: Mid-year asks that can't be offset by savings elsewhere are harder.
              Come with a reallocation proposal, not just an ask.
```

---

## Output Template

```
ENGINEERING BUDGET — {{YEAR or Quarter}}
Prepared by: {{EM / VP}} | Date: {{date}} | Audience: {{CFO / VP Finance / CEO}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total {{year}} engineering budget request: ${{X}}M
vs. Prior year actual: ${{X}}M ({{+/−}}{{N}}%)
Engineering cost as % of revenue: {{N}}% (industry: {{N}}–{{N}}%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BY CATEGORY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
People ({{N}} engineers, fully loaded):         ${{X}}M  ({{N}}% of total)
Infrastructure / cloud:                         ${{X}}M  ({{N}}% of total)
Tooling and software licenses:                  ${{X}}M  ({{N}}% of total)
Contractors and external services:              ${{X}}M  ({{N}}% of total)
Training and development:                       ${{X}}K  ({{N}}% of total)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BY BUSINESS OUTCOME
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Product delivery (new capabilities):           ${{X}}M  ({{N}}%)
Reliability and operations:                    ${{X}}M  ({{N}}%)
Platform and foundation:                       ${{X}}M  ({{N}}%)
Innovation / future bets:                      ${{X}}M  ({{N}}%)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BUDGET INCREASES VS. PRIOR YEAR
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Line item}}: +${{X}} — rationale: {{business outcome this enables}}
{{Line item}}: +${{X}} — rationale: {{business outcome this enables}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EFFICIENCY METRICS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Infrastructure cost per user: ${{X}} (vs. ${{X}} last year — {{improving/stable/worsening}})
Engineering cost as % of revenue: {{N}}%
Delivery rate vs. prior year: {{N}}% (more/fewer/same capabilities per dollar)
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All numbers are fully loaded | Base: 65% |
| By-outcome view is prepared | +10% |
| Prior year actuals are referenced as baseline | +10% |
| Industry benchmark is included | +10% |
| Variance explanation is specific | +5% |
| People cost is salary-only (not fully loaded) | −20% |
| No outcome framing — categories only | −10% |
| Variance explained as "unexpected" without root cause | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Salary-only costing** | Budget uses base salary; finance corrects to fully loaded | Always use fully loaded. Finance will respect you for it. |
| **No outcome framing** | Budget is presented as cost categories only | Map every significant spend to a business outcome before presenting. |
| **Unexplained variance** | Actual vs. plan difference presented without rationale | Never present variance without explanation and correction plan. |
| **No benchmark** | No comparison to industry or prior year | Engineering cost as % of revenue vs. comparable companies anchors the conversation. |
| **Fighting all cuts** | Resisting any reduction proposal | Prioritize. Name what you'd cut first. Show you understand the business trade-off. |

---

## References

- `skills/executive/investment-proposal.md` — For individual investment cases
- `skills/executive/headcount-justification.md` — People cost justification
- `skills/executive/annual-planning.md` — Full-year plan context
- `docs/engineering-playbook.md` → Managing Up section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/annual-planning.md` | Annual plan generates the budget request |
| `skills/executive/investment-proposal.md` | Individual investment cases within the budget |
| `skills/executive/headcount-justification.md` | The people-cost component of the budget |
| `skills/executive/quarterly-business-review.md` | QBR includes quarterly budget actuals |
