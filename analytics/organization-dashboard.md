# Dashboard: Organization Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + leadership team; skip-level reviews; org design conversations
**Cadence**: Monthly refresh; quarterly deep review

---

## Purpose

Give the EM a comprehensive view of organizational health — not just team happiness, but the structural, relational, and operational conditions that determine whether the organization can sustain performance over 12+ months. Surface systemic risks before they become people crises.

**Primary questions this dashboard answers:**
- Is the organization structurally healthy, or are we masking systemic problems with individual effort?
- Where are the organizational risks that will surface as crises if not addressed now?
- Is the leadership operating at the maturity level the organization requires?

---

## Inputs

| Source | Metric Fed |
|---|---|
| `leadership-health/master-leadership-health.md` (13 dimensions) | Organizational Health Score |
| `skills/people/engagement.md` (team engagement scores) | Team Engagement Component |
| `political-signals/political-signals.md` (5 risk signals) | Structural Risk Component |
| `skills/meetings/` (meeting effectiveness signals) | Decision Quality Component |
| `skills/conflict/` (conflict pattern signals) | Conflict Health Component |
| `skills/mentoring/growth-tracking.md` | Coaching Effectiveness Component |

---

## Analysis

### Metric 1 — Organizational Health Score (0–100)

```
Aggregated from 4 organizational health components, weighted by impact.

COMPONENT 1 — TEAM ENGAGEMENT HEALTH (0–30, weight 30%)
  Source: skills/people/engagement.md — 5-dimension engagement scores per person

  Team engagement distribution:
    % of team at 80–100 (Highly Engaged): [N]
    % of team at 60–79 (Engaged): [N]
    % of team at 40–59 (At Risk): [N]
    % of team at 20–39 (Significantly Disengaged): [N]
    % of team at <20 (Actively Disengaged): [N]

  Score calculation:
    Weighted average = (% Highly Engaged × 1.0) + (% Engaged × 0.75) +
                       (% At Risk × 0.4) + (% Significantly Disengaged × 0.15) +
                       (% Actively Disengaged × 0)
    Component score = Weighted average × 30

  Warning threshold: >25% of team below 60 = systemic problem flag

COMPONENT 2 — STRUCTURAL RISK (0–25, weight 25%)
  Source: political-signals/political-signals.md — 5 risk dimensions

  5 structural risk signals, each 0–5 (5 = healthy / no risk):
    Decision reversals: {{0–5}} — Frequency of reversed decisions
    Meeting exclusion: {{0–5}} — Engineering excluded from decisions that affect them
    Ownership ambiguity: {{0–5}} — Unclear accountability for domains or outcomes
    Escalation patterns: {{0–5}} — Frequency of unmanaged escalations
    Incentive misalignment: {{0–5}} — Misaligned team/individual incentives

  Component score = (Sum / 25) × 25

COMPONENT 3 — LEADERSHIP QUALITY (0–25, weight 25%)
  Source: leadership-health/ — 13-dimension leadership assessment, synthesized to 5 key signals

  5 leadership signals, each 0–5:
    Delegation effectiveness: Is work pushed down to the appropriate level?
    Coaching quality: Is the EM developing the team or solving problems for them?
    Feedback frequency: Are engineers receiving specific, timely behavioral feedback?
    Communication clarity: Do engineers understand priorities and their role in them?
    Psychological safety: Can engineers raise real problems without fear?

  Component score = (Sum / 25) × 25

COMPONENT 4 — DECISION AND PROCESS QUALITY (0–20, weight 20%)
  Source: skills/meetings/decision-log.md + action item completion rates

  4 process signals, each 0–5:
    Decision capture rate: % of significant decisions documented in the decision log
    Action item completion rate: % of meeting actions completed on time (target >85%)
    Meeting necessity rate: % of meetings that pass the necessity test (not status theater)
    Cross-team coordination quality: Are cross-team dependencies managed proactively?

  Component score = (Sum / 20) × 20

ORGANIZATIONAL HEALTH SCORE = Component 1 + Component 2 + Component 3 + Component 4

THRESHOLDS:
  80–100: Healthy — organization is structurally sound; focus on growth
  60–79: Functional — specific gaps; name and address the lowest components
  40–59: At Risk — structural problems accumulating; intervention required
  <40: Dysfunctional — organizational capacity is compromised; executive visibility needed
```

### Metric 2 — Cross-Functional Alignment Score (0–100)

```
Source: stakeholder relationships + meeting outcomes + decision stickiness

5 ALIGNMENT FACTORS (0–20 each):

Factor 1 — Stakeholder Relationship Quality (0–20)
  For each key cross-functional partner (Product / Design / Data / Business / Legal):
    Trust level: Strong (5) / Adequate (3) / Strained (1) / Broken (0)
  Average trust score × 4 = factor score

Factor 2 — Decision Stickiness (0–20)
  % of cross-functional decisions that were not relitigated within 30 days of being made
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

Factor 3 — Blocker Resolution Velocity (0–20)
  Average days to resolve cross-team blockers (from identification to resolution)
  <3 days: 20 | 3–7 days: 15 | 7–14 days: 10 | >14 days: 5

Factor 4 — Cross-Team Meeting Outcome Quality (0–20)
  % of cross-functional meetings that produce a decision, alignment document, or clear action
  >80%: 20 | 65–79%: 15 | 50–64%: 10 | <50%: 5

Factor 5 — Escalation Frequency (0–20)
  Inverse: fewer escalations = higher alignment
  Zero escalations in period: 20 | 1–2 managed escalations: 15 | 3–4: 10 | 5+: 5

CROSS-FUNCTIONAL ALIGNMENT SCORE = Sum of 5 factors (0–100)

THRESHOLDS:
  80–100: High alignment — engineering is a trusted cross-functional partner
  60–79: Adequate — some friction; specific relationships or process gaps
  40–59: Low alignment — organizational trust is fraying; proactive repair needed
  <40: Misaligned — cross-functional relationships are a delivery risk; executive visibility
```

### Metric 3 — Leadership Influence Score (0–100)

```
Source: skills/mentoring/technical-leadership.md + recognition + sponsorship activity

5 INFLUENCE FACTORS (0–20 each):

Factor 1 — Technical Leadership Depth (0–20)
  % of team with technical leadership composite score >32 (Emerging Leader or above)
  >50% of team: 20 | 30–50%: 15 | 15–29%: 10 | <15%: 5

Factor 2 — Cross-Functional Influence Events (0–20)
  Product/business decisions materially changed by engineering input in the last quarter
  4+ decisions influenced: 20 | 2–3: 15 | 1: 10 | 0: 5

Factor 3 — Sponsorship Activity (0–20)
  Engineers named in executive forums, cross-functional attribution, or leadership visibility events
  Monthly sponsorship for 50%+ of high performers: 20 | Quarterly for 50%+: 15 |
  Occasional, not systematic: 10 | Not happening: 5

Factor 4 — Recognition Reach (0–20)
  Recognition provided at skip-level or executive audience at least monthly
  Monthly: 20 | Quarterly: 15 | Annually: 10 | Never: 5

Factor 5 — Organizational Trust (0–20)
  Skip-level trust + peer manager trust (from skip-level feedback or peer input)
  High trust from both skip-level and peers: 20 | High from one, moderate from other: 15 |
  Moderate from both: 10 | Low from either: 5

LEADERSHIP INFLUENCE SCORE = Sum of 5 factors (0–100)

Note: Leadership influence is a lagging indicator — changes made today take 2–3 quarters to show
in the score. Trend direction matters as much as the absolute score.
```

---

## Decision Tree

```
What does the Organization Dashboard reveal?

├── ORGANIZATIONAL HEALTH SCORE <60
│   └── Identify which component is lowest:
│       Engagement component <18/30 → skills/people/engagement.md; team-level intervention
│       Structural risk component <15/25 → political-signals/; name and remove the risk
│       Leadership quality component <15/25 → leadership-health/; coaching/delegation audit
│       Decision quality component <12/20 → meeting-planner + decision-log; process reset

├── >25% OF TEAM BELOW ENGAGEMENT SCORE 60
│   └── This is a systemic problem — not individual cases
│       Do not address individually; investigate organizational root cause
│       Common causes: sustained overload, unclear priorities, leadership visibility gap, comp misalignment
│       → skills/people/engagement.md for stay interview protocol at scale

├── CROSS-FUNCTIONAL ALIGNMENT SCORE <60
│   └── Identify the lowest factor:
│       Stakeholder trust low → skills/conflict/stakeholder-resolution.md
│       Decision stickiness low → skills/meetings/decision-log.md; root cause in how decisions are made
│       Blocker velocity slow → weekly blocker audit; escalation path clarification
│       Escalation frequency high → upstream alignment improvement; proactive risk surfacing

├── LEADERSHIP INFLUENCE SCORE <60
│   └── Sponsorship is the fastest lever: name engineers in the right rooms
│       Cross-functional influence: assign engineering leads to pre-sprint planning, not just sprint reviews
│       Technical leadership depth low: skills/mentoring/technical-leadership.md; identify and develop candidates
│       Organizational trust gap: skip-level conversations; peer manager relationship investment

├── LEADERSHIP QUALITY COMPONENT <15/25
│   └── This is an EM self-assessment gap
│       Which of the 5 leadership signals is lowest?
│       Delegation low → skills/mentoring/delegation.md; under-delegation audit
│       Coaching low → skills/people/coaching.md; shift from managing to coaching
│       Feedback low → skills/people/feedback.md; feedback frequency and specificity audit
│       Psychological safety low → intervention required; cannot be declared; must be built

└── ALL SCORES >75
    → Quarterly deep review: is this score accurate or are there blind spots?
    → Skip-level conversations to validate: does the team experience what the scores say?
    → Identify the one organizational investment that would produce the most long-term compounding
```

---

## Output

### Organization Dashboard Scorecard

```
ORGANIZATION DASHBOARD — {{Team/Org}} — {{Date}}

COMPOSITE SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Organizational Health Score:      {{0–100}} | {{Healthy / Functional / At Risk / Dysfunctional}}
Cross-Functional Alignment Score: {{0–100}} | {{High / Adequate / Low / Misaligned}}
Leadership Influence Score:       {{0–100}} | {{Strong / Building / Weak / Absent}}

ORGANIZATIONAL HEALTH BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Team Engagement Health (0–30):      {{score}} | % below 60: {{%}} {{FLAG if >25%}}
Structural Risk (0–25):             {{score}} | Highest risk signal: {{signal name}}
Leadership Quality (0–25):          {{score}} | Lowest signal: {{signal name}}
Decision & Process Quality (0–20):  {{score}} | Action completion rate: {{%}}

TEAM ENGAGEMENT DISTRIBUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Highly Engaged (80–100): {{N}} ({{%}})
Engaged (60–79):          {{N}} ({{%}})
At Risk (40–59):          {{N}} ({{%}}) {{FLAG if >20%}}
Disengaged (<40):         {{N}} ({{%}}) {{FLAG if >0}}
Flight risk signals:      {{N engineers with 2+ flight risk behavioral indicators}}

STRUCTURAL RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision reversals:    {{0–5}} | {{context}}
Meeting exclusion:     {{0–5}} | {{context}}
Ownership ambiguity:   {{0–5}} | {{context}}
Escalation patterns:   {{0–5}} | {{context}}
Incentive misalignment:{{0–5}} | {{context}}

CROSS-FUNCTIONAL ALIGNMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stakeholder trust (avg): {{0–5}} | Strained relationships: {{list}}
Decision stickiness: {{%}} | Relitigated decisions: {{N}}
Blocker resolution velocity: {{N days avg}}
Escalation count this quarter: {{N}}

LEADERSHIP INFLUENCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical leadership depth: {{%}} of team at Emerging Leader+
Engineers sponsored this quarter: {{N}}
Cross-functional influence events: {{N decisions changed by eng input}}
Skip-level/peer trust: {{High / Medium / Low}} | Evidence: {{source}}

INTERVENTIONS QUEUED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Priority 1: {{Highest-risk signal}} → {{specific action}} by {{date}}
Priority 2: {{Second signal}} → {{specific action}} by {{date}}
Priority 3: {{Third signal}} → {{specific action}} by {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Engagement scores sourced from structured monthly assessment | Base: 65% |
| Structural risk signals reviewed against observable evidence | +10% |
| Leadership quality self-assessment validated with skip-level input | +15% |
| Cross-functional alignment data sourced from outcomes, not impressions | +10% |
| Scores assigned from impression without behavioral evidence | −30% |
| Skip-level validation not done for leadership quality | −15% |
| Cross-functional alignment scored without stakeholder input | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Engagement survey-only** | Engagement measured only by pulse survey; behavioral signals ignored | Layer behavioral indicators: 1:1 signals, meeting participation, initiative patterns |
| **Self-assessed leadership quality** | EM scores own leadership quality without skip-level input | Quarterly skip-level; peer manager feedback; team-level behavioral evidence |
| **Alignment theater** | Cross-functional alignment scored high because meetings are cordial; decisions get relitigated | Measure stickiness, not sentiment. Did the decision hold? |
| **Structural risks normalized** | Same structural risks for 3+ quarters; normalized as "just how things work" | Flag persistence explicitly. A risk that hasn't been resolved in 2 quarters requires escalation. |

---

## References

- `leadership-health/master-leadership-health.md` — Leadership quality component source
- `political-signals/political-signals.md` — Structural risk component source
- `skills/people/engagement.md` — Engagement component source
- `skills/meetings/decision-log.md` — Decision quality component source
- `analytics/people-dashboard.md` — People-level detail that feeds organizational aggregates

## Related Skills

| Skill | Relationship |
|---|---|
| `analytics/people-dashboard.md` | Individual signals aggregate into org health; people dashboard is the source |
| `analytics/stakeholder-dashboard.md` | Cross-functional alignment shared between org and stakeholder dashboards |
| `leadership-health/master-leadership-health.md` | Leadership quality component sourced directly |
| `political-signals/political-signals.md` | Structural risk signals sourced directly |
