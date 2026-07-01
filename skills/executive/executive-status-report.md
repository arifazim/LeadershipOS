# Skill: Executive Status Report

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: Weekly (VP audience) or biweekly (SVP/CTO audience)

---

## Purpose

Generate a concise, executive-ready written status update that communicates delivery health, team status, risks, and asks in under 90 seconds of reading time.

This is the most frequently invoked executive skill. It is called by `subagents/delivery-manager.md` after every sprint review and by `subagents/engineering-manager.md` before any scheduled executive sync.

**The test**: An executive who reads only the first paragraph should understand the most important thing. If they read nothing else, they should still know the status.

---

## Inputs

### Required
| Input | Source | Description |
|---|---|---|
| **Delivery status** | `delivery-manager` output | Sprint completion, DORA snapshot, key wins |
| **Period** | Calendar | Week of / Sprint N / Month |
| **Audience level** | Caller | Director / VP / SVP / CTO |
| **Top risk** | Risk register | The one risk that most needs executive awareness |

### Optional
| Input | Source | Description |
|---|---|---|
| **Team health signal** | `engineering-coach` output | Green / Yellow / Red |
| **Roadmap signal** | `product-partner` output | Milestones on track / at risk |
| **Incident summary** | `incident-manager` output | Any P1/P2 from this period |
| **Ask** | EM judgment | What you need from the executive |
| **Prior period context** | Prior week's report | What changed vs. last week |

---

## Analysis

### Step 1 — Determine the Status Signal
The single most important output of a status report is the status signal. It must be true and it must be honest.

| Signal | Criteria |
|---|---|
| **Green** | Delivery on track, no material risks, team health stable |
| **Yellow** | One or more items at risk — being actively managed, no executive action needed yet |
| **Red** | Something is going wrong and executive awareness or action is needed now |

**Rule**: If you're debating between Yellow and Green, it's Yellow. If you're debating between Red and Yellow, it's Red. Optimistic status reporting destroys trust faster than bad news.

### Step 2 — Select the Three Most Important Points
From all available data, pick the three things that matter most for this executive's context. Not the most interesting things. Not the most technical things. The things that connect to what this executive is accountable for.

### Step 3 — Quantify Everything That Can Be Quantified
- Not "velocity was lower" → "velocity was 74% of average — 12 points below target"
- Not "we had an incident" → "a 2-hour service disruption affected 8% of users Thursday; resolved, post-mortem scheduled"
- Not "team is stressed" → "team health is Yellow — 2 engineers flagged elevated workload in 1:1s"

### Step 4 — Write the Ask (or explicitly state no action needed)
Every status report ends with one of:
- A specific ask (named, actionable, time-bound)
- "No action needed this week — sharing for awareness"

A status report without an explicit ask leaves executives wondering if they're supposed to do something.

---

## Decision Tree

```
What is the overall status signal?

├── GREEN
│   └── Format: Signal + 2-sentence summary + metrics table + "No action needed"
│       Length: < 150 words
│       Tone: Confident. Do not overexplain a green status.

├── YELLOW
│   └── Format: Signal + 2-sentence summary naming the yellow item + what's being done
│       + metrics table + risks + optional ask
│       Length: < 250 words
│       Key: Explain what you are doing about the yellow item. Do not just name it.

└── RED
    └── Format: Signal + immediate summary of what is red and why
        + current status of the red item + impact on business/customers
        + what executive action is needed (if any) + full context below
        Length: < 400 words
        Key: Red status must go out same day it's identified. Do not wait for the weekly cadence.
        → Also invoke: skills/executive/executive-risk-report.md for the risk detail
```

---

## Output Template

```
ENGINEERING STATUS — {{Period}} | {{Green 🟢 | Yellow 🟡 | Red 🔴}}

{{2–3 sentence summary. Status signal explained in business terms.
What changed vs. last week. What the most important fact is.
Confidence: [High | Medium | Low].}}

DELIVERY
{{Sprint N: [Achieved | Partial | Missed] | Completion: {{%}} vs. {{avg}}% avg}}
{{Deploy frequency: {{N}}/week | Change failure rate: {{%}} | PR cycle time: {{days}} days}}
{{Key deliverable shipped: [description in business terms, not engineering terms]}}

TEAM
{{Team health: [Green | Yellow | Red]}}
{{Headcount: {{N}} active, {{N}} on-call rotation}}
{{Notable: [one sentence if something is worth flagging, else omit]}}

RISKS
• {{Risk 1}}: [Likelihood] | [Business impact] | [Mitigation in progress]
• {{Risk 2}}: [if applicable]

NEXT WEEK
{{What the team is focused on. One sentence. Tied to business outcome.}}

ASK
{{Specific ask with owner and deadline — or "No action needed."}}
```

---

## Examples

### Green Status (VP audience)

```
ENGINEERING STATUS — Sprint 42 | 🟢 Green

Payments v2 shipped to production Thursday. Zero incidents post-release. Team is
on track for the Q3 milestone. No items require your attention this week.
Confidence: High.

DELIVERY
Sprint 42: Achieved | Completion: 94% vs. 91% avg
Deploy frequency: 5/week | Change failure rate: 0% | PR cycle time: 1.4 days
Key deliverable: Payment retry logic — reduces failed transaction rate by est. 18%

TEAM
Team health: Green
Headcount: 8 active

RISKS
• Platform dependency (Q4 initiative): Medium likelihood | Low impact now |
  Scheduling alignment conversation with Platform EM next week

NEXT WEEK
Beginning checkout flow optimization — targets a 12% improvement in conversion funnel

ASK
No action needed — sharing for awareness.
```

### Red Status (VP audience)

```
ENGINEERING STATUS — Week of June 23 | 🔴 Red

The authentication service experienced a 4-hour outage Tuesday affecting all users.
Service was restored; post-mortem in progress. Q3 milestone is now at risk of a
2-week slip. I need 30 minutes with you this week to align on scope trade-offs.
Confidence: High on impact assessment.

DELIVERY
Sprint 42 goal: Missed — outage consumed 29% of sprint capacity
Deploy frequency: 1/week (incident-driven) | Change failure rate: 18%
Outage: 4 hours, 100% of users affected, Thursday — service restored

TEAM
Team health: Yellow — on-call burden elevated; addressing in next sprint

RISKS
• Q3 milestone slip: High likelihood | 2-week delay | Need scope negotiation with Product
• Authentication service reliability: Medium likelihood of recurrence | Root cause fix
  scheduled Sprint 43 — reliability sprint proposed

NEXT WEEK
Sprint 43: Reliability sprint. No new features. Addressing auth service root cause.

ASK
30 min with you this week to align on Q3 scope trade-off given the timeline slip.
My recommendation: defer Feature X to Q4 and protect the core milestone. Happy to walk through the options.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Delivery data is real (not estimated) | Base: 70% |
| Status signal is honest (no rounding up) | +10% |
| All quantities are specific | +10% |
| Ask is explicit and named | +5% |
| Jargon audit passed | +5% |
| Status signal is rounded up from Yellow to Green | −25% — reject |
| Quantities are approximate | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Green-washing** | Consistently Green status that surprises executives with bad news | Trust audit: if executives are surprised, status was wrong. Force Yellow when uncertain. |
| **Missing ask** | Report ends without a next step | Add ask or "No action needed" explicitly |
| **Jargon in delivery section** | "PRs merged", "story points", "sprint velocity" | Translate: "4 changes shipped", "team capacity", "delivery rate" |
| **Too much data** | Metrics table has 12 rows | Pick 3. Executives do not read metric tables beyond row 3. |
| **Late Red** | Red status sent on the weekly cadence, not same-day | Red is same-day. Build this habit. |

---

## References

- `skills/executive/executive-communication.md` — Foundation rules
- `templates/executive-status.md` — Formatted template for recurring use
- `subagents/delivery-manager.md` → Output Contract (primary data source)
- `CLAUDE.md` → Confidence scoring scale

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/executive-risk-report.md` | Called when a risk needs its own dedicated communication |
| `skills/executive/executive-storytelling.md` | Use when the status needs a narrative (QBR, milestone, etc.) |
| `skills/delivery/review-sprint.md` | Primary data source for delivery section |
