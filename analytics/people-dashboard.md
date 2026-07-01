# Dashboard: People Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (internal); HR partner; skip-level conversations
**Cadence**: Monthly refresh; immediate update on flight risk or burnout signal

---

## Purpose

Give the EM a complete, scored view of every direct report across five people dimensions — engagement, burnout risk, retention risk, career momentum, and coaching effectiveness — so that the right intervention reaches the right person at the right time, not after the crisis.

**Primary questions this dashboard answers:**
- Who needs attention right now, and why?
- Who is growing, and at what velocity?
- Where is the team's people risk concentrated, and what is the priority order?

---

## Inputs

| Source | Metric Fed |
|---|---|
| `skills/people/engagement.md` (5-dimension, 0–100) | Engagement Score |
| `skills/people/burnout.md` (Maslach 0–9) | Burnout Score |
| `skills/performance/retention-risk.md` (6-factor, 0–30) | Retention Risk Score |
| `skills/mentoring/growth-tracking.md` (skill progression 1–5) | Coaching Effectiveness |
| `skills/performance/promotion-readiness.md` (5-dimension, 0–50) | Career Progression Index |
| `skills/people/one-on-one.md` (theme tracker, 4-session log) | 1:1 Signal Quality |

---

## Analysis

### Metric 1 — Coaching Effectiveness (0–100, team-level)

```
Source: skills/mentoring/growth-tracking.md — per-person coaching effectiveness rate

INDIVIDUAL COACHING EFFECTIVENESS:
  For each direct report:
    Goals advancing = (skills with observable behavioral change this quarter) / (total tracked skills)
    Individual coaching effectiveness = goals advancing × 100

TEAM COACHING EFFECTIVENESS:
  Team score = Average individual coaching effectiveness across all direct reports

THRESHOLDS:
  >70%: Strong — approach is working; goals may be too easy if consistently above 80%
  40–70%: Healthy — maintain approach; adjust goals quarterly
  20–39%: Borderline — investigate approach, goal quality, and practice opportunity
  <20%: Ineffective — something must change; identify root cause per person

COACHING EFFECTIVENESS BREAKDOWN (per person):
  Engineer   | Goals Tracked | Goals Advancing | Rate | Signal
  {{Name}}   | {{N}}         | {{N}}           | {{%}} | {{Strong/Healthy/Borderline/Ineffective}}

SKILL VELOCITY TREND (supplementary):
  For each person: Average skill velocity (score change per month across tracked skills)
  Positive: growth is happening
  Zero (2+ months): plateau — approach change needed
  Negative: regression — investigate root cause (burnout? overload? wrong goals?)
```

### Metric 2 — Career Progression Index (0–100, team-level)

```
Source: skills/performance/promotion-readiness.md + career development signals

5 CAREER PROGRESSION FACTORS (0–20 each):

Factor 1 — Promotion Readiness Distribution (0–20)
  % of team with promotion readiness composite score ≥35 (one quarter or ready now)
  >50%: 20 | 35–49%: 15 | 20–34%: 10 | <20%: 5
  Note: Not all engineers should be at ≥35 — this reflects growth opportunity concentration

Factor 2 — Promotion Rate (0–20)
  Promotions in last 12 months / engineers eligible for promotion in last 12 months
  >80% of eligible promoted: 20 | 60–79%: 15 | 40–59%: 10 | <40%: 5
  Eligible = readiness score ≥42 for at least one quarter

Factor 3 — Career Conversation Frequency (0–20)
  % of team with substantive career development conversation in the last 90 days
  >90%: 20 | 75–89%: 15 | 50–74%: 10 | <50%: 5

Factor 4 — Growth Plan Coverage (0–20)
  % of team with an active, maintained IDP (updated in last 60 days)
  >90%: 20 | 75–89%: 15 | 50–74%: 10 | <50%: 5

Factor 5 — High Performer Retention (0–20)
  % of engineers rated Exceeds/Significantly Exceeds retained in the last 12 months
  100%: 20 | 90–99%: 15 | 75–89%: 10 | <75%: 5

CAREER PROGRESSION INDEX = Sum of 5 factors (0–100)

THRESHOLDS:
  80–100: Strong career ecosystem — team growing with high retention
  60–79: Functional — specific gaps in coverage or velocity
  40–59: Stagnating — career investment is insufficient; retention risk is building
  <40: Crisis — flight risk from career frustration is elevated; immediate attention needed

PER-PERSON PROGRESSION PROFILE:
  Engineer | PR Score (0–50) | PR Level | Career Track | Last Career Conv | Growth Plan Active
  {{Name}} | {{score}}       | {{Ready/1Q/2-3Q/Early}} | {{IC/Mgmt/Specialist}} | {{date}} | {{Y/N}}
```

### Metric 3 — Retention Risk Profile (team-level view)

```
Source: skills/performance/retention-risk.md — 6-factor, 0–30 per person

PER-PERSON RETENTION RISK:
  Engineer | Career | Comp | Work | Mgr Rel | Team | Org | Total | Risk Level | Stage
  {{Name}} | {{0–5}} | {{0–5}} | {{0–5}} | {{0–5}} | {{0–5}} | {{0–5}} | {{0–30}} | {{Low/Mod/Elevated/High/Critical}} | {{Early/Mid/Late/-}}

RETENTION RISK DISTRIBUTION (team-level):
  Low (0–5):       {{N}} engineers
  Moderate (6–10): {{N}} engineers
  Elevated (11–16):{{N}} engineers — immediate attention queue
  High (17–22):    {{N}} engineers — flight risk active
  Critical (23–30):{{N}} engineers — late-stage; resignation possible within weeks

HIGH-RISK SIGNALS (per person at Elevated+):
  Dominant factor: {{which of the 6 factors is highest?}} → shapes the intervention
  Flight risk stage: {{Early / Mid / Late}} → shapes urgency
  Compensation root cause: only market-rate correction resolves this — no conversation substitute
  Manager relationship root cause (Factor 4 = 4–5): EM must examine own behavior first

TEAM RETENTION HEALTH:
  % of team at Low/Moderate risk: {{%}} (target: >80%)
  % of team at Elevated+: {{%}} (threshold: >20% = systemic issue)
  Average retention risk score: {{N}}/30
```

### Metric 4 — Burnout Risk Distribution

```
Source: skills/people/burnout.md — Maslach dimensions (0–9 per person)

PER-PERSON BURNOUT SCORES:
  Engineer | Exhaustion | Cynicism | Inefficacy | Total | Stage
  {{Name}} | {{0–3}}    | {{0–3}}  | {{0–3}}    | {{0–9}} | {{None/Risk/Developing/Full}}

SCORE BANDS:
  None (0–2):       {{N}} engineers
  Risk (3–4):       {{N}} engineers — monitor; reduce one stressor
  Developing (5–6): {{N}} engineers — urgent; 25–30% load reduction; weekly check-in
  Full (7–9):       {{N}} engineers — immediate; human acknowledgment + minimum viable ownership

TEAM BURNOUT HEALTH:
  % of team at None/Risk: {{%}} (target: >90%)
  % of team at Developing/Full: {{%}} (threshold: >10% = systemic workload problem)

HP BURNOUT SIGNAL (highest priority):
  High performers at Risk+: {{Names}} — HP burnout is detected late; quality holds longer
  "Speed drops before quality drops" — check HP team members for declining initiative and selective energy

STRUCTURAL CAUSES (if Developing/Full burnout present):
  Workload: {{sustained overutilization — reduce sprint capacity or headcount add}}
  Control: {{engineer lacks autonomy over how work gets done — delegation intervention}}
  Recognition: {{contributions not acknowledged — recognition log audit}}
  Relationships: {{team conflict or isolation — conflict skill invoked}}
  Fairness: {{perceived inequity — direct conversation + system review}}
  Values: {{work conflicts with personal values — career development conversation}}
```

### Metric 5 — 1:1 Signal Quality (EM discipline metric)

```
Source: skills/people/one-on-one.md — theme tracker and commitment log

This metric measures the EM's one-on-one practice quality, not the team's performance.

5 SIGNALS (0–20 each):

Signal 1 — Preparation Rate (0–20)
  % of 1:1s where EM completed the 5-minute preparation checklist
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

Signal 2 — Commitment Follow-Through (0–20)
  % of EM commitments made in 1:1s that were completed before the next session
  >90%: 20 | 75–89%: 15 | 60–74%: 10 | <60%: 5

Signal 3 — Signal Detection Breadth (0–20)
  Are signals from all 7 categories being detected across the team?
  (Engagement / Burnout / Career plateau / Flight risk / Interpersonal conflict / Promotion readiness / Structural)
  6–7 categories with evidence this quarter: 20 | 4–5: 15 | 2–3: 10 | 0–1: 5

Signal 4 — Pattern Response Rate (0–20)
  % of recurring themes (3+ sessions) that received an EM action
  100%: 20 | 80–99%: 15 | 60–79%: 10 | <60%: 5
  (Same problem mentioned 4 times without EM action = EM failure signal)

Signal 5 — Mode Appropriateness (0–20)
  Are 1:1 modes (Open/Check-in/Coaching/Career/Feedback/Performance) matched to person's current need?
  Assessed: always matching mode to stated need: 20 | Usually: 15 | Sometimes: 10 | Default mode only: 5

1:1 SIGNAL QUALITY SCORE = Sum of 5 signals (0–100)
<60: The 1:1 practice is not surfacing the information needed to manage the team effectively
```

---

## Decision Tree

```
What does the People Dashboard reveal?

├── COACHING EFFECTIVENESS <40% (TEAM LEVEL)
│   └── Do not add more coaching goals — the existing ones aren't advancing
│       Audit: Are goals observable? Is there practice opportunity? Is the approach right?
│       Identify the 2–3 people with lowest coaching effectiveness
│       skills/mentoring/coaching-style.md — style change is the first intervention

├── CAREER PROGRESSION INDEX <60
│   └── Identify the lowest factor:
│       PR distribution low → identify engineers at 25–34 (coaching window); design opportunities
│       Promotion rate low → overdue submission scan; are ready engineers being submitted?
│       Career conversations <75% coverage → schedule immediately for missing people
│       HP retention <90% → flight risk assessment for all departing HPs; exit interview learning

├── ANY ENGINEER AT ELEVATED+ RETENTION RISK (11+)
│   └── Immediate action — do not wait for next monthly review
│       Identify the dominant factor (career/comp/work/mgr/team/org)
│       Factor 4 (manager relationship) at 4–5 → EM self-examination first
│       Factor 2 (compensation) at 4–5 → market rate conversation with HR; no relationship repair substitute
│       Skills/performance/retention-risk.md — intervention protocol per factor

├── ANY ENGINEER AT DEVELOPING+ BURNOUT (5+)
│   └── Activate burnout protocol immediately — skills/people/burnout.md
│       Developing (5–6): 25–30% load reduction; on-call moved; weekly check-in 4 weeks
│       Full (7–9): human acknowledgment first; minimum viable ownership; EAP offered
│       Structural cause investigation: which of 6 root causes? Fix the system, not the person

├── HP BURNOUT SIGNAL (high performer at Risk+ stage)
│   └── HPs are detected late — act before quality drops (speed drops first)
│       Check: Is initiative declining? Is energy selective (fires up for new things, not existing ones)?
│       Reduce load by 15–20% proactively; do not wait for explicit burnout statement
│       "I'm fine" is part of the HP identity — look at behavior, not self-report

├── 1:1 SIGNAL QUALITY <60
│   └── The EM's people management practice is producing insufficient signal
│       The dashboard will be inaccurate if 1:1s aren't surfacing real information
│       Improve 1:1 preparation; change modes; address the pattern response gap

└── ALL PEOPLE SIGNALS HEALTHY
    → Monthly dashboard review still required; people signals shift faster than monthly cadence suggests
    → Quarterly: validate with skip-level conversations — does the team experience what the scores show?
    → Document: which individuals are in the high-performing, low-risk quadrant? These are the people
      most at risk of being taken for granted.
```

---

## Output

### People Dashboard Scorecard

```
PEOPLE DASHBOARD — {{Team}} — {{Date}}

COMPOSITE SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Coaching Effectiveness (team avg):  {{0–100}} | {{Strong / Healthy / Borderline / Ineffective}}
Career Progression Index:           {{0–100}} | {{Strong / Functional / Stagnating / Crisis}}
1:1 Signal Quality (EM practice):  {{0–100}} | {{Strong / Adequate / Insufficient}}

INDIVIDUAL RISK MATRIX
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer | Engagement | Burnout | Retention Risk | Coaching Eff | PR Score | Priority
{{Name}} | {{0–100}}  | {{0–9}} | {{0–30}} {{level}} | {{%}} | {{0–50}} | {{Urgent/Monitor/Healthy}}
{{Name}} | {{...}}    | {{...}} | {{...}}          | {{...}} | {{...}} | {{...}}

ATTENTION QUEUE (prioritized)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. URGENT: {{Name}} — {{primary signal: burnout 7 / retention 20 / coaching 15%}}
   Action: {{specific intervention}} by {{date}}

2. MONITOR: {{Name}} — {{secondary signal}}
   Action: {{check-in / conversation / adjustment}} by {{date}}

3. GROWING: {{Name}} — {{strength: coaching 78%, PR score 44}}
   Action: {{sponsorship / promotion case / delegation increase}}

COACHING EFFECTIVENESS DETAIL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer | Goals Tracked | Advancing | Rate  | Skill Velocity | Signal
{{Name}} | {{N}}         | {{N}}     | {{%}} | {{+/-/flat}}   | {{Strong/Healthy/Plateau/Stall}}

CAREER PROGRESSION SNAPSHOT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Promotion Readiness Distribution:
  Ready now (42–50):     {{N}} — {{Names}} → open promotion case
  One quarter (35–41):   {{N}} — {{Names}} → prepare; submit next cycle
  Two+ quarters (25–34): {{N}} — {{Names}} → coaching + growth plan
  Early stage (<25):     {{N}} — {{Names}} → IDP focus

Career conversations current (<90 days): {{N}}/{{total}} | Overdue: {{Names}}
Growth plan active: {{N}}/{{total}} | Missing: {{Names}}

BURNOUT DISTRIBUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
None (0–2):       {{N}} | Risk (3–4): {{N}} | Developing (5–6): {{N}} ⚠ | Full (7–9): {{N}} 🚨
Structural cause if Developing+: {{workload/control/recognition/relationships/fairness/values}}

RETENTION RISK DISTRIBUTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Low/Moderate: {{N}} | Elevated: {{N}} | High/Critical: {{N}}
Dominant retention factor across team: {{career/comp/work/mgr/team/org}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Engagement and burnout assessed with structured tools, not impression | Base: 70% |
| Retention risk scored per person monthly | +10% |
| Coaching effectiveness measured as rate, not satisfaction | +10% |
| 1:1 quality tracked and used to calibrate signal reliability | +10% |
| People risk scored from impression without structured assessment | −35% |
| HP burnout not actively monitored (self-report only) | −20% |
| Coaching effectiveness never measured; sessions assumed productive | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Green-washing** | All signals appear healthy; real problems surface as resignations or incidents | Validate dashboard scores against 1:1 signals and skip-level input quarterly. |
| **HP neglect** | High performers scored as low-risk because they perform well; burnout goes undetected | Actively monitor HPs for speed decline, selective energy, and initiative drop — not just output. |
| **Coaching assumptions** | Sessions are scheduled and run; effectiveness never measured | Coaching effectiveness rate is the metric. Scheduled sessions ≠ advancing skills. |
| **Crisis-only action** | Dashboard reviewed only when someone resigns or burns out | Monthly review with the attention queue. People signals are visible before they become crises. |

---

## References

- `skills/people/engagement.md` — Engagement score source
- `skills/people/burnout.md` — Burnout score source
- `skills/performance/retention-risk.md` — Retention risk score source
- `skills/performance/promotion-readiness.md` — Career progression source
- `skills/mentoring/growth-tracking.md` — Coaching effectiveness source
- `analytics/career-dashboard.md` — Career progression detail; people dashboard feeds into

## Related Skills

| Skill | Relationship |
|---|---|
| `analytics/career-dashboard.md` | Career progression index detail; people dashboard is the source |
| `analytics/organization-dashboard.md` | People-level signals aggregate into org health |
| `skills/performance/retention-risk.md` | Retention risk protocol invoked for Elevated+ cases |
| `skills/people/burnout.md` | Burnout recovery protocol invoked for Developing+ cases |
