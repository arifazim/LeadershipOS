# Skill: Agenda Builder

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before every meeting; minimum 24 hours before; 48 hours for decision meetings

---

## Purpose

Build a meeting agenda that is a working document — not a list of topics — so that every minute is time-boxed, every item has a purpose type, talking points are prepared per item, risks are surfaced before the room, decisions needed are named explicitly, and follow-up actions are captured at close.

**What the EM does automatically**: In agenda building, the EM:
1. Assigns a purpose type to every agenda item (FYI / Discussion / Decision) — this determines how much time the item gets and what the facilitation looks like
2. Prepares talking points for each item that can be delivered in the time-box without preparation in the room
3. Surfaces risks per agenda item before the meeting so they can be addressed rather than discovered
4. Names every decision needed explicitly so the room knows what it must produce
5. Designs a follow-up capture protocol so no action leaves without an owner and a date

**Ethical principle**: An agenda without time-boxes is a wish list. A wish list meeting runs until someone has to leave, at which point the most important items — typically last on the list — are deferred. The EM who sends a five-bullet agenda 10 minutes before the meeting has not prepared a meeting — they have prepared a conversation with attendees. Preparation is an act of respect for the time of everyone in the room.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Meeting purpose** | From `skills/meetings/meeting-planner.md` — the one-sentence purpose statement |
| **Meeting type** | Decision / Alignment / Brainstorm / Status / Retrospective |
| **Attendee list** | Who is attending; their roles (Driver / Approver / Contributor) |
| **Total meeting duration** | 25 / 50 / 75 minutes |

### Optional
| Input | Description |
|---|---|
| **Pre-read document** | What was sent; what can be assumed known vs. what requires brief context-setting |
| **Prior meeting notes** | Open action items from the last session; decisions made that set context |
| **Known risks or tensions** | Topics likely to generate conflict, consume disproportionate time, or require de-escalation |

---

## Analysis

### Step 1 — Design the Agenda Structure

```
Every agenda is built from four components:

COMPONENT 1 — OPENING (5 minutes, always)
  Purpose: Orient the room; confirm the meeting's goal; surface any new information
  Contents:
    — One sentence: "The goal of this meeting is [outcome]. We're done when [success criteria]."
    — Check for new information: "Before we start — has anything changed that affects our agenda?"
    — Time-check: "We have [N] minutes. Here's how we're using it." [overview of agenda]
  Why this matters: Meetings that open with "OK let's get started" drift for the first 10 minutes
  as the room tries to establish shared context. Opening does that explicitly in 5 minutes.

COMPONENT 2 — AGENDA ITEMS (variable; see Step 2)
  Each item has: Title / Purpose type / Time-box / Talking points / Risk / Decision needed

COMPONENT 3 — PARKING LOT (ongoing throughout)
  A visible list (shared doc, whiteboard, or Slack thread) of topics raised that are out of scope
  or will consume too much time if addressed now
  Management: "I'm going to park that — [topic] is important and I want to give it proper attention.
  Let me add it to the parking lot and we'll schedule dedicated time."
  Parking lot items get: owner assigned + scheduled time within 48 hours (not "sometime")
  Failure mode: parking lot items are never scheduled; they rot until the problem resurfaces

COMPONENT 4 — CLOSE (5 minutes, always)
  Purpose: Action item read-back; decision confirmation; parking lot review; next meeting
  Contents:
    — "Here are the decisions we made today: [read back from decision log]"
    — "Here are the actions we committed to: [read back — owner / action / date]"
    — "Parking lot items: [who owns scheduling them]"
    — "Next meeting / next touch point: [date or trigger]"
  Why this matters: Meetings that end without a read-back produce divergent recollections.
  The read-back is 60 seconds of insurance against three follow-up conversations.

Time allocation formula:
  Total meeting time
  − Opening (5 min)
  − Close (5 min)
  = Working time available for agenda items

  Working time distributed by item priority:
    The most important item is FIRST (not last) — energy and attention are highest at the start
    Status / FYI items are LAST — or async
    No single item gets more than 40% of working time (signals wrong meeting design)
```

### Step 2 — Classify Each Item by Purpose Type

```
Purpose type determines the facilitation mode and the correct time-box.

PURPOSE TYPE: FYI (For Your Information)
  Goal: Share information; the room receives, does not decide
  Facilitation: EM or presenter speaks; questions allowed; no discussion
  Time-box: 2–5 minutes maximum; anything longer belongs in the pre-read
  Signal it's running long: discussion is happening; convert to Discussion type
  Best practice: FYI items are best delivered async (pre-read, Slack, email)
  In-meeting FYI: only when the information is time-sensitive or emotionally significant

PURPOSE TYPE: DISCUSSION
  Goal: Explore perspectives, trade-offs, and options; build shared understanding
  Facilitation: Structured turn-taking; time-limit enforcement; synthesize frequently
  Time-box: 10–20 minutes per item; 15-minute default
  Productive close: "Let me synthesize what I've heard: [summary]. Does that capture the group's view?"
  Failure mode: Discussion that circles back on itself; EM narrates instead of synthesizes
  Signal the item is over-running: same point is being made repeatedly; decision hasn't emerged

PURPOSE TYPE: DECISION
  Goal: Make a specific, documented decision; the meeting succeeds only if the decision is made
  Facilitation: State the decision to be made; gather input (max 10 min); call the decision; confirm
  Time-box: 15–25 minutes (10 min input + 5 min decision + confirm + document = 20 min typical)
  Facilitation script:
    "The decision we need to make is [specific question]. We have [N] minutes.
    [Input round — each Contributor speaks once, max 2 minutes each]
    [Approver or Driver decides based on input]
    'The decision is [X]. [Name] will document this.'"
  Critical rule: The Approver's decision is final in this session. Advocacy after the call is noted
  for future cycles — not used to reopen the decision.

PURPOSE TYPE: RETROSPECTIVE
  Goal: Extract learning; assign improvement actions
  Time-box: See skills/meetings/retrospective.md for full structure
  In an agenda: mark as "Retro" and allocate the full time to it; do not combine with status

Agenda item template:
  Item N — [Title]
  Type: [FYI / Discussion / Decision]
  Time: [Start–End] ([N] minutes)
  Talking points: [3–5 bullet points per item; what the EM or owner will say]
  Risk: [What could go wrong with this item — derail, conflict, missing info, time overrun]
  Decision needed: [Specific question to be answered, if applicable; "N/A" for FYI]
  Owner: [Who is leading this item — not always the EM]
```

### Step 3 — Prepare Talking Points Per Item

```
Talking points are the specific content the EM or item owner will deliver — not bullet points
about what to cover, but the actual framing, context, and question to pose.

Talking point quality standard:

WEAK talking point: "Discuss the deployment timeline."
  — Says nothing about what to say; forces improvisation in the room
  — If the agenda is sent to attendees: gives them no preparation hook
  — EM arrives and discovers they don't know enough to lead the discussion

STRONG talking point: "Current deployment target is [date]. Three factors are creating risk:
  [factor 1] (impacts [team]), [factor 2] (impacts [timeline]), [factor 3] (decision needed today).
  We need to decide: maintain [date] with [mitigation], or move to [alternative date] with [consequence]."
  — EM can deliver this in 90 seconds without notes
  — Attendees who received this as a pre-read arrive with a formed view
  — The decision is embedded in the context; less discussion is needed to reach it

Talking point construction per item:

1. CONTEXT (30–60 seconds): What situation is this item about?
   "As of [date], [situation]. Since our last conversation, [what changed]."

2. THE ISSUE OR QUESTION (15–30 seconds): Why are we discussing this now?
   "The question before us is [specific, one-sentence question]."

3. OPTIONS OR POSITIONS (60–90 seconds if Decision type):
   "We're considering [Option A]: [description], which [consequence].
   Or [Option B]: [description], which [consequence]."

4. RECOMMENDATION (Decision type only): The Driver's view
   "My recommendation is [option] because [1–2 reasons]. I want to hear if there's
   a constraint or consideration I'm missing."

5. DISCUSSION HOOK (Discussion type):
   "Before we dive in — [one open question that invites the critical perspective]."
   "The concern I'm holding that I'd like us to address: [specific concern]."

Time discipline in talking points:
  Map talking point delivery time to the agenda time-box
  A 15-minute item: 90 seconds of context + 5 minutes of discussion + 5 minutes decision = 11.5 min
  EM tests delivery out loud before the meeting; if it takes longer than the time-box: cut content
```

### Step 4 — Surface Risks Per Agenda Item

```
Meeting risks are distinct from project risks.
Meeting risks are conditions that will prevent the meeting from producing its intended outcome.

Risk taxonomy for agenda items:

RISK TYPE 1 — SCOPE CREEP
  "This item may expand beyond its time-box because [topic X] is politically sensitive
  or because [person Y] tends to reframe the scope."
  Mitigation: State the scope boundary at the item open:
  "We're focusing on [specific question]. [Related topic] is important and is in the parking lot."

RISK TYPE 2 — MISSING INFORMATION
  "A key data point needed to make this decision is not yet available: [specific data].
  If raised, we may be unable to decide."
  Mitigation: Confirm availability before the meeting; if unavailable — convert decision item
  to discussion, or defer the item to when the data exists.

RISK TYPE 3 — POWER DYNAMICS
  "The Approver has a known strong preference for [option]; discussion may be suppressed."
  "A senior person's presence may discourage honest input from junior Contributors."
  Mitigation: Round-robin input before the Approver speaks; name it if needed:
  "I want to make sure we hear all perspectives before [Name] makes the call."

RISK TYPE 4 — EMOTIONAL LOAD
  "This topic involves recent conflict or disappointing news; emotional response may derail rational discussion."
  Mitigation: Acknowledge it explicitly at the item open:
  "I know this is a frustrating situation. I want to make sure we use this time to
  move forward, not to relitigate what happened. Can we agree to that frame?"

RISK TYPE 5 — TIME OVERRUN
  "This item has historically consumed more time than planned."
  "The discussion is inherently complex and may not reach a decision in [N] minutes."
  Mitigation: Hard time-box with explicit warning at 2 minutes remaining:
  "We have 2 minutes left on this item. We can either decide now, or park it for a dedicated session."

Risk surfacing in the agenda document:
  Every agenda item has a "Risk" field
  If Risk = None: confirm this — it is rarely true for Decision items
  High-risk items are sequenced earlier in the agenda when attention is higher
```

### Step 5 — Capture Decisions and Actions at Close

```
The close is not administrative overhead — it is the meeting's most important 5 minutes.
Decisions not read back are not confirmed. Actions not assigned have no owner.

DECISIONS READ-BACK PROTOCOL
  "Before we close: let me read back the decisions we made."
  For each decision: "[Decision]: We agreed to [X]. [Name] owns recording this. Any corrections?"
  Correction window: 60 seconds; correct now, not by email tomorrow
  → Captured in skills/meetings/decision-log.md

ACTION ITEMS READ-BACK PROTOCOL
  "Here are the actions we committed to:"
  For each action: "[Owner] will [specific action] by [specific date]."
  Format rule: Every action has a named individual owner (not "the team" or "we")
  Date rule: Every action has a specific date (not "soon" or "ASAP")
  Ambiguous owner = no owner = action does not happen
  → Captured in skills/meetings/action-items.md

PARKING LOT DISPOSITION
  "We parked [N] topics. Here's what happens to each:"
  For each parking lot item: "[Owner] will schedule [specific format] for [topic] by [date]."
  If no owner and no date: the item is effectively abandoned — name this explicitly

CONFIRMATION CHECK
  "Is there anything we discussed that I've missed in the read-back?"
  15 seconds of silence; then close.
  The confirmation check catches divergent understanding before it becomes a follow-up conversation.

Meeting notes:
  Sent within 2 hours of meeting close
  Contains: Decisions / Actions (owner + date) / Parking lot disposition
  Does NOT contain: A transcript of the discussion; verbatim quotes; subjective interpretation
  Who sends: Driver or designated notetaker; not the Approver
```

---

## Decision Tree

```
What does the agenda building assessment reveal?

├── NO PURPOSE STATEMENT FOR THE MEETING
│   └── Stop building the agenda
│       Without a purpose, items cannot be classified; time cannot be allocated
│       Return to skills/meetings/meeting-planner.md; state the purpose first

├── AGENDA ITEMS HAVE NO PURPOSE TYPE (FYI / Discussion / Decision)
│   └── Classify every item before time-boxing
│       FYI items → move to pre-read or async; remove from agenda
│       Discussion items → 10–20 minutes; structured turn-taking; synthesis at close
│       Decision items → name the specific question; max 25 minutes; require closure

├── TOTAL AGENDA TIME EXCEEDS MEETING DURATION
│   └── Cut or defer, in this order:
│       1. Remove all FYI items → move to pre-read
│       2. Convert Discussion items to async (doc + comment)
│       3. Defer lowest-priority Decision item to dedicated session
│       Rule: Meeting ends on time. Overrun is a planning failure.

├── TALKING POINTS NOT PREPARED FOR DECISION ITEMS
│   └── Prepare before the meeting; never improvise a decision-driving framing
│       Weak talking points produce weak discussions which produce no decisions
│       Test: deliver the talking point out loud in under 90 seconds; if not possible, cut

├── RISK FIELD LEFT BLANK FOR ALL ITEMS
│   └── Review items for at least one of: scope creep / missing info / power dynamics /
│       emotional load / time overrun
│       If genuinely zero risks for a Decision meeting: reconsider; this is unusual

├── NO DECISION READ-BACK PLANNED FOR CLOSE
│   └── Add it. Non-negotiable for Decision meetings.
│       5 minutes at close. Every decision confirmed. Every action assigned with owner and date.

└── AGENDA COMPLETE
    → Send to attendees at least 24 hours before (48 hours for Decision meetings)
    → Pre-read sent separately if required
    → Confirm attendees have received and will prepare
```

---

## Output

### Meeting Agenda Document

```
MEETING AGENDA — {{Meeting Name}} — {{Date}} — {{Duration}}

PURPOSE: {{One sentence — what we're deciding or achieving today}}
SUCCESS CRITERIA: {{What must be true at the end of this meeting}}
DRIVER: {{Name}} | APPROVER: {{Name or N/A}} | CONTRIBUTORS: {{Names}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OPENING — 5 min [{{time}}]

"The goal of this meeting is {{purpose}}. We're done when {{success criteria}}."
Check for new information. Overview of agenda and time-boxes.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ITEM 1 — {{Title}} | {{TYPE}} | {{N}} min [{{start–end}}]
Owner: {{Name}}

Talking points:
  - {{Context: situation as of today; what changed since last time}}
  - {{The question or issue: why we're discussing this now}}
  - {{Options/positions being considered, if Decision type}}
  - {{Recommendation or discussion hook}}

Risk: {{Scope creep / Missing info / Power dynamics / Emotional load / Time overrun — specific}}
Decision needed: {{Specific question: "Should we X or Y?" — or "N/A"}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ITEM 2 — {{Title}} | {{TYPE}} | {{N}} min [{{start–end}}]
[same structure as Item 1]

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PARKING LOT (managed throughout)
Items added: {{list as raised}} | Owner for scheduling: {{Name}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CLOSE — 5 min [{{time}}]

DECISIONS:
  "{{Decision 1}}: We agreed to {{X}}." [confirm]
  "{{Decision 2}}: We agreed to {{X}}." [confirm]

ACTIONS:
  {{Owner}} will {{specific action}} by {{date}}
  {{Owner}} will {{specific action}} by {{date}}

PARKING LOT DISPOSITION:
  {{Topic}} → {{Owner}} schedules {{format}} by {{date}}

CONFIRMATION CHECK: "Anything missed?"
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Every agenda item has a purpose type (FYI / Discussion / Decision) | Base: 60% |
| Talking points prepared per item (deliverable in time-box) | +15% |
| Risk surfaced per item | +10% |
| Decisions named specifically with "Decision needed" field | +10% |
| Close protocol includes read-back of decisions and actions | +10% |
| Agenda sent 24h+ before meeting | +5% |
| Agenda is a topic list with no time-boxes or purpose types | −35% |
| No talking points; EM improvises in the room | −20% |
| No close read-back; decisions and actions assumed captured | −20% |
| Agenda sent less than 1 hour before meeting | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No purpose types** | Agenda is a bullet list; meeting drifts between FYI and decision without structure | Classify every item. FYI items belong async. Decision items need explicit closure. |
| **Improvised talking points** | EM arrives and figures out what to say as the item starts; discussion is unfocused | Prepare talking points in writing before the meeting. Test by delivering out loud. |
| **Overloaded agenda** | Agenda exceeds available time; last items deferred every meeting | Remove FYI items; convert discussions to async; defer lowest-priority decision. |
| **No close read-back** | People leave with different understandings of what was decided and who owns what | Treat the close as non-negotiable. 5 minutes. Every decision. Every action. Owner + date. |
| **Parking lot without disposition** | Topics parked; never scheduled; resurface as crises | Every parking lot item leaves with an owner and a scheduled time within 48 hours. |

---

## References

- `skills/meetings/meeting-planner.md` — Purpose and type sourced from meeting planning; agenda builds on this
- `skills/meetings/decision-log.md` — Decision items captured during close → recorded here
- `skills/meetings/action-items.md` — Action items captured during close → tracked here
- `skills/meetings/executive-meeting.md` — Executive agendas have additional structure requirements
- `skills/meetings/staff-meeting.md` — Staff meeting agenda template with standing sections

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/meeting-planner.md` | Agenda builds on the meeting purpose and type established in planning |
| `skills/meetings/decision-log.md` | Decisions from the close read-back are recorded in the decision log |
| `skills/meetings/action-items.md` | Actions from the close read-back are tracked in the action items tracker |
| `skills/meetings/executive-meeting.md` | Executive agendas follow this framework with BLUF and additional constraints |
