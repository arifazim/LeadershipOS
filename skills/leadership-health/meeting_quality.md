# Skill: Meeting Quality

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly

---

## Purpose

Measure the effectiveness of meetings the engineering manager runs or participates in. Meetings are one of the highest-cost activities in engineering — poor meetings waste time, erode trust, and create decision debt.

This skill answers three questions:
1. Are meetings the EM runs or participates in achieving their intended outcomes?
2. Are meetings well-structured with clear agendas, decisions, and action items?
3. Do attendees find meetings valuable, or do they see them as time-wasters?

**Invoke this skill when**: After a series of meetings, when team feedback indicates meeting fatigue, or before a quarterly review.

**Do not invoke this skill for**: Measuring communication quality in general (use `communication_effectiveness.md`), measuring team forum effectiveness (use `communication_effectiveness.md`), or measuring 1:1 quality (use `coaching_score.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Meeting metrics (last 20 meetings) | Calendar / meeting tool | Agenda adherence, decision output, action item completion, duration |
| Attendee feedback | Surveys, 1:1s, informal feedback | 3–5 verbatim comments from attendees about meeting value |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Agenda completion rate | Meeting notes | % of meetings where all agenda items were addressed |
| Decision output count | Meeting notes | Average number of decisions made per meeting |
| Action item completion rate | Meeting notes / follow-up tracking | % of action items completed by the agreed date |
| Attendee satisfaction score | Formal or informal survey | Average satisfaction score (1–5) |
| Meeting volume | Calendar data | Count and total hours of meetings per week |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Agenda Adherence Assessment
Review the last 20 meetings:
- **Agenda adherence rate** = `(Meetings where all agenda items were addressed ÷ Total meetings) × 100`

| Agenda Adherence Rate | Interpretation |
|---|---|
| ≥ 85% | High. Meetings stay on topic and on time. |
| 70–84% | Acceptable. Most meetings address all agenda items. |
| 55–69% | At Risk. Meetings frequently drift or run over. |
| < 55% | Critical. Meetings are unstructured and unproductive. |

### Step 2 — Decision Output Assessment
Review decision output:
- **Decision output rate** = `(Average decisions per meeting)` for meetings that required decisions

| Average Decisions per Meeting | Interpretation |
|---|---|
| ≥ 1 for decision meetings | High. Meetings produce decisions. |
| 0.5–0.9 for decision meetings | Acceptable. Some meetings are informational only. |
| 0.1–0.4 for decision meetings | At Risk. Meetings are informational but claim to be decision forums. |
| 0 for decision meetings | Critical. Meetings labeled as decision forums produce no decisions. |

### Step 3 — Action Item Completion Assessment
Review action item completion:
- **Action item completion rate** = `(Action items completed by agreed date ÷ Total action items) × 100`

| Action Item Completion Rate | Interpretation |
|---|---|
| ≥ 90% | High. Meeting action items are executed reliably. |
| 75–89% | Acceptable. Most action items are completed. |
| 60–74% | At Risk. Action items are frequently missed. |
| < 60% | Critical. Meetings produce action items that are not executed. |

### Step 4 — Attendee Satisfaction Assessment
Review attendee feedback:
- **Satisfaction score** = Average satisfaction rating (1–5) from attendee feedback

| Satisfaction Score | Interpretation |
|---|---|
| ≥ 4.0 | High. Attendees find meetings valuable. |
| 3.0–3.9 | Acceptable. Meetings are tolerable but not exceptional. |
| 2.0–2.9 | At Risk. Attendees find meetings frustrating. |
| < 2.0 | Critical. Attendees actively avoid or resent meetings. |

### Step 5 — Synthesize Meeting Quality Signal
Combine agenda adherence, decision output, action item completion, and satisfaction into an overall meeting quality assessment. Weight: Agenda adherence (25%), Decision output (25%), Action item completion (25%), Satisfaction (25%).

---

## Decision Tree

Use this tree to determine the meeting quality classification and primary recommendation.

```
What is the agenda adherence rate?
│
├── ≥ 85% ────────────────────────────────────────────────
│   What is the action item completion rate?
│   │
│   ├── ≥ 90% ───────────────────────────────────────────
│   │   What is the satisfaction score?
│   │   │
│   │   ├── ≥ 4.0
│   │   │   └── OUTCOME: Meeting quality is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Share your meeting practices with peer EMs.
│   │   │
│   │   └── < 4.0
│   │       └── OUTCOME: Meeting quality is functional but attendees are not engaged.
│   │             Recommendation: Review attendee feedback.
│   │             Are meetings too long? Too frequent?
│   │             Wrong attendees? Experiment with format changes.
│   │
│   └── 75–89% ─────────────────────────────────────────
│       └── OUTCOME: Meeting quality is functional with action item gap.
│             Recommendation: Improve action item tracking.
│             Assign a note-taker who tracks completions.
│             Follow up on missed action items in the next meeting.
│
├── 70–84% ───────────────────────────────────────────────
│   What is the primary meeting gap?
│   │
│   ├── AGENDA NOT FOLLOWED
│   │   └── OUTCOME: Meeting quality is at risk due to drift.
│   │             Recommendation: Assign a timekeeper.
│   │             If an agenda item is not resolved, move it to
│   │             the "parking lot" and schedule a follow-up.
│   │
│   ├── NO DECISIONS MADE
│   │   └── OUTCOME: Meeting quality is at risk due to lack of output.
│   │             Recommendation: Every meeting must have a decision
│   │             or an information objective. If it is information only,
│   │             make it async (document or video).
│   │
│   └── ACTION ITEMS NOT EXECUTED
│       └── OUTCOME: Meeting quality is at risk due to execution gap.
│             Recommendation: Track action items in a shared system.
│             Review completions at the start of every meeting.
│
└── < 70% ─────────────────────────────────────────────────
    What is the primary failure mode?
    │
    ├── NO AGENDA
    │   └── OUTCOME: Meeting quality is broken — meetings have no structure.
    │         Recommendation: Require an agenda for every meeting.
    │         No agenda, no meeting. Send the agenda 24 hours in advance.
    │
    ├── WRONG ATTENDEES
    │   └── OUTCOME: Meeting quality is broken — wrong people in the room.
    │         Recommendation: Review attendee list for every recurring meeting.
    │         Remove people who are not contributing or deciding.
    │
    ├── TOO LONG / TOO FREQUENT
    │   └── OUTCOME: Meeting quality is broken — meeting fatigue.
    │         Recommendation: Cut meeting length by 25%.
    │         Cancel recurring meetings that do not have a clear purpose.
    │         Make meetings default to 25 or 50 minutes.
    │
    └── NO FOLLOW-THROUGH
        └── OUTCOME: Meeting quality is broken — meetings produce no results.
              Recommendation: Assign one decision and one action item
              per meeting maximum. Track them publicly.
              Cancel meetings that produce neither.
```

---

## Output

Produce the following artifacts in order.

### 1. Meeting Quality Summary (3–5 sentences)

State: overall meeting quality signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Meeting quality is functional with an action item gap. Agenda adherence is 82% — most meetings stay on topic. Decision output is 0.8 decisions per decision meeting — acceptable. Action item completion is 72% — action items are frequently missed. Satisfaction is 3.2/5 — attendees find meetings tolerable but not valuable. The primary gap is action item execution: meetings produce action items but they are not tracked or followed up. Immediate action: EM to implement a shared action item tracker and review completions at the start of every meeting. Confidence: High (84%)."

### 2. Meeting Quality Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Agenda adherence rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Decision output rate | {{avg decisions}} | ≥ 1 = Green, 0.5–0.9 = Yellow, < 0.1 = Red | {{G/Y/R}} |
| Action item completion rate | {{%}} | ≥ 90% = Green, 75–89% = Yellow, < 60% = Red | {{G/Y/R}} |
| Satisfaction score | {{1–5}} | ≥ 4.0 = Green, 3.0–3.9 = Yellow, < 2.0 = Red | {{G/Y/R}} |

### 3. Meeting Audit

| Date | Meeting | Attendees | Agenda | Decisions | Action Items | Duration | Satisfaction |
|---|---|---|---|---|---|---|---|
| {{Date}} | {{Meeting}} | {{Count}} | {{Y/N}} | {{Count}} | {{Count}} | {{Mins}} | {{1–5}} |

### 4. Root Cause (if meeting quality is At Risk or Broken)

- **Primary cause**: {{No agenda / Wrong attendees / Too long/frequent / No follow-through / Multiple failures}}
- **Evidence**: {{2–3 specific observations from meeting audit}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to meeting practice}}
- **Meeting policy** (if applicable): {{Specific policy to implement}}

---

## Examples

### Example A — Strong Meeting Quality

**Inputs**
- Meeting metrics: 20 meetings — 18 had agendas (90% agenda adherence rate)
- Decision output: 12 decision meetings averaged 1.1 decisions per meeting
- Action item completion: 92% — 35 of 38 action items completed on time
- Attendee satisfaction: 4.3/5 average — attendees report meetings are "focused and productive"
- Meeting volume: 8 hours of meetings per week — appropriate for an EM role

**Output Summary**
> Meeting quality is strong. Agenda adherence is 90%, decision output is 1.1 per decision meeting, action item completion is 92%, and satisfaction is 4.3/5. Meetings are structured, productive, and valued by attendees. The one gap is that 2 meetings had no agenda — both were ad-hoc incident responses where structure was sacrificed for speed. This is appropriate for incident response but should be the exception, not the norm. Confidence: High (93%).

---

### Example B — Meeting Quality Broken

**Inputs**
- Meeting metrics: 20 meetings — 8 had agendas (40% agenda adherence rate)
- Decision output: 10 decision meetings averaged 0.2 decisions per meeting
- Action item completion: 38% — 15 of 39 action items completed on time
- Attendee satisfaction: 2.1/5 average — attendees report "meetings are a waste of time" and "nothing ever gets decided"
- Meeting volume: 18 hours of meetings per week — excessive

**Output Summary**
> Meeting quality is broken. Agenda adherence is 40%, decision output is 0.2 per decision meeting, action item completion is 38%, and satisfaction is 2.1/5. Meetings are unstructured, unproductive, and resented by attendees. Meeting volume is 18 hours per week — EM is spending too much time in meetings and producing too little value. The primary failure is a combination of no agenda and no follow-through: meetings have no structure and produce no results. Confidence: High (86%).

**Recommendations**
- *This week*: EM to cancel or reduce 2 recurring meetings that do not have clear agendas or decision outputs.
- *This quarter*: Implement a meeting policy: (1) every meeting must have an agenda sent 24 hours in advance, (2) no agenda = no meeting, (3) default to 25 or 50 minutes, (4) assign one action item per meeting maximum.
- *Systemic*: Reduce meeting volume by 30%. Move informational content to async formats (documents, videos, Slack threads).

---

## Confidence Score

The confidence score reflects how much to trust this meeting quality assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any meeting quality assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Meeting data is tool-tracked (calendar or meeting tool) | +5% |
| Attendee feedback is from multiple sources | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Meeting data is self-reported only | −10% |
| No attendee feedback available | −10% |
| Meeting volume data is unavailable | −5% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in meeting practice |
| 70–89% | Medium | Use output; flag gaps to team |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for team communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Meeting data under-reporting** | EM only logs "important" meetings | Log is thin but team reports frequent meetings | Require log of all meetings above 30 minutes |
| **Satisfaction bias** | Attendees rate meetings positively to avoid conflict | Satisfaction is high but meeting output is low | Cross-reference satisfaction with decision output and action item completion |
| **Agenda theater** | Agendas exist but are not followed | Agenda adherence is high but meetings drift | Measure adherence by whether all items were resolved, not whether an agenda existed |
| **Decision mislabeling** | Meetings labeled as decision forums but are informational | Decision output is low despite "decision" meeting labels | Classify meetings by purpose: decision, information, or social. Measure output by purpose |
| **Action item theater** | Action items are recorded but not tracked | Completion rate is low but EM reports "we have action items" | Track action items in a shared system with completion dates |
| **Volume blindness** | EM does not track meeting volume | Meeting hours are high but EM reports "meetings are fine" | Track total meeting hours per week; > 15 hours for an EM is a red flag |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Predict before React*
- `docs/engineering-playbook.md` → *Running Effective Meetings*, *Calendar Management*, *Team Communication*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
| `communication_effectiveness.md` — Closely related — meetings are a primary communication channel |
| `coaching_score.md` — 1:1 meeting quality (complementary) |
| Levinson — *The Pocket Guide to Effective Meetings* (2003): Meeting structure and facilitation |
| Rogelberg — *The Surprising Science of Meetings* (2019): Evidence-based meeting practices |

---

## Related Skills

| Skill | Relationship |
|---|---|
| `communication_effectiveness.md` | Closely related — meetings are a primary communication channel |
| `coaching_score.md` | 1:1 meeting quality (complementary) |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `execution_clarity.md` | Meetings are a primary channel for communicating priorities |
| `stakeholder_alignment.md` | Meetings are a primary tool for stakeholder alignment |
| `decision_quality.md` | Meetings are a primary venue for decision-making |
| `skills/people/assess-engagement.md` | Meeting quality affects team engagement |
| `skills/delivery/plan-sprint.md` | Sprint planning meeting quality |
