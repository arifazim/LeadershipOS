# Skill: Design Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Per-sprint (design handoff) + Weekly (sync)

---

## Purpose

Manage the engineering-design relationship so that design and engineering are never blocked on each other, design intent is preserved in implementation, and the gap between what was designed and what was built is measured and minimized.

The design-engineering handoff is one of the most common sources of rework, friction, and quality degradation in product teams. Designs delivered too late block engineering. Designs delivered too early are implemented without the design context that made them good.

**The partnership standard**: Design should be one sprint ahead of engineering. Not two sprints (stale by implementation). Not concurrent (too late). One sprint ahead — designs are ready when engineering needs them, not before and not during.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of sprint items with finalized designs at sprint start | >90% | <80% = Yellow; <70% = Red |
| **Decision latency** | Median days to resolve design-engineering implementation questions | ≤1 day | >3 days = Yellow; >7 days = Red |
| **Cross-team blockers** | Sprint items blocked waiting for design (missing, unclear, or in-revision) | 0 | >1/sprint = Yellow |
| **Dependency aging** | Engineering stories waiting on design input for >3 business days | 0 | >2 aging = Yellow |
| **Collaboration health** | Design attends sprint demos; engineers attend design reviews; rework rate | Green | High rework = Yellow |
| **Stakeholder satisfaction** | Designer's reported confidence that engineering implements design intent | Green | Quarterly 1:1 |

**Rework rate** (primary quality signal for design partnership):
```
Rework rate = (stories requiring design revision post-implementation) ÷ (total stories shipped) × 100
Target: <5%
Yellow: 5–15%
Red: >15%
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Design pipeline state** | What is designed and ready vs. in-progress vs. not started |
| **Current sprint stories** | Which stories need designs and whether they have them |
| **Design debt** | Shipped features with unresolved design inconsistencies |
| **Rework history** | Cases where implementation diverged from design intent |

### Optional
| Input | Description |
|---|---|
| **Design system state** | Is the design system current? Are components available? |
| **Accessibility requirements** | Design-sourced accessibility constraints engineering must implement |
| **UX research inputs** | Research findings that are shaping current design decisions |

---

## Analysis

### Step 1 — Assess Design Readiness

For each story in the upcoming sprint, classify:

| Status | Criteria | Engineering action |
|---|---|---|
| ✅ Design complete | Final designs in design tool; annotations present; edge cases covered | Implement |
| 🟡 Design in progress | Designs exist but in revision or missing edge cases | Implement with flagged risk — check back before edge cases |
| 🔴 Design not started | No designs available | Do not schedule for sprint; flag dependency |

### Step 2 — Protect Design Intent Through Implementation

Design intent degrades through implementation when:
- Specs are ambiguous and engineers make local decisions
- Designs don't include responsive or edge case states
- Design and engineering never review together mid-implementation

**Design intent preservation practices:**
1. Kickoff: Designer walks through designs with engineers before implementation starts (15 minutes)
2. Mid-point: Engineer demos in-progress implementation to designer before polishing
3. Completion: Designer reviews implementation before marking story done

### Step 3 — Manage the Design Debt

Design debt is unresolved inconsistency between shipped product and design standards:
- Inconsistent component usage
- Visual regressions from rapid iterations
- Missing states (loading, empty, error) that weren't designed

Track design debt as a backlog. Review quarterly with design partner.

---

## Decision Tree

```
What is the state of the design pipeline?

├── DESIGN IS BEHIND (designs not ready for upcoming sprint)
│   └── Immediate: Identify which stories are blocked
│       Option A: Delay those stories to next sprint (protect quality)
│       Option B: Proceed with wireframes and agree to a design review checkpoint
│       Never: Ship without any design guidance and "fix it later"
│       Conversation: "We have {{N}} stories without designs. Options: delay to next
│                      sprint, or proceed with wireframes with a review checkpoint."

├── HIGH REWORK RATE (>5% of stories revised post-implementation)
│   └── Root cause: Where is the gap — missing specs, ambiguous annotations, no kickoff?
│       Most common causes:
│       1. No design kickoff — engineer didn't understand intent
│       2. Edge cases not designed — engineer made local decisions
│       3. Designs changed after implementation started — process gap
│       Fix: Add kickoff ritual; require edge case coverage before "design complete"

├── DESIGN BLOCKS OCCURRING (designs missing mid-sprint)
│   └── Structural problem: Design is not one sprint ahead
│       Fix: Create a design readiness gate — designs must be "design complete"
│            N days before the sprint they're scheduled in
│       Escalation: If designer is capacity-constrained, surface to PM and design lead

├── DECISION LATENCY HIGH (implementation questions take >3 days)
│   └── Add: Design-on-call availability during sprint (async channel, same-day response)
│       Establish: Implementation questions get a response within 4 working hours
│       Escalate: If designer unavailable, who is the backup decision maker?

└── PARTNERSHIP IS HEALTHY
    └── Invest: Invite designers to sprint retrospectives (they benefit from implementation feedback)
        Recognize: Public attribution when design quality drives positive outcomes
        Maintain: Quarterly partnership retro — what's working, what to improve
```

---

## Output

### Design Partnership Health Report

```
DESIGN PARTNERSHIP HEALTH — Sprint {{N}} / Week of {{date}}

METRICS
Alignment score:     {{N}}% designs ready at sprint start | {{🟢/🟡/🔴}}
Decision latency:    {{N}} hrs median for implementation questions | {{🟢/🟡/🔴}}
Cross-team blockers: {{N}} stories blocked on design | {{🟢/🟡/🔴}}
Dependency aging:    {{N}} stories waiting >3d on design input | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Rework rate:         {{N}}% of stories required design revision | {{🟢/🟡/🔴}}
Stakeholder satisfaction: {{Designer's last reported signal + date}}

DESIGN PIPELINE STATE
Ready for next sprint: {{N}}/{{N}} stories
In progress (at risk): {{list}}
Not started (block):   {{list}} — action: {{plan}}

DESIGN DEBT ITEMS
• {{Item}}: {{description and age}}

DECISIONS PENDING
• {{Implementation question}} — designer: {{name}} — needed by: {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Design readiness tracked per sprint | Base: 65% |
| Rework rate measured | +10% |
| Design kickoff ritual in place | +10% |
| Decision latency tracked | +10% |
| Design debt log maintained | +5% |
| Rework not measured | −15% |
| No design readiness gate | −20% |
| Design and engineering never review together | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Late designs** | Designs arrive during sprint; implementation paused | Enforce one-sprint-ahead rule. Gate sprint commitment on design readiness. |
| **No kickoff** | Engineer implements without understanding intent | 15-minute kickoff before every story. Required. |
| **Invisible rework** | Rework happens but isn't tracked | Measure rework rate. Rework is a signal about partnership health, not just quality. |
| **Design debt accumulates** | Shipped product diverges from design standards over time | Quarterly design debt review. Allocate sprint capacity for debt repayment. |
| **No decision owner for implementation questions** | Engineer blocked waiting for designer who's in meetings | Establish async design channel with SLA. Questions get 4-hour responses. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/product-partnership.md` — Closely related upstream partner
- `docs/engineering-playbook.md` → Managing Across section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/dependency-management.md` | Meta-skill for tracking design dependencies |
| `skills/cross-functional/product-partnership.md` | Product and design partnerships are often jointly managed |
| `skills/cross-functional/qa-partnership.md` | QA partnership affected by design quality upstream |
| `skills/delivery/review-sprint.md` | Rework rate is a sprint health signal |
