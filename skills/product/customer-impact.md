# Skill: Customer Impact

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Feature prioritization + Incident response + On-demand (any decision affecting users)

---

## Purpose

Estimate and quantify the business value of engineering decisions from the customer's perspective — translating user impact into ARR risk, NPS effect, churn probability, and support burden — so that product decisions are made with the customer dimension fully visible.

**What the EM does automatically**: For any feature, incident, or trade-off decision, the EM surfaces the customer impact dimension:
- How many customers are affected, and what segment?
- What is the ARR at risk or enabled by this decision?
- What is the churn probability if this problem is not fixed?
- What is the NPS effect of this change?

Engineering decisions that ignore customer impact create invisible business risk. The EM who quantifies customer impact earns a seat at the product table.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The decision or feature** | What engineering is building, fixing, or changing |
| **Affected customer segment** | Who is affected — all customers, enterprise, free tier, etc. |
| **Customer data** | ARR by segment, customer count, NPS baseline |
| **Impact type** | Workflow broken / improvement / new capability / performance |

### Optional
| Input | Description |
|---|---|
| **Support ticket data** | Volume of tickets related to this area |
| **CS escalation history** | Named customers or accounts that have raised this issue |
| **Competitor comparison** | Does a competitor have this feature? Does absence cause churn? |
| **Time sensitivity** | Does the customer impact compound over time? |

---

## Analysis

### Step 1 — Segment the Impact

Customer impact is always segment-specific. A feature that affects 5% of customers but 60% of ARR is a high-priority Must. A feature that affects 40% of customers but 5% of ARR is a Should.

**Segment classification:**

| Segment | Typical ARR concentration | Priority multiplier |
|---|---|---|
| Enterprise / strategic accounts | 60–80% of ARR in 10–20% of accounts | 3× |
| Growth / SMB | 20–30% of ARR; high volume | 1.5× |
| Freemium / trial | 0–5% of ARR; conversion potential | 1× (unless conversion-critical) |
| Internal users | No direct ARR; productivity impact | 0.5× (unless it gates customer delivery) |

### Step 2 — Estimate the ARR Impact

For negative impact (bugs, degradation, incidents):
```
ARR at risk = Affected customers × Average ARR per customer × Churn probability

Churn probability by impact severity:
  Critical (product unusable): 40–60% churn risk within 90 days
  High (major workflow broken): 20–40% churn risk within 90 days
  Medium (significant inconvenience): 5–20% churn risk within 180 days
  Low (minor issue): 1–5% churn risk (ongoing, not immediate)
```

For positive impact (new features, improvements):
```
ARR enabled = (New conversions × ARPU) + (Retained customers × ARPU × Retention improvement %)
```

### Step 3 — Estimate NPS and CSAT Effect

NPS is a lagging indicator but a predictive churn signal. Estimate NPS impact:

| Change type | NPS effect | Business signal |
|---|---|---|
| Fixing a P1 incident within SLA | +2 to +5 points | Trust recovery |
| Fixing a long-standing pain point (>90 days old) | +3 to +8 points | Loyalty recovery |
| New high-value capability | +1 to +3 points | Expansion signal |
| Outage/disruption affecting customers | −5 to −15 points | Retention risk |
| Repeated incidents | Cumulative −3 to −5 per incident | Churn acceleration |

*NPS estimates are directional. Track actuals to calibrate.*

### Step 4 — Calculate the Support Burden

Customer impact that reaches support has a cost:

```
Support burden = (Tickets/month) × (Avg time to resolve) × (Loaded support agent cost)

Industry average: $20–$50 per ticket fully loaded
Enterprise escalation: $200–$500 per account-level escalation

Fixing the root cause eliminates the ongoing support burden permanently.
This is often an underestimated component of feature value.
```

---

## Decision Tree

```
What is the customer impact assessment context?

├── FEATURE PRIORITIZATION (which feature to build next)
│   └── Calculate for top candidates:
│       - Affected customers by segment (with ARR weighting)
│       - ARR enabled or protected by each feature
│       - NPS effect (directional)
│       Present to PM: "Feature A affects 200 enterprise customers (80% of ARR).
│       Feature B affects 3,000 SMB customers (25% of ARR). For ARR impact,
│       Feature A has higher priority. For customer count, Feature B wins."
│       → Invoke: skills/product/rice-scoring.md — use ARR impact as the Impact variable

├── INCIDENT RESPONSE (assessing customer impact during an incident)
│   └── Immediate: Quantify affected segment and ARR at risk
│       Frame: "This incident affects {{N}} customers in the enterprise segment.
│       ARR at risk: ${{X}}. Churn probability: {{N}}% within 90 days if not resolved."
│       → Invoke: subagents/incident-manager.md with customer impact data

├── FEATURE DELAY DECISION (something is slipping)
│   └── Calculate: Customer impact of delay
│       "Delaying [X] by 4 weeks costs: [N customers × N weeks of suboptimal experience]
│       Estimated ARR at risk from delay: ${{X}} (churn risk during delay period)"
│       This makes the delay cost visible — not just the delivery cost

├── BUG TRIAGE (should this be fixed now or later?)
│   └── Calculate: Ongoing ARR risk of not fixing vs. sprint capacity cost of fixing
│       Apply churn probability × ARR at risk = expected value of fixing now
│       Compare to: Sprint capacity cost of the fix
│       If expected value > fix cost: Fix now
│       If expected value < fix cost: Schedule appropriately

└── PRODUCT DECISION WITH UNKNOWN CUSTOMER IMPACT
    └── Surface the uncertainty explicitly:
        "I don't have data on customer impact here. Before we commit to this,
        can CS/product run a quick pulse? The decision changes significantly
        if this affects enterprise customers."
        → Invoke: skills/cross-functional/customer-success.md for feedback
```

---

## Output

### Customer Impact Report

```
CUSTOMER IMPACT ASSESSMENT — {{Feature / Decision}} — {{date}}

AFFECTED CUSTOMERS
Segment:       {{Enterprise | SMB | Freemium | All}}
Customer count: {{N}} customers ({{N}}% of total)
ARR affected:  ${{X}} ({{N}}% of total ARR)

IMPACT TYPE
{{Capability enabled | Workflow improved | Bug fixed | Risk mitigated}}
Severity: {{Critical | High | Medium | Low}}

BUSINESS IMPACT

Positive (if building):
  ARR enabled:          ${{X}} ({{rationale}})
  Churn risk reduced:   {{N}} customers × {{N}}% retention improvement = ${{X}} ARR protected
  NPS effect:           Est. {{+/-N}} points ({{rationale}})
  Support burden saved: ${{X}}/month ({{N}} tickets × ${{cost/ticket}})
  Annual value:         ${{X}}

Negative (if not building / delaying):
  ARR at risk:          ${{X}} ({{N}} customers × ${{ARPU}} × {{churn prob}})
  Churn timeline:       {{N}}% risk within {{N}} days
  Support cost ongoing: ${{X}}/month
  Total cost of delay:  ${{X}}/month

CONFIDENCE: {{High | Medium | Low}} — {{data source}}

RECOMMENDATION
{{Build now / Fix before next release / Schedule for next sprint / Can wait — medium term}}
Business rationale: {{one sentence connecting to ARR, churn, or customer outcome}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| ARR impact estimated (not just customer count) | Base: 65% |
| Customer segment classification applied | +10% |
| Churn probability anchored to severity level | +10% |
| NPS effect estimated directionally | +5% |
| Support burden calculated | +5% |
| Customer count only (no ARR weighting) | −15% |
| Churn probability not estimated | −10% |
| Impact is qualitative only | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Customer count without ARR weighting** | "40% of customers are affected" — but it's 40% of the free tier | Always segment by ARR concentration. 40% of customers ≠ 40% of business impact. |
| **No churn probability** | "This affects enterprise customers" without estimating churn risk | Apply the severity × segment churn probability table. |
| **Incident impact unquantified** | Incident status report doesn't name ARR at risk | During any incident: calculate ARR at risk within the first 30 minutes. |
| **Delay cost invisible** | "We're delaying Feature X by 4 weeks" without naming the customer cost of delay | Every delay has a customer impact. Calculate it. |
| **No support burden** | Value calculation misses ongoing support cost that the feature eliminates | Include support burden in value calculations. It's often 20–40% of total value. |

---

## References

- `skills/product/rice-scoring.md` — Customer impact feeds the Impact variable in RICE
- `skills/cross-functional/customer-success.md` — CS partnership provides customer impact data
- `skills/cross-functional/support-escalation.md` — Support volume feeds support burden calculation
- `subagents/incident-manager.md` — Customer impact calculation during incidents

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/rice-scoring.md` | Customer impact is the Impact and Reach variables in RICE |
| `skills/product/product-risk.md` | Customer impact is the consequence of a product risk materializing |
| `skills/cross-functional/customer-success.md` | CS provides the churn and satisfaction data |
| `subagents/incident-manager.md` | Incident severity informed by customer impact |
