# Skill: Executive Decision Framework

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (any decision requiring executive input or approval)

---

## Purpose

Structure engineering decisions for executive consumption — framing options, evidence, and recommendations in a format that allows executives to make fast, well-informed decisions without requiring engineering context.

Executives make dozens of decisions per week. The EM who presents a decision well gets a decision. The EM who presents a decision poorly gets a meeting, then another meeting, then a request for more data, then eventual drift.

**The cardinal rule**: Never come to an executive with a question. Come with a recommendation supported by evidence and a clear ask. Executives are not hired to make decisions for you. They are hired to decide things only they can decide. Know which category your decision is in.

**Decision classification**:
- **Your decision**: You have the authority, the information, and the accountability. Make it. Do not escalate.
- **Joint decision**: Affects multiple teams or requires executive awareness, but the EM is the primary owner.
- **Executive decision**: Requires authority, budget, or political capital only the executive has.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The decision** | What needs to be decided, specifically |
| **Decision owner** | Who has the authority to make this call |
| **Options** | At minimum two options — including "do nothing" as an explicit option |
| **Your recommendation** | What you believe the right call is and why |
| **Decision deadline** | When does the window close? What closes if delayed? |

### Optional
| Input | Description |
|---|---|
| **Evidence** | Data supporting your recommendation |
| **Risk of each option** | What can go wrong with each path |
| **Stakeholders affected** | Who needs to be informed of the decision |
| **Reversibility** | How easy is it to undo this decision if it's wrong? |
| **Prior decisions** | Related decisions that constrain this one |

---

## Analysis

### Step 1 — Classify the Decision

Before building the framework, confirm this decision actually needs executive input:

| Question | If Yes | If No |
|---|---|---|
| Does it require budget the EM doesn't control? | Escalate | EM decides |
| Does it affect another team's roadmap or resources? | Escalate or align | EM decides |
| Does it set a precedent that changes company policy? | Escalate | EM decides |
| Does it require the executive's political capital? | Escalate | EM decides |
| Could the EM defend the decision independently? | EM decides | Consider escalating |

**Warning**: Over-escalating decisions that are yours to make is as damaging as under-escalating. Executives lose confidence in EMs who bring them decisions that should have been made without them.

### Step 2 — Build the Options Table

Every well-framed executive decision has:
- Minimum 2 options (maximum 4)
- Status quo always named as an option
- Each option with: cost, benefit, risk, reversibility

| Option | What it is | Cost | Benefit | Risk | Reversible? |
|---|---|---|---|---|---|
| A | {{description}} | {{$X or eng-weeks}} | {{outcome}} | {{downside}} | {{Yes/No}} |
| B | {{description}} | {{$X or eng-weeks}} | {{outcome}} | {{downside}} | {{Yes/No}} |
| Status quo | Do nothing | {{ongoing cost}} | {{none new}} | {{what degrades}} | N/A |

### Step 3 — Generate the Recommendation

The recommendation must:
- Name one option (not "A or B depending on your priorities")
- State the rationale in 1–2 sentences
- Acknowledge the primary counterargument ("The case for Option B is X. My response is Y.")

A recommendation that hedges ("it depends") is not a recommendation. It is a question dressed up as an analysis.

### Step 4 — Name the Decision Window

Every decision has a window. After the window closes, some options are no longer available.

Examples:
- "If we don't decide on Option A by Friday, the vendor slot is taken by another customer"
- "Sprint planning is Monday. After that, inserting this scope costs two weeks of disruption"
- "The open source project is forking in Q3. Deciding now costs less than deciding post-fork"

Never present a decision without naming when it must be made and what is lost by waiting.

---

## Decision Tree

```
What type of decision needs to be framed?

├── ARCHITECTURAL / TECHNICAL DIRECTION
│   └── Frame: Business outcome at stake → options with trade-offs → recommendation
│       Translation rule: Never use architectural terminology. Frame as:
│       "Speed vs. safety", "now vs. later", "cheap vs. right"
│       Evidence needed: Cost estimate, risk assessment, team capability signal
│       → Also invoke: subagents/tech-lead.md for the technical analysis

├── PRIORITY / SCOPE TRADE-OFF
│   └── Frame: Constraints → what we can deliver → what must be deferred → ask
│       Options: scope A vs. scope B, timeline extension, resource increase
│       Translation rule: Every option is framed as "if we do X, Y is delayed by Z"
│       Evidence needed: Current capacity, committed dates, stakeholder impact

├── RISK DECISION (accept vs. mitigate)
│   └── Frame: Risk description → probability × impact → mitigation cost → options
│       → Also invoke: skills/executive/executive-risk-report.md for the full risk frame
│       Options: Accept risk / Mitigate risk / Transfer risk (contract / insurance)
│       Recommendation must name the risk posture explicitly: "I recommend we accept this."

├── PEOPLE / ORG DECISION
│   └── Frame: Business impact of current state → options → recommendation
│       These decisions are sensitive. Facts first. Recommendation is clear.
│       Options: restructure, backfill, promote, performance management
│       Evidence: Business impact data, not personality assessment

└── VENDOR / BUILD / BUY
    └── Frame: Capability needed → options (build vs. buy vs. partner)
        → cost comparison → time comparison → risk comparison → recommendation
        Evidence: Market research, build estimate, vendor proposal
        Rule: Build is almost always slower and more expensive than estimated.
              Model conservatively on build estimates.
```

---

## Output Template

```
DECISION REQUEST — {{Decision title}}
Submitted by: {{EM name}} | Date: {{date}}
Decision needed by: {{date}} | Decision owner: {{name / role}}

THE DECISION
{{One sentence: what needs to be decided.}}

CONTEXT
{{2–3 sentences. Why does this need to be decided now? What changes if not decided?
No engineering jargon. Frame in business impact.}}

OPTIONS

Option A: {{Title}}
  What: {{One sentence description}}
  Cost: {{$X or N engineer-weeks or N months delay}}
  Benefit: {{Business outcome enabled}}
  Risk: {{Primary downside}}
  Reversible: {{Yes / No / Partially — why}}

Option B: {{Title}}
  What: {{One sentence description}}
  Cost: {{$X or N engineer-weeks or N months delay}}
  Benefit: {{Business outcome enabled}}
  Risk: {{Primary downside}}
  Reversible: {{Yes / No / Partially — why}}

Status Quo: Do not decide
  Cost: {{Ongoing cost or risk — name it}}
  Consequence: {{What degrades or fails to materialize}}

RECOMMENDATION
Option {{A or B}} — {{1–2 sentence rationale}}

The case for Option {{other}}: {{acknowledge the counterargument}}
My response: {{why the recommendation still holds}}

DECISION WINDOW
{{Specific date and what closes after it.}}

WHAT HAPPENS AFTER THE DECISION
If Option A: {{EM action within N days}}
If Option B: {{EM action within N days}}
```

---

## Example

```
DECISION REQUEST — Q3 Scope: Enterprise Dashboard vs. Mobile v2
Submitted by: Arif | Date: June 30, 2025
Decision needed by: July 7 (Sprint 9 planning) | Decision owner: VP Engineering + Product

THE DECISION
With the reliability sprint consuming 2 weeks of Q3 capacity, we cannot deliver
both the Enterprise Dashboard and Mobile v2 in Q3. One must move to Q4.

CONTEXT
The reliability sprint is non-negotiable — the authentication service risk
was approved last week. Q3 capacity is now 14 engineer-weeks, not 16. Both
the Enterprise Dashboard and Mobile v2 are 8 engineer-weeks each. We can
deliver one fully, or both partially. Partial delivery of either is not viable.

OPTIONS

Option A: Enterprise Dashboard in Q3, Mobile v2 to Q4
  What: Complete Enterprise Dashboard by September; Mobile v2 becomes Q4 target
  Cost: Mobile v2 delayed ~10 weeks vs. current plan
  Benefit: Enterprise Dashboard enables 3 named Q3 enterprise contracts ($420K ARR)
  Risk: Mobile customers may notice delayed features; 2 competitor mobile releases in window
  Reversible: Yes — Mobile v2 scope is not committed to customers

Option B: Mobile v2 in Q3, Enterprise Dashboard to Q4
  What: Complete Mobile v2 by September; Enterprise Dashboard becomes Q4 target
  Cost: Enterprise Dashboard delayed ~10 weeks; Q3 enterprise contracts at risk
  Benefit: Mobile v2 ships; no competitor gap on mobile
  Risk: 3 enterprise contracts may not close without dashboard; $420K ARR at risk in Q3
  Reversible: No — enterprise deals have hard Q3 close dates

Status Quo: Split capacity across both
  Cost: Neither ships complete in Q3
  Consequence: Enterprise contracts and mobile customers both unsatisfied;
               half-built features shipped to both

RECOMMENDATION
Option A: Enterprise Dashboard in Q3

The case for Option B: Mobile v2 prevents a competitor window.
My response: The competitor mobile releases are feature additions, not platform
shifts. A 10-week delay does not eliminate our mobile position. The $420K ARR
risk from enterprise contracts is a concrete near-term loss.

DECISION WINDOW
Sprint 9 planning is July 7. After that, changing scope mid-sprint adds 1–2 weeks
of disruption cost on top of the delay.

WHAT HAPPENS AFTER THE DECISION
If Option A: I update Product on Mobile v2 timeline by July 8; Sprint 9 plan
             reflects Enterprise Dashboard as primary objective.
If Option B: I contact Sales on enterprise contract risk by July 8 and assess
             which Q3 contracts can flex to Q4.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Options table has ≥2 options including status quo | Base: 65% |
| Recommendation is specific (not conditional) | +15% |
| Decision window is named | +10% |
| Counterargument is acknowledged and addressed | +10% |
| Post-decision actions are named | +5% |
| No recommendation — options only | −25% |
| Decision is one the EM should make independently | −20% (wrong escalation) |
| Decision window is absent | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Question without recommendation** | "What should we do about X?" | Always lead with a recommendation. Questions become options + recommendation. |
| **Wrong escalation** | Bringing the executive a decision that's yours to make | Classify the decision first. If it's yours, make it. |
| **Missing status quo** | Only two active options presented | Name status quo and its cost. Always. |
| **No decision window** | "Decide when you can" | Name when options close. Executives respect urgency when it's real. |
| **Conditional recommendation** | "Either A or B depending on your risk tolerance" | Pick one. Name the primary risk. Invite them to disagree, not to choose for you. |
| **Technical framing** | Options described in engineering terms | Translate every option to business impact, cost, and risk. |

---

## References

- `skills/executive/executive-communication.md` — Translation foundations
- `skills/executive/executive-risk-report.md` — When a decision option involves a risk
- `docs/engineering-playbook.md` → Technical Debt and Architecture sections

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-risk-report.md` | Risk decisions use this framework after the risk is quantified |
| `skills/executive/investment-proposal.md` | Investment decisions are a specialized case of this framework |
| `skills/executive/vp-one-on-one.md` | 1:1 is often where decisions are presented informally before formal escalation |
| `subagents/tech-lead.md` | Technical analysis that feeds into architecture decisions |
