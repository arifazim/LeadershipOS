# Skill: Coaching Style

**Domain**: Mentoring Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Style assessment at relationship start + Adaptation after each session + Quarterly style audit

---

## Purpose

Identify the most effective coaching and mentoring style for each individual, adapt when the current style is producing stagnation, and build the EM's own self-awareness about their default style so that preference bias doesn't narrow the range of people they can effectively develop.

**What the EM does automatically**: In coaching style selection, the EM:
1. Identifies their own default style and its natural failure modes before coaching anyone
2. Diagnoses the mentee's learning preference (conceptual, example-first, hands-on, reflective) and adapts accordingly
3. Selects coaching mode based on the topic type and the mentee's current knowledge level — not on what feels comfortable to the EM
4. Detects style mismatch signals and adjusts within the session, not between sessions
5. Expands their own style range over time — an EM limited to one coaching mode can only develop engineers who happen to match that mode

**Ethical principle**: Coaching style preference belongs to the mentee, not the mentor. An EM who coaches exclusively in their preferred style is not coaching to the person — they are imposing their own learning preference on everyone they develop. Engineers who don't match the EM's style will appear less coachable, less capable, or "harder to mentor" when in fact they simply need a different approach. Mis-assessing someone's coachability because they don't match your style is both inaccurate and harmful.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Topic type** | Is this a knowledge gap, a skill gap, a judgment gap, or a behavioral/pattern gap? |
| **Mentee's current knowledge level** | Do they have foundational knowledge in this area, or are they encountering it for the first time? |
| **Prior session response** | How did the mentee respond to the approach used last session — engaged, frustrated, or confused? |

### Optional
| Input | Description |
|---|---|
| **Learning preference data** | Observed or stated preference for how this person best absorbs new information |
| **Growth tracking plateau signal** | From `skills/mentoring/growth-tracking.md` — if velocity is stalled, style change may be the intervention |
| **EM style self-assessment** | Which mode the EM naturally defaults to; which modes feel uncomfortable |

---

## Analysis

### Step 1 — Identify the EM's Default Style and Its Failure Modes

```
Every EM has a default coaching style. Most EMs unconsciously apply it regardless of
whether it fits the mentee or the topic. The first step is knowing what your default is.

The four coaching modes on the directive-to-nondirective spectrum:

EXPERT MODE (Highly Directive)
  Description: EM shares knowledge, frameworks, and answers directly
  Language: "Here's what I know about this. Here's what I'd do. Here's the pattern to watch for."
  Best for: Genuine knowledge gap (mentee lacks information the EM has)
            Time-critical situations where discovery is too slow
            Safety or high-stakes technical decisions where experimentation is costly
  Natural failure mode:
    — Creates dependency: mentee gets answers without developing judgment
    — Feels efficient but produces slower long-term growth
    — EM's mental model may not transfer cleanly; person adopts the answer, not the reasoning
  Who defaults here: EMs with deep technical expertise; people who value efficiency and clarity
  When this is wrong: Person has capacity to figure it out; judgment development is the goal

SOCRATIC MODE (Guided Discovery)
  Description: EM asks questions; mentee discovers their own answers
  Language: "What do you think? What have you tried? What would change your approach?
             What options haven't you considered?"
  Based on: GROW model (skills/people/coaching.md) — Goal → Reality → Options → Will
  Best for: Person has foundational knowledge; needs judgment, not information
            Building independent problem-solving capacity
            Behavioral development where the insight must come from within
  Natural failure mode:
    — Frustrating for a mentee who lacks the foundational knowledge to answer the questions
    — Can feel evasive: "Why won't they just tell me the answer?"
    — Requires high self-control from the EM; expert EMs find it uncomfortable to withhold answers
  Who defaults here: EMs with coaching training; people comfortable with ambiguity
  When this is wrong: Person is missing foundational knowledge; time pressure is real

REFLECTIVE MODE (Observation Mirror)
  Description: EM names what they observe; holds up a mirror to patterns the mentee can't see
  Language: "What I notice is... I've observed that you tend to... When [situation happens],
             I see you respond by... What do you make of that?"
  Best for: Behavioral patterns the person can't observe in themselves
            Interpersonal blind spots; communication patterns; leadership shadow
            Building self-awareness as a foundational skill for growth
  Natural failure mode:
    — Passive-feeling if the mentee expects active coaching; can seem indirect
    — If the EM's observation is wrong, the session derails
    — Requires established trust — early in a relationship, reflection feels like evaluation
  Who defaults here: EMs with psychological safety training; natural observers
  When this is wrong: Person needs information or skill, not pattern awareness

CHALLENGE MODE (Assumption Disruption)
  Description: EM challenges the mentee's framing, assumptions, or constraints
  Language: "I don't think that's the real problem. What if the constraint you're accepting
             isn't actually fixed? What would you do if [the thing you think is true] wasn't?"
  Best for: Person is stuck in one frame; thinking within unnecessary constraints
            Testing judgment by exposing assumptions
            Senior engineers who need to be challenged, not guided
  Natural failure mode:
    — Damages trust if used before it's earned; mentee feels attacked, not challenged
    — Requires precision — challenging the wrong thing produces confusion, not insight
    — EM's challenge must be correct; a wrong challenge wastes the session
  Who defaults here: EMs with high confidence and high relational trust with the mentee
  When this is wrong: Relationship is not yet strong enough to hold the challenge

Self-assessment (EM completes once):
  "My default mode is [Expert / Socratic / Reflective / Challenge]."
  "The failure mode I'm most likely to exhibit is [dependency / frustration / passivity / trust damage]."
  "The mode I find most uncomfortable to use is [...]."
  "When I'm under time pressure, I default to [Expert] even when it's not right."
```

### Step 2 — Adapt to Learning Preference

```
Learning preference affects how the mentee best receives and retains the insights
produced in the coaching session — regardless of the mode used.

Four learning preference patterns:

CONCEPTUAL LEARNER
  Signal: "Can you explain the principle first? I want to understand the framework before the example."
  Absorption pattern: Principle → Framework → Example → Application
  EM adaptation:
    Open with the concept: "The underlying principle is [X]. The reason this matters is [Y]."
    Then provide one concrete example; let them derive the others
    Avoid starting with a story — they want the map before the territory
  Trap to avoid: Over-abstracting; the framework must eventually land in a specific, real situation

EXAMPLE-FIRST LEARNER
  Signal: "Can you give me an example? I learn best when I can see it concretely first."
  Absorption pattern: Specific story → Extract principle → Apply in own context
  EM adaptation:
    Start with a specific, real case: "Let me tell you about a time when [specific situation]."
    After the story: "What do you notice about what drove the decision?"
    Then let them extract the principle — don't hand it to them
  Trap to avoid: Staying in the story; the mentee must abstract the principle or no transfer happens

HANDS-ON LEARNER
  Signal: "Can I try something? I'd rather experiment and see what happens."
  Absorption pattern: Experiment → Debrief → Principle → Refine
  EM adaptation:
    Design a small experiment: "Here's a situation coming up where you can try [approach].
    Before you go in, what's your hypothesis? What will you watch for?"
    After: Full debrief (skills/mentoring/delegation.md debrief structure applies here)
  Trap to avoid: Deploying in high-stakes situations before sufficient iteration; start small

REFLECTIVE LEARNER
  Signal: "I need to think about this. Can we come back to it? I process better in writing."
  Absorption pattern: Experience → Private reflection → Insight → Discussion
  EM adaptation:
    End sessions with a written reflection prompt: "Before next session, write down:
    What did you notice about your own approach? What would you do differently?"
    Start next session with their reflection — don't give answers before they've reflected
    Respect the processing time — pressure for immediate insight will suppress it
  Trap to avoid: Filling silence with more input; their thinking time is productive, not avoidant

Identifying learning preference:
  Ask once, early in the relationship: "When you're learning something new at work, what
  helps it stick for you? Do you like to see the concept first, or an example? Do you
  prefer to try it, or think about it first?"
  Most people know. If they don't: experiment and observe what produces the strongest reaction.
```

### Step 3 — Select Coaching Mode by Topic Type

```
Topic type determines which coaching mode is most likely to produce growth.

TOPIC TYPE → RECOMMENDED MODE

Knowledge gap (person lacks information the EM has):
  → Expert mode
  "They don't know what I know — sharing it is the fastest path to value."
  Transition: After sharing, shift to Socratic: "Given what I just told you, what would you do?"

Skill gap (person has knowledge but cannot apply it reliably):
  → Socratic + Reflective
  "They know the concept; they need to develop the ability to apply it."
  Start Socratic to surface their approach; use Reflective to name patterns in their application

Judgment gap (person can apply skill but makes poor decisions under ambiguity):
  → Socratic + Challenge
  "They can execute; they need to develop better decision-making instincts."
  Challenge their assumptions; surface the judgment heuristics they're missing

Behavioral/pattern gap (person has a pattern they can't see that limits effectiveness):
  → Reflective first, then Socratic
  "They need a mirror before they can ask different questions."
  Lead with observation; transition to questions once they've acknowledged the pattern

Style selection matrix:

          | Low knowledge | High knowledge |
----------|-------------------------------------------------
Task (do) | Expert → Socratic | Socratic + Challenge |
Pattern   | Reflective      | Reflective + Challenge |

Mode switching within a session:
  "I'm going to switch modes for a moment — I have something specific to share that I think
  would be useful here. After I share it, I'd like to come back to your thinking."
  Naming the mode switch prevents confusion about whether the mentor is now giving a directive.
```

### Step 4 — Detect and Respond to Style Mismatch

```
Style mismatch produces recognizable signals. Detect them within the session; adjust before
the session ends. Adjusting between sessions is too slow — the person has already discounted
the experience.

Style mismatch signals:

Signal 1 — Frustration (Socratic mode mismatch)
  What it looks like: Repeated "I don't know" responses; visible frustration; "Can you just tell me?"
  What it means: The mentee lacks the foundational knowledge to discover the answer
  Response: "Let me give you some context first, and then come back to the question."
  Switch to Expert → then return to Socratic once they have the base

Signal 2 — Passive reception (Expert mode mismatch)
  What it looks like: Head nodding; "yes, that makes sense" with no engagement; no questions
  What it means: The mentee understood but didn't internalize; they received, not discovered
  Response: "I've been sharing a lot. Let me stop — what do you make of all that?"
  Switch to Socratic → extract their thinking before adding more input

Signal 3 — Deflection (Reflective mode mismatch)
  What it looks like: "I don't really see that pattern" without engagement; changes topic; redirects
  What it means: Either the observation was wrong, or trust isn't high enough for reflective work
  Response: "Let me share a specific instance and see if it resonates."
  Either: Share concrete behavioral evidence / or: Build trust before returning to this mode

Signal 4 — Overwhelm (Challenge mode mismatch)
  What it looks like: Silence; withdrawal; "I need to think about this"; visible discomfort
  What it means: The challenge was too aggressive for the relationship or the topic
  Response: "I pushed too hard there. Let me back up — what's your current thinking?"
  Switch to Socratic → let them feel safe before returning to challenge

Post-session style audit (2 minutes, after every session):
  "Was the mentee engaged, or receiving?"
  "Did they leave with something they discovered, or something I told them?"
  "Was the mode I used right for the topic, or did I default to my preference?"
  "What's one thing I'd do differently in the next session?"
```

---

## Decision Tree

```
What does the coaching style assessment reveal?

├── EM HAS NOT ASSESSED OWN DEFAULT STYLE
│   └── Stop. Do this first.
│       "My default is [mode]. My natural failure mode is [consequence].
│       The mode I avoid is [mode]. My adaptation target for this quarter is [mode]."
│       An EM who doesn't know their default will unconsciously apply it to everyone.

├── MENTEE SHOWING FRUSTRATION (Socratic mismatch)
│   └── Detect mid-session; respond immediately
│       "Let me give you some context first."
│       Share what the mentee needs to know; then return: "Given that — what do you think?"
│       Do not continue Socratic questioning when the foundational knowledge is missing.

├── MENTEE SHOWING PASSIVE RECEPTION (Expert mismatch)
│   └── Stop sharing; activate their thinking
│       "I've been talking a lot. What do you make of what you've heard?"
│       "What would you add, challenge, or apply from this?"
│       Expert input that isn't processed and owned doesn't transfer.

├── REFLECTIVE OBSERVATION REJECTED (trust or accuracy issue)
│   └── Check: Is the observation accurate? If unsure — don't name it as fact; name it as question.
│       "I noticed [X] — what's your read on that?"
│       If trust is the issue: return to Socratic; rebuild before attempting Reflective.

├── GROWTH VELOCITY STALLED (skills/mentoring/growth-tracking.md shows plateau)
│   └── Style change is the first intervention
│       "The approach I've been using isn't producing movement. Let me try [different mode]."
│       Expert-to-Socratic is the most common correction: EM has been giving answers; person needs to discover.
│       Try the new mode for 3 sessions before assessing whether the plateau has broken.

├── SAME MODE APPLIED TO ALL MENTEES
│   └── Expand style range — this is an EM development gap
│       Identify one mentee per quarter for deliberate practice of the uncomfortable mode
│       Coach: "I'm practicing [Reflective] with you. You might notice I'm asking different questions."
│       Transparency about practice builds trust and gives mentee permission to give feedback.

└── MENTEE LEARNING PREFERENCE NOT IDENTIFIED
    └── Ask directly: "When you're learning something new, what helps it stick?"
        Then adapt: Conceptual first / Example first / Hands-on / Reflective
        Identify within the first 2 sessions; record it; use it consistently
```

---

## Output

### Coaching Style Profile

```
COACHING STYLE PROFILE — {{EM Name}} + {{Mentee Name}} — {{Date}}

EM STYLE SELF-ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Default mode: {{Expert / Socratic / Reflective / Challenge}}
Natural failure mode: {{Dependency / Frustration / Passivity / Trust damage}}
Uncomfortable mode: {{...}} — Practice target: {{Y/N}}
Under-pressure default: {{...}} — Risk: {{Reverts to [mode] when time-pressed}}

MENTEE LEARNING PREFERENCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Primary preference: {{Conceptual / Example-first / Hands-on / Reflective}}
Evidence: {{How identified — observation / stated preference}}
EM adaptation: {{What changes in delivery based on this preference}}

SESSION-BY-SESSION STYLE RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Date     | Topic type          | Mode used  | Mismatch signal? | Adjustment made
{{date}} | {{knowledge gap}}   | {{Expert}} | {{None}}         | {{—}}
{{date}} | {{judgment gap}}    | {{Socratic}} | {{Frustration}} | {{Switched to Expert, then returned}}
{{date}} | {{behavioral gap}}  | {{Reflective}} | {{Deflection}} | {{Backed to specific instance}}

STYLE EFFECTIVENESS RATING (Monthly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"Was the mentee engaged or receiving?" {{Engaged / Receiving — adjust mode}}
"Did they leave with something discovered or told?" {{Discovered / Told — shift toward Socratic}}
"Was the mode right for the topic?" {{Y / N — correction: [mode to use next time]}}
Velocity correlation: {{Style change → growth velocity change observed: Y/N}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| EM has completed own default style self-assessment | Base: 60% |
| Mentee learning preference identified and documented | +15% |
| Mode selected based on topic type, not EM preference | +15% |
| Mismatch signals detected and adjusted within session | +10% |
| Post-session style audit conducted consistently | +5% |
| EM applies one default mode to all mentees regardless of topic | −35% |
| Style mismatch detected but not adjusted until next session | −15% |
| EM has never assessed own default style or failure modes | −20% |
| Mentee learning preference never identified | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Default mode universalism** | Every session uses the same mode regardless of topic or mentee | Style self-assessment required. Topic-type matrix drives selection. |
| **Expert mode overuse** | Mentee stops thinking independently; waits for EM's answer | Shift to Socratic. Require mentee to bring a proposed answer before any question is addressed. |
| **Socratic with missing foundation** | Mentee is frustrated and stuck because they lack the knowledge to discover the answer | Identify the knowledge gap. Provide it (Expert mode). Then return to Socratic. |
| **Reflective too early** | Mentee deflects observations because trust hasn't been established | Build the relationship before attempting Reflective. Return to Socratic in the interim. |
| **Style mismatch tolerated** | Session ends with mismatch unaddressed; EM plans to "adjust next time" | Adjust within the session. Once the session ends with mismatch, the damage is done. |

---

## References

- `skills/mentoring/mentor-plan.md` — Coaching style selection serves the mentoring relationship design
- `skills/mentoring/growth-tracking.md` — Velocity stall is the primary trigger for style change
- `skills/mentoring/mentee-plan.md` — Mentee learning preference is identified via mentee plan assessment
- `skills/people/coaching.md` — GROW model is the foundation for Socratic mode; shared framework

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/mentoring/growth-tracking.md` | Velocity plateau triggers style change as the first intervention |
| `skills/people/coaching.md` | Socratic mode is built on the GROW model; coaching.md is the foundational reference |
| `skills/mentoring/mentee-plan.md` | Learning preference data sourced from mentee plan; feeds style adaptation |
| `skills/mentoring/mentor-plan.md` | Style selection serves the structured mentoring relationship; feeds session quality |
