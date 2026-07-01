# Skill: Sales Alignment

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (roadmap signal) + On-demand (deal escalation, custom request)

---

## Purpose

Align engineering with the sales organization — providing accurate delivery commitments that Sales can use with customers, managing custom engineering requests from deals, and ensuring that promises made in the sales process are technically sound before they're made.

Sales and engineering are often in tension because their incentives diverge: Sales closes deals on the promise of future capabilities; engineering delivers those capabilities on a schedule that may not match the promise. The EM's job is to create a partnership where Sales has accurate information and engineering has visibility into deal-critical commitments.

**The alignment imperative**: A promise made by Sales that engineering cannot keep damages the customer relationship, the deal, and the company. The EM is the technical authority who determines what can and cannot be promised — and when.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of Sales-promised features that had engineering confirmation before commitment | >90% | <80% = Yellow; <70% = Red |
| **Decision latency** | Hours to respond to a Sales request for engineering feasibility | ≤4 business hours | >24 hours = Yellow; >48 hours = Red |
| **Cross-team blockers** | Active deals blocked by engineering delivery uncertainty | 0 | >2 active = Yellow |
| **Dependency aging** | Deal-critical engineering commitments with unresolved risk >5 days | 0 | >1 aging = Yellow |
| **Collaboration health** | Sales has accurate roadmap; engineering reviews custom requests; no surprise promises | Green | Surprise commitments = Red |
| **Stakeholder satisfaction** | Sales leadership's confidence that engineering is a reliable partner | Green | Quarterly 1:1 with VP Sales |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Active deal pipeline** | Deals in late-stage that have engineering dependencies |
| **Custom feature requests** | Non-roadmap engineering work being requested for specific deals |
| **Roadmap accuracy signal** | What Sales is communicating to prospects vs. what engineering can deliver |
| **Committed delivery dates** | Any dates engineering has confirmed to Sales or customers |

### Optional
| Input | Description |
|---|---|
| **Deal size and priority** | Revenue at risk per deal — helps prioritize custom requests |
| **Competitor feature gaps** | What competitors offer that Sales uses as a reference |
| **Customer technical requirements** | Specific technical constraints from enterprise prospects |

---

## Analysis

### Step 1 — Build the Deal-Engineering Dependency Map

For each late-stage deal with engineering dependencies:

| Deal | Feature needed | Roadmap? | Committed date | Engineering confidence | Risk |
|---|---|---|---|---|---|
| {{Deal A}} | {{feature}} | Yes — Q3 | {{date}} | High | None |
| {{Deal B}} | {{feature}} | No — custom | TBD | Low | Custom scope needed |
| {{Deal C}} | {{feature}} | Yes — Q4 | {{date}} | Medium | Timeline risk |

This map gives Sales leadership and the EM a shared view of deal-engineering dependencies.

### Step 2 — Evaluate Custom Feature Requests

Custom engineering work for specific deals is the highest-friction Sales-engineering interaction. Evaluate every custom request on four dimensions:

| Dimension | Question | Threshold |
|---|---|---|
| **Technical feasibility** | Can we build this? | Yes / Partial / No |
| **Roadmap fit** | Is this aligned with where product is going? | Yes / Neutral / Divergent |
| **Cost** | What is the engineering cost in person-weeks? | {{N}} weeks |
| **Revenue at risk** | What is the deal value if we say no? | ${{X}} |

**Custom request decision matrix:**

| Revenue at risk | Roadmap fit | Engineering cost | Recommendation |
|---|---|---|---|
| >$500K | Yes | <4 weeks | Accept — align to roadmap if possible |
| >$500K | No | <4 weeks | Accept with VP approval — evaluate as one-off |
| >$500K | Yes | >4 weeks | Accept with sprint capacity trade-off approval |
| <$500K | No | >4 weeks | Decline — engineering cost exceeds deal economics |
| Any | Any | >12 weeks | Decline — creates delivery risk across all customers |

### Step 3 — Manage Sales Communication of the Roadmap

Sales needs to communicate the roadmap to prospects without overcommitting engineering. Establish:

1. **Roadmap language standards** for Sales: what they can and cannot say
2. **Feasibility review process**: Sales submits requests; engineering responds within 4 hours
3. **Commitment authorization**: Only engineering (via EM) can authorize a delivery commitment

**Language standards for Sales:**

| What Sales wants to say | Approved framing |
|---|---|
| "We'll have X by Q3" | "X is on our Q3 roadmap" (until engineering confirms a date) |
| "We can build that for you" | "Let me check with engineering and get back to you today" |
| "That's just 2 weeks of work" | Never — Sales cannot estimate engineering work |

---

## Decision Tree

```
What is the state of the Sales alignment?

├── SALES HAS MADE AN UNCOMMITTED PROMISE (engineering hasn't confirmed)
│   └── Immediate: Get the details — what was promised, to whom, by when
│       Assess: Can engineering deliver? At what cost to current roadmap?
│       Options: Confirm the commitment / negotiate the scope / surface the conflict
│       Never: Let an uncommitted promise stand without engineering review
│       Frame to Sales: "I need to validate this before it becomes a customer commitment."

├── CUSTOM FEATURE REQUEST FOR A DEAL
│   └── Apply the decision matrix (see Step 2)
│       Respond within 4 hours — Sales is talking to a customer
│       If yes: Confirm cost, timeline, and what gets displaced on the roadmap
│       If no: Provide an alternative or a partial solution where possible
│       If maybe: Ask for 24 hours to scope properly

├── DEAL-CRITICAL DATE IS AT RISK
│   └── Notify Sales leadership within 24 hours — before the customer hears
│       Provide: New date + confidence + options (partial / soft / delayed delivery)
│       Frame: Business language. "The [capability] delivery is moving from [X] to [Y]
│               due to [reason]. Options: [options]."
│       → Invoke: skills/executive/executive-risk-report.md if ARR is at risk

├── PIPELINE REVIEW REVEALS SYSTEMATIC ALIGNMENT GAPS
│   └── Pattern: Sales is consistently promising features engineering hasn't confirmed
│       Fix: Joint Sales-Engineering-PM roadmap review monthly
│           Establish feasibility review SLA (4-hour response)
│       Escalate: To VP Sales and VP Engineering — this is a process issue, not a case issue

└── ALIGNMENT IS HEALTHY
    └── Maintain: Monthly pipeline review with Sales leadership
        Invest: Quarterly Sales enablement — help Sales understand what engineering is building
        Recognize: When engineering enables a deal close, attribute it in shared forums
```

---

## Output

### Sales Alignment Report (Monthly)

```
SALES-ENGINEERING ALIGNMENT — {{Month}}

METRICS
Alignment score:      {{N}}% Sales commitments confirmed by engineering | {{🟢/🟡/🔴}}
Decision latency:     {{N}} hrs avg response to feasibility requests | {{🟢/🟡/🔴}}
Cross-team blockers:  {{N}} active deals blocked by delivery uncertainty | {{🟢/🟡/🔴}}
Dependency aging:     {{N}} deal commitments with unresolved risk >5d | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{VP Sales last signal + date}}

DEAL-ENGINEERING DEPENDENCY MAP
Deal          | Feature         | Confidence | Date       | Risk
{{Deal A}}    | {{feature}}     | High ✅    | {{date}}   | None
{{Deal B}}    | {{feature}}     | Medium 🟡  | {{date}}   | {{risk}}
{{Deal C}}    | Custom — TBD    | Low 🔴     | TBD        | Custom scope

CUSTOM REQUESTS THIS PERIOD
• {{Request}} — deal: {{name}} | ARR: ${{X}} | Decision: {{Accept/Decline/Scope}} | Reason: {{rationale}}

UNCOMMITTED PROMISES SURFACED
• {{Description}} — {{action taken}}

ENGINEERING ENABLING WINS
• {{Deal or capability that closed because of engineering delivery}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Deal-engineering dependency map maintained | Base: 65% |
| Custom request decision matrix applied | +10% |
| Feasibility response within 4 hours | +10% |
| Uncommitted promises surfaced and resolved | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| Sales making commitments without engineering review | −25% |
| No custom request evaluation process | −15% |
| Feasibility response >48 hours | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Uncommitted promises** | Sales commits engineering to work engineering hasn't agreed to | Establish authorization rule: only EM can authorize engineering commitments. |
| **Slow feasibility response** | Sales waits >24 hours for engineering to say yes/no | 4-hour SLA for feasibility. This is deal-critical time. |
| **No custom request evaluation** | Custom work absorbed without roadmap impact assessment | Apply the decision matrix. Custom work displaces something. Make it visible. |
| **No pipeline visibility** | EM discovers deal-critical commitments late | Monthly pipeline review with Sales. This is a required cadence, not optional. |
| **Binary yes/no on custom requests** | "Can't do it" without alternatives | Always offer a partial, phased, or alternative path. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/marketing-alignment.md` — Sales and marketing launches often coordinated
- `docs/engineering-playbook.md` → Managing Across, Stakeholders sections

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/marketing-alignment.md` | Launch alignment often shared between sales and marketing |
| `skills/cross-functional/customer-success.md` | Post-sale customer commitments managed through CS partnership |
| `skills/executive/investment-proposal.md` | When custom engineering for a deal needs formal budget approval |
| `skills/cross-functional/dependency-management.md` | Deal-engineering dependencies tracked here |
