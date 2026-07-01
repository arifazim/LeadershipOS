# Skill: Opportunity Cost

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Any roadmap decision + Sprint planning under pressure + On-demand (feature request, scope change)

---

## Purpose

Calculate and communicate the opportunity cost of every significant engineering decision — making explicit what the team is not building, and what that inaction costs, so that choices are made with full information rather than partial visibility.

**What the EM does automatically**: Whenever a new feature is added, a roadmap item is committed to, or a scope choice is made, the EM surfaces the opportunity cost:
- What are we not building because we're building this?
- What is the next-best-alternative's expected value?
- How long will we be unable to start the alternative?

Most product decisions focus on the value of what's being built. Opportunity cost forces the question about what's being deferred. A feature worth $200K/year is a bad investment if it displaces a feature worth $500K/year.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The chosen item** | What is being built or prioritized |
| **The next-best alternative** | What would be built if this weren't chosen |
| **Effort for chosen item** | Engineering weeks required |
| **Business value of chosen item** | Expected value (RICE score or $ estimate) |

### Optional
| Input | Description |
|---|---|
| **Business value of the alternative** | Expected value of the deferred item |
| **Time horizon** | How many weeks/months until the alternative can start |
| **Urgency of alternative** | Does the alternative's value decay over time? |
| **Third option** | A second alternative to compare |

---

## Analysis

### Step 1 — Identify the Next-Best Alternative

The opportunity cost calculation requires naming what is being deferred. This is often the most valuable step — it forces the decision to be explicit about what the team is not doing.

**How to identify the next-best alternative:**
1. Take the prioritized backlog, sorted by RICE score or business value
2. The next-best alternative is the highest-ranked item that won't be built because the chosen item is being built
3. If the chosen item displaces multiple items, sum their deferred value

### Step 2 — Calculate the Opportunity Cost

```
Opportunity cost = Value of next-best alternative × Confidence in alternative
                   (over the period the alternative is deferred)

Simple formula:
  Delay period = Effort of chosen item (weeks)
  Deferred value = Alternative's expected monthly value × (delay weeks ÷ 4)
  Opportunity cost = Deferred value × Confidence in alternative

Example:
  Chosen: Feature A (6 weeks, expected $30K/month value)
  Alternative: Feature B (4 weeks, expected $25K/month value, confidence 0.8)

  Delay period for B = 6 weeks = 1.5 months
  Opportunity cost = $25K/month × 1.5 months × 0.8 = $30,000

  Net position: Building A earns $30K/month ongoing
                BUT costs $30K in deferred B value during A's build
                Break-even: 1 month after A ships
```

### Step 3 — Calculate the Payback Period

```
Payback period = Opportunity cost ÷ Monthly incremental value of chosen item

If payback period > 6 months: Reconsider the prioritization
If payback period ≤ 3 months: Clear winner — proceed
If payback period 3–6 months: Judgment call; surface to PM for joint decision
```

### Step 4 — Detect High-Opportunity-Cost Situations

The EM auto-detects and flags these patterns:

| Pattern | Signal | Action |
|---|---|---|
| **Inverted RICE** | Chosen item has lower RICE than deferred alternative | Flag: "We're building [X] instead of [Y]. [Y] scores higher. Intended?" |
| **Long delay with decaying value** | Alternative's value decreases over time (competitive risk, customer churn) | Flag: "Deferring [Y] for 3 months. Y's value may decay — competitor has this feature." |
| **High-effort, low-return** | Chosen item has poor value/effort ratio vs. alternative | Flag: "We're spending [N] weeks on [X] with [N] expected value. [Y] takes half the time for similar value." |
| **Technical prerequisite inversion** | Building a dependency before the high-value item it enables | Not an opportunity cost problem — this is sequencing. But make the dependency explicit. |

---

## Decision Tree

```
What is the opportunity cost scenario?

├── NEW FEATURE REQUEST (PM or exec brings a new item)
│   └── Auto-calculate: What does this displace? At what cost?
│       Present: "Building [X] takes [N] weeks. During that time, [Y] — which was
│       next in the backlog — is deferred by [N] weeks, costing an estimated
│       [$ or RICE units] in deferred value. Worth it?"
│       Do NOT: Absorb scope without surfacing the trade-off
│       → Invoke: skills/product/moscow-prioritization.md to classify the request

├── ROADMAP REVIEW (quarter planning)
│   └── For each item in the plan, name the item it displaces
│       Present the opportunity cost table (see Output)
│       Flag: Any item where opportunity cost > business value of chosen item
│       Recommend: Re-sequence items with poor opportunity cost ratios
│       → Invoke: skills/product/roadmap-health.md for full assessment

├── CAPACITY SHORTFALL (must cut something)
│   └── Rank all current-plan items by opportunity cost of deferral
│       Items with lowest opportunity cost of deferral = first to cut
│       Items with highest opportunity cost of deferral = last to cut
│       Present to PM: "If we need to cut 1 sprint of capacity, the lowest-cost
│       item to defer is [X]. Deferring it costs [$ or description]. Recommend."

└── TECH DEBT VS. FEATURE TRADE-OFF
    └── Calculate: What business value does this tech debt work enable?
        Opportunity cost formula works here too:
          "Spending [N] weeks on reliability investment defers [feature Y].
           Y's deferred value is [$X]. Reliability investment reduces incident
           cost by [$Y/quarter]. Break-even: [N] quarters."
        → Invoke: skills/product/value-vs-cost.md for reliability investment framing
```

---

## Output

### Opportunity Cost Analysis

```
OPPORTUNITY COST ANALYSIS — {{Decision / Feature}} — {{date}}

THE CHOICE
Building: {{chosen item}} | Effort: {{N}} weeks | Expected value: ${{X}}/month (or RICE: {{N}})

THE ALTERNATIVE (what we're not building instead)
Deferred: {{alternative item}} | Effort: {{N}} weeks | Expected value: ${{X}}/month (conf: {{N}})

OPPORTUNITY COST CALCULATION
Delay period for alternative: {{N}} weeks ({{N}} months)
Deferred value: ${{X}}/month × {{N}} months × {{conf}} = ${{TOTAL}}

PAYBACK ANALYSIS
Monthly incremental value of chosen item: ${{X}}
Payback period: {{N}} months (deferred value ÷ monthly value)
Signal: {{Clear win (≤3mo) | Judgment call (3-6mo) | Reconsider (>6mo)}}

OPPORTUNITY COST TABLE (full backlog view)
Rank | Item      | Effort  | Value/mo | If we build this first, we defer: | OC
  1  | {{item}}  | {{N}}w  | ${{X}}   | {{alt}} by {{N}}w                 | ${{X}}
  2  | {{item}}  | {{N}}w  | ${{X}}   | {{alt}} by {{N}}w                 | ${{X}}
  3  | {{item}}  | {{N}}w  | ${{X}}   | {{alt}} by {{N}}w                 | ${{X}}

FLAGS
⚠️ {{Item}}: Opportunity cost > business value — consider re-sequencing
⚠️ {{Item}}: Alternative has time-sensitive value (decaying) — consider pulling forward
🚀 {{Item}}: Opportunity cost is low; displaced items are lower value — proceed confidently
```

---

## Example

```
OPPORTUNITY COST ANALYSIS — Custom Reporting Dashboard — July 1, 2025

THE CHOICE
Building: Custom reporting dashboard | Effort: 6 weeks | Expected value: $18K/month (3 enterprise contracts)

THE ALTERNATIVE (what we're not building)
Deferred: Mobile SDK v2 | Effort: 4 weeks | Expected value: $12K/month (est.) | Confidence: 0.7

OPPORTUNITY COST CALCULATION
Delay for Mobile SDK: 6 weeks = 1.5 months
Deferred value: $12K × 1.5 × 0.7 = $12,600

PAYBACK ANALYSIS
Monthly incremental value of reporting dashboard: $18K
Payback period: 0.7 months — reporting dashboard earns back the opportunity cost in <1 month

Signal: 🟢 Clear win — proceed with reporting dashboard
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Next-best alternative is named | Base: 65% |
| Opportunity cost is calculated in $ or RICE | +15% |
| Payback period is calculated | +10% |
| Time-sensitive alternatives flagged | +10% |
| Opportunity cost table covers full backlog | +5% |
| No alternative named | −25% |
| Alternative's value not estimated | −15% |
| Decision made without surfacing trade-off | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Invisible trade-off** | Team commits to a feature without naming what it displaces | Name the alternative every time. The trade-off exists whether or not it's named. |
| **One-dimensional decision** | Decision made on chosen item's value without considering deferred value | Always calculate both sides: value of chosen item AND cost of deferred item. |
| **No payback period** | "This feature is valuable" without knowing when it breaks even | Calculate the payback. >6 months is a flag for re-evaluation. |
| **Tech debt has no opportunity cost** | Technical investment treated as free | Tech debt work displaces feature work. Calculate what's being deferred and its cost. |
| **Alternative value not estimated** | "We'll build X next" without knowing what X is worth | RICE-score the alternatives. You can't calculate opportunity cost without the alternative's value. |

---

## References

- `skills/product/rice-scoring.md` — RICE provides the value estimates for opportunity cost
- `skills/product/moscow-prioritization.md` — MoSCoW and opportunity cost work together
- `skills/product/value-vs-cost.md` — Investment analysis when opportunity cost spans multiple items
- `docs/engineering-playbook.md` → Prioritization section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/rice-scoring.md` | RICE scores are inputs to the opportunity cost calculation |
| `skills/product/moscow-prioritization.md` | Opportunity cost quantifies the cost of deferring a Should or Could |
| `skills/product/roadmap-health.md` | Roadmap health includes opportunity cost misalignments |
| `skills/product/feature-sizing.md` | Effort estimates are required for the delay period calculation |
