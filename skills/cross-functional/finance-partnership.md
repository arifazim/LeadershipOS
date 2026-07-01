# Skill: Finance Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (budget reconciliation) + Quarterly (planning) + On-demand (headcount, unplanned spend)

---

## Purpose

Build a productive engineering-finance relationship — translating engineering spend into business value, managing budget with the transparency finance needs, and making the EM a trusted steward of engineering resources in the eyes of the CFO function.

Finance and engineering rarely speak the same language. Engineers see budget as a constraint on what they can build. Finance sees budget as a signal of management discipline. The EM who builds a bridge between these perspectives earns more trust — and more budget flexibility — than the one who treats finance as an obstacle.

**The finance partnership rule**: Finance is not the budget police. Finance is the function that helps the company allocate capital to its best uses. Engineering's job is to make the case clearly enough that the right capital flows to engineering.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of engineering spend that finance can map to a named business outcome | >85% | <75% = Yellow; <65% = Red |
| **Decision latency** | Median days from budget request to finance decision | ≤5 business days | >10 days = Yellow; >15 days = Red |
| **Cross-team blockers** | Engineering initiatives blocked by unresolved budget approvals | 0 | >1 active = Yellow |
| **Dependency aging** | Budget requests or reforecasts pending finance review for >7 days | 0 | >1 aging = Yellow |
| **Collaboration health** | Monthly reconciliation held; variance explained; no surprise spend | Green | Unexplained variance = Yellow |
| **Stakeholder satisfaction** | Finance team's confidence that engineering manages its budget responsibly | Green | Quarterly 1:1 with finance BP |

**Budget variance signal (monthly):**
```
Green:  Actual spend within ±5% of plan
Yellow: Actual spend 5–15% above or below plan — explanation required
Red:    Actual spend >15% above plan — corrective action plan required
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Budget vs. actuals** | Monthly engineering spend against plan by category |
| **Headcount plan** | Approved vs. actual headcount and planned hire dates |
| **Infrastructure spend** | Cloud/infra cost run rate and trend |
| **Planned unbudgeted spend** | Any spend outside the approved budget needing new approval |

### Optional
| Input | Description |
|---|---|
| **Capitalization schedule** | If engineering work is capitalized (GAAP R&D vs. capitalized development) |
| **Vendor contracts** | Renewal dates and cost changes for significant tools/services |
| **Cost optimization opportunities** | Infrastructure or tooling cost that can be reduced |

---

## Analysis

### Step 1 — Build the Business Outcome Map

Finance needs to understand what engineering spend is *for*. Before any budget conversation, map every significant engineering cost to a business outcome:

```
People ($X): Delivery of [product roadmap] — enables [revenue/capability/risk reduction]
Infrastructure ($X): Powers [product] at [scale] — cost per user is $[X]
Tooling ($X): Developer productivity — reclaims [N] engineer-hours/month
```

Any spend that cannot be mapped to a business outcome is a budget vulnerability in finance's eyes.

### Step 2 — Prepare the Monthly Reconciliation

For each budget category, prepare:
- Actuals vs. plan
- Variance explanation (if >±5%)
- Is the variance one-time or recurring?
- What is the corrective action (if unfavorable variance)?

**Variance explanation format:**
```
Category: Infrastructure (+$18K, +12% above plan)
Cause: Traffic spike from enterprise pilot in April — 3× normal traffic for 2 weeks
Type: One-time (pilot ended; traffic normalized)
Action: None — expected within normal range next month
```

### Step 3 — Manage Hiring Pipeline Budget Impact

Every hire has a budget impact with a lag. Track:
- Approved headcount vs. filled positions (unspent salary budget)
- Planned start dates vs. actual start dates (budget timing impact)
- Recruiting spend (often underbudgeted for senior roles)

**Communicate proactively**: If a hire is delayed 60+ days, flag the budget surplus to finance before they notice it and reallocate it.

---

## Decision Tree

```
What is the finance partnership state?

├── VARIANCE >5% (plan vs. actuals diverging)
│   └── Green variance (below plan): Flag proactively to finance with explanation
│         "We're tracking $X under plan because [reason]. This [will/won't] continue."
│         Do not: Let under-spend accumulate and surprise finance at quarter-end
│       Red variance (above plan): Explain cause + corrective action
│         "We're $X above plan because [reason]. We're [correcting with X action]."
│         If structural: Revise the forecast. Don't just explain month-over-month.

├── UNPLANNED SPEND NEEDED
│   └── Prepare: Business case before the ask (what does the business get?)
│       Frame: "We need $X that wasn't in the budget. Here is what it enables.
│               Here is what happens if we don't spend it."
│       → Invoke: skills/executive/investment-proposal.md for the formal case
│       Timing: Ask before you spend. Not after.

├── HEADCOUNT DECISION PENDING (budget impact)
│   └── Provide finance with: fully loaded cost, planned start date, budget quarter impact
│       Be specific: "This hire impacts the budget by $[X] starting [month]."
│       → Invoke: skills/executive/headcount-justification.md for the business case
│       Coordinate: Finance needs 30+ days to update the budget model

├── INFRASTRUCTURE COST GROWING
│   └── Diagnose: Is growth proportional to usage (expected) or anomalous (unexpected)?
│       Expected growth: Show cost-per-user trend — if flat or declining, this is efficiency
│       Anomalous growth: Root cause and corrective action before finance asks
│       Opportunity: Cost optimization initiatives reduce engineering cost line — visible win

└── FINANCE RELATIONSHIP IS HEALTHY
    └── Invest: Invite finance BP to quarterly engineering planning — they become advocates
        Share: Engineering ROI metrics proactively — don't wait for finance to ask
        Maintain: Monthly 30-minute reconciliation meeting — discipline signals trust
```

---

## Output

### Monthly Budget Reconciliation Report

```
ENGINEERING BUDGET RECONCILIATION — {{Month}} {{Year}}

SUMMARY SIGNAL: {{Green 🟢 | Yellow 🟡 | Red 🔴}}

BUDGET VS. ACTUALS
Category         | Plan      | Actual    | Variance  | Signal
People           | ${{X}}    | ${{X}}    | {{+/-$X}} | {{🟢/🟡/🔴}}
Infrastructure   | ${{X}}    | ${{X}}    | {{+/-$X}} | {{🟢/🟡/🔴}}
Tooling          | ${{X}}    | ${{X}}    | {{+/-$X}} | {{🟢/🟡/🔴}}
Other            | ${{X}}    | ${{X}}    | {{+/-$X}} | {{🟢/🟡/🔴}}
TOTAL            | ${{X}}    | ${{X}}    | {{+/-$X}} | {{🟢/🟡/🔴}}

VARIANCE EXPLANATIONS (for any >±5%)
• {{Category}}: {{explanation}} | Type: {{One-time | Recurring}} | Action: {{corrective action or none}}

HEADCOUNT STATUS
Approved: {{N}} | Filled: {{N}} | Open: {{N}} roles
Budget impact of open roles: -${{X}} (unspent; flagged as surplus)

FORECAST REVISION
{{If needed: revised full-year forecast vs. original plan}}

DECISIONS PENDING FINANCE
• {{Request}} — submitted: {{date}} — needed by: {{date}}

METRICS
Alignment score: {{N}}% of spend mapped to business outcomes
Decision latency: {{N}} days avg for budget decisions
Collaboration health: {{Green | Yellow | Red}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Monthly reconciliation completed with variance explanation | Base: 65% |
| All spend mapped to business outcome | +10% |
| Headcount pipeline budget impact tracked | +10% |
| Proactive communication on variances (not reactive) | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| Variance reported without explanation | −20% |
| Spend not mapped to outcomes | −15% |
| Finance surprised by spend (didn't flag proactively) | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Reactive variance reporting** | Finance asks about variance before EM explains | Report variance proactively. Finance respects the heads-up. |
| **Spend without business case** | Engineering spend that finance cannot map to outcomes | Map every significant cost line to a business outcome. Do it before finance asks. |
| **Surprise headcount impact** | Hire starts; finance budget model is wrong | Coordinate hire timing with finance 30+ days before start date. |
| **No relationship with finance BP** | Finance sees engineering as an opaque cost center | Monthly 30-minute meeting. Make them a partner, not a gatekeeper. |
| **Infrastructure growth unexplained** | Cloud bill grows month-over-month with no narrative | Always have the cost-per-user metric. Growth with declining cost/user is efficient. |

---

## References

- `skills/executive/engineering-budget.md` — Budget structure and framing
- `skills/executive/investment-proposal.md` — Business case for unplanned spend
- `skills/executive/headcount-justification.md` — People investment case
- `skills/cross-functional/dependency-management.md` — Canonical metric definitions

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/engineering-budget.md` | Budget structure and annual planning |
| `skills/executive/investment-proposal.md` | When finance partnership requires a formal investment case |
| `skills/cross-functional/dependency-management.md` | Dependency tracking for budget decisions |
| `skills/executive/headcount-justification.md` | People cost case for finance |
