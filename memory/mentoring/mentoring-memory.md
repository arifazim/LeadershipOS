# Leadership Memory: Mentoring

**Domain**: Leadership Memory → Mentoring
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs coaching approach, session design, and mentoring effectiveness)
**Cadence**: Record after notable sessions; review quarterly per mentee

---

## Purpose

Coaching effectiveness is not a fixed attribute of the EM — it is the product of the right approach applied to the right person at the right moment. The same technique that produces breakthrough insight in one engineer produces defensiveness in another. Without memory, the EM defaults to their own comfort mode regardless of fit. With memory, they build a coaching profile per person that accumulates evidence about what actually moves the needle.

**Questions this domain answers:**
- "Which coaching mode has worked best with [engineer]?"
- "What feedback framing does [engineer] respond to vs. shut down from?"
- "Where is [engineer] growing, and where are they stuck?"
- "What types of practice opportunities have accelerated [engineer]'s growth?"
- "Is the current mentoring approach actually producing behavioral change?"

---

## Domain-Specific Entry Fields

```
Engineer:             {{first name}}
Session type:         {{1:1 coaching / mentoring session / skill debrief / feedback conversation / growth planning}}
Coaching mode used:   {{Expert (directive) / Socratic (questioning) / Reflective (mirror) / Challenge (disruption)}}
Learning preference:  {{Conceptual-first / Example-first / Hands-on / Reflective}}
Goal addressed:       {{which skill or development goal this session focused on}}
What landed:          {{specific framing, question, or approach that produced visible engagement or insight}}
What fell flat:       {{specific approach that produced shutdown, confusion, or passive agreement}}
Behavioral signal:    {{what the engineer's body language, energy, or follow-through revealed}}
Evidence of transfer: {{was the coaching applied in real work? specific observable behavior}}
```

---

## What to Record

Create an entry after any of the following:

- A coaching session produced a visible shift in understanding or approach
- A coaching session produced no observable effect after multiple attempts
- A specific question or framing caused a breakthrough
- An engineer applied coaching in real work in a way that was observable
- A coaching approach that has worked before failed in this session
- The EM shifted coaching modes mid-session — and what prompted the shift
- A mentoring relationship dynamic changed (engineer became more engaged or more distant)

---

## Pattern Detection

After three or more entries for the same engineer, look for:

**Mode fit**: Is one coaching mode consistently more effective than others? Expert mode works for engineers who want to learn from experience; Socratic fails when the engineer hasn't built enough context to generate answers. Reflective mode works when the engineer already knows the answer but needs permission to trust it.

**Learning preference mismatch**: Is the EM's default approach matching the engineer's learning preference? Hands-on learners disengage from conceptual-first conversations. Example-first learners need the case study before the principle.

**Feedback reception pattern**: What framing causes the engineer to receive feedback openly vs. defensively? Some engineers need acknowledgment of what they did well before hearing a development point. Others prefer directness. Framing that triggers defensiveness wastes the session.

**Transfer evidence**: Are the skills discussed in coaching appearing in real work? If not after three sessions, the approach must change — either the goal is wrong, the practice opportunity doesn't exist, or the coaching mode isn't producing transfer.

**Dependency vs. growth**: Is the engineer coming to coaching for answers (dependency) or with their own thinking to test (growth)? Dependency is a coaching failure mode — it signals the EM is using Expert mode too heavily.

---

## Query Patterns

```
Q: "Which coaching mode works best with [engineer]?"
→ Filter by: person:[name]; aggregate What landed by Coaching mode used
→ Pattern: which mode correlates with Evidence of transfer

Q: "What feedback framing does [engineer] respond to?"
→ Filter by: person:[name] + session type including feedback
→ Retrieve: What landed + What fell flat fields

Q: "Where is [engineer] stuck despite coaching?"
→ Filter by: person:[name] + What fell flat; sort by frequency
→ Cross-reference: growth-tracking.md for plateau signal

Q: "What practice opportunities have accelerated growth?"
→ Filter by: person:[name] + outcome:positive
→ Retrieve: Evidence of transfer fields

Q: "Is the current mentoring approach working?"
→ Filter by: person:[name]; compare Evidence of transfer across last 90 days
→ If no transfer evidence in 3+ sessions: approach must change
```

---

## Entry Log

```
MENTORING MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: MEN-2026-07-01-001
Date: 2026-07-01
Domain: mentoring
Actors: [Engineer first name]
Context: Fourth coaching session on cross-functional communication. Engineer had received
  feedback from Product that their written updates were too technical. Prior two sessions
  used Socratic mode — multiple questions about audience, purpose, tone. Limited visible shift.
What happened: Switched to Example-first approach. Pulled up two actual update examples
  — one from a strong cross-functional communicator on the team, one from the engineer.
  Asked: "What's the reader going to feel reading each of these?" Engineer immediately
  identified the gap without prompting.
Outcome: Engineer rewrote their next update before sending. Product Director commented
  positively on clarity in the next sprint review.
Lesson: This engineer's learning preference is Example-first, not Socratic. Socratic mode
  requires sufficient schema to generate useful answers — without the example, the questions
  were too abstract to land. Concrete models before principles.
Confidence: Emerging
Engineer: [First name]
Session type: 1:1 coaching
Coaching mode used: Expert (shifted from Socratic to Example-first mid-session)
Learning preference: Example-first (confirmed this session)
Goal addressed: Cross-functional written communication
What landed: Side-by-side example comparison; reader-perspective question
What fell flat: Pure Socratic questioning without concrete models
Behavioral signal: Immediate engagement when example was introduced; had been passive previously
Evidence of transfer: Rewrote next update; received positive external feedback within one sprint
Tags: person:[first-name], pattern:coaching-response, pattern:communication-style, outcome:positive
Related entries: MEN-2026-06-15-001, MEN-2026-06-01-001
```

---

## Coaching Profile (per engineer)

```
COACHING PROFILE: {{Engineer name}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Most effective mode:       {{Expert / Socratic / Reflective / Challenge}}
Learning preference:       {{Conceptual-first / Example-first / Hands-on / Reflective}}
Confirmed by:              {{N sessions of consistent evidence}}

Feedback framing that works:
  Opening frame:     {{strength acknowledgment first / direct / question-led}}
  Delivery format:   {{specific behavioral / comparative example / impact-focused}}
  What triggers shutdown: {{list}}

Transfer evidence pattern:
  Applies in real work: {{Yes / Selectively / Rarely}}
  Best transfer conditions: {{what context produces real-world application}}

Growth areas with progress:     {{skill + entry ID}}
Growth areas currently stuck:   {{skill + entry ID + approach change tried}}
Dependency vs. growth ratio:    {{comes with own thinking / comes for answers}}

Mode history:
  {{date}}: {{mode used}} → {{outcome}}
  {{date}}: {{mode used}} → {{outcome}}

Last updated: {{date}}
```

---

## Recall Output Format

```
MENTORING RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Engineer: {{name}}
Entries reviewed: {{N}} entries, {{date range}}

COACHING PROFILE SUMMARY:
  Most effective mode: {{mode}} ({{N}} confirming observations)
  Learning preference: {{type}} ({{Established / Emerging}})

WHAT HAS WORKED:
  {{Specific approach, entry ID, date}}

WHAT HAS NOT WORKED:
  {{Specific approach, entry ID, date}}

TRANSFER EVIDENCE:
  {{Is coaching producing behavioral change in real work? Evidence}}

RECOMMENDATION FOR NEXT SESSION:
  Mode: {{recommended mode and why}}
  Opening: {{how to open the session}}
  Risk: {{what to avoid based on past failure}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Mode lock** | EM uses same coaching mode for all engineers regardless of response | Coaching profile per engineer; mode must adapt to observable response signals |
| **Transfer assumed** | Session went well; EM assumes the skill transferred to real work | Evidence of transfer is the only valid coaching effectiveness measure; observe real-work application |
| **Dependency reinforced** | Engineer comes to the EM for answers; EM provides them | Dependency is Expert mode used when Socratic was correct; shift to questioning when the engineer has sufficient context |
| **No profile built** | Multiple sessions; no pattern documented; EM guessing each time | Document after every notable session; profile accumulates over 3–4 sessions |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `skills/mentoring/coaching-style.md` — Mode selection and adaptation
- `skills/mentoring/growth-tracking.md` — Skill progression data linked to this log
- `analytics/master-leadership-dashboard.md` (View 3) — Coaching effectiveness metric
