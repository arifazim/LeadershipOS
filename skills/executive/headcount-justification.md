# Skill: Headcount Justification

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (hiring need) + Annual planning cycle

---

## Purpose

Build and present the business case for adding engineering headcount — making the ROI case in terms that finance and executive stakeholders can evaluate and approve.

Headcount is the most scrutinized engineering investment because it is the most expensive and the most visible. A hire approved incorrectly is a problem for years. A hire denied incorrectly costs business outcomes that are harder to see but equally real.

**The paradox of headcount proposals**: By the time you feel the need strongly enough to write the proposal, you're already behind. The team is stretched. Delivery is suffering. The proposal needs to be written when the signal first appears — not after it's become a crisis.

**The three skeptical questions every executive asks**:
1. Can we do this with the people we have?
2. Can we do this with contractors before committing to a hire?
3. What is the fully loaded cost and when do we break even?

Answer all three before they ask.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Role description** | What does this person do? Level, specialty, team |
| **Business capability gap** | What can we not build or deliver without this hire? |
| **Current team capacity** | What is the team being asked to do vs. what they can deliver? |
| **Fully loaded cost** | Annual cost including salary, benefits, equipment, overhead |
| **Expected ROI** | What business outcome does this hire enable? |

### Optional
| Input | Description |
|---|---|
| **Alternatives considered** | Contractor, reorg, reprioritization — and why they're insufficient |
| **Time to productivity** | How long until this hire is contributing fully? |
| **Hiring market context** | Talent availability, time-to-fill expectations |
| **Precedent** | Similar roles approved and their outcomes |
| **Risk of not hiring** | What degrades if this role is not filled? |

---

## Analysis

### Step 1 — Name the Capability Gap in Business Terms

Never start with the role. Start with what the role enables.

| Wrong framing | Right framing |
|---|---|
| "We need a senior backend engineer" | "We cannot ship the enterprise API without a backend specialist — this blocks 3 Q3 enterprise contracts" |
| "We're understaffed" | "The team is committed to N person-quarters of work on a capacity of M — the gap is growing delivery risk each sprint" |
| "The team is burning out" | "On-call burden is unsustainable — 2 engineers are rotating every week. This hire reduces on-call to sustainable frequency and is the retention risk prevention investment" |

### Step 2 — Calculate the Cost of the Gap

For each identified capability gap, answer:
- What is the current cost of the gap? (delayed revenue, incident cost, retention risk, customer impact)
- What does the gap cost per quarter if unaddressed?
- What does a single hire cost vs. those costs?

This math is the proposal. The math almost always makes the hire look cheap compared to the gap.

### Step 3 — Rule Out Cheaper Alternatives

Executives will ask about alternatives. Address them first:

| Alternative | When it works | When it doesn't |
|---|---|---|
| **Contractor** | Short-term project with defined end | Long-term capability need; on-call work; team knowledge that must persist |
| **Reprioritization** | Work is discretionary | Work is committed or contractual |
| **Reorg / redistribution** | Capacity exists elsewhere in org | Other teams are equally committed |
| **Delay** | Timeline is flexible | Timeline is tied to revenue, compliance, or competitive position |

Name which alternatives you considered and why each was ruled out.

### Step 4 — Frame the Hire as ROI

| Business impact | How to frame it |
|---|---|
| Revenue enabled | "This hire unlocks $X in contracts that are currently blocked by capability gap" |
| Incident cost avoided | "One P1 costs $Y. This hire reduces P1 frequency from N/quarter to M/quarter" |
| Velocity recovered | "This hire increases engineering throughput by N person-quarters/year, equivalent to [deliverable]" |
| Retention protected | "Losing [engineer] to burnout costs $150–200K in recruiting + ramp. This hire is the prevention." |

---

## Decision Tree

```
What is the primary driver of the hire?

├── CAPABILITY GAP (skill we don't have)
│   └── Frame: What capability is missing → what business outcome it blocks
│       → what the hire costs → what the gap costs
│       Evidence: Named blocked initiative or contract. Not "we might need this someday."
│       Risk: "Capability gap" claims need specifics. "We need ML" without a business
│             outcome attached will be challenged.

├── CAPACITY GAP (skill we have but not enough of)
│   └── Frame: Committed work vs. capacity → gap in person-quarters
│       → what slips without the hire → what the slip costs
│       Evidence: Current sprint data, roadmap commitments, Q1-Q4 plan
│       Risk: Executives will ask why you can't reprioritize. Answer this.

├── RELIABILITY / ON-CALL BURDEN
│   └── Frame: Current on-call frequency → sustainable frequency → gap
│       → incident cost per quarter → fully loaded hire cost → break-even
│       Evidence: On-call rotation data, MTTR, P1/P2 count and business impact
│       Key: Frame as business continuity investment, not engineer comfort.

├── RETENTION RISK (someone might leave without relief)
│   └── Frame: Replacement cost estimate + ramp time + knowledge loss
│       vs. cost of hire that prevents departure
│       Evidence: 1:1 signals, workload data, market compensation (if applicable)
│       Caution: Retention proposals are sensitive. Be specific but professional.

└── STRATEGIC INVESTMENT (building capability for future)
    └── Frame: Business hypothesis → capability required → why now vs. later
        This is the weakest headcount case. Needs the strongest evidence.
        Require: Named business outcome + timeline + how you'll know it's working.
        → Also invoke: skills/executive/investment-proposal.md for the broader case
```

---

## Output Template

```
HEADCOUNT JUSTIFICATION — {{Role Title}}
Submitted by: {{EM name}} | Date: {{date}}
Decision needed by: {{date}} — {{rationale for timeline}}

THE ASK
{{One sentence: role, level, rationale, expected impact.}}
Example: "Approval to hire one Senior Reliability Engineer to reduce P1 incident
frequency by 70% and bring on-call rotation to sustainable frequency by Q3."

THE BUSINESS CASE

Problem: {{What is not happening or what is at risk because this role doesn't exist?}}

Cost of the gap: {{$X per quarter in [incident cost / delayed revenue / retention risk]}}
Cost of the hire: ${{X}} annually (fully loaded: salary ${{X}} + benefits + overhead)
Expected return: {{Specific outcome by date}}
Break-even: {{When return exceeds cost}}

ALTERNATIVES CONSIDERED
• Contractor: {{Why considered, why ruled out}}
• Reprioritization: {{Why considered, why ruled out}}
• Other: {{if applicable}}

WHAT THIS HIRE ENABLES
• {{Business outcome 1}}
• {{Business outcome 2}}

WHAT CONTINUES WITHOUT THIS HIRE
• {{Ongoing cost or degraded outcome 1}}
• {{Risk 2}}

TIMELINE
Recruiting estimate: {{N}} weeks | Onboarding to full productivity: {{N}} weeks
Impact expected by: {{date}}

ACCOUNTABILITY
If approved, I commit to: {{specific success metric by date}}
```

---

## Example

```
HEADCOUNT JUSTIFICATION — Senior Reliability Engineer
Submitted by: Arif | Date: October 1, 2025
Decision needed by: November 1 — must start recruiting in November to hire by Q1

THE ASK
Approval to hire one Senior Reliability Engineer to reduce P1 incidents from
4/quarter to <1/quarter and reduce on-call rotation from weekly to monthly.

THE BUSINESS CASE

Problem: The engineering team is averaging 4 P1 incidents per quarter. Each
incident costs approximately $40K in engineering response time, SLA credits,
and lost productivity. On-call rotation currently requires 4 engineers to
rotate weekly — an unsustainable burden that is a named retention risk for
2 of our 4 most senior engineers.

Cost of the gap:    $160K/quarter in incident costs + retention risk
Cost of the hire:   $230K annually, fully loaded
Expected return:    <1 P1/quarter by Q2 2026; on-call to monthly rotation
Break-even:         ~7 months (3 quarters of prevented incident cost + retention preservation)

ALTERNATIVES CONSIDERED
• Contractor: On-call reliability work requires institutional knowledge that
  a short-term contractor cannot develop. Ruled out.
• Reprioritization: The 2 engineers best positioned for this work are on
  committed product delivery. Pulling them increases delivery risk. Ruled out.

WHAT THIS HIRE ENABLES
• P1 incidents reduced to <1/quarter (from current 4/quarter average)
• On-call rotation reduced from weekly to monthly — sustainable long-term
• Senior engineer retention: removes named workload concern from 2025 retention risk list

WHAT CONTINUES WITHOUT THIS HIRE
• $160K/quarter incident cost continues
• Retention risk for 2 senior engineers escalates through Q1

TIMELINE
Recruiting estimate: 8–10 weeks | Onboarding to full productivity: 6–8 weeks
Impact expected by: Q2 2026

ACCOUNTABILITY
If approved, I commit to: P1 incidents ≤1/quarter by end of Q2 2026.
Review point: Q2 2026 QBR.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Business case quantified (gap cost vs. hire cost) | Base: 65% |
| Alternatives explicitly ruled out | +10% |
| Break-even calculated | +10% |
| Accountability commitment with date | +10% |
| Decision window named | +5% |
| Framed as "we're understaffed" without quantification | −25% |
| No alternatives considered | −15% |
| Cost of gap is vague | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **"We're busy" framing** | Proposal describes workload, not business impact | Translate: what fails to ship, what incident repeats, what revenue is blocked |
| **Missing alternatives** | No acknowledgment of contractor or reprioritization | Address the two questions executives always ask, before they ask. |
| **Salary-only cost** | Hire is costed at base salary | Use fully loaded (1.25–1.40× salary). |
| **No break-even** | ROI is directional but not calculated | Finance will calculate it. Calculate it yourself, better. |
| **Late proposal** | Team is already in crisis when proposal is written | File the proposal when signal first appears — not when it's a fire. |

---

## References

- `skills/executive/investment-proposal.md` — Investment framing framework
- `skills/executive/engineering-budget.md` — Headcount in budget context
- `skills/executive/annual-planning.md` — Headcount in annual plan context
- `docs/engineering-playbook.md` → Hiring section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/investment-proposal.md` | General investment case; headcount is a specialized form |
| `skills/executive/engineering-budget.md` | Headcount is the largest budget line |
| `skills/executive/annual-planning.md` | Annual plan is where most headcount is justified |
| `skills/people/assess-burnout.md` | Burnout assessment feeds retention risk in headcount justification |
