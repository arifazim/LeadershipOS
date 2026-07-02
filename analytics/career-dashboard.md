# Dashboard: Career Dashboard

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (for team conversations) + HR partner + skip-level
**Cadence**: Quarterly refresh; updated immediately after calibration or promotion decision

---

## Purpose

Give the EM a single view of every direct report's career momentum — promotion readiness, growth velocity, aspiration alignment, and the risk that career stagnation is driving attrition — so that career development is managed proactively rather than reactively after someone hands in their notice.

**Primary questions this dashboard answers:**
- Who is ready for promotion and hasn't been submitted?
- Whose career growth has stalled, and what is causing the plateau?
- Is the team's career trajectory healthy enough to retain high performers for the next 12–18 months?

---

## Inputs

| Source | Metric Fed |
|---|---|
| `skills/performance/promotion-readiness-tracking.md` (0–50) | Career Progression Index |
| `skills/mentoring/growth-tracking.md` (skill velocity) | Growth Velocity Component |
| `skills/people/career-development.md` (aspiration mapping) | Aspiration Alignment Component |
| `skills/performance/calibration.md` (calibration outcomes) | Calibration Accuracy Component |
| `skills/performance/retention-risk.md` (Factor 1 — career) | Career-Driven Retention Risk |
| `skills/performance/recognition.md` (recognition patterns) | Visibility Component |

---

## Analysis

### Metric 1 — Career Progression Index (0–100)

```
The Career Progression Index measures how effectively the team is moving toward
the career goals its members have stated.

5 COMPONENTS (0–20 each):

COMPONENT 1 — PROMOTION READINESS DISTRIBUTION (0–20)
  Promotion readiness composite scores (0–50) across the team

  Distribution target (for a healthy team):
    Ready now (42–50):        10–20% of team — submission pipeline active
    One quarter away (35–41): 20–30% of team — preparation underway
    Two to three quarters (25–34): 30–40% of team — development investment
    Early stage (<25):        20–30% of team — foundational growth phase

  Score:
    % at 35+: >50% of team: 20 | 35–49%: 15 | 20–34%: 10 | <20%: 5

COMPONENT 2 — PROMOTION VELOCITY (0–20)
  Promotions completed in last 12 months / engineers who were eligible (score ≥42) at any point

  >80% promoted: 20 | 60–79%: 15 | 40–59%: 10 | <40%: 5

  Overdue submission flag:
    Any engineer at readiness 42+ for 2+ quarters without submitted case → flag immediately
    This is both a career failure and a retention risk escalator

COMPONENT 3 — ASPIRATION ALIGNMENT (0–20)
  % of team whose current role, growth trajectory, and assigned work aligns with their stated
  career aspiration (from skills/people/career-development.md — 1-year / 3-year / 5-year horizons)

  Full alignment (track + work + growth): 20 per person
  Partial alignment (track matches; specific gaps): 12 per person
  Misalignment (on wrong track; ceiling hit; aspirations unstated): 5 per person
  Score = weighted average across team

  Track types:
    IC growth track: technical depth + scope increase
    Management track: people and system ownership
    Specialist track: domain expertise deepening
    Pivot track: deliberate career direction change

COMPONENT 4 — GROWTH PLAN COVERAGE AND QUALITY (0–20)
  Coverage: % of team with an active IDP (updated in last 60 days): 0–10
    >90%: 10 | 70–89%: 7 | 50–69%: 4 | <50%: 2

  Quality: % of IDPs with 70-20-10 balance and specific, time-bounded milestones: 0–10
    >80% of IDPs are quality: 10 | 60–79%: 7 | 40–59%: 4 | <40%: 2

COMPONENT 5 — HARD BLOCKER SCAN (0–20)
  Promotion readiness hard blockers (any dimension ≤2) across the team
  Zero engineers with hard blockers: 20
  1–2 with blockers and active development plans: 15
  3+ with blockers; no active plans: 5
  Any engineer at score 42+ with a hard blocker (suppressed submission): 0

CAREER PROGRESSION INDEX = Sum of 5 components (0–100)

THRESHOLDS:
  80–100: Strong — career ecosystem is producing promotions at appropriate velocity
  60–79: Functional — specific gaps; promotion pipeline or IDP quality needs attention
  40–59: Stagnating — career development investment is insufficient; retention risk is building
  <40: Critical — career frustration is a primary flight risk driver; immediate intervention needed
```

### Metric 2 — Growth Velocity Profile (per person)

```
Source: skills/mentoring/growth-tracking.md — skill progression scores over time

For each direct report, track skill velocity across the 5 promotion readiness dimensions:

GROWTH VELOCITY SCORES (per person):
  Dimension        | M-3 Score | M-2 Score | M-1 Score | Current | Velocity | Signal
  Technical        | {{N}}     | {{N}}     | {{N}}     | {{N}}   | {{+/-}}  | {{Advancing/Plateau/Stall/Regressing}}
  Scope/Ownership  | {{N}}     | {{N}}     | {{N}}     | {{N}}   | {{+/-}}  | {{...}}
  Communication    | {{N}}     | {{N}}     | {{N}}     | {{N}}   | {{+/-}}  | {{...}}
  Leadership       | {{N}}     | {{N}}     | {{N}}     | {{N}}   | {{+/-}}  | {{...}}
  Track Record     | {{N}}     | {{N}}     | {{N}}     | {{N}}   | {{+/-}}  | {{...}}

GROWTH VELOCITY PATTERNS AND INTERPRETATIONS:

Accelerating (all dimensions +0.5+ per quarter):
  Interpretation: Healthy growth; correct approach; consider raising the bar
  Action: Expand scope; increase delegation level; advance promotion timeline if at 35+

Plateau (one or more dimensions at 0 for 2+ months):
  Interpretation: Wrong approach, wrong practice opportunity, or hidden blocker
  Action: Change something before month 3; skills/mentoring/coaching-style.md first

Selective growth (strong in some dimensions; stagnant in others):
  Interpretation: Common pattern; natural strengths + growth gaps
  Action: Ensure the stagnant dimension is the development focus this quarter

Regressing (any dimension negative):
  Interpretation: Environmental change, burnout, overload, or wrong role
  Action: Investigate root cause within 2 weeks; do not adjust growth goals until root cause found

Ceiling pattern (3+ quarters at same score despite active coaching):
  Interpretation: May be at optimal level for this person's aspiration
  Action: Honest career conversation: "Is this the right track? Is this the right growth goal?"
```

### Metric 3 — Calibration Accuracy (team-level signal)

```
Source: skills/performance/calibration.md outcomes vs. EM original assessments

Calibration accuracy measures the gap between what the EM assessed and what calibration produced.
High divergence signals either EM bias or insufficient evidence quality.

CALIBRATION DIVERGENCE (per engineer, per cycle):
  EM assessment | Calibration outcome | Direction | Interpretation
  Exceeds       | Meets               | Downward  | EM over-assessed; bias check needed
  Meets         | Exceeds             | Upward    | EM under-assessed; visibility gap
  Developing    | Meets               | Upward    | Calibration group raised; EM may be too hard
  Meets         | Developing          | Downward  | Calibration group lowered; EM may be too lenient

CALIBRATION ACCURACY SCORE (0–30 per cycle; +2 for match / +1 for adjacent / 0 for 2+ levels off):
  Sum of calibration accuracy scores / (N engineers × 2) × 100 = accuracy %

THRESHOLDS:
  >90% accuracy: EM's assessments align with calibration group; strong evidence quality
  75–89%: Minor divergence; review specific cases for bias
  60–74%: Significant divergence; bias checklist required before next cycle
  <60%: Systemic assessment problem; EM must examine assessment methodology

HIDDEN HIGH PERFORMER FLAG:
  Any upward calibration (EM rated lower than calibration result): investigate visibility gap
  Was the person invisible to the calibration group before the session?
  Was sponsorship active? → skills/performance/calibration.md challenge preparation

SYSTEMATIC BIAS SIGNAL:
  If all divergences are in one direction (all downward or all upward): systematic bias
  Apply the six-bias checklist before next cycle; identify the specific bias pattern
```

### Metric 4 — Career-Driven Retention Risk

```
Source: skills/performance/retention-risk.md — Factor 1 (Career Trajectory, 0–5)

CAREER FACTOR DISTRIBUTION:
  Factor 1 (career trajectory) score per person:
  0–1 (no career risk):     {{N}} engineers
  2 (low risk):             {{N}} engineers
  3 (moderate risk):        {{N}} engineers — stay interview this quarter
  4 (elevated career risk): {{N}} engineers — urgent conversation this month
  5 (critical career risk): {{N}} engineers — retention is at risk; immediate action

CAREER-DRIVEN RETENTION RISK SIGNALS:
  Engineer at Factor 1 = 4–5 AND Promotion Readiness ≥42 → overdue submission driving attrition
  Engineer at Factor 1 = 4–5 AND no active growth plan → career investment absence = departure signal
  Engineer at Factor 1 = 4–5 AND aspiration misalignment → wrong track; honest ceiling conversation

INTERVENTION MATCHING (career factor ≥4):
  Cause: Overdue promotion → open the case; if blocked, name the specific gap
  Cause: Growth stagnation → redesign the IDP; change the coaching approach
  Cause: Wrong track → honest career conversation; explore internal mobility
  Cause: Structural ceiling → name what can't be delivered; discuss external paths honestly
```

---

## Decision Tree

```
What does the Career Dashboard reveal?

├── CAREER PROGRESSION INDEX <60
│   └── Identify the lowest component:
│       Promotion velocity low → overdue submission scan; submit eligible engineers immediately
│       Aspiration misalignment high → career conversations for misaligned engineers this month
│       Growth plan coverage <75% → schedule IDP reviews for missing people this week
│       Hard blockers present without plans → design specific development opportunities per blocker

├── ENGINEER AT READINESS ≥42 FOR 2+ QUARTERS WITHOUT SUBMISSION
│   └── This is overdue — act immediately
│       If submission is blocked: name the specific gap and development milestone
│       If submission is ready: open the case before next calibration cycle
│       This is also a flight risk signal: career Factor 1 likely at 4–5

├── GROWTH VELOCITY PLATEAU (0 for 2+ months, any dimension)
│   └── Change the approach before month 3
│       First: Is there practice opportunity? (Does the role allow this skill to be used?)
│       Second: Change the coaching approach — skills/mentoring/coaching-style.md
│       Third: Is this the right goal? Is this the right track?

├── CALIBRATION DIVERGENCE >25% (EM assessments significantly off)
│   └── Apply six-bias checklist before next submission
│       If all divergences are upward → visibility gap; sponsorship investment needed
│       If all divergences are downward → EM over-assesses; harder calibration standard
│       If mixed → case-by-case bias review; identify which bias per engineer

├── CAREER FACTOR 1 ≥4 (elevated career-driven retention risk)
│   └── Career retention conversation this month — not next quarter
│       Map the root cause: overdue promotion / growth stagnation / wrong track / ceiling
│       Honest ceiling conversation if internal path is limited:
│       "The role you're describing doesn't exist here in the timeframe you're thinking about.
│        Here's what I can offer; here's what I can't."
│       False hope is more damaging to trust than an honest constraint

└── ALL CAREER SIGNALS HEALTHY
    → Quarterly review: is aspiration map still accurate? People change what they want.
    → Annual: has the talent pipeline been deliberately designed, or is it an accident of who joined?
    → HP career investment: the engineers most likely to be taken for granted are the ones who
      appear to be thriving — check in on them too.
```

---

## Output

### Career Dashboard Scorecard

```
CAREER DASHBOARD — {{Team}} — {{Date}}

COMPOSITE SCORES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Career Progression Index: {{0–100}} | {{Strong / Functional / Stagnating / Critical}}
Calibration Accuracy:     {{%}} | {{Strong / Minor divergence / Significant / Systemic}}

PROMOTION PIPELINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer     | Level | PR Score | PR Stage          | Hard Blocker | Status              | Action
{{Name}}     | {{L}} | {{0–50}} | {{Ready/1Q/2-3Q}} | {{Y/N dim}} | {{Submit/Prepare/Dev}} | {{specific}}
⚠ Overdue:  {{Names at 42+ for 2+ quarters not submitted}}

ASPIRATION ALIGNMENT MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer | Track           | 1-Year Goal               | Alignment | Last Career Conv | Action
{{Name}} | {{IC/Mgmt/Spec}} | {{specific aspiration}}   | {{Full/Partial/Misaligned}} | {{date}} | {{...}}

GROWTH VELOCITY SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer | Overall Velocity | Slowest Dimension | Signal   | Intervention
{{Name}} | {{+/-/flat}}     | {{dimension}}     | {{Adv/Plateau/Stall/Reg}} | {{action}}

CAREER-DRIVEN RETENTION RISK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer | Career Factor (0–5) | Root Cause                    | Intervention
{{Name}} | {{N}}               | {{Overdue promo/Stagnation/Track}} | {{specific action by date}}

IDP COVERAGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Active IDPs: {{N}}/{{total}} | Quality IDPs (70-20-10 balanced): {{N}}/{{total}}
Missing: {{Names}} | Stale (>60 days): {{Names}} → refresh this week

CALIBRATION ACCURACY (last cycle)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
EM vs. Calibration divergences: {{N}} | Direction: {{Upward/Downward/Mixed}}
Systematic bias signal: {{Y/N}} | Bias type if Y: {{which bias}}
Hidden HP flag: {{Names where upward divergence occurred}} → sponsorship gap
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Promotion readiness scores computed with behavioral evidence | Base: 65% |
| Aspiration mapping updated within 90 days per engineer | +15% |
| Calibration accuracy tracked across 2+ cycles | +10% |
| Career conversations held on a quarterly cadence | +10% |
| Promotion readiness scored from impression, not evidence | −30% |
| Aspiration map never built or not updated | −20% |
| Overdue submissions not tracked; eligible engineers not submitted | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Promotion by surprise** | Engineers promoted or not promoted without prior signals; surprises in both directions | PR scores updated quarterly; career conversations quarterly; no calibration surprise. |
| **Aspiration drift** | Aspiration map built once; never updated; EM operates on stale career data | Revalidate aspiration in every quarterly career conversation. People change what they want. |
| **Overdue submission accumulation** | Engineers at readiness 42+ for multiple quarters; not submitted; frustration builds | Monthly overdue submission scan. Every engineer at 42+ without an open case is a risk. |
| **False ceiling** | EM says "the role doesn't exist here" when it might; doesn't explore internal mobility | Before naming a ceiling, verify: is there an internal path? Is there a timeline? Name the real constraint. |

---

## References

- `skills/performance/promotion-readiness-tracking.md` — Career progression source
- `skills/people/career-development.md` — Aspiration mapping source
- `skills/mentoring/growth-tracking.md` — Growth velocity source
- `skills/performance/calibration.md` — Calibration accuracy source
- `analytics/people-dashboard.md` — Career progression is one component of the people dashboard

## Related Skills

| Skill | Relationship |
|---|---|
| `analytics/people-dashboard.md` | Career progression index feeds the people dashboard; career dashboard provides the detail |
| `skills/performance/promotion-readiness-tracking.md` | The primary data source for the promotion pipeline |
| `skills/people/career-development.md` | Aspiration map and track identification |
| `skills/performance/calibration.md` | Calibration accuracy tracks EM assessment quality |
