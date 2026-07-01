# Skill: MoSCoW Prioritization

**Domain**: Product
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Sprint planning + Quarterly roadmap + On-demand (scope pressure, capacity shortfall)

---

## Purpose

Apply MoSCoW prioritization to a feature list and produce a recommended classification — automatically, without waiting to be asked — so that the engineering team is never building a Could when a Must is at risk.

**What the EM does automatically**: Given any feature list, sprint backlog, or quarterly roadmap, the EM:
1. Classifies each item Must / Should / Could / Won't with rationale
2. Surfaces items that look Must but should be Could
3. Flags items that look Could but are actually Must (hidden dependency)
4. Recommends what to defer when capacity is under pressure

**The classification imperative**: Every sprint and every quarter has more work than capacity. MoSCoW makes the prioritization explicit instead of implicit. Implicit prioritization means the team decides — usually by working on what's most interesting, not what's most valuable.

---

## Definitions

| Classification | What it means | Engineering implication |
|---|---|---|
| **Must** | Non-negotiable. Missing this fails the goal, the customer, or the commitment. | Zero flexibility on scope. Protect at all costs. |
| **Should** | High value. Should ship in this period unless something must be traded. | First candidate when Must items need more capacity. |
| **Could** | Desirable but not essential. Ships if time permits. | Explicitly cut when Must or Should items are at risk. |
| **Won't** | Will not be done in this period. Explicitly deprioritized — not forgotten. | Makes deprioritization visible and agreed. Not "not doing" — "not doing now." |

**The classification trap**: Most teams have too many Musts. If everything is a Must, nothing is. The real question is: what fails if this doesn't ship in this period?

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Feature or story list** | The candidate items to classify |
| **Delivery period** | Sprint, quarter, or release — the scope of the classification |
| **Committed goals** | OKRs, sprint goals, or customer commitments that anchor the Musts |
| **Team capacity** | Available engineering capacity in this period |

### Optional
| Input | Description |
|---|---|
| **Customer commitments** | Specific features promised to named customers |
| **Revenue dependencies** | Features gating a contract, renewal, or launch |
| **Prior period carryover** | Items committed but not shipped last period |
| **Risk signals** | Any items with high technical uncertainty |

---

## Analysis

### Step 1 — Auto-Classify by Criteria

For each item, apply the classification test in order:

```
MUST test (any one criterion makes it Must):
  □ Failure to ship breaks a customer contract or SLA
  □ Failure to ship blocks another Must item (hidden dependency)
  □ Failure to ship misses a compliance or legal deadline
  □ Failure to ship means the product is broken for a meaningful user segment
  □ Failure to ship was committed to by name at executive level

SHOULD test (any one, none of the above):
  □ Ships a significant business outcome (revenue, retention, growth)
  □ Is in the OKR or roadmap plan for this period
  □ Is a blocker for the next period's Must items
  □ Customers have named this as a high-priority request

COULD test (default if not Should or Must):
  □ Nice to have — improves experience but doesn't break it
  □ Could ship next period without meaningful business impact
  □ Not in any named OKR or commitment

WON'T (explicit call):
  □ Explicitly agreed not to build this period
  □ Deprioritized relative to higher-value items
  □ Should be documented so it doesn't re-surface without context
```

### Step 2 — Detect Classification Problems

**Too many Musts**: If >40% of items are classified Must, challenge each. Ask: "What specifically fails if this doesn't ship this sprint/quarter?"

**Must without capacity**: If the Must items alone exceed capacity, this is a delivery risk — not a prioritization problem. Escalate immediately.

**Could items in Must clothing**: Items that appear Must because of internal engineering preference, not external business need. Common examples: refactors, test coverage, tooling upgrades. These are important but rarely Must for a sprint.

**Hidden Must items**: Should or Could items that are actually prerequisites for a Must. A Could that is a technical dependency of a Must becomes a Must. Surface these explicitly.

### Step 3 — Produce the "What to Delay" Recommendation

When capacity is under pressure, the EM proactively recommends what to cut — before being asked:

```
DELAY RECOMMENDATION PROCESS:
1. Protect all Must items — non-negotiable
2. Assess Shoulds: which has the lowest business impact if deferred?
3. Move the lowest-impact Should to Could or next period
4. Communicate the trade-off: "Deferring [X] costs us [business impact].
   This protects [Must item Y]. Recommended."
5. Get PM confirmation — this is a joint decision, not unilateral
```

---

## Decision Tree

```
What is the classification scenario?

├── SPRINT PLANNING — NEW SPRINT
│   └── Classify each candidate story before committing
│       Threshold: Musts first. Shoulds to fill remaining capacity. Coulds only if time.
│       Auto-surface: Any story with >50% technical uncertainty → demote one level
│       Auto-surface: Any story that is a prerequisite for next sprint's Must → promote to Must
│       Output: Classified backlog with rationale + "won't this sprint" list

├── QUARTERLY ROADMAP REVIEW
│   └── Classify each initiative for the quarter
│       Check: Are all Musts in the first half of the quarter? (Protect delivery)
│       Flag: Any Must item in Q4 of a quarter with significant delivery risk
│       Recommend: Move any Could out of the plan if Musts are at capacity risk
│       → Invoke: skills/product/roadmap-health.md for full roadmap assessment

├── CAPACITY SHORTFALL (team is behind or capacity reduced)
│   └── Auto-recommendation trigger: classify everything in current plan
│       Present to PM: "We have [N] capacity. Musts need [M]. Gap is [N-M].
│       I recommend deferring: [list of Coulds and lowest-impact Shoulds]."
│       → Invoke: skills/product/opportunity-cost.md to quantify the deferral cost

└── SCOPE CREEP DEFENSE
    └── New request arrives mid-sprint or mid-quarter
        Auto-classify the new request: Must / Should / Could
        If Must: "This is a Must. To accommodate it, we defer [X] — a Could.
                  Here is the trade-off."
        If Should or Could: "This is a Should. It goes into next sprint/quarter's backlog."
        Never: Absorb scope without removing equivalent scope
```

---

## Output

### MoSCoW Classification Table

```
MOSCOW CLASSIFICATION — {{Sprint N / Q{{N}} Roadmap}} — {{date}}
Capacity: {{N}} engineer-weeks | Period: {{dates}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
MUST ({{N}} items, {{N}} eng-weeks) — {{N}}% of capacity
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ {{Item}} — {{N}} weeks — Reason: {{why it's Must}}
✅ {{Item}} — {{N}} weeks — Reason: {{why it's Must}}

⚠️ CAPACITY ALERT: Musts alone = {{N}} weeks vs. {{N}} available [if applicable]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SHOULD ({{N}} items, {{N}} eng-weeks)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🟡 {{Item}} — {{N}} weeks — Business value: {{outcome}} — Deferral cost: {{impact}}
🟡 {{Item}} — {{N}} weeks — Business value: {{outcome}} — Deferral cost: {{impact}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COULD ({{N}} items, {{N}} eng-weeks)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔵 {{Item}} — {{N}} weeks — Ships if: Musts and Shoulds complete with time remaining
🔵 {{Item}} — {{N}} weeks

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WON'T ({{N}} items — explicitly deferred)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
❌ {{Item}} — Reason: {{why it's not in this period}} — Revisit: {{when}}
❌ {{Item}} — Reason: {{rationale}} — Revisit: {{quarter or condition}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CLASSIFICATION FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Item}}: Classified as Must but should be challenged — "What fails if this slips 1 sprint?"
⚠️ {{Item}}: Hidden Must — is a technical dependency of [Must item] — promote to Must
⚠️ {{Item}}: Could in Should clothing — no named OKR or commitment — demote to Could

DELAY RECOMMENDATION:
If capacity is under pressure, defer in this order:
1. {{Could item}} — deferral cost: minimal — next slot: {{sprint/quarter}}
2. {{Could item}} — deferral cost: minimal
3. {{Should item}} — deferral cost: {{specific business impact}} — notify: {{who}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All Musts traced to a specific commitment or failure condition | Base: 65% |
| Must items fit within capacity | +10% |
| Delay recommendation produced proactively | +10% |
| Hidden Must dependencies surfaced | +10% |
| Won't list is explicit (not just absent) | +5% |
| >40% of items classified Must | −20% |
| No Won't list | −10% |
| Must items exceed capacity with no plan | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Must inflation** | Everything is Must | Challenge each: "What specifically fails if this doesn't ship?" Demote anything that doesn't have a concrete answer. |
| **No Won't list** | Deprioritized items disappear silently | Make Won't explicit. Agreed deprioritization prevents re-surfacing without context. |
| **Hidden Must** | Should item blocks a Must; discovered mid-sprint | Run the dependency check in Step 1 before committing. |
| **Scope absorption** | New request added; nothing removed | Every new Must must displace a Could or Should. Zero-sum. |
| **PM owns all classification** | EM passively accepts PM's prioritization | EM auto-classifies and brings the recommendation. Joint decision — not unilateral on either side. |

---

## References

- `skills/product/rice-scoring.md` — RICE provides the quantitative input to MoSCoW classification
- `skills/product/opportunity-cost.md` — Deferral cost quantification for Should and Could items
- `skills/product/roadmap-health.md` — Roadmap-level MoSCoW application
- `docs/engineering-playbook.md` → Prioritization section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/product/rice-scoring.md` | RICE scores inform MoSCoW classification |
| `skills/product/opportunity-cost.md` | Quantifies the cost of deferring a Should or Could |
| `skills/product/okr-alignment.md` | OKR mapping determines which items qualify as Must |
| `skills/cross-functional/product-partnership.md` | MoSCoW output shared with PM; joint classification |
