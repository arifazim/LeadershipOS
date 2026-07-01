# Skill: Product Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly (sync) + Sprint (planning alignment) + Quarterly (roadmap)

---

## Purpose

Build and maintain a high-functioning engineering-product partnership — where requirements are well-defined before engineering starts, trade-offs are decided jointly, and neither team is surprised by the other's constraints.

The engineering-product relationship is the highest-leverage cross-functional relationship an EM manages. When it works well, delivery is predictable, scope is stable, and trust compounds. When it breaks down, scope creep, late requirement changes, and blame cycles destroy both teams.

**The partnership contract**: Product owns the problem and the priority. Engineering owns the solution and the estimate. Neither team owns both — and neither should try to.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of sprint items with agreed acceptance criteria before sprint start | >90% | <80% = Yellow; <70% = Red |
| **Decision latency** | Median days to resolve a product-engineering trade-off decision | ≤2 days | >5 days = Yellow; >10 days = Red |
| **Cross-team blockers** | Sprint items blocked by missing, unclear, or changed requirements | 0 | >1/sprint = Yellow; >3/sprint = Red |
| **Dependency aging** | Stories waiting on product input for >5 business days | 0 | >2 aging = Yellow |
| **Collaboration health** | Weekly sync held, commitments followed, retros include product | Green | Per scoring table in dependency-management.md |
| **Stakeholder satisfaction** | PM's reported confidence in engineering partnership | Green | Assessed quarterly in PM 1:1 |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Sprint backlog state** | Stories ready vs. not ready for engineering |
| **Requirement clarity signal** | % of next sprint's stories with accepted criteria defined |
| **In-flight scope changes** | Any requirement changes to stories already in development |
| **Product roadmap** | Current quarter and next quarter priorities from the PM |

### Optional
| Input | Description |
|---|---|
| **Customer research** | User feedback that is shaping upcoming requirements |
| **Business context** | Why certain features are priority — helps engineers make better local decisions |
| **Dependency signals from PM** | What product is waiting on from other teams |

---

## Analysis

### Step 1 — Assess Requirement Readiness

Before each sprint, score the readiness of every candidate story:

| Status | Criteria | Action |
|---|---|---|
| ✅ Ready | Acceptance criteria defined, edge cases discussed, designs available | Can commit |
| 🟡 Near-ready | Acceptance criteria partial; minor questions outstanding | Commit with flagged risk |
| 🔴 Not ready | No acceptance criteria; designs missing; requirements unclear | Do not commit; schedule definition session |

**Rule**: Never commit to a story that is Not Ready. The cost of clarifying requirements before sprint is always lower than the cost of rework mid-sprint.

### Step 2 — Calculate the Alignment Score

```
Alignment score = (stories with complete acceptance criteria at sprint start) ÷ (total sprint stories) × 100

Target: >90%
If <80%: Sprint readiness is Yellow — raise with PM before sprint planning
If <70%: Sprint readiness is Red — delay sprint planning until readiness improves
```

### Step 3 — Manage Scope Changes In-Flight

Every scope change during a sprint has a cost. Make it visible:

```
Scope change cost formula:
  If change is in-progress work: +50% of original estimate (rework cost)
  If change is not-yet-started work: +20% of original estimate (context switch)
  If change is addition to sprint: Remove equivalent points to maintain capacity

Communicate every scope change to PM as: "This change costs N points.
To absorb it, we defer [item X]. Confirm?"
```

### Step 4 — Diagnose Partnership Health

| Pattern | Symptom | Root cause | Fix |
|---|---|---|---|
| High scope change rate | Requirements change mid-sprint frequently | Product doesn't have enough discovery runway | Extend product's planning horizon; define 2 sprints ahead |
| Low alignment score | Stories start sprint unready | Definition of Ready not enforced | Add readiness gate to sprint planning ritual |
| High decision latency | Trade-off decisions take >5 days | No regular PM-EM decision meeting | Add a weekly "decision clearing" meeting |
| Repeated blockers | Same type of requirement gap appears | Structural process gap | Identify the pattern; fix the upstream process |

---

## Decision Tree

```
What is the state of the product partnership?

├── PARTNERSHIP IS HEALTHY (all metrics Green)
│   └── Maintain: Weekly sync, quarterly retro of the partnership itself
│       Invest: Share engineering context with PM proactively — they make better
│               product decisions with more technical understanding
│       Signal: Explicitly acknowledge partnership wins to both teams

├── ALIGNMENT SCORE <80% (requirement readiness failing)
│   └── Immediate: Do not start sprint until readiness improves
│       Conversation: "We have {{N}} stories that aren't ready. Sprint planning needs
│                      to be 2 days later, or we reduce sprint scope to ready stories."
│       Structural fix: Add "Definition of Ready" checklist to sprint planning ritual
│       → If recurring: escalate to joint EM-PM retrospective on planning process

├── SCOPE CHANGES >2 PER SPRINT (requirement instability)
│   └── Immediate: Make scope change cost visible on every instance
│       Conversation: "This change costs N points. We can absorb it by deferring X.
│                      Confirm?"
│       Structural fix: Define a scope freeze point (e.g., Day 3 of sprint)
│                       Changes after freeze go to next sprint

├── DECISION LATENCY >5 DAYS (cross-team decisions stalled)
│   └── Immediate: Name the decision, the owner, and the deadline explicitly
│       Add: Weekly "decision clearing" agenda item to PM-EM sync
│       Escalate: If decision is on critical path, involve VP within 24 hours

└── PARTNERSHIP IS STRAINED (collaboration health Yellow or Red)
    └── Action: Direct 1:1 with PM — name the pattern, not the symptoms
        Frame: "I've noticed [pattern]. I want us to have a good partnership.
                What's getting in the way for you?"
        If unresolved: Joint conversation with both managers
        Never: Let a strained relationship go unnamed for more than 2 weeks
```

---

## Output

### Partnership Health Report (Weekly)

```
PRODUCT PARTNERSHIP HEALTH — Week of {{date}}

METRICS
Alignment score:     {{N}}% | Target: >90% | {{🟢/🟡/🔴}}
Decision latency:    {{N}} days median | Target: ≤2 days | {{🟢/🟡/🔴}}
Cross-team blockers: {{N}} | Target: 0 | {{🟢/🟡/🔴}}
Dependency aging:    {{N}} stories waiting >5d on product input | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{last signal + date}}

NEXT SPRINT READINESS
Ready: {{N}}/{{N}} stories ({{N}}%)
Not ready: {{list}} — action: {{who is doing what by when}}

SCOPE CHANGES THIS SPRINT
{{N}} changes | Cost: {{N}} points absorbed | Deferred: {{what moved}}

DECISIONS PENDING
• {{Decision}} — owner: {{PM or EM}} — needed by: {{date}}

PARTNERSHIP NOTES
{{One observation about partnership health this week — what's working or what to address}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Alignment score calculated for each sprint | Base: 65% |
| Scope changes logged with cost | +10% |
| Pending decisions tracked with owner and deadline | +10% |
| Partnership health assessed qualitatively | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| No alignment score tracked | −20% |
| Scope changes absorbed without logging | −15% |
| Partnership health assumed Green without assessment | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No readiness gate** | Unready stories committed to sprint | Enforce "Definition of Ready." Never commit to Not Ready. |
| **Invisible scope change cost** | PM adds scope; engineering absorbs without flagging | Every scope change gets a cost statement. Always. |
| **Decision by default** | No explicit decision made; engineering infers from silence | Name the decision, the owner, and the date. Silence is not agreement. |
| **Strained relationship ignored** | Tension accumulates for months | Name it in a 1:1 within 2 weeks of noticing it. |
| **Requirements without context** | Stories have acceptance criteria but no "why" | Ask the PM for business context. Engineers make better decisions with it. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions and tracking
- `docs/engineering-playbook.md` → Managing Across, Roadmaps, Prioritization sections
- `subagents/product-partner.md` — Product partner subagent

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/dependency-management.md` | Meta-skill for all cross-team dependency tracking |
| `skills/cross-functional/design-partnership.md` | Design is closely coupled to product in most orgs |
| `skills/executive/executive-decision-framework.md` | When product-engineering trade-offs need escalation |
| `subagents/product-partner.md` | Subagent that operationalizes this partnership |
