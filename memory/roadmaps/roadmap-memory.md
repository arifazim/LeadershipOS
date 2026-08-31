# Leadership Memory: Roadmaps

**Domain**: Leadership Memory → Roadmaps
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + stakeholders (informs planning accuracy, stakeholder communication strategy)
**Cadence**: Record at planning time; add outcome entries at delivery; review quarterly

---

## Purpose

Roadmap planning is systematically optimistic. Teams underestimate dependencies, overestimate velocity, and underweight the cost of context switching — and then repeat the same errors in the next planning cycle because the lessons from the last one weren't captured. This domain turns delivery history into a calibration instrument: it tells the EM where the team's estimates are reliable and where they need a systematic buffer.

**Questions this domain answers:**
- "Which types of work do we consistently underestimate?"
- "How accurate have our roadmap commitments been over the last four quarters?"
- "How have specific stakeholders responded to roadmap changes?"
- "Which strategic initiatives have survived from planning to delivery?"
- "What has caused our roadmaps to slip?"

---

## Domain-Specific Entry Fields

```
Initiative:             {{name or description of the work item or initiative}}
Entry type:             {{Plan entry / Delivery outcome / Stakeholder reaction / Slip analysis}}
Planning date:          {{when this was committed}}
Committed delivery:     {{date or quarter promised}}
Actual delivery:        {{date or quarter delivered — fill in retrospectively}}
Estimation ratio:       {{actual effort / estimated effort — e.g., 1.4x overrun; <1.0 = ahead}}
Slip reason:            {{Technical / Scope / Dependency / People / Design / External / None}}
Work type:              {{New capability / Incremental / Technical investment / KTLO}}
Stakeholder reaction:   {{which partner, what the reaction was to the outcome or to a change}}
What was communicated:  {{how the slip or change was framed to stakeholders}}
What landed:            {{specific communication or framing that was accepted}}
What caused friction:   {{specific communication or framing that created pushback or distrust}}
```

---

## What to Record

**Plan entries** (at planning time):
- The commitment, the work type, the timeline, and the key assumptions underlying the estimate
- Explicit identification of risks to the timeline at planning time

**Delivery outcome entries** (at delivery or slip):
- Actual delivery date vs. commitment
- Slip reason with root cause
- Estimation ratio

**Stakeholder reaction entries** (when stakeholder responds to roadmap change):
- What was communicated and how
- How the stakeholder responded
- What communication approach reduced friction

**Slip analysis entries** (quarterly retrospective on roadmap accuracy):
- Which slip reasons dominate this quarter
- Whether the same reason is recurring across multiple initiatives

---

## Pattern Detection

After six or more delivery outcome entries, look for:

**Systematic estimation error by work type**: Do New capability initiatives consistently overrun while KTLO estimates are accurate? Or vice versa? Different work types have different estimation reliability profiles.

**Slip reason frequency**: Is Dependency the most common slip reason? Then cross-team dependency management is the structural fix — not better estimation. Is Scope the most common? Then scope definition is the failure.

**Estimation ratio trend**: Is the team's estimation accuracy improving quarter over quarter, or is the same overrun ratio repeating? An unchanging ratio indicates the planning process isn't learning.

**Stakeholder reaction patterns**: Does a specific stakeholder consistently respond badly to slip communication? Is there a framing that has worked with them before? Stakeholder reaction to roadmap changes is a relationship signal, not just a communication challenge.

**Strategic initiative survival rate**: What percentage of initiatives that are planned in Q1 survive to delivery by Q4 without significant scope change? Low survival rates indicate planning-to-execution alignment failure.

---

## Query Patterns

```
Q: "Which types of work do we consistently underestimate?"
→ Filter by: Entry type: Delivery outcome; group by Work type
→ Calculate: average Estimation ratio per work type

Q: "What has caused our roadmap slips?"
→ Filter by: Slip reason field; aggregate by reason
→ Frequency: which reason dominates?

Q: "How has [stakeholder] responded to roadmap changes?"
→ Filter by: person:[tag] + Entry type: Stakeholder reaction
→ Retrieve: What landed + What caused friction fields

Q: "How accurate have roadmap commitments been?"
→ Filter by: Entry type: Delivery outcome; calculate average Estimation ratio
→ Trend: is accuracy improving quarter over quarter?

Q: "Which strategic initiatives have slipped repeatedly?"
→ Filter by: Work type: New capability + Slip reason ≠ None
→ Identify: which initiative types are structurally at risk
```

---

## Entry Log

```
ROADMAP MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example plan entry]

ID: RMP-2026-04-01-001
Date: 2026-04-01
Domain: roadmaps
Initiative: Customer self-service refund portal
Entry type: Plan entry
Planning date: 2026-04-01
Committed delivery: Q2 2026 (end of June)
Work type: New capability
Key assumptions: Backend refund API already complete (confirmed with Platform on 2026-03-28);
  design review complete; 2 engineers at full allocation.
Risks at planning: Design dependency on Design team — review not yet scheduled.
Estimation ratio: TBD
Tags: situation:roadmap-negotiation, person:product-director, outcome:neutral
Related entries: STK-2026-04-01-003

---

[Example delivery outcome entry]

ID: RMP-2026-07-01-002
Date: 2026-07-01
Domain: roadmaps
Initiative: Customer self-service refund portal
Entry type: Delivery outcome
Committed delivery: Q2 2026 (end of June)
Actual delivery: Q3 2026 (projected mid-July; 2.5-week slip)
Estimation ratio: 1.25x overrun on implementation; design review took 3x estimated time
Slip reason: Dependency — Design review required three rounds due to scope expansion in
  the design mockups. Risk identified at planning but not acted on (no date set for design
  review kickoff).
Lesson: A risk named at planning without a mitigation action is not a managed risk — it is
  a documented future surprise. "Design review not yet scheduled" required a scheduled date
  before the sprint started, not a note in the risk register.
Tags: pattern:underestimated-risk, pattern:estimation-miss, situation:roadmap-negotiation
Related entries: RMP-2026-04-01-001, STK-2026-07-01-004
```

---

## Estimation Accuracy Profile

```
ROADMAP ESTIMATION ACCURACY: {{Team / Period}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

ESTIMATION RATIO BY WORK TYPE (actual / estimated):
  New capability:       avg {{ratio}} | worst: {{ratio}} | best: {{ratio}}
  Incremental:          avg {{ratio}} | worst: {{ratio}} | best: {{ratio}}
  Technical investment: avg {{ratio}} | worst: {{ratio}} | best: {{ratio}}
  KTLO:                 avg {{ratio}} | worst: {{ratio}} | best: {{ratio}}

SLIP REASON FREQUENCY (last 4 quarters):
  Technical:    {{N}} ({{%}})
  Scope:        {{N}} ({{%}})
  Dependency:   {{N}} ({{%}})
  People:       {{N}} ({{%}})
  Design:       {{N}} ({{%}})
  External:     {{N}} ({{%}})
  Dominant cause: {{reason}} → structural fix: {{what to address}}

QUARTER-OVER-QUARTER ACCURACY TREND:
  Q-3: avg ratio {{N}}
  Q-2: avg ratio {{N}}
  Q-1: avg ratio {{N}}
  Current Q: avg ratio {{N}}
  Trend: {{Improving / Stable / Degrading}}

STRATEGIC INITIATIVE SURVIVAL RATE:
  Planned at Q-start: {{N}}
  Delivered without major scope change: {{N}} ({{%}})
  Slipped or descoped: {{N}} ({{%}})

RECOMMENDED BUFFER BY WORK TYPE:
  New capability: +{{%}} to all estimates (based on historical ratio)
  Dependency-heavy work: flag for explicit dependency timeline before committing
```

---

## Recall Output Format

```
ROADMAP RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{what was asked}}
Entries reviewed: {{N}} entries, {{date range}}

ESTIMATION ACCURACY PATTERN:
  Work type at risk: {{type}} — avg overrun: {{ratio}}
  Dominant slip reason: {{reason}} ({{N}} occurrences)

STAKEHOLDER COMMUNICATION PATTERN:
  What has worked with {{partner}}: {{framing}}
  What has caused friction: {{framing}}

RECOMMENDATION:
  Buffer to apply for this type of work: +{{%}}
  Risk to mitigate before committing: {{specific risk from pattern}}
  Stakeholder framing to use: {{based on reaction history}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Plan recorded; outcome never added** | Log full of plan entries with no delivery outcomes | Delivery outcome entries are triggered by sprint completion or delivery; they're not optional retrospective entries |
| **Risk named but not mitigated** | Planning risks documented; no action taken; surprise at slip | At planning: every risk must have a named mitigation action and an owner, not just a label |
| **Estimation learning not applied** | Same overrun ratio quarter after quarter; no buffer adjustment | Apply the team's historical ratio to estimates; don't estimate from scratch each quarter |
| **Stakeholder reaction not captured** | Communication approach repeated without knowing whether it worked | Stakeholder reaction entries capture what framing worked — these inform the next difficult roadmap conversation |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `analytics/master-leadership-dashboard.md` (View 2) — Roadmap confidence and delivery metrics
- `skills/meetings/decision-log.md` — Decision stickiness for roadmap decisions
- `memory/stakeholders/stakeholder-memory.md` — Stakeholder reaction patterns cross-referenced here
