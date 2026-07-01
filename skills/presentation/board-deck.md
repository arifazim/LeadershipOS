# Skill: Board Deck

**Domain**: Presentation
**Owner**: `subagents/executive-summary.md`
**Cadence**: Quarterly (board meetings) + on-demand (fundraising, M&A, major incidents)

---

## Purpose

Build a board-ready engineering presentation — stricter than VP-level, structured around the three questions board members actually ask, and compressed to the format that earns confidence from people who have limited context and no time.

Board members evaluate engineering on one axis: is engineering an asset or a liability? Every slide in the board deck must answer that question. Everything else is noise.

**The three questions every board member is asking:**
1. Can the engineering team build what we're selling?
2. Is engineering spending money wisely?
3. Are there hidden risks we should know about?

**The 15-minute board standard** (boards often give engineering 10–15 minutes):
> Three slides. No more.
> - **Slide 1**: Performance — what we built and what it earned
> - **Slide 2**: Investment — what we spent and what it's worth
> - **Slide 3**: Outlook — what we're building next and the one risk to watch
>
> The ask goes on Slide 3 if there is one. One ask maximum. One slide. No exceptions.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Quarter's delivery** | What shipped, in business outcome terms |
| **Engineering investment** | Headcount, cost summary, notable resource decisions |
| **Engineering health signal** | One signal: Healthy / Concerns / Issues |
| **Strategic outlook** | What engineering is building toward in next 2–4 quarters |

### Optional
| Input | Description |
|---|---|
| **Reliability record** | Uptime %, any disruptions and their customer impact |
| **Hiring** | Team composition changes, key hires |
| **Risk** | One top risk in business terms |
| **Ask** | If the board needs to decide or approve something |

---

## Analysis

### Step 1 — Apply the Board Communication Rules

Board communication is stricter than VP communication. Additional constraints beyond executive jargon rules:

**Complete ban list for board decks:**
`sprint, velocity, deployment, CI/CD, microservices, API, latency, SLA, tech debt, refactor, infrastructure, backlog, PR, ticket, story point, incident (use "service disruption"), MTTR (use "time to recovery"), on-call, pipeline, architecture, Kubernetes, DevOps, scrum, agile, standup`

**One ask maximum.** If you have two asks, you haven't prioritized.

**One page or three slides.** If it doesn't fit, you haven't edited.

**Every claim ties to a business metric or strategic outcome.** Features listed without impact are cut.

### Step 2 — Translate Engineering Metrics to Board Language

| Engineering metric | Board translation |
|---|---|
| 94% sprint completion | "Engineering delivered 94% of committed capabilities this quarter" |
| Deployment frequency: 5/week | "Shipping new capabilities multiple times per week" |
| MTTR: 1.8 hours | "When service disruptions occur, restored within 2 hours on average" |
| Change failure rate: 2% | "98% of updates shipped without customer-facing issues" |
| Team: 14 engineers | "Engineering team of 14; grew by 3 this quarter" |
| P1 incident | "Service disruption affecting [N]% of users" |

### Step 3 — Structure the Board Deck

**Board deck structure** (3 slides / 1 page max):

```
Slide 1: PERFORMANCE
  - Delivery rate (% of committed capabilities shipped)
  - One or two key deliverables + their business outcomes
  - Reliability: uptime % and any disruptions (if none: say so)

Slide 2: INVESTMENT
  - Team size + change vs. prior quarter
  - Engineering cost as % of operating expense or revenue
  - One significant investment and its ROI

Slide 3: OUTLOOK + ONE ASK
  - What engineering is building toward in next 2 quarters
  - Top risk (one, in business terms, with mitigation)
  - Confidence in current plan: High / Medium / Low
  - Ask (if any — or omit this section entirely)
```

### Step 4 — The Risk Disclosure Rule

Boards must hear about risks. A board deck with no risk disclosed triggers one of two reactions: relief (if they trust you) or skepticism (if they don't yet). Most board members default to skepticism.

**Rule**: Always disclose one risk. If the risk is well-managed, say so — but name it. Boards respect transparency. The EM who names the risk and the plan earns more trust than the EM who presents a risk-free quarter.

---

## Decision Tree

```
What is the board meeting context?

├── REGULAR QUARTERLY UPDATE
│   └── Format: Performance → Investment → Outlook + ask
│       Tone: Confident, data-backed, forward-looking
│       Length: 3 slides (10 slides maximum if additional materials requested)
│       Delivery: 10–15 minutes presenting + 5 minutes Q&A
│       → Invoke: skills/presentation/kpi-storytelling.md for metric selection

├── FOLLOWING A MAJOR INCIDENT OR CRISIS
│   └── Format: What happened (2 sentences) → Customer impact → Resolution
│       → What prevents recurrence → What the board should know
│       Tone: Transparent, action-oriented — do not minimize
│       Placement: Add as first section before regular quarterly update
│       Length: Add 1 paragraph to regular deck — do not build separate deck

├── FUNDRAISING / DUE DILIGENCE
│   └── Format: Engineering capability → Team → Build/buy approach
│       → Roadmap → Key risks and mitigations
│       Tone: Substantive, honest about gaps, specific about strengths
│       Length: 1–2 pages; expect deep Q&A
│       Preparation: Prepare 10–15 backup slides for questions

└── M&A OR STRATEGIC PARTNERSHIP
    └── Format: Assessment of target/partner → Integration approach
        → Risks → Timeline → Resource ask
        → Also invoke: skills/executive/investment-proposal.md if resources needed
        → Also invoke: subagents/tech-lead.md for technical assessment
```

---

## Output Template

```
ENGINEERING UPDATE — Q{{N}} {{YEAR}}
Prepared for: Board of Directors
Prepared by: {{EM / VP / CTO}}
Presentation time: {{N}} minutes

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PERFORMANCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2–3 sentences. Delivery rate vs. commitment. Business framing only.]

Key capabilities shipped this quarter:
• {{Capability}} — {{business outcome: what it enables or what it measured}}
• {{Capability}} — {{business outcome}}

Reliability: {{N}}% of the quarter without customer-facing disruptions.
{{If disruptions occurred: "One disruption on [date] — [N hours], [N%] of customers affected. Resolved."}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INVESTMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team: {{N}} engineers ({{+/−N}} vs. last quarter)
{{Key hire or team milestone — one sentence, if applicable}}
Engineering cost: {{N}}% of operating expense (industry: {{N}}–{{N}}%)

Significant investment this quarter:
• {{Investment}} — {{business outcome or projected return}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OUTLOOK — NEXT 2 QUARTERS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[2 sentences. What engineering is building toward. Tied to company strategy.]

Top risk: {{One risk in business terms — likelihood, mitigation, and status}}
Confidence in Q{{N+1}} plan: {{High | Medium | Low}} — {{one sentence rationale}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ASK (if any — omit section if none)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific, single ask — or omit this section entirely}}
```

---

## Example

```
ENGINEERING UPDATE — Q3 2025
Prepared for: Board of Directors

PERFORMANCE
Engineering delivered 91% of committed capabilities this quarter, including the
enterprise API platform (live August 15) and checkout optimization. The checkout
improvement contributed to a 14% increase in transaction completion in the 30
days since launch. One customer-facing disruption occurred in July — 2 hours,
affecting 8% of users — resolved and the underlying cause fixed.

Key capabilities:
• Enterprise API platform — enables self-service integration for B2B customers;
  3 enterprise contracts now in Q4 pipeline
• Checkout optimization — 14% transaction completion improvement, worth an
  estimated $180K in annualized recovered revenue

Reliability: 99.1% of the quarter without disruptions.

INVESTMENT
Team: 18 engineers (+2 vs. Q2). Two senior engineers joined to accelerate
enterprise product line. One key engineering leader hired in August.
Engineering cost: 29% of operating expense (industry median: 28–35%).

Significant investment: Reliability improvement program — disruption frequency
reduced 80% since Q1; projected $160K annual support cost reduction.

OUTLOOK — NEXT 2 QUARTERS
Engineering is focused on enterprise security certification (Q4) and international
infrastructure (Q1 2026), both on the approved H2 plan. Current team capacity
supports both without additional headcount.

Top risk: SOC 2 security certification is on the critical path for the enterprise
tier launch. External auditor is engaged. Timeline is tight but currently on track.
I will escalate to the board immediately if this changes.

Confidence in Q4 plan: High — team is staffed, scope is locked, no known blockers.

ASK
Approval to accelerate 2026 headcount planning: we anticipate needing 3 additional
engineers in H1 2026 to support international growth. Request to begin recruiting
in Q4 so the team is in place for the Q1 2026 launch. Proposal attached.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All engineering jargon removed | Base: 65% |
| Three board questions answered | +15% |
| Every claim tied to business metric | +10% |
| Risk disclosed with mitigation | +10% |
| Length is ≤ 3 slides or 1 page | +5% |
| Any term from ban list survives | −25% (reject — fix before presenting) |
| No risk disclosed | −20% |
| More than one ask | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Jargon survives** | Any banned term in the deck | Full audit. Zero tolerance. Every word must pass the "non-engineer" test. |
| **Features without outcomes** | "We shipped X" with no business result | For every deliverable: "which means [business outcome for customers or the company]" |
| **No risk** | Perfect quarter presented | Name one risk. Always. Boards expect it. Hiding it is worse. |
| **Too long** | More than 3 slides or 1 dense page | Cut every sentence that doesn't answer one of the three board questions. |
| **Multiple asks** | Three action items for the board | One ask. Choose the most important. The others become VP-level conversations. |

---

## References

- `skills/executive/board-level-summary.md` — Written board summary (same content, different format)
- `skills/presentation/kpi-storytelling.md` — KPI selection and translation
- `skills/executive/executive-communication.md` — Jargon translation rules

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/board-level-summary.md` | Written version of the same board content |
| `skills/presentation/executive-slide-review.md` | Review the deck before presenting (stricter for board) |
| `skills/presentation/kpi-storytelling.md` | Translate KPIs into board-appropriate narrative |
| `skills/executive/investment-proposal.md` | When the board ask involves a budget or headcount decision |
