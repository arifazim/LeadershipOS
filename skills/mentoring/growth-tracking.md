# Skill: Growth Tracking

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly skill assessment + Quarterly coaching effectiveness review + Annual trajectory review

---

## Purpose

Track skill progression with precision — not impression — so that mentoring investments are measured, growth stalls are detected early, and promotion readiness is grounded in observable behavioral evidence rather than recency bias or relationship warmth.

**What the EM does automatically**: In growth tracking, the EM:
1. Scores skills on a 1–5 progression scale using behavioral evidence, not general impression
2. Measures coaching effectiveness quarterly as a rate: (skills advancing) / (skills targeted)
3. Detects growth velocity patterns — on-track, plateauing, or regressing — and adjusts approach accordingly
4. Distinguishes leading indicators (behavior change) from lagging indicators (output quality) so problems are caught before they compound
5. Connects skill progression scores directly to promotion readiness dimensions so growth tracking produces calibration-ready evidence

**Ethical principle**: Growth tracking exists to serve the person being tracked, not to build an administrative record. Scores that are recorded but never discussed with the person are surveillance, not development. Every score must be shareable and discussable. If the EM would not show the score to the person: the score is wrong, or the conversation hasn't happened yet.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Mentoring agreement goals** | The 3–5 goals from `skills/mentoring/mentor-plan.md` — growth tracking anchors to these |
| **Skill dimension targets** | Which of the five promotion readiness dimensions are being developed |
| **Behavioral observations** | Specific, dated instances of the person applying (or not applying) the target skill in real work |

### Optional
| Input | Description |
|---|---|
| **Prior skill scores** | Previous month's scores — required for velocity calculation |
| **Peer observations** | What teammates observe in real work (code reviews, design discussions, cross-team interactions) |
| **Promotion readiness assessment** | From `skills/performance/promotion-readiness.md` — growth tracking feeds this directly |

---

## Analysis

### Step 1 — Score Skill Progression (1–5 Scale)

```
Skill progression is not binary. It moves through five stages, each with
distinct behavioral indicators. The score is assigned based on what the person
actually does in real work — not what they know or what they say.

SKILL PROGRESSION SCALE

Level 1 — AWARENESS
  Knows the concept; understands the theory; cannot apply independently
  Behavioral signal: Can explain the skill; does not demonstrate it under pressure
  Typical indicators: "I know I should do X" but doesn't; needs explicit prompt each time
  Not a failure — this is where most learning starts

Level 2 — DEVELOPING
  Applies the skill with guidance or preparation; makes predictable mistakes
  Behavioral signal: Applies skill in low-stakes situations; hesitates in high-stakes ones
  Typical indicators: Good in pair situations; execution degrades in novel situations
  Common for 3–9 months depending on complexity

Level 3 — COMPETENT
  Applies the skill reliably in normal situations; can explain what they did and why
  Behavioral signal: Consistent execution; recovers quickly when something goes wrong
  Typical indicators: Peers trust their judgment in this area; EM's supervision decreasing
  This is the "meets expectation" baseline for most skills at level

Level 4 — PROFICIENT
  Adapts the skill to novel situations; teaches it effectively to others
  Behavioral signal: Handles edge cases without guidance; others come to them with questions
  Typical indicators: Code reviews improve others' understanding; architects for future flexibility
  Marks the transition from doing to enabling

Level 5 — EXPERT
  Defines what good looks like; advances the practice beyond current team standard
  Behavioral signal: Changes how the team operates in this area; attracts cross-functional attention
  Typical indicators: External recognition; sets patterns others follow; EM learns from them
  Relatively rare — a team has one or two Level 5s per domain, not many

Scoring rules:
  Score based on the lowest consistent level — not peak performance
  "They've done it once at Level 4" is a Level 3 with a strong data point, not a Level 4
  Require 3+ observed instances at a level before assigning that level
  Score each skill independently — halo effect between skills is a bias

Skills to track per promotion readiness dimension:
  Technical Execution: [list 2–3 observable technical skills for this engineer's level]
  Scope and Ownership: [initiative-taking, proactive blocker identification, ownership extension]
  Communication: [audience calibration, async quality, cross-functional clarity]
  Leadership/Influence: [mentorship given, practices shaped, cross-team influence]
  Delivery Impact: [measurable outcomes driven, not just tasks completed]
```

### Step 2 — Calculate Growth Velocity

```
Growth velocity measures the rate of progression per skill per month.
It distinguishes stalls from normal learning curves and detects when the approach needs to change.

Velocity calculation (monthly):

  For each tracked skill:
  Current score − Prior score = velocity for this period

  Velocity interpretation:
    +1 or more per quarter: Fast progression — verify this is sustainable and not
                             at the cost of other skills
    +0.5 per quarter: Normal progression — healthy development cadence
    0 for 2 months: Plateau — investigate; do not assume the approach is correct
    0 for 3+ months: Stall — change something; same approach will produce same result
    −0.5 or below: Regression — urgent; identify root cause before next session

Velocity benchmarks by skill complexity:
  Foundational technical skills (basic debugging, code review basics): 2–4 months to Level 3
  Complex technical skills (system design, architecture): 9–18 months to Level 3
  Leadership skills (influence without authority, cross-team navigation): 12–24 months to Level 3
  Communication skills (executive-level clarity, written precision): 6–12 months to Level 3

Plateau investigation checklist:
  Is the goal observable enough? ("better at communication" can't be scored)
  Is there practice opportunity? (Can they actually exercise this skill in current work?)
  Is there feedback density? (Are they getting signals often enough to adjust?)
  Is the approach right? (Expert-sharing where guided discovery is needed → skills/mentoring/coaching-style.md)
  Is there a hidden blocker? (Anxiety, organizational dynamics, capability vs. motivation gap)

Regression investigation (more urgent than plateau):
  Has something changed in the work environment? (Team change, new stakeholder, scope reduction)
  Is there a burnout signal? (skills/people/burnout.md — degradation in quality often precedes)
  Is this person being set up to fail? (Expectations outpacing support)
```

### Step 3 — Measure Coaching Effectiveness

```
Coaching effectiveness measures whether the mentoring investment is producing
behavioral change at the expected rate.

Coaching effectiveness rate (quarterly):

  For each active mentoring goal:
    Is there specific behavioral evidence of advancement in real work? YES = 1 / NO = 0

  Effectiveness rate = (Goals with behavioral evidence) / (Total active goals)

Interpretation:
  >70%: High effectiveness — goals may be too easy; raise the bar
  40–70%: Healthy — maintain approach; continue monitoring velocity
  20–39%: Borderline — something is not working; identify and change it
  <20%: Ineffective — stop and investigate before continuing sessions

What coaching effectiveness is NOT:
  — It is not "the sessions felt productive" (subjective, unreliable)
  — It is not "the mentee is happy with the relationship" (satisfaction ≠ growth)
  — It is not "we covered a lot of good material" (coverage ≠ application)
  — It is not "the mentee seems to understand" (understanding ≠ behavior change)

Coaching effectiveness root cause analysis (when <40%):

  WRONG APPROACH
    Symptom: Good sessions; no change in work behavior
    Check: Is the mentor sharing answers when the mentee needs to discover?
    Fix: Shift to Socratic mode (skills/mentoring/coaching-style.md)

  WRONG GOALS
    Symptom: Can't assess goal progress because the goal isn't observable
    Check: Can I point to a specific behavior that would demonstrate this goal?
    Fix: Rewrite goals using observable behavior + context + standard format

  INSUFFICIENT PRACTICE OPPORTUNITY
    Symptom: Mentee understands but work context doesn't allow practice
    Check: Does their current role provide the experience required to build this skill?
    Fix: Create a stretch assignment; adjust scope; design deliberate practice (skills/mentoring/delegation.md)

  BETWEEN-SESSION APPLICATION FAILURE
    Symptom: Insights from sessions don't translate to work
    Check: Are between-session commitments being tracked?
    Fix: One specific commitment per session with success definition (skills/mentoring/mentee-plan.md)

  WRONG MENTOR
    Symptom: Persistent <20% effectiveness despite approach changes
    Check: Does this mentor have direct experience with this specific skill gap?
    Fix: Facilitate handoff to domain-expert mentor; this is not a failure — it's optimization
```

### Step 4 — Connect Growth Tracking to Promotion Readiness

```
Growth tracking is not an independent activity — it feeds calibration-ready evidence
into the promotion readiness assessment.

Mapping skill scores to promotion readiness dimensions:

  TECHNICAL EXECUTION dimension
    Score = weighted average of technical skill scores tracked this cycle
    Calibration evidence: "In [month], their design for [system] demonstrated Level [N] proficiency.
    Specific: [behavior observed]. This maps to [Exceeds/Meets/Developing] at their level."

  SCOPE AND OWNERSHIP dimension
    Score = ownership initiative scores + proactive communication scores
    Calibration evidence: "They identified [blocker/risk] independently in [context] before it was raised.
    This is a consistent pattern in [month list] — not a single instance."

  COMMUNICATION dimension
    Score = audience calibration + async quality + cross-functional clarity scores
    Calibration evidence: "In [forum], they translated [technical concept] into [impact statement]
    without losing accuracy. This is Level [N] on the communication rubric."

  LEADERSHIP/INFLUENCE dimension
    Score = mentorship given + practices shaped + cross-team influence
    Calibration evidence: "Three engineers on the team showed [skill improvement] after [their] coaching.
    The behavioral change is observable in [their] code review patterns."

  TRACK RECORD dimension
    Score = sustained demonstration duration across all dimensions
    Score = weeks of consistent behavior at target level / 13 weeks (one quarter)
    This is the hardest dimension to fake and the most reliable predictor of promotion success.

Evidence quality standard for calibration:
  Specific instance: "In [context], they demonstrated [behavior] that resulted in [outcome]."
  Not: "They've been doing really well overall."
  Each growth tracking entry should be usable as a calibration brief data point.
```

### Step 5 — Detect and Respond to Growth Signals

```
Growth tracking produces leading and lagging indicators. Act on leading indicators;
lagging indicators confirm what leading indicators already showed.

LEADING INDICATORS (catch problems 4–8 weeks early):
  — Session preparation quality declining: mentee arriving less prepared
  — Between-session follow-through rate dropping below 60%
  — Mentee re-asking questions already answered in prior sessions
  — Energy or enthusiasm visible declining
  — Dependency increasing (more questions, not fewer)

LAGGING INDICATORS (confirm what leading indicators showed):
  — Skill score stagnation for 2+ months
  — Coaching effectiveness rate below 40% for a quarter
  — No observable behavioral change in real work
  — Promotion readiness score not advancing despite active mentoring

Growth signal response framework:

  ACCELERATING (velocity +1+ per quarter, effectiveness >70%):
    Increase scope of goals
    Introduce next-level challenges earlier
    Reduce support frequency — independence is the goal
    Consider: is this person ready for a stretch assignment or promotion conversation?

  ON TRACK (velocity +0.5 per quarter, effectiveness 40–70%):
    Continue; no intervention needed
    Monthly confirmation that goals are still calibrated to actual development gaps

  PLATEAU (velocity 0 for 2 months):
    Change something before the third month — same approach produces same result
    First intervention: change the practice opportunity (not the approach)
    Second intervention: change the mentoring approach (skills/mentoring/coaching-style.md)
    Third intervention: question whether this is the right goal for this period

  REGRESSION (velocity negative):
    Urgent — identify root cause within 2 weeks, not at the next monthly review
    Check: External change (role, team, stakeholder) / Burnout signal / Expectation overload
    Pause growth goals if burnout is present; skills/people/burnout.md takes priority
```

---

## Decision Tree

```
What does the growth tracking assessment reveal?

├── SKILL SCORE CANNOT BE ASSIGNED (goal not observable)
│   └── Stop. Rewrite the goal before attempting to score.
│       "Improve communication" → "Can calibrate message complexity to VP vs. engineer audience
│       in real conversations without requiring EM pre-review"
│       Observable goals produce scorable assessments; vague goals produce impressions

├── VELOCITY = 0 FOR 2 MONTHS (plateau)
│   └── Change something before month 3
│       First: Check practice opportunity — does the role allow this skill to be exercised?
│       Second: Change approach (skills/mentoring/coaching-style.md)
│       Third: Question whether this goal is right for this period
│       Do NOT continue the same approach and expect different results

├── COACHING EFFECTIVENESS <40% (quarterly)
│   └── Root cause investigation before next session:
│       Wrong approach → switch mode
│       Wrong goals → rewrite with observable behavior
│       No practice opportunity → create deliberate practice via delegation
│       No between-session application → skills/mentoring/mentee-plan.md
│       Wrong mentor → facilitate handoff

├── LEADING INDICATORS DECLINING (preparation quality, follow-through, energy)
│   └── Do not wait for lagging indicators
│       Surface the pattern directly: "I've noticed [specific observation]. What's happening?"
│       Burnout check: skills/people/burnout.md if energy signal is present
│       Act within 2 weeks of pattern detection, not at month-end review

├── SKILL SCORES ADVANCING TOWARD PROMOTION THRESHOLD
│   └── Connect to promotion readiness tracker (skills/performance/promotion-readiness.md)
│       Map growth tracking scores to promotion dimensions
│       Build calibration-ready evidence: specific instance + context + impact for each dimension
│       Begin pre-calibration visibility building if person is invisible to the calibration group

├── REGRESSION DETECTED
│   └── Pause growth goals
│       Identify root cause: external change / burnout / expectation overload / role mismatch
│       If burnout: skills/people/burnout.md is primary; growth tracking is secondary
│       Address root cause before resuming growth agenda

└── ALL SKILLS AT LEVEL 3+ FOR TARGET LEVEL
    └── Assessment: Is this person operating above their current level?
        If yes: Begin promotion readiness case (skills/performance/promotion-readiness.md)
        If not yet submitted: flight risk signal (skills/performance/retention-risk.md)
```

---

## Output

### Growth Tracking Dashboard

```
GROWTH TRACKING — {{Name}} — {{Level}} — {{Date}}

SKILL PROGRESSION SCORES (1–5)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Skill                     | M-3   | M-2   | M-1   | Current | Velocity | Signal
{{Technical skill 1}}     | {{N}} | {{N}} | {{N}} | {{N}}   | {{±}}   | {{On track/Plateau/Stall}}
{{Technical skill 2}}     | {{N}} | {{N}} | {{N}} | {{N}}   | {{±}}   | {{...}}
{{Scope/ownership skill}} | {{N}} | {{N}} | {{N}} | {{N}}   | {{±}}   | {{...}}
{{Communication skill}}   | {{N}} | {{N}} | {{N}} | {{N}}   | {{±}}   | {{...}}
{{Leadership skill}}      | {{N}} | {{N}} | {{N}} | {{N}}   | {{±}}   | {{...}}

COACHING EFFECTIVENESS (Quarterly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q{{N}}: Goals advancing: {{N}}/{{total}} = {{%}} | {{High/Healthy/Borderline/Ineffective}}
Root cause if <40%: {{Wrong approach / Wrong goals / No practice / No application / Wrong mentor}}
Approach change made: {{Y/N}} — What changed: {{specific}}

LEADING INDICATOR ALERTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Session preparation quality: {{Declining / Stable / Strong}}
Between-session follow-through: {{%}} | Threshold: 60%
Re-asking answered questions: {{Y/N}} | Frequency: {{N times in last 30 days}}
Energy signal: {{Normal / Declining — check burnout}}
Dependency trend: {{Decreasing (healthy) / Stable / Increasing — address}}

PROMOTION READINESS LINKAGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical dimension: Skill avg = {{N}} | PR score contribution: {{N}}/10
Scope dimension: Skill avg = {{N}} | PR score contribution: {{N}}/10
Communication dimension: Skill avg = {{N}} | PR score contribution: {{N}}/10
Leadership dimension: Skill avg = {{N}} | PR score contribution: {{N}}/10
Track record: Weeks at target level = {{N}} | PR score contribution: {{N}}/10
Ready to open promotion case: {{Y | N — gap: specific dimension and score}}

CALIBRATION-READY EVIDENCE (per dimension)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Technical: "In {{context}}, they demonstrated {{behavior}} — Level {{N}} evidence."
Scope: "In {{context}}, they demonstrated {{behavior}} — Level {{N}} evidence."
Communication: "In {{context}}, they demonstrated {{behavior}} — Level {{N}} evidence."
Leadership: "In {{context}}, they demonstrated {{behavior}} — Level {{N}} evidence."
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Skills scored on observable behavior, not impression | Base: 65% |
| Velocity tracked monthly with prior-score comparison | +15% |
| Coaching effectiveness calculated quarterly as a rate | +10% |
| Scores connected to promotion readiness dimensions | +10% |
| Calibration-ready evidence documented per dimension | +5% |
| Skills scored from impression without behavioral evidence | −30% |
| No velocity calculation; single-point snapshots only | −15% |
| Growth tracking never shared with or discussed with the person | −25% |
| No connection to promotion readiness or calibration process | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Impression scoring** | "They're doing well" scored as Level 4 without behavioral instances | Require 3 specific, dated behavioral observations per level assignment before scoring. |
| **Tracking without sharing** | Scores exist in a spreadsheet the person never sees | Share scores in every monthly growth conversation. If you won't show it, the score is wrong. |
| **Plateau tolerance** | Same skill score for 3+ months; no approach change | Treat plateau as a system failure — something must change: goal, approach, practice opportunity, or mentor. |
| **Velocity without direction** | Skills advancing but not toward promotion readiness | Map every tracked skill to a promotion readiness dimension. Advancing in the wrong direction is not progress. |
| **Lagging-only detection** | Problems identified only after output quality drops | Monitor leading indicators monthly: preparation quality, follow-through rate, energy signal. |

---

## References

- `skills/mentoring/mentor-plan.md` — Mentoring goals are the source of growth tracking targets
- `skills/mentoring/mentee-plan.md` — Monthly self-assessment data feeds growth tracking
- `skills/mentoring/coaching-style.md` — Approach change is the first intervention when velocity stalls
- `skills/mentoring/delegation.md` — Deliberate practice created through delegation feeds skill progression
- `skills/performance/promotion-readiness.md` — Growth tracking scores feed promotion readiness directly
- `skills/performance/calibration.md` — Calibration-ready evidence built here; used in calibration session

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/mentor-plan.md` | Mentoring agreement goals are the tracking targets; effectiveness feeds back to mentor plan |
| `skills/performance/promotion-readiness.md` | Growth scores map directly to promotion readiness dimensions |
| `skills/performance/calibration.md` | Behavioral evidence logged here is usable in calibration sessions |
| `skills/mentoring/coaching-style.md` | When velocity stalls, style shift is the first intervention |
| `skills/people/burnout.md` | Regression in skill scores may signal burnout — cross-check before adjusting growth targets |
