# Skill: Board-Level Summary

**Domain**: Executive
**Owner**: `subagents/executive-summary.md`
**Cadence**: Quarterly (board meetings) + on-demand (fundraising, M&A, major incidents)
**Contract**: `contracts/presentation.contract.md` (worked example)

---

## Purpose

Produce a one-page, board-ready engineering summary that communicates engineering performance, investment health, and strategic outlook in terms board members can evaluate — without any engineering background.

Board members are evaluating three things: is the engineering organization an asset or a liability, is leadership trustworthy, and is the company building what it needs to win? Answer those three questions. That is the entire job of a board-level engineering summary.

**Board-level communication rules (stricter than VP rules):**
- Maximum 1 page (or 3 slides)
- No engineering terms of any kind
- Every claim is tied to a business metric or strategic outcome
- One recommendation or ask per summary — maximum
- If you're not sure whether something is too technical, it is

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Quarter's delivery** | What was shipped, in business outcome terms |
| **Engineering investment** | Headcount, cost (if known), major resource decisions |
| **Engineering health** | Honest assessment — one signal: Healthy / Concerns / Issues |
| **Strategic outlook** | What engineering is building toward in the next 2–4 quarters |

### Optional
| Input | Description |
|---|---|
| **Reliability record** | Uptime, major incidents, customer impact |
| **Competitive context** | How engineering capability compares to industry |
| **Hiring and team** | Team growth, key hires, talent investments |
| **Risk** | One top engineering risk, in business terms |

---

## Analysis

### Step 1 — Identify the Three Questions Board Members Are Actually Asking

For engineering specifically:
1. **Can the engineering team build what we're selling?** (Delivery credibility)
2. **Is engineering spending money wisely?** (Investment efficiency)
3. **Are there hidden risks we should know about?** (Governance)

Every sentence in the board summary should answer one of these three questions. If it answers none of them, remove it.

### Step 2 — Eliminate All Engineering Concepts
Board members may include investors, domain experts, legal counsel, and former operators from non-technical industries. Write for the least technical person in the room.

**Complete ban list for board summaries:**
`sprint, velocity, deployment, CI/CD, microservices, API, latency, uptime SLA, tech debt, refactor, infrastructure, backlog, PR, ticket, story point, incident (use "service disruption"), MTTR (use "time to recovery"), on-call, pipeline, architecture, Kubernetes, DevOps, scrum, agile, standup`

### Step 3 — Translate Engineering Metrics to Business Metrics

| Engineering metric | Board translation |
|---|---|
| Deployment frequency: 12/week | "Shipping new capabilities multiple times per week — faster than 85% of industry" |
| MTTR: 2.1 hours | "When service disruptions occur, resolved within 2 hours on average" |
| Change failure rate: 3% | "97% of updates shipped without customer-facing issues" |
| Velocity: 89% of target | "Engineering delivered 89% of committed features this quarter" |
| Team: 12 engineers | "Engineering team of 12; grew by 3 this quarter" |

### Step 4 — Frame Engineering Investment as ROI
Boards approve engineering investment. They want to see return. Frame every investment:
- "We invested $X in [capability] — this enables [business outcome]"
- "The [N] engineers hired this quarter will enable [milestone] by [date]"
- "The reliability investment reduced service disruption cost by estimated $X annually"

---

## Decision Tree

```
What is the context for this board summary?

├── REGULAR QUARTERLY UPDATE
│   └── Format: Performance → Investment → Outlook → One ask (if any)
│       Tone: Confident, data-backed, forward-looking
│       Length: 1 page / 3 slides

├── FOLLOWING A MAJOR INCIDENT
│   └── Format: What happened (in 2 sentences) → Customer impact → Resolution
│       → What we're doing to prevent recurrence → What the board should know
│       Tone: Transparent, action-oriented — do not minimize
│       Length: Add 1 paragraph to the regular update

├── FUNDRAISING / DUE DILIGENCE CONTEXT
│   └── Format: Engineering capability narrative → Team → Infrastructure → Roadmap → Risk
│       Tone: Substantive, honest about gaps, specific about strengths
│       Length: 1–2 pages; they will ask follow-up questions

└── M&A OR PARTNERSHIP CONTEXT
    └── Format: Engineering assessment of target/partner → Integration complexity
        → Recommended approach → Risk → Timeline
        → Also invoke: skills/executive/investment-proposal.md if resources needed
```

---

## Output Template

```
ENGINEERING SUMMARY — Q{{N}} {{YEAR}}
Prepared for: Board of Directors
Prepared by: {{EM / VP / CTO}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PERFORMANCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2–3 sentences. What was delivered this quarter, in business outcome terms.
Delivery rate vs. commitment. Any significant customer-facing capabilities shipped.]

Key deliverables:
• {{Feature/capability}} — {{business outcome, not description}}
• {{Feature/capability}} — {{business outcome}}

Reliability: {{N}}% of the quarter without customer-facing service disruptions.
{{If incidents occurred: "One disruption on [date] — [N hours], [N%] of users affected. Resolved."}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INVESTMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team: {{N}} engineers ({{+N}} vs. last quarter)
{{Key hire or team milestone if relevant — one sentence}}
Engineering cost as % of revenue: {{%}} ({{vs. industry benchmark if known}})

Significant investments this quarter:
• {{Investment}}: {{business outcome or ROI}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OUTLOOK — NEXT 2 QUARTERS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2 sentences. What engineering is building toward. Tied to company strategy.]

Top risk: {{One risk, in business terms, with mitigation.}}
Confidence in Q{{N+1}} plan: {{High | Medium | Low}} — {{one sentence rationale}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ASK (if any)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific ask — or omit this section entirely if no board action needed}}
```

---

## Output Variant: Deck Format

The memo format above is the default. When the context calls for live presentation rather than a pre-read document, use this deck variant instead — same content discipline (three questions, ban list, one ask), compressed to slides.

**The 15-minute board standard** (boards often give engineering 10-15 minutes):
> Three slides. No more.
> - **Slide 1**: Performance — what we built and what it earned
> - **Slide 2**: Investment — what we spent and what it's worth
> - **Slide 3**: Outlook — what we're building next and the one risk to watch
>
> The ask goes on Slide 3 if there is one. One ask maximum. One slide. No exceptions.

### Deck Output Template

```
ENGINEERING UPDATE — Q{{N}} {{YEAR}}
Prepared for: Board of Directors
Prepared by: {{EM / VP / CTO}}
Presentation time: {{N}} minutes

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLIDE 1 — PERFORMANCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2-3 sentences. Delivery rate vs. commitment. Business framing only.]

Key capabilities shipped this quarter:
• {{Capability}} — {{business outcome: what it enables or what it measured}}
• {{Capability}} — {{business outcome}}

Reliability: {{N}}% of the quarter without customer-facing disruptions.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLIDE 2 — INVESTMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team: {{N}} engineers ({{+/-N}} vs. last quarter)
Engineering cost: {{N}}% of operating expense (industry: {{N}}-{{N}}%)
Significant investment this quarter: {{Investment}} — {{business outcome or projected return}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SLIDE 3 — OUTLOOK + ONE ASK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2 sentences. What engineering is building toward. Tied to company strategy.]
Top risk: {{One risk in business terms — likelihood, mitigation, and status}}
Confidence in Q{{N+1}} plan: {{High | Medium | Low}}
Ask (if any — omit section if none): {{Specific, single ask}}
```

**Deck-specific decision tree** (which sections to add per meeting context):

```
├── FOLLOWING A MAJOR INCIDENT OR CRISIS
│   └── Add before Slide 1: what happened (2 sentences) → customer impact → resolution
│       → what prevents recurrence. Do not build a separate deck for this.

├── FUNDRAISING / DUE DILIGENCE
│   └── Expand to 1-2 pages: engineering capability → team → build/buy approach
│       → roadmap → key risks and mitigations. Expect deep Q&A; prepare 10-15 backup slides.

└── M&A OR STRATEGIC PARTNERSHIP
    └── Format: assessment of target/partner → integration approach → risks → timeline → resource ask
        → Also invoke: skills/executive/investment-proposal.md if resources needed
        → Also invoke: subagents/tech-lead.md for technical assessment
```

Use `skills/presentation/kpi-storytelling.md` for metric selection and `skills/presentation/executive-slide-review.md` to review the deck before presenting.

---

## Example

```
ENGINEERING SUMMARY — Q2 2025
Prepared for: Board of Directors

PERFORMANCE
Engineering delivered 91% of committed capabilities this quarter, including the
new checkout flow (live June 1) and API platform for partner integrations. The
checkout improvement has contributed to a 14% increase in transaction completion
observed in the 30 days since launch.

Reliability: 99.6% of the quarter without customer-facing disruptions. One
2-hour disruption in April affected 12% of users; resolved and root cause fixed.

INVESTMENT
Team: 14 engineers (+3 vs. Q1). Three senior engineers hired to accelerate
the enterprise product line.
Engineering cost: 31% of operating expense (industry median: 28–35%).

Significant investment: Reliability improvement program — projected to reduce
support cost by $200K annually and reduce disruption frequency by 70%.

OUTLOOK — NEXT 2 QUARTERS
Engineering is focused on the enterprise tier launch (Q3) and international
infrastructure (Q4) — both on the approved H2 plan. Current team capacity
supports both commitments without additional headcount.

Top risk: Enterprise security certification (SOC 2) is on the critical path
for Q3 launch. External auditor engaged; timeline is tight but currently on
track. Will escalate immediately if this changes.

Confidence in Q3 plan: High.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All engineering jargon removed | Base: 65% |
| Every claim tied to business metric | +15% |
| Investment framed as ROI | +10% |
| Three board questions answered | +10% |
| Length is ≤ 1 page | +5% |
| Any engineering term survives | −20% (reject) |
| No risk disclosed | −15% (boards expect risks) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Technical jargon** | Any item from the ban list appears | Full audit before sending. Zero tolerance. |
| **No business outcome** | Features listed without impact | For every deliverable: "which means [business outcome]" |
| **Hiding a risk** | No risk disclosed when risks exist | Boards expect risk disclosure. Hiding it is worse than naming it. |
| **Too long** | More than 1 page of dense text | Every sentence that isn't answering one of the 3 board questions gets cut |
| **Multiple asks** | Three action items at the end | One ask maximum per board summary |

---

## References

- `skills/executive/executive-communication.md` — Foundation translation rules
- `skills/executive/executive-storytelling.md` — Narrative structure
- `skills/presentation/kpi-storytelling.md` — KPI selection and translation for the deck variant
- `CLAUDE.md` → "Produce executive summaries before details"

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/quarterly-business-review.md` | QBR is the internal version; board summary is the external version |
| `skills/executive/executive-risk-report.md` | Risk section of the board summary may need dedicated risk treatment |
| `skills/executive/investment-proposal.md` | When the board ask involves a budget or headcount decision |
| `skills/presentation/executive-slide-review.md` | Review the deck variant before presenting (stricter for board) |

**Note**: this skill absorbed `skills/presentation/board-deck.md` as the "Output Variant: Deck Format" section above — that file is retired; all callers should point here.
