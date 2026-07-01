# Skill: Annual Planning

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Annual (October–November for calendar-year companies; adapt to fiscal year)

---

## Purpose

Produce an engineering annual plan that aligns with company strategy, secures resource commitments, and sets executable quarterly targets with confidence levels that executives can hold you accountable to.

Annual planning is the highest-stakes planning event an EM participates in. It determines headcount, budget, roadmap scope, and organizational priorities for the next 12 months. Showing up unprepared costs resources you'll spend the year without.

**Three outputs that must come out of annual planning**:
1. An engineering roadmap with quarterly milestones and confidence signals
2. A headcount and budget request justified by business outcomes
3. A set of bets — initiatives where engineering is making a directional commitment the company will hold

**The planning trap**: Most EMs plan for what they can execute with current capacity. The best EMs plan for what the business needs, then show the gap, and use that gap as the resource conversation.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Company strategy for the year** | What are the company's top 3 bets for the fiscal year? |
| **Current team capacity** | Fully loaded engineering capacity after committed maintenance load |
| **Last year's delivery data** | Actual vs. committed for 4 quarters — this is your estimation baseline |
| **Current technical debt level** | High / Medium / Low — affects available velocity |
| **Known Q1 commitments** | Work already in progress or contractually committed |

### Optional
| Input | Description |
|---|---|
| **Hiring plan from last year** | What was committed vs. what was hired |
| **Competitor landscape** | What are competitors building that affects engineering priorities? |
| **Customer research** | What are the highest-value capabilities customers are asking for? |
| **Platform team input** | What infrastructure investments are necessary for the year's ambitions? |
| **DORA trend** | Are delivery metrics improving, stable, or declining? |

---

## Analysis

### Step 1 — Establish Your Realistic Capacity

**Capacity calculation:**

```
Base capacity = (headcount) × (40 hrs/week) × (48 working weeks)
Maintenance load = estimated % of capacity on keep-lights-on work
Available for new work = Base capacity × (1 − maintenance load)
Estimation error correction = multiply by your historical accuracy rate
Realistic delivery capacity = result of above
```

**Common maintenance load benchmarks:**
- Healthy, modern system: 20–30%
- Average enterprise system: 30–40%
- Legacy or high-incident system: 40–60%

Be honest. EMs who underestimate maintenance load fail to deliver their annual plan every year.

### Step 2 — Map Company Bets to Engineering Requirements

For each company strategic bet:
1. What engineering capability does this require?
2. Does that capability exist? (Yes / Partial / No)
3. If No or Partial — what investment closes the gap?
4. What is the engineering cost (person-quarters) of that capability?

This mapping is the core of the annual plan. It connects every engineering investment to a company bet.

### Step 3 — Sequence the Roadmap

Sequencing rules:
- **Foundation before feature**: If a platform investment is prerequisite to three features, the platform comes first
- **Revenue before optimization**: If company is pre-profitability, prioritize revenue-enabling work
- **Risk before complexity**: Address high-risk items early in the year when you have most optionality
- **Quarterly deliverability**: Each quarter should have at least one shippable outcome — not just in-progress work

### Step 4 — Build the Ask

The resource ask must flow from the gap between:
- What the business needs the plan to deliver
- What current capacity can realistically deliver

If you can deliver the full plan with current headcount: say so, and say why you believe it.
If there is a gap: name it exactly (N person-quarters), explain what slips without it, make the ask.

---

## Decision Tree

```
What is the relationship between the company's strategic ambition and engineering's current capacity?

├── CAPACITY MATCHES AMBITION
│   └── Format: Strategy alignment → quarterly roadmap → headcount steady → risks
│       Tone: Confident. Focus the conversation on sequencing and priority trade-offs.
│       Risk: Don't undersell. If you can deliver more, say what "more" looks like.

├── CAPACITY BELOW AMBITION (gap)
│   └── Format: Strategy alignment → capacity calculation → gap analysis
│       → investment request → roadmap with and without investment
│       Tone: Business case, not complaint. "Here is what we can build.
│             Here is what the business needs. Here is the gap."
│       → Also invoke: skills/executive/investment-proposal.md for headcount request
│       → Also invoke: skills/executive/headcount-justification.md if gap is people

├── AMBITION EXCEEDS REALISTIC CAPACITY BY >30%
│   └── Format: Flag the math explicitly — do not hide it in a stretch plan
│       Options: phased scope reduction / investment / longer timeline
│       Critical: Do not commit to a plan you cannot execute. The year's damage
│                 is done in the planning meeting, not in Q3.
│       Recommend one option with rationale. Do not leave it to executives to figure out.

└── TECHNICAL DEBT IS CONSTRAINING CAPACITY
    └── Format: Debt tax calculation → recovery investment → capacity released
        Frame debt investment as capacity purchase, not housekeeping.
        "Investing N engineer-quarters in reliability recovers the equivalent of
         N additional engineers for the rest of the year."
```

---

## Output Template

```
ENGINEERING ANNUAL PLAN — {{YEAR}}
Submitted by: {{EM / VP}} | Date: {{date}}
Audience: {{VP / SVP / CTO / Exec Team}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STRATEGY ALIGNMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Company bets → Engineering commitments:

| Company Bet | Engineering Capability Needed | Status | Quarters Required |
|---|---|---|---|
| {{Bet 1}} | {{Capability}} | Exists / Gap | {{N quarters}} |
| {{Bet 2}} | {{Capability}} | Exists / Gap | {{N quarters}} |
| {{Bet 3}} | {{Capability}} | Exists / Gap | {{N quarters}} |

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CAPACITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team: {{N}} engineers (start of year)
Maintenance load: {{N}}% ({{rationale}})
Available for roadmap: {{N}} person-quarters
Historical delivery accuracy: {{N}}% ({{N}}-quarter average)
Realistic throughput: {{N}} person-quarters at {{N}}% confidence

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{YEAR}} ROADMAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q1 [{{focus}}]: {{Primary deliverable}} | Confidence: {{High/Medium/Low}}
  → Business outcome: {{what this enables}}

Q2 [{{focus}}]: {{Primary deliverable}} | Confidence: {{High/Medium/Low}}
  → Business outcome: {{what this enables}}

Q3 [{{focus}}]: {{Primary deliverable}} | Confidence: {{High/Medium/Low}}
  → Business outcome: {{what this enables}}

Q4 [{{focus}}]: {{Primary deliverable}} | Confidence: {{High/Medium/Low}}
  → Business outcome: {{what this enables}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RESOURCE REQUEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{If headcount needed — invoke skills/executive/headcount-justification.md}}
{{If budget needed — invoke skills/executive/engineering-budget.md}}
{{If no additional resources needed — state clearly: "No additional headcount or
 budget requested. Current team can execute this plan."}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TOP 3 RISKS TO THIS PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Risk}} | Likelihood: {{H/M/L}} | Mitigation: {{what you're doing}}
2. {{Risk}} | Likelihood: {{H/M/L}} | Mitigation: {{what you're doing}}
3. {{Risk}} | Likelihood: {{H/M/L}} | Mitigation: {{what you're doing}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WHAT I NEED FROM LEADERSHIP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific asks with decision deadlines — or "No decisions needed beyond resource approval."}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Capacity calculation includes maintenance load | Base: 60% |
| Strategy alignment table maps bets to capabilities | +15% |
| Historical delivery accuracy used in forecast | +10% |
| Resource ask flows from gap analysis | +10% |
| Roadmap has quarterly granularity with confidence | +5% |
| Capacity calculation uses raw headcount only | −20% |
| Roadmap is all High confidence | −15% (unrealistic; reject) |
| No risks named | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Capacity optimism** | Plan built on 100% of headcount × 52 weeks | Apply maintenance load and historical accuracy. Plan will be wrong without it. |
| **Strategy disconnect** | Engineering plan does not reference company bets | Every initiative must map to a company priority. Remove what doesn't. |
| **All-High confidence** | 12 months of "High confidence" deliverables | Q3 and Q4 should be Medium at best. Add uncertainty honestly. |
| **No gap analysis** | Resource ask appears without explanation | Show the math: business needs N, capacity delivers M, gap is N−M. |
| **Missing maintenance load** | No acknowledgment of keep-lights-on work | Calculate maintenance load first. The rest of the math depends on it. |

---

## References

- `skills/executive/investment-proposal.md` — For resource asks that emerge from the plan
- `skills/executive/quarterly-business-review.md` — Q4 QBR feeds into annual plan
- `skills/executive/headcount-justification.md` — People investment case
- `docs/engineering-playbook.md` → Roadmaps section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/quarterly-business-review.md` | Q4 QBR is the primary input to next year's annual plan |
| `skills/executive/investment-proposal.md` | Formal proposal for any gap identified in annual planning |
| `skills/executive/headcount-justification.md` | When headcount is the primary resource being requested |
| `skills/executive/engineering-budget.md` | When total engineering budget is part of the planning conversation |
