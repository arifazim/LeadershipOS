# Skill: Support Escalation

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (escalation arrives) + Weekly (escalation queue review)

---

## Purpose

Manage the interface between engineering and the customer support organization — ensuring that support escalations are triaged quickly, resolved with appropriate urgency, and fed back into the engineering process to prevent recurrence.

Support is engineering's early warning system. A spike in support tickets about a specific feature is a leading indicator of a user-facing defect, a UX problem, or a reliability issue — often before it reaches incident severity. EMs who have a healthy support relationship see problems early. Those who don't find out in post-mortems.

**The escalation contract**: Support owns the customer conversation. Engineering owns the technical resolution. Support should never have to chase engineering for status. Engineering should never be surprised by a support escalation that could have been caught by a monitoring alert.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of support escalations with engineering acknowledgment within SLA | >95% | <90% = Yellow; <80% = Red |
| **Decision latency** | Median hours from support escalation to engineering triage | ≤2 hours | >4 hours = Yellow; >8 hours = Red |
| **Cross-team blockers** | Support tickets blocked waiting for engineering investigation >24 hours | 0 | >3 active = Yellow |
| **Dependency aging** | Open support escalations without resolution or timeline >5 days | 0 | >3 aging = Yellow |
| **Collaboration health** | Weekly escalation review held; recurring issues root-caused; support informed of fixes | Green | No feedback loop = Yellow |
| **Stakeholder satisfaction** | Support leadership's confidence that engineering responds appropriately | Green | Quarterly 1:1 |

**Escalation triage SLA:**
```
Critical (P1): Service down for customer or segment → acknowledge within 30 min; engage immediately
High (P2):     Core workflow broken; no workaround → acknowledge within 1 hour; triage within 2 hours
Medium (P3):   Significant bug; workaround exists → acknowledge within 4 hours; schedule within 48 hours
Low (P4):      Minor bug; UX issue; feature request → acknowledge within 24 hours; route to backlog
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Active escalation queue** | Current escalations from support with severity and age |
| **Escalation volume trend** | Is the number of escalations increasing, stable, or decreasing? |
| **Recurring issue patterns** | Same issue appearing in multiple support tickets |
| **Resolution time data** | How long escalations are taking to resolve |

### Optional
| Input | Description |
|---|---|
| **Support CSAT data** | Customer satisfaction scores that may reflect resolution quality |
| **Ticket routing accuracy** | Are escalations correctly categorized when they arrive? |
| **Known issues list** | Engineering-acknowledged bugs that support can reference |

---

## Analysis

### Step 1 — Escalation Triage Process

Every escalation needs a triage decision within SLA:

| Triage outcome | Criteria | Next step |
|---|---|---|
| **Engineering bug** | Reproducible defect in engineering code | Add to sprint (P1/P2) or backlog (P3/P4); communicate timeline to support |
| **Configuration issue** | User or account configuration problem | Provide support with self-service fix; no engineering change needed |
| **Expected behavior** | Product is working as designed; user misunderstood | Provide support with explanation; consider UX or documentation fix |
| **Data issue** | Bad data state; needs data fix | Engineering data fix (treat as bug); timeline to support |
| **Known issue** | Already in engineering's backlog | Link to existing ticket; provide estimated timeline |

### Step 2 — Identify Recurring Patterns

Individual tickets are support problems. Patterns are engineering problems.

```
Pattern detection threshold:
  Same issue type in >3 tickets within 7 days → flag to engineering for investigation
  Same issue type in >5 tickets within 30 days → escalate to PM as product problem
  Sudden volume spike (2× normal) for any issue type → treat as potential incident signal
```

When a pattern is identified:
1. Engineering investigates root cause (even if individual tickets are low severity)
2. Add root cause fix to sprint if pattern is P2 or above impact
3. Provide support with interim guidance while fix is in progress

### Step 3 — Close the Feedback Loop

Support needs to know when engineering ships a fix for a known issue. Without this:
- Support continues sending workarounds for problems that are already fixed
- Customers are told to wait for something that already shipped
- Trust in engineering erodes

**Fix notification process:**
```
When engineering ships a fix for a support-escalated issue:
  1. Tag the fix in the PR/commit with the support ticket ID
  2. Notify support lead when fix is deployed to production
  3. Support updates affected customers
  4. Engineering closes out the escalation ticket
```

---

## Decision Tree

```
What is the state of the support escalation?

├── P1/P2 ESCALATION ARRIVES
│   └── Engineering acknowledges within SLA (30 min for P1, 1 hour for P2)
│       First response to support: "We have this. [Engineer X] is investigating.
│       We'll update you in [N] hours."
│       Update cadence: Every 2 hours until resolved for P1; every 4 hours for P2
│       Do NOT: Let support chase engineering for status on an active P1/P2

├── ESCALATION VOLUME SPIKE (2× normal)
│   └── Treat as potential incident: investigate immediately
│       Check: Is this a deployment-related issue? (Check change failure rate)
│       Check: Is this localized to a customer segment or universal?
│       If incident: Invoke subagents/incident-manager.md
│       If not incident: Root cause the pattern; expedite fix

├── RECURRING PATTERN DETECTED (>3 same-type tickets in 7 days)
│   └── Action: Engineering investigation within 48 hours
│       Report to support lead: "We've identified a pattern. Investigating root cause.
│       Here is interim guidance for affected customers."
│       Escalate to PM if pattern represents a product gap, not just a bug
│       → Invoke: skills/cross-functional/product-partnership.md

├── ESCALATION AGING (>5 days without resolution or timeline)
│   └── EM follows up with engineering assignee same day
│       Communicate to support: "Current status is [X]. Expected resolution: [date].
│       Here is what customers can do in the meantime."
│       Do NOT: Let aging escalations stay silent

└── ESCALATION PROCESS IS HEALTHY
    └── Maintain: Weekly escalation queue review (15 minutes)
        Invest: Quarterly support-engineering session — support demos common failure modes
        Recognize: When engineering closes a long-standing support pain point
```

---

## Output

### Escalation Queue Report (Weekly)

```
SUPPORT ESCALATION REPORT — Week of {{date}}

METRICS
Alignment score:     {{N}}% escalations acknowledged within SLA | {{🟢/🟡/🔴}}
Decision latency:    {{N}} hrs median triage time | {{🟢/🟡/🔴}}
Cross-team blockers: {{N}} tickets waiting >24h for engineering | {{🟢/🟡/🔴}}
Dependency aging:    {{N}} open escalations >5d without timeline | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{Support team's last signal + date}}

ACTIVE ESCALATIONS
Ticket  | Issue              | Severity | Age | Status          | ETA
#{{N}}  | {{description}}    | P2       | 2d  | In progress     | {{date}}
#{{N}}  | {{description}}    | P3       | 6d  | Scheduled S44   | {{date}}
#{{N}}  | {{description}}    | P2       | 1d  | Triaged — bug   | {{date}}

RECURRING PATTERNS THIS WEEK
• {{Pattern}} — {{N}} tickets — action: {{investigation / escalated to PM / fix scheduled}}

FIXES DEPLOYED THIS WEEK (notify support)
• {{Fix description}} — resolves tickets: {{ticket IDs}} — deployed: {{date}}

VOLUME TREND
This week: {{N}} escalations | Last week: {{N}} | 4-week avg: {{N}}
Signal: {{Stable / Increasing / Decreasing}} | {{🟢/🟡/🔴}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Escalation triage SLA defined and tracked | Base: 65% |
| Pattern detection threshold defined | +10% |
| Fix notification process in place | +10% |
| Weekly escalation queue review held | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| No SLA defined for escalation response | −20% |
| Support chases engineering for status | −15% |
| No feedback loop when fixes are shipped | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Support chasing engineering** | Support sends follow-ups because engineering doesn't proactively update | Build proactive update cadence into every P1/P2 response. |
| **No pattern detection** | Same issue appears in 10 tickets; each treated as isolated | Define pattern threshold. 3 same-type tickets in 7 days = investigate. |
| **No fix notification** | Engineering ships fix; support doesn't know; customers keep getting workarounds | Tag fixes with ticket IDs. Notify support on deploy. Close the loop. |
| **Volume spike missed** | Spike in escalations not treated as incident signal | Compare to 4-week average. 2× = check for incidents. |
| **Escalation treated as support job** | Engineering filters all support escalations through PM | EM has a direct relationship with support lead. Some escalations bypass the queue. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/customer-success.md` — CS escalations that originate in support
- `subagents/incident-manager.md` — When support volume spike indicates an incident

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/customer-success.md` | High-priority support escalations route to CS |
| `subagents/incident-manager.md` | Volume spikes may indicate production incidents |
| `skills/cross-functional/product-partnership.md` | Recurring support patterns escalated to product |
| `skills/cross-functional/qa-partnership.md` | Support escalations feed into defect escape rate tracking |
