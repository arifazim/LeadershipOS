# Skill: High Performer

**Domain**: Performance Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (high performer health check) + Quarterly (stretch and retention review)

---

## Purpose

Identify, protect, develop, and retain high performers — including those who are performing at an exceptional level but are invisible to the organization. High performers are the most asymmetric asset on any engineering team: they typically deliver 3–5× the output of median performers, are disproportionately likely to develop the team around them, and are the first to leave when they feel unrecognized, over-utilized, or underchallened.

**What the EM does automatically**: On a monthly cadence, the EM:
1. Identifies every engineer who is operating above their level — including those who are invisible to the organization
2. Monitors high performers specifically for burnout signals, which present differently in high performers than in others
3. Ensures stretch assignments keep pace with growing capability — a high performer in a static role will leave
4. Actively advocates for high performer visibility beyond the team
5. Detects the five performance intelligence signals: Hidden high performer / Burnout in top performers / Quiet underperformance / Flight risk / Coaching opportunity

**Ethical principle**: High performers are not a resource to extract. The EM who loads the highest-capability engineer with every difficult problem, without investing in their development, career, and recognition, is converting an asset into an attrition risk. High performance must be matched with high investment. The relationship is reciprocal: exceptional contribution deserves exceptional attention from the manager.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Performance evidence** | Observable behaviors, deliverables, and impact across the current period |
| **Team-relative assessment** | How this person's output and influence compare to their peers at the same level |
| **Engagement state** | Energy, enthusiasm, and behavioral signals from recent 1:1s |

### Optional
| Input | Description |
|---|---|
| **Cross-functional signal** | Feedback and recognition from partners outside the team |
| **Organizational visibility** | How well-known this person is to leaders above the EM |
| **Prior performance history** | Whether high performance is sustained or recently emerged |

---

## Analysis

### Step 1 — Identify Hidden High Performers

```
Hidden high performers are engineers delivering outsized value who are not recognized for it —
often because their work is invisible, their style is quiet, or the recognition system is biased
toward visibility rather than impact.

Detection pattern: High performer score by impact; low score by visibility

Hidden high performer archetypes:

Archetype 1 — The Infrastructure Invisible
  Work type: Platform, tooling, reliability, developer experience
  Why hidden: Their work has no direct user face; it multiplies others' productivity but is
              rarely attributed to anyone; incidents prevented are invisible by definition
  Detection signals:
    — Team velocity is significantly higher than the team size suggests
    — Other engineers reference them frequently when solving hard problems
    — Their absence from a sprint is immediately felt; their presence is taken for granted
    — Rarely in all-hands presentations; their work never has a product announcement
  EM action: Explicitly name the multiplier effect. Translate infrastructure impact into
             business terms. Ensure executive audiences understand what they protect.

Archetype 2 — The Quiet Contributor
  Work type: Any; the style is quiet, not the work
  Why hidden: Does not self-promote; doesn't speak first in meetings; doesn't volunteer their
              achievements; strong written delivery that no one reads unless directed to
  Detection signals:
    — 1:1s reveal extensive impact the EM was unaware of
    — Peers respect them deeply but they don't appear in calibration discussions
    — They've been at the same level for 2+ years without a promotion conversation
    — Their name doesn't come up when leadership asks "who should own X?"
  EM action: Surface their work actively. Name them in rooms they're not in. Sponsor explicitly.
             Ask them: "What are you most proud of that I haven't acknowledged?"

Archetype 3 — The Cross-Functional Lift
  Work type: Any; their impact is primarily through enabling others, not their own output
  Why hidden: Performance systems measure individual output; their multiplier effect on others
              is unmeasured and unattributed
  Detection signals:
    — Other engineers grow faster on this person's team than on other teams
    — They run the code reviews that improve everyone's quality
    — They write the design documents that save 10 engineers 2 weeks of confusion
    — Exit interviews name them as a reason people stayed
  EM action: Measure the leverage, not just the output. "This person's code reviews improved
             the team's P95 PR quality by 40% this quarter" is specific enough to survive calibration.

Archetype 4 — The Politically Invisible
  Work type: Any; they lack the organizational relationships or style that generates recognition
  Why hidden: Not in the informal information network; doesn't have lunch with the senior engineers;
              the recognition system favors those with strong informal relationships
  Detection signals:
    — Rating history below their observable impact
    — Mentioned rarely in peer feedback despite strong performance
    — Not included in informal project decisions despite obvious expertise
    — Often from an underrepresented group in engineering
  EM action: Investigate for bias in prior ratings. Create the visibility that doesn't come naturally.
             Sponsor deliberately. Document impact in calibration with specificity.
```

### Step 2 — Detect Burnout in High Performers

```
Burnout in high performers presents differently and is detected later than in average performers.

Why it's harder to detect:
  High performers sustain output quality longer under burnout — their baseline is so high that
  even a 30% degradation looks like strong performance to observers
  They often don't report it; "I'm fine" is part of their identity
  They're frequently the ones who are asked to absorb more when others struggle
  
High-performer burnout-specific signals (in order of appearance):

Early signals (6–10 weeks before collapse):
  — Quality stays high but speed drops significantly; they're working harder for the same output
  — They stop volunteering for new challenges; start finishing tasks instead of initiating
  — Less presence in team discussions where they were previously a consistent voice
  — Energy is selectively present (still engaged in the work) but absent from team rituals
  — They stop asking for feedback; they know what good looks like and are conserving energy

Mid signals (3–6 weeks before collapse):
  — Uncharacteristic errors in work that is well within their capability
  — Loss of patience: shorter responses, less explanatory in code reviews, more direct to a fault
  — They begin to rationalize reduced contribution: "That's not my problem"
  — The cynicism dimension activates: "Why are we building this anyway?"
  — 1:1 answers become shorter; less sharing; fewer questions

Late signals (1–3 weeks before collapse or attrition):
  — Output drops visibly; they're no longer compensating
  — They stop attending optional meetings entirely; start missing required ones
  — Direct statements: "I'm exhausted" or "I just need this to be over"
  — Consider: They may be simultaneously planning their exit

The high performer burnout trap:
  The EM who sees a high performer at the mid signal stage and adds a "critical project" because
  "they're the only one who can do it" will produce either medical leave or resignation within 4 weeks.
  
High performer burnout response:
  → Invoke: skills/people/burnout.md for full protocol
  Additionally: Name the pattern directly.
  "You've been delivering at a level that has protected the team through a difficult period.
  I should have caught this earlier. I'm reducing your load this sprint regardless of what's in progress.
  What other engineers can't have pulled is not your responsibility to carry forever."
```

### Step 3 — Assess the Five Detection Signals

```
The EM continuously monitors for five performance intelligence signals:

Signal 1 — Hidden high performer
  Detection: Performance score is high; organizational visibility is low
  Evidence: Their impact is observable but unattributed in calibration discussions
  Response: Active sponsorship; explicit visibility creation; translate impact to business terms
  Urgency: High — hidden high performers have elevated attrition risk (feel unvalued)

Signal 2 — Burnout in top performers
  Detection: Quality holding but speed dropping; initiative declining; cynicism language appearing
  Evidence: 1:1 energy change; pace of work slowing; selective engagement
  Response: Load reduction immediately; direct acknowledgment; → skills/people/burnout.md
  Urgency: Critical — collapse follows early signals within 4–10 weeks

Signal 3 — Quiet underperformance (separate from high performer — included here for completeness)
  Detection: Appears engaged; output is below what the role requires at their level
  Evidence: Task completion but no initiative; no impact on the team beyond their own deliverables
  Response: → skills/performance/low-performer.md
  Urgency: Medium — left unaddressed becomes a calibration and team morale problem

Signal 4 — Flight risk
  Detection: High performer disengaged from career conversations; external interest surfacing;
             motivation profile not being met by current role
  Evidence: Motivation shifts; LinkedIn active; less investment in long-horizon work
  Response: Direct retention conversation; address the specific root cause
  Urgency: Critical — high performer attrition takes 6–18 months to recover from

Signal 5 — Coaching opportunity
  Detection: High performer at ceiling of current capability; the next growth edge is identifiable
  Evidence: Consistent delivery at current level; engagement high; next challenge not yet assigned
  Response: → skills/people/coaching.md; design the stretch before they get bored
  Urgency: Medium-high — opportunity before the stagnation becomes the disengagement
```

### Step 4 — Design the High Performer Investment Plan

```
High performance requires high investment — not just high load.

The high performer investment plan:

Stretch assignment:
  The high performer must always have work at the edge of their current capability
  If all work is within comfortable mastery: they are under-challenged and will seek challenge externally
  Identify the next capability edge: "What would cause them to struggle productively this quarter?"

Organizational visibility:
  High performers need exposure above the EM's direct influence
  Minimum quarterly: one presentation, contribution, or conversation at the skip-level or above
  "I'm going to introduce you to {{executive}} at the roadmap review. Here's how I'd like you
  to represent the work."

Sponsorship beyond mentorship:
  Mentorship = advice in the room; Sponsorship = advocacy in rooms they don't enter
  "I mentioned {{name}} in the VP's team review last week and what they built for reliability."
  Track: "Have I said something about this person's work in a room they weren't in this month?"

Career investment matched to contribution:
  A high performer whose career is not moving will move themselves
  Quarterly: "Is the career path we discussed still the right one? What's changed?"
  Promotion timing: Do not hold a high performer at level longer than 6 months past demonstrated readiness

Recognition designed for the individual:
  → Invoke: skills/performance/recognition.md for individual recognition profile
  Public for those who want public; specific and private for those who don't
  Never generic ("great job"); always specific ("the architecture you designed for the notification
  service reduced our P95 latency by 65% and two engineers have cited it as their best learning
  experience of the year — that's the work I want people to know you do")

Protect their time:
  High performers are magnets for interruption: "Can you help me with...?" from teammates
  They often absorb this without complaining
  The EM's job: create structural protection — deep work blocks, meeting-free days,
                explicit "they're in a focus period" communication to the team
```

### Step 5 — Distinguish High Performance from High Visibility

```
One of the most common calibration errors: conflating high visibility with high performance.

High visibility ≠ high performance:
  The engineer who speaks most in meetings is not the highest performer
  The engineer who gets the most Slack reactions is not the highest performer
  The engineer on the product that got the biggest launch is not necessarily the highest performer

Test: Remove the visibility variable
  "If this person had done all of this work without any of the presentations, the all-hands mentions,
  and the informal relationship-building — would I still assess them the same way?"
  If yes: the performance is genuine
  If no: you're rating visibility, not performance

High performance markers (visibility-independent):
  ✓ Technical decisions made in their work that prevented incidents that didn't happen
  ✓ Junior engineers who grew specifically because of their code reviews and pairing
  ✓ Systems that run reliably without anyone thinking about them
  ✓ Cross-functional decisions that were better because they were in the room
  ✓ PRs that ship with no revisions; designs that the team builds from without re-opening

High visibility markers (performance-independent):
  ✗ Well-known name above the team level
  ✗ Strong relationships with influential people
  ✗ Frequent contributions to all-hands, tech talks, and team forums
  ✗ Good at executive communication; "lands well in the room"
  ✗ Credited for successes their team built

Both matter — but they are different skills with different development paths.
The EM who conflates them will systematically underrate hidden high performers
and overrate visible average performers.
```

---

## Decision Tree

```
What does the high performer assessment reveal?

├── HIDDEN HIGH PERFORMER DETECTED
│   └── Immediate action: Create visibility before they leave
│       This week: Name them specifically in a room above the team level
│       This month: Translate their impact into calibration-grade evidence
│       This quarter: Sponsor them for the recognition, promotion, or opportunity they've earned
│       Frame: "I haven't done enough to ensure your impact is visible. Let me fix that."

├── BURNOUT IN TOP PERFORMER DETECTED (ANY STAGE)
│   └── Stop loading immediately — the next assignment can wait
│       Mid or early stage: "Before we talk about the project — how are you holding up?"
│       Remove at minimum one significant item this sprint
│       Do not add until they have been below 85% capacity for 2+ consecutive sprints
│       → Invoke: skills/people/burnout.md for full recovery protocol

├── FLIGHT RISK DETECTED
│   └── The retention conversation is more urgent than the current sprint
│       Direct: "I want to be honest. I'm getting a sense that something has shifted for you.
│       I want to understand what's going on, and I want you to know I want you here."
│       Listen: what specifically is driving the flight risk?
│       Address the root cause, not the symptom: recognition, career, compensation, load, work type
│       → Invoke: skills/performance/retention-risk.md for full protocol

├── HIGH PERFORMER AT CAPABILITY CEILING
│   └── The next stretch is more urgent than the next sprint
│       "What's the work that would genuinely challenge you this quarter?"
│       Design the assignment before they plateau
│       If no stretch exists in the current team: create cross-team opportunity
│       → Invoke: skills/people/growth-plans.md for stretch milestone design

└── HIGH PERFORMER HEALTHY AND ENGAGED
    └── Protect what's working; invest proactively
        Monthly: check load ratio — are they absorbing more than their share?
        Quarterly: career conversation; sponsorship review
        Confirm: have I said something about this person in a room above my level this month?
```

---

## Output

### High Performer Profile and Investment Plan

```
HIGH PERFORMER PROFILE — {{Person}} — {{Level}} — {{date}}

PERFORMANCE CLASSIFICATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Performance tier: {{Top 10% | High | Emerging high}}
Operating at level: {{Below | At | Above | Significantly above}}
Archetype: {{Infrastructure Invisible | Quiet Contributor | Cross-functional Lift | Politically Invisible | None}}
Visibility score (vs. performance score): {{Aligned | Hidden (performance >> visibility)}}

FIVE SIGNAL SCAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Hidden high performer: {{Detected — action: {{specific}} | Not detected}}
Burnout signal: {{Stage: {{Early/Mid/Late/None}} — action: {{specific}}}}
Quiet underperformance: {{N/A for this profile}}
Flight risk: {{High/Medium/Low/None}} — root cause: {{if detected}}
Coaching opportunity: {{Identified — dimension: {{specific}} | Not yet}}

INVESTMENT PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Stretch assignment this quarter: {{What, scope, success signal}}
Visibility action: {{Specific presentation, introduction, or mention — by date}}
Sponsorship: {{What the EM said about them in rooms they weren't in — date}}
Career investment: {{Next level target, timeline, specific milestone}}
Load protection: {{Current load ratio: N% — action if >90%: {{specific}}}}

RECOGNITION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recognition style: {{Public | Private | Peer | Deferred}}
Last recognized: {{date}} | Content: {{Specific — not generic}}
Recognition gap: {{Y/N}} | Action: {{specific}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Hidden high performer archetypes checked | Base: 65% |
| Burnout signal scan run against HP-specific signals | +15% |
| Visibility vs. performance gap assessed | +10% |
| Flight risk assessed with root cause | +10% |
| Investment plan includes sponsorship (not just advice) | +5% |
| High visibility conflated with high performance | −30% |
| High performer loaded without burnout monitoring | −20% |
| Burnout detected but next critical project assigned | −50% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Loading the reliable** | High performer absorbs every hard problem because they deliver | Audit load ratio monthly. High performance ≠ unlimited capacity. Match investment to load. |
| **Visibility blind spot** | Rating calibration driven by who speaks most in meetings | Run the visibility-removal test. Ask: "Would I rate them the same if they had done this quietly?" |
| **Burnout missed until collapse** | High performer holds output quality through early burnout; EM doesn't notice until it drops | Monitor the speed and initiative signals, not just the output quality signal. Those decline first. |
| **Late sponsorship** | High performer leaves; EM says "They never told me they felt unrecognized" | Sponsorship is the EM's job to create, not the engineer's job to request. |
| **Promotion delay** | High performer performing at next level for 9 months; no promotion conversation | Act when the evidence is there. Delayed promotion creates resentment that doesn't fully heal. |

---

## References

- `skills/people/burnout.md` — Full burnout protocol for the burnout-in-top-performers detection
- `skills/people/engagement.md` — Flight risk protocol when high performer disengagement detected
- `skills/performance/calibration.md` — Hidden high performer evidence building for calibration
- `skills/performance/recognition.md` — Individual recognition design for high performers
- `skills/people/career-development.md` — Career investment matched to high performer trajectory

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/performance/calibration.md` | High performer evidence must survive calibration; this skill builds it |
| `skills/performance/retention-risk.md` | Flight risk in high performers triggers full retention protocol |
| `skills/people/burnout.md` | Burnout in top performers requires the full protocol with HP-specific signal awareness |
