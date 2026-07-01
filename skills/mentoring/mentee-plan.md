# Skill: Mentee Plan

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Design at relationship start + Session-by-session preparation + Monthly self-assessment

---

## Purpose

Design and activate the mentee's side of a mentoring relationship — establishing mentee ownership, preparation discipline, between-session application, and self-assessment so that the mentoring investment produces skill change rather than scheduled conversation.

**What the EM does automatically**: When acting as mentor or enabling mentoring for a direct report, the EM:
1. Assesses mentee readiness before committing to a structured mentoring relationship — unready mentees burn both parties' time
2. Establishes the mentee's responsibility explicitly: the mentee drives the agenda, the mentor responds
3. Monitors the mentee's preparation quality as the primary indicator of whether the relationship is functioning
4. Teaches the mentee how to extract value from a mentor with limited time
5. Detects when the mentee's goals have shifted and surfaces that before sessions drift

**Ethical principle**: Mentoring is the mentee's responsibility, not the mentor's. A mentor who drives the relationship, prepares all agendas, and chases the mentee for follow-through has become a career parent — not a mentor. This serves neither party. The EM's role is to make the mentee capable of running the relationship, not to run it for them.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Mentee's stated goals** | What the mentee says they want from this relationship |
| **Mentee's coachability indicators** | Observable evidence that the person acts on input between sessions |
| **Mentoring agreement** | From `skills/mentoring/mentor-plan.md` — shared goals and success criteria |

### Optional
| Input | Description |
|---|---|
| **Prior mentoring history** | How the person engaged with previous mentors; what worked or failed |
| **Learning preference** | How this person absorbs and applies new information — from `skills/mentoring/coaching-style.md` |
| **Growth plan** | From `skills/people/growth-plans.md` — so mentee preparation targets align with the development plan |

---

## Analysis

### Step 1 — Assess Mentee Readiness

```
Not everyone who wants a mentor is ready to benefit from one.
Unready mentees waste the mentor's time and learn that mentoring doesn't work.

Mentee readiness indicators (score each 0–2):

COACHABILITY (0–2)
  2: Acts on feedback before the next session; applies insights in real work unprompted
  1: Acts on feedback inconsistently; sometimes applies insights, sometimes doesn't
  0: Agrees in the session; no visible behavior change in work; "yes, but..." pattern

AGENDA OWNERSHIP (0–2)
  2: Comes to sessions with specific questions, real problems, and prepared observations
  1: Comes with vague topics; needs prompting to get to the real question
  0: Arrives without preparation; expects mentor to run the session

REFLECTION CAPACITY (0–2)
  2: Can observe their own patterns; articulates what they don't know; distinguishes knowing from doing
  1: Self-aware in some areas; blind spots in others; accepts observations when prompted
  0: Cannot distinguish "I know this" from "I can do this"; resists observations about blind spots

GOAL SPECIFICITY (0–2)
  2: Goals are specific, time-bounded, and connected to real development gaps
  1: Goals are directionally right but vague; needs help translating to observable behaviors
  0: Goals are aspirational labels ("be a better engineer", "improve my leadership")

BETWEEN-SESSION APPLICATION (0–2)
  2: Reports back on what was tried, what worked, and what didn't; shows their work
  1: Tries some things; variable follow-through; needs accountability prompts
  0: No between-session activity; sessions are discussions without translation to work

Readiness score: 0–10
  8–10: Ready for a structured mentoring relationship — commit fully
  5–7: Partially ready — start with a shorter trial (8 weeks) and assess
  3–4: Not yet ready — identify what's blocking readiness before committing
  0–2: Not ready — structured mentoring will not produce value; surface the readiness gap directly

"Not ready" does not mean "never" — it means the right intervention is not mentoring yet.
Possible interventions before mentoring: clarity on career goals (skills/people/career-development.md),
or feedback on coachability patterns (skills/people/feedback.md).
```

### Step 2 — Design Mentee Preparation Protocol

```
The mentee's preparation is the most reliable predictor of session quality.
A mentor can compensate for a weak session by sharing experience; a mentee cannot compensate
for an unprepared session — the value of the mentor's time is lost.

Mentee preparation protocol (before every session):

1. REVIEW THE MENTORING AGREEMENT
   What are the 3–5 goals we agreed to?
   Which goal does this session serve?
   What specific behavior am I trying to develop in real work?

2. BRING A REAL PROBLEM
   Not a hypothetical: "What should I do if I face conflict on a team?"
   A real problem: "I have a conflict with a stakeholder right now. Here's the situation.
   Here's what I've tried. Here's what I don't understand."
   The mentor's most valuable contribution is applied wisdom — not abstract advice.

3. PREPARE ONE SPECIFIC QUESTION
   The best mentoring sessions are organized around one question that the mentee cannot
   answer alone. Not "do you have any advice?" but:
   "In your experience, when a team has this dynamic [describe], what makes the difference
   between a team that resolves it and one that doesn't?"

4. REPORT ON THE LAST SESSION'S ACTION
   Every session should begin with: "Last time I committed to [action].
   Here's what I tried. Here's what happened. Here's what I'm still not clear on."
   If there's nothing to report: the sessions are not translating to work — address directly.

5. SHARE AN OBSERVATION ABOUT OWN PATTERN
   One thing I noticed about myself in the last 2 weeks that I want to talk about.
   This demonstrates reflection capacity — and gives the mentor a real signal to work with.

Preparation minimum standard:
  If the mentee arrives without items 2 and 3: name the expectation; do not fill the gap.
  "I want to make sure we're using this time well. What real problem do you want to bring today?"
  Filling the mentee's preparation gap trains them to under-prepare permanently.
```

### Step 3 — Teach Extraction Techniques

```
Mentors with significant experience have more to share than any session can contain.
The mentee's job is to extract specific, applicable knowledge — not to receive
general wisdom and be inspired.

High-yield extraction techniques:

TECHNIQUE 1 — The experience harvest
  "Tell me about a time when you faced [situation similar to mine]. What did you do?
  What didn't work? What would you do differently now?"
  Power: Extracts pattern recognition the mentor may not know to volunteer.
  Use: When the mentee is stuck on a problem the mentor has likely seen before.

TECHNIQUE 2 — The mistake request
  "What's the most common mistake people at my level make when navigating [situation]?
  How would I know if I was making it?"
  Power: Surfaces the warning signs and failure modes the mentor learned from experience.
  Use: When entering new territory; transition to next level; unfamiliar stakeholders.

TECHNIQUE 3 — The observation request
  "What do you notice about how I approach [specific thing] that I might not be seeing?"
  Power: Gets the mentor's direct observation — not advice, but a mirror.
  Use: When stuck in a blind spot; when feedback has been vague; when something isn't working.

TECHNIQUE 4 — The network access
  "Who else should I be talking to about this? Who has a perspective I'm not getting?"
  Power: Turns the mentor's network into the mentee's network — one relationship at a time.
  Use: When the mentee needs cross-functional exposure; when building reputation; career transition.

TECHNIQUE 5 — The mental model request
  "What's the framework you use to think about [decision type]? How do you decide when you
  have incomplete information?"
  Power: Extracts the reasoning process, not just the answer. Teaches judgment, not just content.
  Use: When the mentee faces recurring decision types they handle poorly.

Between-session application discipline:
  After every session, mentee writes:
  — One thing I'm going to try in the next 2 weeks
  — What "success" looks like (so I know if it worked)
  — What I'll report back on at the next session
  No written commitment = no accountability = lower probability of change
```

### Step 4 — Run the Monthly Mentee Self-Assessment

```
The mentee should assess their own growth monthly — not wait for the mentor's assessment.
Self-assessment builds self-awareness and produces the data the mentor needs.

Monthly mentee self-assessment (5 questions):

1. GOAL PROGRESS
   "For each goal in my mentoring agreement: what's the specific evidence that I'm advancing?"
   Score each goal: Advancing clearly / Advancing slowly / Not advancing / Goal no longer relevant

2. BEHAVIOR CHANGE IN WORK
   "Is my behavior in real work different from 30 days ago in any of the target areas?"
   Specific: "I made [decision type] independently last week without asking [mentor].
   Two months ago I would have asked."
   If no specific behavioral change: the sessions are producing conversation, not growth.

3. BETWEEN-SESSION APPLICATION RATE
   "Of the commitments I made at my last 3 sessions: how many did I follow through on?"
   Target: >80% follow-through rate
   Below 60%: The session commitments are wrong (too ambitious) or the follow-through is wrong (not prioritized)

4. MENTOR TIME QUALITY
   "Am I using my mentor's time on the highest-value questions — the ones I can't answer without them?"
   If I'm bringing questions I could answer by reading, asking a peer, or trying it first:
   I'm under-preparing and wasting mentoring capacity.

5. GOALS STILL RELEVANT?
   "Are my mentoring goals still connected to what I actually need to grow right now?"
   Goals set 3 months ago may no longer reflect the actual development gap.
   Surface this to the mentor; don't continue working toward an obsolete goal.

Self-assessment red flags:
  — "I can't think of specific behavioral change" → applying without internalizing; need more practice
  — "I keep re-asking the same question" → not capturing answers; start a mentoring notebook
  — "I feel dependent on my mentor's input before acting" → dependency; skills/mentoring/mentor-plan.md
  — "My goals feel disconnected from my actual work" → re-contracting conversation needed
```

---

## Decision Tree

```
What does the mentee plan assessment reveal?

├── MENTEE READINESS SCORE <5
│   └── Do not commit to a structured mentoring relationship yet
│       Identify the specific readiness gap:
│         No clear goals → career development conversation first (skills/people/career-development.md)
│         No coachability → direct feedback on the pattern (skills/people/feedback.md)
│         No reflection capacity → 8-week trial with explicit preparation expectations
│       Revisit readiness in 60 days

├── MENTEE ARRIVES UNPREPARED (missing real problem + specific question)
│   └── Do not fill the gap
│       "What real problem do you want to work on today?"
│       If they can't produce one: "Let's reschedule for next week. Come with a specific situation you're facing."
│       Filling the gap once sets the expectation permanently.

├── BETWEEN-SESSION APPLICATION <60%
│   └── Commitments are either too ambitious or not prioritized
│       Reframe: "What's the ONE thing from this session you'll actually do before we meet again?"
│       Check: Did they write it down? Do they know what success looks like?
│       Pattern persists after 2 sessions → surface directly: "What's getting in the way of application?"

├── MENTEE SELF-ASSESSMENT SHOWS NO BEHAVIORAL CHANGE (2+ MONTHS)
│   └── Sessions are producing conversation, not growth
│       Investigate: Is the problem wrong? Is the approach wrong? Is the mentee blocked externally?
│       Reset: Pick one specific behavior to demonstrate in the next 30 days; make it visible and observable.

├── MENTEE BECOMING DEPENDENT
│   └── Shift to Socratic-only mode
│       Require mentee to bring a proposed answer before any question is discussed
│       Track: Are they making more independent decisions in actual work?
│       If dependency persists after 60 days: the mentoring relationship is producing harm, not growth

├── GOALS NO LONGER RELEVANT
│   └── Re-contracting conversation — don't continue on obsolete goals
│       Surface: "Are these still the right goals? What's changed?"
│       Rewrite the goals before the next session; don't drift for months on the wrong agenda

└── MENTEE READY TO COMPLETE THE RELATIONSHIP
    └── Closing assessment:
        — What specific behaviors are now demonstrated independently?
        — What was learned about how this person grows?
        — What's the next relationship or resource they need?
        — Is there a network connection to make as a closing gift?
        Exit on success, not on time elapsed.
```

---

## Output

### Mentee Plan and Self-Assessment Record

```
MENTEE PLAN — {{Mentee Name}} — {{Cycle Start}}

READINESS ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Coachability:          {{0–2}} | Evidence: {{specific observation}}
Agenda ownership:      {{0–2}} | Evidence: {{specific observation}}
Reflection capacity:   {{0–2}} | Evidence: {{specific observation}}
Goal specificity:      {{0–2}} | Evidence: {{specific observation}}
Between-session app.:  {{0–2}} | Evidence: {{specific observation}}
Total: {{0–10}} | Readiness: {{Ready / Trial / Pre-work needed / Not ready}}
Blocking gap if <5: {{specific readiness gap to address first}}

MENTEE PREPARATION PROTOCOL (Established: Y/N)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Mentee owns agenda: {{Y/N | Date established}}
Real problem requirement: {{Y/N | Mentee understands expectation}}
Action report expectation: {{Y/N | Written commitment format agreed}}

MONTHLY SELF-ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Month: {{date}}
Goal 1 progress: {{Advancing clearly / Slowly / Not advancing / Obsolete}}
Goal 2 progress: {{...}}
Specific behavior change in work: {{Y — describe | N — flag as gap}}
Between-session follow-through rate: {{%}}
Dependency signal: {{None / Emerging / Established — address}}
Goals still relevant: {{Y / N — re-contracting needed}}

BETWEEN-SESSION COMMITMENTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Date     | Commitment | Success definition | Reported outcome
{{date}} | {{action}} | {{what done looks like}} | {{what happened}}
{{date}} | {{action}} | {{...}}             | {{...}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Readiness assessed before relationship commitment | Base: 65% |
| Mentee owns agenda and session preparation | +15% |
| Between-session commitments tracked with success definitions | +10% |
| Monthly self-assessment completed by mentee | +10% |
| Extraction techniques taught to mentee | +5% |
| Readiness not assessed; relationship started on optimism | −25% |
| Mentor fills mentee's preparation gap habitually | −20% |
| No between-session commitments or follow-through tracking | −15% |
| Mentee dependency unaddressed for 2+ months | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Readiness mismatch** | Mentee wants a mentor but hasn't developed coachability; sessions are pleasant but unproductive | Assess readiness first. Address the specific gap before committing to structured mentoring. |
| **Mentor-driven agenda** | Mentor prepares all topics; mentee arrives and receives | Return agenda ownership immediately. If mentee cannot bring a real problem, reschedule rather than fill the gap. |
| **No between-session application** | Sessions are interesting; no behavior change in work | Require one written commitment with a success definition. Track at next session, no exceptions. |
| **Dependency** | Mentee cannot act without mentor input; asks "what should I do?" for decisions within their scope | Shift to Socratic-only. Require proposed answers before questions. Monitor independence in real work. |
| **Obsolete goals** | Mentee working toward goals that no longer reflect actual development needs | Re-contracting conversation. Rewrite goals before continuing. |

---

## References

- `skills/mentoring/mentor-plan.md` — Counterpart; the complete relationship design; mentee readiness feeds the mentor plan
- `skills/mentoring/growth-tracking.md` — Monthly self-assessment data feeds skill progression tracking
- `skills/mentoring/coaching-style.md` — Learning preference adaptation shapes how mentee best absorbs mentor input
- `skills/people/feedback.md` — Coachability patterns surfaced as developmental feedback before mentoring begins
- `skills/people/career-development.md` — Career goal clarity is a prerequisite for specific mentoring goals

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/mentor-plan.md` | Counterpart — mentee plan and mentor plan form the complete relationship design |
| `skills/mentoring/growth-tracking.md` | Self-assessment data flows into growth tracking monthly |
| `skills/people/feedback.md` | Coachability feedback precedes mentoring readiness; shares the SBI framework |
| `skills/people/career-development.md` | Career clarity prerequisite for mentoring goals; feeds goal specificity |
