# Skill: Coaching Score

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after 1:1 cycles

---

## Purpose

Measure the quality and impact of 1:1s and development conversations. Coaching is how an EM grows their team — without it, capability stagnates, engagement declines, and succession planning fails.

This skill answers three questions:
1. Are 1:1s focused on development, or are they status updates disguised as coaching?
2. Is the team making progress on their development goals?
3. What coaching gaps are limiting team growth?

**Invoke this skill when**: A team member's growth has plateaued, engagement is declining, before a promotion cycle, or when the EM wants to improve their coaching practice.

**Do not invoke this skill for**: Performance reviews (use `skills/people/performance-review.md`), individual capability assessment (use `skills/people/assess-capability.md`), or career path definition (use `skills/people/develop-career.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| 1:1 logs | EM notes or calendar | Last 6–8 1:1s per direct report: topics, duration, follow-ups |
| Development plan progress | Individual development plans | Status of each team member's development goals |
| Engineer feedback | 1:1s, surveys, exit interviews | 3–5 verbatim comments about coaching quality from team members |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| 1:1 topic distribution | EM notes | % of 1:1 time spent on status updates vs. development vs. personal check-in |
| Goal progression rate | Development plans | % of development goals that progressed this quarter |
| Psychological safety signals | Team surveys, 1:1 notes | Themes from team about safety in development conversations |
| Career growth velocity | Promotion / role change history | Time in current role, recent promotions, lateral moves |
| Coaching skill assessment | Peer feedback, 360 | Themes from peers and manager about coaching quality |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — 1:1 Quality Assessment
Review 1:1 logs for the last 6–8 1:1s per direct report:
- What percentage of 1:1 time is spent on development topics (skills, growth, career) vs. status updates vs. personal check-in?
- Are 1:1s agenda-driven or free-flowing?
- Does the EM ask open-ended development questions, or do they drive the conversation?
- Are there follow-up actions from each 1:1?

Calculate:
- **Development time ratio** = `(Time spent on development topics ÷ Total 1:1 time) × 100`

| Development Time Ratio | Interpretation |
|---|---|
| ≥ 50% | High. 1:1s are primarily development-focused. |
| 35–49% | Acceptable. Mix of status and development. |
| 20–34% | At Risk. 1:1s are primarily status updates. |
| < 20% | Critical. 1:1s are not serving their development purpose. |

### Step 2 — Development Plan Progress
Review each team member's development plan:
- **Goal progression rate** = `(Development goals with measurable progress this quarter ÷ Total development goals) × 100`

| Goal Progression Rate | Interpretation |
|---|---|
| ≥ 75% | High. Team is growing on plan. |
| 50–74% | Acceptable. Progress is being made but some goals are stalled. |
| 30–49% | At Risk. Most development goals are not progressing. |
| < 30% | Critical. Development plans are not being executed. |

If a goal has not progressed for 2+ consecutive quarters, classify it as stalled.

### Step 3 — Psychological Safety Assessment
Review engineer feedback for psychological safety signals:
- Do team members raise development concerns voluntarily, or only when asked?
- Do team members report feeling supported in growth attempts, or fear of failure?
- Are development conversations characterized by exploration or by EM-directed instruction?

| Safety Signal | Interpretation |
|---|---|
| Team members volunteer development concerns; conversations are exploratory | High |
| Team members respond to questions but do not self-initiate; some defensiveness | Acceptable |
| Team members avoid development topics or report fear of failure | At Risk |
| Team members report coaching as criticism or micromanagement | Critical |

### Step 4 — Career Growth Velocity
Review career progression data:
- What is the average time in current role for the team?
- How many promotions or lateral moves have occurred in the last 12 months?
- Is growth proportional to performance?

| Career Growth Velocity | Interpretation |
|---|---|
| Team members are growing into new responsibilities within 12–18 months | High |
| Growth is occasional but present | Acceptable |
| Team members are stuck in roles for > 24 months with no growth | At Risk |
| Team members are regressing or leaving due to lack of growth | Critical |

### Step 5 — Synthesize Coaching Signal
Combine development time ratio, goal progression, psychological safety, and career growth velocity into an overall coaching assessment. Weight: Development time (30%), Goal progression (30%), Psychological safety (25%), Career growth (15%).

---

## Decision Tree

Use this tree to determine the coaching classification and primary recommendation.

```
What is the development time ratio?
│
├── ≥ 50% ────────────────────────────────────────────────
│   What is the goal progression rate?
│   │
│   ├── ≥ 75% ───────────────────────────────────────────
│   │   What is the psychological safety signal?
│   │   │
│   │   ├── High
│   │   │   └── OUTCOME: Coaching is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Share your 1:1 practices with peer EMs.
│   │   │
│   │   └── Acceptable or lower
│   │       └── OUTCOME: Coaching is strong but safety is a gap.
│   │             Recommendation: In next 1:1s, practice listening
│   │             without immediately offering solutions.
│   │             Let the report lead the development topic.
│   │
│   └── < 75% ──────────────────────────────────────────
│       └── OUTCOME: Coaching time is allocated but goals are not progressing.
│             Recommendation: Review stalled development goals.
│             Are goals too ambitious? Too vague? Not supported by projects?
│             Revise goals to be achievable within the current role.
│
├── 35–49% ───────────────────────────────────────────────
│   What is the primary 1:1 content?
│   │
│   ├── STATUS UPDATE DOMINANT
│   │   └── OUTCOME: Coaching is functional but 1:1s are status meetings.
│   │             Recommendation: Block the first 15 minutes of every 1:1
│   │             for development topics only. No project status.
│   │
│   └── DEVELOPMENT + STATUS MIXED
│       └── OUTCOME: Coaching is functional with time allocation gap.
│             Recommendation: Separate status and development.
│             Use async status updates (written) and reserve 1:1 time
│             for development.
│
└── < 35% ─────────────────────────────────────────────────
    What is the primary coaching failure?
    │
    ├── 1:1S ARE STATUS MEETINGS
    │   └── OUTCOME: Coaching is broken — 1:1s are not serving their purpose.
    │         Recommendation: Redesign 1:1 format.
    │         Each 1:1 must have a development agenda item.
    │         If no development topic exists, use the time for
    │         career conversation or skill exploration.
    │
    ├── GOALS ARE NOT EXECUTING
    │   └── OUTCOME: Coaching is broken — development plans are not being acted on.
    │         Recommendation: Review each development goal with the report.
    │         Is the goal still relevant? What support is needed?
    │         If the goal is not being executed, deprioritize or replace it.
    │
    ├── SAFETY IS ABSENT
    │   └── OUTCOME: Coaching is broken — team does not feel safe to grow.
    │         Recommendation: Diagnose safety gap through anonymous survey
    │         or skip-level conversations. Do not push development
    │         until safety is restored.
    │
    └── GROWTH HAS STOPPED
        └── OUTCOME: Coaching is broken — team is not growing.
              Recommendation: Identify the growth blocker.
              Is it role stagnation? Lack of stretch projects?
              Manager not advocating for promotions?
              Address the specific blocker with the report and your manager.
```

---

## Output

Produce the following artifacts in order.

### 1. Coaching Summary (3–5 sentences)

State: overall coaching signal (strong / functional / at risk / broken), development time ratio, primary gap, and one immediate action. Include confidence level.

> **Example**: "Coaching is functional with a goal progression gap. Development time ratio is 42% — 1:1s include development topics but are mixed with status updates. Goal progression rate is 55% — 6 of 11 development goals are stalled, mostly due to lack of stretch project opportunities. Psychological safety is acceptable. The primary gap is goal-to-project translation: development goals are defined but not connected to real work. Immediate action: EM to map each stalled development goal to a project opportunity in the next planning cycle. Confidence: High (86%)."

### 2. Coaching Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Development time ratio | {{%}} | ≥ 50% = Green, 35–49% = Yellow, < 35% = Red | {{G/Y/R}} |
| Goal progression rate | {{%}} | ≥ 75% = Green, 50–74% = Yellow, < 30% = Red | {{G/Y/R}} |
| Psychological safety signal | {{signal}} | High = Green, Acceptable = Yellow, At Risk/Critical = Red | {{G/Y/R}} |
| Career growth velocity | {{signal}} | High = Green, Acceptable = Yellow, At Risk/Critical = Red | {{G/Y/R}} |

### 3. Development Plan Status

| Team Member | Goal | Status | Blocker | Next Action |
|---|---|---|---|---|
| {{Name}} | {{Goal}} | {{On track / Stalled / At risk / Not started}} | {{Blocker or None}} | {{Action and owner}} |

### 4. Root Cause (if coaching is At Risk or Broken)

- **Primary cause**: {{1:1s are status meetings / Goals not executing / Safety absent / Growth stopped}}
- **Evidence**: {{2–3 specific observations from 1:1 logs or feedback}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action with one team member}}
- **This quarter**: {{1 systemic change to coaching practice}}
- **For each stalled goal** (if applicable): {{Specific action to restart progress}}

---

## Examples

### Example A — Strong Coaching

**Inputs**
- 1:1 logs: 8 1:1s per direct report over the last quarter — average 55 minutes each. Development topics occupied 58% of time on average.
- Development plan progress: 10 of 12 goals progressed this quarter (83% rate)
- Engineer feedback: "My 1:1s are the best part of my week. I always leave with something to think about and a concrete next step."
- Psychological safety: High — team members volunteer concerns and ask for stretch assignments
- Career growth velocity: 2 promotions and 1 lateral move in the last 12 months

**Output Summary**
> Coaching is strong. Development time ratio is 58%, goal progression is 83%, psychological safety is high, and career growth is active. The team is growing, engaged, and supported. The one gap is that 1:1s for new hires (< 3 months) are slightly more status-focused (35% development time) — new hires need more structure to transition from onboarding to development. Confidence: High (95%).

---

### Example B — Coaching Broken

**Inputs**
- 1:1 logs: 6 1:1s per direct report over the last quarter — average 25 minutes each. Development topics occupied 18% of time on average.
- Development plan progress: 3 of 14 goals progressed this quarter (21% rate) — 8 goals have been stalled for 2+ quarters
- Engineer feedback: "My 1:1s are mostly status updates. When I bring up a development topic, we talk about it for 5 minutes and then move on to projects."
- Psychological safety: At Risk — 2 team members reported in exit interviews that they did not feel supported in growth attempts
- Career growth velocity: 0 promotions or lateral moves in the last 18 months; 2 voluntary departures due to lack of growth

**Output Summary**
> Coaching is broken. Development time ratio is 18% — 1:1s are primarily status updates. Goal progression is 21% — 11 of 14 development goals are stalled, many for multiple quarters. Psychological safety is at risk, and career growth has stopped. The primary cause is that 1:1s are not structured for development and development goals are not connected to real work. The team is disengaging. Confidence: High (88%).

**Recommendations**
- *This week*: EM to schedule a 1:1 with each direct report focused solely on their development goals — no project status allowed.
- *This quarter*: Restructure 1:1 format: 15 minutes development, 15 minutes status (if needed), 10 minutes personal check-in. Block 50% of 1:1 time for development.
- *Systemic*: Connect every development goal to a project or stretch assignment. Goals without projects will not progress.

---

## Confidence Score

The confidence score reflects how much to trust this coaching assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any coaching assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| 1:1 logs are contemporaneous notes, not reconstructed from memory | +5% |
| Engineer feedback is from multiple sources | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| 1:1 logs are reconstructed from memory or calendar holds only | −10% |
| Engineer feedback is from a single source | −10% |
| No development plans exist for any team member | −15% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in coaching practice |
| 70–89% | Medium | Use output; flag gaps to team in next 1:1s |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for development planning; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **1:1 log under-reporting** | EM only logs "important" 1:1s | Log is thin but team reports regular 1:1s | Require brief notes from every 1:1, not just the notable ones |
| **Development time inflation** | EM counts all 1:1 time as development time | Development time ratio is high but team reports status-heavy 1:1s | Define development topics explicitly: skills, growth, career, feedback. Status is not development. |
| **Goal existence ≠ goal execution** | Development plans exist but are not acted on | Goal progression is low despite plans being in place | Measure execution, not documentation — goals without projects are theater |
| **Safety signal blindness** | EM interprets silence as safety | No concerns raised but exit interviews reveal dissatisfaction | Use anonymous surveys or skip-levels to detect hidden safety gaps |
| **Coaching as fixing** | EM views coaching as solving team member problems | 1:1s are EM-driven and directive rather than exploratory | Coaching is asking questions, not providing answers |
| **Growth conflation** | EM equates promotions with growth | No promotions but team is growing in role depth | Growth includes scope expansion, skill depth, and influence — not just title changes |

---

## References

- `docs/principles.md` — Principle 7: *Grow the Team*; Principle 3: *Default to Transparency*
- `docs/engineering-playbook.md` → *1:1s*, *Coaching and Development*, *Career Paths*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/people/develop-career.md` — Career development planning methodology
- `skills/people/assess-capability.md` — Capability assessment methodology
- `skills/people/performance-review.md` — Performance review integration
- Whitmore — *Coaching for Performance* (2017): GROW model and coaching principles
- Google — *Project Oxygen* (2018): "Is a good coach" as a top manager behavior

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/people/develop-career.md` | Career development planning (complementary) |
| `skills/people/assess-capability.md` | Capability assessment (input to this dimension) |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `team_autonomy.md` | Closely related — coaching enables autonomy |
| `delegation_score.md` | Closely related — delegation requires capable team members |
| `decision_quality.md` | Coaching affects decision capability |
| `ownership_index.md` | Coaching develops ownership behaviors |
| `skills/people/assess-engagement.md` | Team engagement assessment (complementary) |
