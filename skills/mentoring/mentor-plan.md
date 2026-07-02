# Skill: Mentor Plan

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Relationship design at start + Monthly check-in + Quarterly effectiveness review

---

## Purpose

Design and sustain a mentoring relationship that produces measurable skill growth — not just scheduled conversations. The mentor plan distinguishes mentoring from managing and coaching, establishes a structured agreement, tracks effectiveness, and evolves as the mentee grows.

**What the EM does automatically**: In the mentor role, the EM:
1. Establishes a mentoring agreement with explicit goals, cadence, and success criteria before the first session
2. Tracks skill progression and coaching effectiveness quarterly — not by impression, but by observable behavioral change
3. Distinguishes when to mentor (knowledge transfer), coach (guided discovery), or manage (accountability) — and signals clearly which mode is active
4. Monitors for mentoring relationship failure modes: dependency, over-investment, or stagnation
5. Connects mentee growth directly to promotion readiness and career trajectory

**Ethical principle**: Mentoring is an investment in the mentee's future, not the mentor's legacy. A mentoring relationship that produces a dependent mentee who cannot function without guidance has failed — regardless of how close the relationship became. The test of effective mentoring is whether the mentee grows toward independence, not whether the mentee continues to need the mentor.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Mentee's stated goals** | What the mentee wants from this relationship — specific and time-bounded |
| **Mentee's current level and trajectory** | Where they are now; where they want to be; timeline |
| **EM's assessment of the gap** | The actual skill or career gap to be addressed, from the EM's observation |

### Optional
| Input | Description |
|---|---|
| **Mentee's prior mentoring history** | What has worked or failed in previous mentoring relationships |
| **Promotion readiness score** | From `skills/performance/promotion-readiness-tracking.md` — to anchor mentoring goals to concrete advancement criteria |
| **Growth plan** | From `skills/people/growth-plans.md` — mentoring should complement, not duplicate, the existing IDP |
| **Peer input** | What teammates observe that the mentee may not see in themselves |

---

## Analysis

### Step 1 — Distinguish Mentoring from Coaching and Managing

```
Mentoring, coaching, and managing are three distinct modes. Using the wrong one
for the situation produces confusion, dependency, or resistance.

MANAGING: Accountability-based relationship
  Direction: Bi-directional but manager holds formal authority
  Focus: Delivery, performance, organizational expectations
  Mode: Manager sets expectations; engineer executes
  When to use: Role performance, behavioral compliance, organizational accountability
  Signal: "Here is what I need from you in this role."

COACHING: Guided-discovery relationship
  Direction: Primarily from coach — questions, not answers
  Focus: Problem-solving and self-awareness; the answer is already in the person
  Mode: GROW model; Socratic; the person does the work
  When to use: Person has capacity to figure it out; learning through discovery
  Signal: "What do you think? What have you tried? What would you do differently?"
  → Invoke: skills/people/coaching.md

MENTORING: Knowledge-transfer relationship
  Direction: Primarily from mentor — experience, patterns, network
  Focus: Skill building, career navigation, access to wisdom the mentee doesn't yet have
  Mode: Expert sharing, pattern recognition, direct advice when warranted
  When to use: Person lacks experience or context that the mentor has accumulated
  Signal: "Here's what I've learned about this. Here's the pattern I'd watch for."

Common confusion:
  Managers who mentor their own direct reports must signal the mode explicitly:
  "Right now I'm speaking as your manager — [accountability statement]"
  "Right now I'm speaking as your mentor — [experiential advice]"
  Mixing modes without signaling creates confusion about whether this is an expectation or advice.

When the EM is not the right mentor:
  Same-gender or same-background role models may be more effective for some career navigations
  Technical domains outside the EM's expertise → identify a domain-expert mentor
  Promotion paths into management → an experienced EM mentor outside the chain of command
  Action: Facilitate the relationship; don't compete with it
```

### Step 2 — Design the Mentoring Agreement

```
A mentoring agreement is a written document, not a verbal understanding.
The act of writing it forces clarity on goals, commitment, and success criteria.

Mentoring agreement components:

1. GOALS (3–5 specific, measurable growth targets)
   Bad goal: "Get better at system design"
   Good goal: "Be able to independently lead the architecture discussion for a service
               at the complexity level of [example] within 6 months — without requiring
               pre-review from a senior engineer."

2. CADENCE
   Standard: 60-minute sessions every 2 weeks
   Minimum: Monthly — shorter cadence produces slower outcomes
   Format: Mentee prepares agenda; mentor prepares one topic or observation
   The mentee owns session prep — this is not optional

3. DURATION
   Time-bounded: 6 months to start; renew with explicit re-contracting
   Open-ended mentoring relationships drift — no urgency, no measurement

4. TOPICS IN SCOPE
   Technical: system design, architecture patterns, code quality, domain knowledge
   Career: navigation, organizational dynamics, role transitions, sponsorship
   Leadership: influence, communication, cross-functional effectiveness
   Out of scope: personal/therapeutic topics → EAP; manager-report performance topics → 1:1

5. SUCCESS CRITERIA
   "At 6 months, we will assess whether [mentee] can [observable behavior] at [standard]."
   Specific enough that two independent observers would agree on whether it was met.

6. MUTUAL COMMITMENTS
   Mentor commits: preparation, specific experience sharing, honest feedback, connections
   Mentee commits: preparation, follow-through on between-session actions, proactive agenda-setting

Re-contracting trigger:
  Any of these signals require a re-contracting conversation:
  — Sessions feel like status updates rather than growth conversations
  — Mentee stops preparing or bringing real problems
  — Goals were achieved early (set new ones) or became irrelevant
  — Mentor realizes they don't have expertise in what the mentee needs
```

### Step 3 — Run the Coaching Effectiveness Measurement

```
Mentoring effectiveness is measured by behavioral change in real work — not by
the quality of the conversations or the mentee's satisfaction with the relationship.

Coaching effectiveness score (measured quarterly):

  For each goal in the mentoring agreement, assess:
  Observable: Has the mentee demonstrated the target behavior in actual work since the last quarter?
    YES: Goal advancing — score 1
    NO: Goal not advancing — score 0

  Effectiveness rate = (Goals advancing) / (Total active goals)
  Interpret:
    >70%: Strong effectiveness — goals may be too easy; consider raising them
    40–70%: Healthy effectiveness — maintain approach
    20–39%: Borderline — review approach; is this the right learning mode?
    <20%: Ineffective — investigate root cause before continuing

Root cause of low effectiveness:
  Wrong approach: EM is using expert-sharing for problems that need guided discovery
  Wrong goals: Goals are not observable; can't tell if behavior changed
  Between-session gap: Mentee is not applying insights between sessions — skills/mentoring/mentee-plan.md
  Wrong mentor: Domain mismatch; facilitated connection to right mentor is better
  Readiness problem: Mentee is not yet ready to grow this skill — prerequisite gap

Promotion readiness linkage:
  Map mentoring goals directly to promotion readiness dimensions from
  skills/performance/promotion-readiness-tracking.md — Technical / Scope / Communication /
  Leadership / Track Record
  At each quarterly review: Which promotion readiness dimensions have advanced?
  If mentoring goals don't map to any promotion dimension: misaligned investment
```

### Step 4 — Monitor Mentoring Relationship Health

```
Mentoring relationships have predictable health patterns over time.

Healthy pattern:
  Month 1–2: High energy; exploring goals; establishing trust
  Month 3–4: Real growth challenges emerge; sessions require more from both parties
  Month 5–6: Skill gaps closing; mentee becoming more autonomous; re-contracting imminent

Degradation patterns to watch for:

Pattern 1 — Dependency creation
  Signal: Mentee asks "what should I do?" before trying; defers all decisions to mentor
  Risk: Mentoring is producing learned helplessness, not independence
  Fix: Shift to Socratic mode (skills/mentoring/coaching-style.md); require mentee to bring proposed answer
  Measure: Is the mentee making more independent decisions in their actual work each month?

Pattern 2 — Social drift
  Signal: Sessions have become a friendly conversation with no skill agenda
  Risk: Relationship has value to both parties but is no longer producing growth
  Fix: Re-read the mentoring agreement aloud in the next session; reset goals and check-ins
  Measure: How many between-session actions were completed vs. agreed in the last 60 days?

Pattern 3 — Mentor over-investment
  Signal: EM is spending >2 hours/week on this mentoring relationship outside sessions
  Risk: EM is compensating for mentee's lack of preparation or driving the mentee's growth for them
  Fix: Name it directly: "I've noticed I'm doing more preparation than you are. What's getting in the way?"
  Rule: If the mentor cares more about the mentee's goals than the mentee does, the goals are wrong.

Pattern 4 — Plateau
  Signal: Goals aren't advancing for 2+ consecutive months despite session regularity
  Risk: Wrong approach, wrong environment, or hidden blocking factor
  Fix: Stop, assess, and change something — approach, goal framing, or mentor
```

---

## Decision Tree

```
What does the mentor plan assessment reveal?

├── MENTORING RELATIONSHIP NOT YET STRUCTURED
│   └── Write the mentoring agreement before the next session
│       3–5 goals / 6-month duration / explicit success criteria
│       Verbal mentoring without an agreement drifts within 60 days

├── MODE CONFUSION (mentoring/coaching/managing mixed)
│   └── Signal the mode explicitly in every session
│       "As your mentor — [advice]"
│       "As your manager — [expectation]"
│       "As your coach — [question back to you]"
│       Mixing without signaling destroys clarity and trust

├── COACHING EFFECTIVENESS <40%
│   └── Investigate root cause before the next session:
│       Wrong approach → switch mode (skills/mentoring/coaching-style.md)
│       Wrong goals → rewrite for observability
│       No between-session application → address mentee readiness (skills/mentoring/mentee-plan.md)
│       Wrong mentor → facilitate handoff to domain expert

├── DEPENDENCY PATTERN DETECTED
│   └── Shift to Socratic mode exclusively for 30 days
│       Require mentee to bring a proposed answer before any question is addressed
│       Track: Is the mentee making independent decisions in real work? Measure in 30 days.

├── PROMOTION READINESS NOT ADVANCING
│   └── Map mentoring goals to promotion readiness dimensions
│       If goals don't map: redesign goals around the readiness gap
│       Cross-check with skills/performance/promotion-readiness-tracking.md

├── MENTORING RELATIONSHIP AT 6-MONTH MILESTONE
│   └── Re-contracting conversation:
│       — What goals were achieved? Name them explicitly.
│       — What goals weren't achieved? Why not?
│       — Should this relationship continue, and with what new goals?
│       — Is the EM still the right mentor, or has the mentee's needs evolved?
│       Continuing without re-contracting produces drift

└── MENTORING RELATIONSHIP COMPLETE
    └── Closing conversation: "Here's what I've seen you grow in."
        Specific — not "you've come a long way"
        Transfer: What relationships should I facilitate for your next chapter?
        Exit: No obligation to continue indefinitely if goals are achieved
```

---

## Output

### Mentoring Agreement and Effectiveness Tracker

```
MENTOR PLAN — {{Mentee Name}} — {{Cycle Start}}

MENTORING AGREEMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Relationship type: {{Manager-as-mentor | External mentor | Peer mentor}}
Duration: {{6 months}} | Sessions: {{Every 2 weeks, 60 minutes}}
Mode clarity established: {{Y/N}} — mode signaling agreed: {{Y/N}}

GOALS (3–5 specific, observable, time-bounded)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Goal 1: {{Specific behavior to demonstrate}} | Promotion dimension: {{Technical/Scope/Comm/Leadership/Track}}
Goal 2: {{Specific behavior to demonstrate}} | Promotion dimension: {{...}}
Goal 3: {{...}}

SUCCESS CRITERIA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"At 6 months, {{mentee name}} can {{observable behavior}} at {{standard}}.
Two observers reviewing the work would agree that this standard was met."

COACHING EFFECTIVENESS — QUARTERLY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q1: Goals advancing: {{N}}/{{total}} = {{%}} | Assessment: {{Strong/Healthy/Borderline/Ineffective}}
Q2: Goals advancing: {{N}}/{{total}} = {{%}} | Assessment: {{...}}
Root cause if <40%: {{Wrong approach / Wrong goals / Between-session gap / Wrong mentor}}
Approach adjusted: {{Y/N}} — What changed: {{...}}

RELATIONSHIP HEALTH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Dependency pattern: {{Detected / Not detected}}
Social drift: {{Detected / Not detected}}
Mentor over-investment (>2h/week outside sessions): {{Y/N}}
Plateau (2+ months no goal advancement): {{Y/N}}
Action taken: {{...}}

RE-CONTRACTING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
6-month re-contract date: {{date}} | Continue: {{Y/N}}
Goals achieved: {{list}} | Goals not achieved: {{list / reason}}
New goals if continuing: {{...}}
Right mentor for next chapter: {{EM / Domain expert / Peer / External}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Mentoring agreement written with observable success criteria | Base: 60% |
| Mode distinction established (mentor/coach/manager) | +15% |
| Coaching effectiveness measured quarterly with observable evidence | +15% |
| Goals mapped to promotion readiness dimensions | +10% |
| Re-contracting scheduled before drift sets in | +5% |
| No written mentoring agreement | −30% |
| Goals not observable ("get better at X") | −20% |
| Mentor investing more energy than mentee | −15% |
| Dependency pattern unaddressed for 2+ months | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Unstructured relationship** | Monthly "how are you?" conversations; no goals; no measurement | Write the agreement. Name the goals. Measure the outcomes. |
| **Mode confusion** | Mentee doesn't know if they're receiving advice or a performance expectation | Signal the mode explicitly at the start of every relevant conversation. |
| **Dependency creation** | Mentee asks "what should I do?" before trying; doesn't make independent decisions | Shift to Socratic-only for 30 days. Require proposed answers before questions. |
| **Mentor over-investment** | EM spends hours preparing; mentee arrives unprepared | Name it directly. If mentee doesn't own the relationship, it can't succeed. |
| **Goal-to-promotion misalignment** | Mentoring goals don't connect to observable career advancement | Redesign goals using promotion readiness dimensions as the anchor. |

---

## References

- `skills/mentoring/mentee-plan.md` — Mentee's responsibility in the relationship; preparation protocol
- `skills/mentoring/growth-tracking.md` — Skill progression scoring and coaching effectiveness measurement
- `skills/mentoring/coaching-style.md` — Selecting and adapting the right approach per session
- `skills/people/coaching.md` — GROW model and coaching modes (coaching ≠ mentoring; both matter)
- `skills/performance/promotion-readiness-tracking.md` — Mapping mentoring goals to promotion readiness dimensions
- `skills/people/career-development.md` — Career trajectory context that mentoring should serve

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/mentee-plan.md` | Counterpart — mentor plan and mentee plan form the complete relationship design |
| `skills/mentoring/growth-tracking.md` | Coaching effectiveness is measured here; results feed back to mentor plan quarterly |
| `skills/mentoring/coaching-style.md` | Style selection shapes which mentoring approach is deployed per session |
| `skills/people/coaching.md` | Coaching is a subset of what mentoring includes; GROW model shared |
| `skills/performance/promotion-readiness-tracking.md` | Mentoring goals should map directly to promotion readiness dimensions |
