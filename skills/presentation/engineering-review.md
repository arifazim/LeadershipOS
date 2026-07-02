# Skill: Engineering Review

**Domain**: Presentation
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or quarterly with the engineering team

---

## Purpose

Structure and run an engineering team review — an internal session where technical depth is allowed, delivery truth is surfaced, team health is assessed openly, and the engineering team leaves with clarity on where they are and where they're going.

The engineering review is the inverse of the executive presentation. Where board and VP decks strip out all engineering detail, the engineering review is where that detail belongs. But it still needs structure, narrative, and a clear outcome — or it becomes a status meeting that could have been an email.

**The three jobs of an engineering review:**
1. **Truth-telling**: How are we actually doing — technically and as a team?
2. **Learning**: What did we learn this period that changes how we work?
3. **Direction**: What are we focused on next, and does everyone understand why?

**The 15-minute version** (for teams that run tight engineering syncs):
> If you have 15 minutes with the engineering team, the three slides that matter most are:
> - **Slide 1**: Where we stand (delivery health + one key DORA signal)
> - **Slide 2**: What we learned (the most important thing from the period — a pattern, a lesson, a failure)
> - **Slide 3**: What's next (the next 2–4 week focus — specific, not a theme)

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Delivery data** | Sprint completion, DORA metrics, key deliverables |
| **Incidents or failures** | Any P1/P2, production issues, near-misses |
| **Team health signals** | 1:1 observations, capacity, on-call burden |
| **Technical highlights** | Important architectural decisions, debt addressed, or new capabilities |
| **Next period focus** | What the team is committing to in the next sprint or quarter |

### Optional
| Input | Description |
|---|---|
| **Retrospective themes** | Patterns from team retros that informed this period |
| **External feedback** | Customer or stakeholder feedback relevant to the team |
| **Hiring or team changes** | Composition changes that affect the team |
| **Technical debt status** | Progress or regression on known debt |

---

## Analysis

### Step 1 — Calibrate the Technical Depth

Engineering reviews are the one audience where technical depth is appropriate. But depth without structure loses the room.

| Section | Technical depth allowed | What to include |
|---|---|---|
| **Delivery** | Medium | DORA metrics, sprint data, completion rate |
| **Technical wins** | High | Architecture decisions, code improvements, test coverage |
| **Incidents** | High | Root cause, contributing factors, system-level analysis |
| **Team health** | Low | Aggregate signals only — not individual callouts |
| **Next focus** | Medium | Technical direction with business rationale |

### Step 2 — The Honest Assessment Standard

The engineering review must tell the truth the executive review cannot. This is where the team learns whether management is honest with them.

**What the team expects to hear honestly:**
- What actually went wrong — not just the polished version
- Where the EM made a mistake in estimation, prioritization, or judgment
- What the team did well that deserves explicit recognition
- What the next quarter's constraints are — headcount, roadmap, trade-offs

If the engineering review sounds like the executive status report, the team knows they're not getting the real picture. Trust erodes.

### Step 3 — Build the Learning Section

The most underinvested section in most engineering reviews is the learning section. It answers:

- What pattern from this period should change how we work?
- What incident or failure taught us something specific about our system?
- What assumption did we have that turned out to be wrong?
- What did we try that worked better than expected?

**Learning format:**

```
We believed: {{assumption}}
We found: {{what actually happened}}
We're changing: {{specific practice or threshold that updates}}
```

### Step 4 — Make the "Next Period" Slide Specific

The most common engineering review failure: the "next period" slide is a list of themes or focus areas instead of specific, bounded commitments.

```
Weak: "Focus areas: reliability, enterprise API, hiring"
Strong: "Sprint 43: Auth service root cause fix (reliability sprint).
         Sprint 44–45: Enterprise API v2 feature completion.
         Ongoing: 2 open roles — interviews scheduled."
```

---

## Decision Tree

```
What is the primary state of the engineering team this period?

├── HEALTHY PERIOD (delivery ≥90%, no team health concerns)
│   └── Format: Wins → delivery snapshot → learning → next focus
│       Tone: Confident, not complacent. Celebrate specifically — not generically.
│       Emphasis: Give the learning section real weight. Healthy periods have
│                 lessons too — they're just subtler.

├── MIXED PERIOD (delivery 70–89%, or team health is Yellow)
│   └── Format: Delivery snapshot (honest) → what drove the gap → team signal
│       → learning → next focus with adjustments
│       Tone: Accountable without being heavy. The team already knows — they
│             lived it. Acknowledge it, explain it, move forward.
│       Critical: Name what the EM will do differently — not just the team.

├── DIFFICULT PERIOD (delivery <70%, or Red team health)
│   └── Format: Honest assessment of what happened → impact → root cause
│       → what's changing structurally → next period with realistic scope
│       Tone: Transparent, steady. The team is watching for panic or blame.
│             Show neither.
│       Never: Pretend it didn't happen. Never: Blame individuals in the room.
│       Do: Own the management failure if there was one. Announce the fix.

└── MAJOR INCIDENT PERIOD
    └── Format: Incident summary → blameless root cause → what we're doing
        → system-level changes → team recognition for response
        See: blameless post-mortem format in `docs/engineering-playbook.md`
        Tone: Analytical, not emotional. Focus on the system, not the person.
```

---

## Output Template

```
ENGINEERING REVIEW — {{Period}}
Facilitated by: {{EM name}} | Audience: Engineering team
Format: {{In-person / Remote}} | Time: {{N}} minutes

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DELIVERY SNAPSHOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Sprint completion: {{N}}% ({{N}} of {{N}} points)
Sprint goal: {{Achieved | Partially achieved | Missed}} — {{one sentence on why}}

DORA this period:
• Deploy frequency: {{N}}/week ({{Elite/High/Medium/Low}})
• Change failure rate: {{N}}%
• Lead time: {{N}} days
• MTTR: {{N}} hrs average

Key deliverable shipped: {{description with technical and business context}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TECHNICAL HIGHLIGHTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
• {{Architecture decision or improvement — technical detail allowed here}}
• {{Debt addressed or capability added}}
• {{Tool or process improvement}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
INCIDENTS AND NEAR-MISSES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Blameless summary of any incidents, or "None this period."}}
Root cause: {{system-level, not individual-level}}
Change: {{what's different now}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
WHAT WE LEARNED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
We believed: {{assumption}}
We found: {{what actually happened}}
We're changing: {{specific practice, threshold, or process}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
TEAM HEALTH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Signal: {{Green | Yellow | Red}}
{{Aggregate observation — no individual callouts. "On-call burden elevated for 3 engineers."}}
Action: {{what EM is doing about it}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
NEXT SPRINT / PERIOD FOCUS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Specific, bounded commitments — not themes}}
• {{Deliverable}} — {{owner or squad}} — by {{date}}
• {{Deliverable}} — {{owner or squad}} — by {{date}}

Questions for the team: {{1–2 discussion questions to open dialogue}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Delivery data is real (not estimated) | Base: 70% |
| Learning section has specific "We believed / We found / We're changing" | +10% |
| Incidents covered blameless | +10% |
| Next focus is specific (not thematic) | +10% |
| Team health addressed directly | +5% |
| Delivery section exists but no learning section | −15% |
| Individual blame present in incident section | −25% (reject) |
| Next period focus is themes only | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Executive review for engineers** | Jargon stripped, business framing only — team gets no technical depth | Engineering review is the place for technical depth. Give it to them. |
| **No learning section** | Status → next steps, nothing in between | The learning section is why the review is worth having. Add it. |
| **Individual blame** | "The incident happened because X didn't catch it" | Blameless. Always. Name the system failure, not the person. |
| **Thematic next period** | "Our focus is reliability and quality" | Name specific deliverables, owners, and dates. Themes aren't commitments. |
| **EM not accountable** | All accountability is on the team | If the period was difficult, name what the EM is doing differently too. |

---

## References

- `docs/engineering-playbook.md` → Incidents, Retrospectives sections
- `skills/delivery/review-sprint.md` — Sprint-level data source for this review
- `skills/people/burnout.md` — Team health signal for the health section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/review-sprint.md` | Sprint data that feeds the delivery section |
| `skills/presentation/architecture-review-deck.md` | Technical architecture section may warrant its own review |
| `skills/people/burnout.md` | Team health assessment feeding into the review |
| `skills/executive/executive-status-report.md` | Executive-facing version of the same period's information |
