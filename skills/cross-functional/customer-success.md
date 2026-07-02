# Skill: Customer Success Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (feedback loop) + On-demand (escalation, churn risk)

---

## Purpose

Build a productive engineering-customer success partnership — ensuring that customer feedback reaches engineering systematically, that escalations are triaged and resolved with urgency, and that engineering understands the customer impact of its technical decisions.

Customer Success (CS) is engineering's clearest signal about whether what was built actually works for the customer. Most engineering teams treat CS as a support function. The best EMs treat CS as the primary voice of the customer in the engineering decision loop.

**The partnership model**: CS owns the customer relationship and the escalation signal. Engineering owns the resolution and the root cause. Neither team can do their job well without the other.

**Boundary with `skills/cross-functional/support-escalation.md`**: that skill covers individual support-originated tickets, triaged by severity and resolved case by case. This skill covers account-level relationship and churn-risk escalations — a pattern of unresolved issues threatening a customer relationship, not a single ticket. Support-escalation should hand off here once severity exceeds its resolution authority; this skill doesn't re-triage individual tickets that are already progressing through support's queue.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of CS-raised engineering issues with acknowledged owner and timeline | >90% | <80% = Yellow; <70% = Red |
| **Decision latency** | Median hours from CS escalation to engineering triage decision | ≤4 hours | >24 hours = Yellow; >48 hours = Red |
| **Cross-team blockers** | Customer accounts at churn risk due to unresolved engineering issues | 0 | >1 active = Yellow |
| **Dependency aging** | Open CS-engineering issues without resolution commitment for >7 days | 0 | >2 aging = Yellow |
| **Collaboration health** | CS informed of maintenance windows; engineering aware of customer segments; regular feedback loop | Green | No regular feedback loop = Yellow |
| **Stakeholder satisfaction** | CS leadership's confidence that engineering prioritizes customer issues appropriately | Green | Quarterly 1:1 |

**Customer impact severity classification:**
```
P1 (Critical): Product unusable for a customer segment; churn risk immediate → respond within 2 hours
P2 (High):     Core workflow broken for a customer; churn risk elevated → respond within 4 hours
P3 (Medium):   Significant inconvenience; workaround exists → respond within 24 hours
P4 (Low):      Feature request or minor bug → standard backlog; communicate timeline
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Active CS escalations** | Current customer issues that CS has escalated to engineering |
| **Churn risk accounts** | Customers where product issues are contributing to retention risk |
| **Customer feedback themes** | Recurring feedback patterns from CS 1:1s or support data |
| **Committed customer deliverables** | Engineering work that was promised to specific customers |

### Optional
| Input | Description |
|---|---|
| **NPS or CSAT trends** | Customer satisfaction metrics that may reflect engineering quality |
| **Feature requests by revenue segment** | Which customer segments are requesting what |
| **Workaround catalog** | Issues where CS has created workarounds; engineering should address root causes |

---

## Analysis

### Step 1 — Triage CS Escalations

Every CS escalation needs a triage decision within 4 hours:

| Decision | Criteria | Action |
|---|---|---|
| **Immediate fix** | P1 or P2; customer churn risk named | Engineering drops in now; CS notified of timeline |
| **Next sprint** | P3; meaningful customer impact; no workaround | Add to next sprint; CS notified of timing |
| **Backlog with timeline** | P4; workaround exists; low revenue impact | Add to backlog; communicate estimated quarter |
| **Won't fix** | Edge case; low impact; engineering cost too high | Explain the decision to CS; CS manages customer expectation |

**Rule**: "Won't fix" must be communicated to CS before CS communicates it to the customer. CS cannot be surprised by a no.

### Step 2 — Build the Customer Feedback Loop

CS has the richest customer feedback of any function. Engineering rarely has direct access to it. Build the loop:

1. **Monthly CS-Engineering sync**: CS presents top 5 customer friction points. Engineering responds with roadmap context.
2. **Feedback tagging**: CS logs customer feedback with engineering-relevant tags. Engineering reviews weekly.
3. **Issue attribution**: When an engineering fix resolves a customer issue, CS tracks the retention impact.

### Step 3 — Manage Committed Customer Deliverables

When engineering has committed to a specific customer (via Sales or CS):
- Track it explicitly in the delivery plan
- Notify CS ≥2 weeks before delivery if the date is changing
- CS manages the customer communication; engineering manages the technical delivery

**CS-engineering commitment register:**
```
Customer     | Commitment          | Eng date  | Confidence | CS contact
{{Name}}     | {{feature/fix}}     | {{date}}  | High ✅    | {{name}}
{{Name}}     | {{feature/fix}}     | {{date}}  | Medium 🟡  | {{name}}
```

---

## Decision Tree

```
What is the CS partnership state?

├── ACTIVE P1/P2 ESCALATION (churn risk account)
│   └── Immediate: Engineering engages within 2–4 hours
│       Communication to CS: "We have this. Here is our timeline. We'll update you every [N] hours."
│       Do NOT: Let CS find out about engineering status through the PM
│       → If systemwide: Invoke incident management (subagents/incident-manager.md)

├── CS ESCALATION AGING (>7 days without resolution commitment)
│   └── Action: EM follows up with engineering assignee same day
│       Communicate to CS: "Current status is [X]. Expected resolution: [date]."
│       If blocked: Name the blocker to CS and provide a workaround if one exists

├── RECURRING FEEDBACK PATTERN (same issue from multiple customers)
│   └── Action: Escalate to PM — this is a product signal, not a support signal
│       Frame: "CS has flagged [issue] from {{N}} customers in the last [period].
│               This is a product problem, not a one-off."
│       → Invoke: skills/cross-functional/product-partnership.md to surface to roadmap

├── CHURN RISK ACCOUNT (customer retention depends on engineering)
│   └── Escalate: EM + CS lead + PM joint call within 24 hours
│       Assess: What specifically would retain this customer?
│       Options: Accelerate fix / custom workaround / executive relationship intervention
│       Never: Let a named churn risk account sit unacknowledged

└── PARTNERSHIP IS HEALTHY
    └── Invest: Bring CS into sprint demos — let them see what's shipping
        Share: Upcoming maintenance windows with CS ≥72 hours in advance
        Recognize: When engineering prevents a churn, make it visible to both teams
```

---

## Output

### CS Partnership Health Report (Monthly)

```
CUSTOMER SUCCESS PARTNERSHIP HEALTH — {{Month}}

METRICS
Alignment score:      {{N}}% escalations with acknowledged owner + timeline | {{🟢/🟡/🔴}}
Decision latency:     {{N}} hrs avg triage response | {{🟢/🟡/🔴}}
Cross-team blockers:  {{N}} accounts at churn risk due to engineering issues | {{🟢/🟡/🔴}}
Dependency aging:     {{N}} issues without resolution commitment >7d | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{CS leadership's last signal + date}}

ACTIVE ESCALATIONS
Customer       | Issue              | Severity | Age | Status     | ETA
{{Name}}       | {{description}}    | P2       | 3d  | In progress| {{date}}
{{Name}}       | {{description}}    | P3       | 8d  | Scheduled  | Sprint 44

COMMITTED DELIVERABLES
Customer       | Commitment         | Date      | Confidence | Risk
{{Name}}       | {{description}}    | {{date}}  | High ✅    | None
{{Name}}       | {{description}}    | {{date}}  | Medium 🟡  | {{risk}}

TOP FEEDBACK THEMES THIS MONTH
1. {{Theme}} — {{N}} customers — {{action: roadmap / escalated to PM / acknowledged}}
2. {{Theme}} — {{N}} customers — {{action}}

ENGINEERING-ENABLED RETENTION
• {{Description of customer retained or issue resolved}} — ARR retained: ${{X}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| CS escalation triage within 4 hours | Base: 65% |
| Monthly feedback loop meeting held | +10% |
| Committed customer deliverables tracked | +10% |
| Churn risk accounts identified and actively managed | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| P1/P2 escalations not triaged within 4 hours | −25% |
| No CS feedback loop | −15% |
| CS surprised by "won't fix" decisions | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Slow triage** | CS escalations wait days for engineering to look at them | 4-hour triage SLA. This is customer money on the line. |
| **Surprised CS** | CS learns "won't fix" from the customer | Engineering communicates no-decisions to CS before CS communicates to customer. |
| **No feedback loop** | Engineering never hears what customers are struggling with | Monthly CS-Engineering sync. It changes what gets prioritized. |
| **Ignored aging issues** | Escalations sit for weeks without update | 7-day aging alert. EM follows up immediately. |
| **Engineering-CS isolation** | CS and engineering interact only through the PM | Direct EM-CS lead relationship. Don't route everything through PM. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/support-escalation.md` — Escalation management for support-originated issues
- `subagents/incident-manager.md` — When a CS escalation becomes a production incident

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/support-escalation.md` | Support escalations that become CS escalations |
| `skills/cross-functional/sales-alignment.md` | Customer commitments often made in sales and managed by CS |
| `subagents/incident-manager.md` | When a CS escalation triggers incident response |
| `skills/cross-functional/product-partnership.md` | Recurring CS feedback themes escalated to product |
