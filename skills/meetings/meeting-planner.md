# Skill: Meeting Planner

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Before every meeting is scheduled or accepted
**Contract**: `contracts/meeting.contract.md` (worked example)

---

## Purpose

Determine whether a meeting should exist, who must attend, what format serves the purpose, and what the meeting must produce — before it is scheduled. Most meetings fail before they start because the purpose, format, or attendee list was wrong.

**What the EM does automatically**: In meeting planning, the EM:
1. Applies a necessity test before scheduling any meeting — async resolution is always considered first
2. Classifies the meeting type to select the correct format, structure, and attendee design
3. Calculates meeting cost (attendees × time × hourly rate) and compares it to the expected value of the outcome
4. Designs the attendee list using a participant framework — every person in the room must have a defined role
5. Determines whether a pre-read is needed, what it must contain, and when it must be sent

**Ethical principle**: Unnecessary meetings are not a neutral inconvenience — they are a tax on the entire team's focus, productivity, and morale. Every engineer in a 60-minute meeting with seven people represents seven hours of deep work that did not happen. The EM who schedules meetings carelessly is making a resource allocation decision without accounting for the cost. The default is async. A meeting is justified only when synchronous interaction produces an outcome that asynchronous communication cannot.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Purpose statement** | One sentence: why does this meeting need to happen? |
| **Required outcome** | What must be true at the end of this meeting that is not true now? |
| **Candidate attendee list** | Who is being considered for attendance |

### Optional
| Input | Description |
|---|---|
| **Prior meeting history** | Has this meeting happened before? Did it produce the outcome? |
| **Async alternatives tried** | What async attempts have already failed or are insufficient? |
| **Decision urgency** | Is there a deadline driving the meeting, or is it elective? |

---

## Analysis

### Step 1 — Apply the Meeting Necessity Test

```
The meeting necessity test is a gate — not a formality.
If the purpose can be achieved without a synchronous meeting, it should be.

QUESTION 1: What is the specific outcome this meeting must produce?
  If the answer is "to share information": send an async document with a comment deadline.
  If the answer is "to make a decision": apply Question 2.
  If the answer is "to align on something": define what misalignment exists first.
  If the answer is "to brainstorm": apply Question 3.
  If the answer is "to check in": consider whether this belongs in an existing 1:1 or staff meeting.

QUESTION 2: Can this decision be made asynchronously?
  Type 2 decisions (reversible, low-stakes, within one team's authority):
    → Async doc with a "comments by [date]" deadline; decision made by the owner
    → Do not schedule a meeting for decisions that one person should own
  Type 1 decisions (irreversible, high-stakes, cross-team, or politically sensitive):
    → Meeting justified; synchronous discussion catches risks that async misses
    → Even then: send the decision framing document 48 hours before the meeting

QUESTION 3: Is brainstorming the actual goal?
  If yes: Has async brainstorming been tried? (shared doc, async comment thread)
  Most brainstorming benefits from async divergence before synchronous convergence.
  Format: Async pre-brainstorm (24–48h) → 45-minute sync to synthesize and decide
  Do not schedule a 90-minute brainstorming meeting when 30 minutes of async prep
  would reduce the sync time to 30 minutes.

QUESTION 4: Are the right people available, and will they participate?
  A meeting with the wrong attendees produces misaligned decisions.
  A meeting with disengaged attendees produces the illusion of alignment.
  If the decision-maker cannot attend: reschedule, or make the decision without the meeting.
  If the critical subject matter expert cannot attend: reschedule.

QUESTION 5: What happens if this meeting doesn't happen?
  If the answer is "nothing — it'll resolve itself": cancel the meeting.
  If the answer is "we delay a decision by one week": quantify the cost of that delay.
  If the answer is "a significant risk is unaddressed": the meeting is necessary.

Necessity test outcome:
  PASS → Schedule the meeting; proceed to attendee design and format selection
  FAIL → Document the async path: send [doc] to [people] with [response requested by date]
  DEFER → Gather the missing prerequisite (decision-maker availability, pre-read document, etc.)
```

### Step 2 — Classify Meeting Type

```
Meeting type determines format, structure, time allocation, and facilitation approach.
Using the wrong format for the meeting type is a guaranteed failure.

MEETING TAXONOMY

TYPE 1 — DECISION
  Purpose: A specific decision must be made; the outcome is a documented choice
  Format: 30–60 minutes; tight agenda; decision framing sent 48h before; 10-minute buffer for questions
  Attendees: Decision owner + people with critical information + people who must implement
  Output: Decision recorded in decision log (skills/meetings/decision-log.md)
  Failure mode: Discussion without decision; meeting ends with "let's think about it more"
  Signal that it's not a Decision meeting: no one in the room can make the call

TYPE 2 — ALIGNMENT
  Purpose: Multiple people need to reach shared understanding; not necessarily a decision
  Format: 45–90 minutes; structured discussion; explicit check for understanding at close
  Attendees: All people who will be affected by what they're aligning on
  Output: Written alignment summary circulated within 24 hours
  Failure mode: People leave with different understandings despite having "aligned"
  Signal of failure: Two attendees describe the outcome differently 48 hours later

TYPE 3 — BRAINSTORM / IDEATION
  Purpose: Generate options; explore possibilities; not to decide
  Format: 30–45 minutes of async pre-work + 30–60 minutes of synthesis session
  Attendees: Deliberately diverse; include people whose perspectives will challenge the dominant view
  Output: Synthesized option list; no decision in this session unless explicit design choice
  Failure mode: Dominant voices crowd out quiet contributors; same ideas emerge every time
  Signal of failure: Output is a list of ideas no one takes ownership of

TYPE 4 — STATUS / INFORMATION SHARING
  Purpose: Update multiple people simultaneously; surface blockers
  Format: 15–30 minutes; structured updates; parking lot for items requiring discussion
  Attendees: People who need the information and cannot get it async (rare)
  Output: Written summary sent immediately after; action items captured
  Failure mode: Status meeting becomes a problem-solving session for one person's issue
  Pre-check: Can this information be conveyed in a shared async document? If yes: cancel the meeting.

TYPE 5 — RETROSPECTIVE / LEARNING
  Purpose: Extract learning from a completed period; define changes to behavior or process
  Format: 60–90 minutes; structured; psychologically safe; action-item focused
  Attendees: The team involved in the work being reviewed
  Output: 3–5 specific, owner-assigned action items with due dates
  Failure mode: Venting session with no actions; or action items assigned but never reviewed
  → skills/meetings/retrospective.md

TYPE 6 — RELATIONSHIP / CULTURE
  Purpose: Build team cohesion, trust, or connection; not task-focused
  Format: Unstructured or lightly structured; optional attendance signals low priority
  Attendees: Whoever genuinely wants to be there; forced attendance defeats the purpose
  Output: Relationship capital; not a deliverable
  Failure mode: Forced fun; corporate team-building that signals management doesn't understand the team
```

### Step 3 — Design the Attendee List

```
Attendee design is the most consistently neglected meeting planning step.
Too many attendees: high cost, lower engagement, decisions made slowly.
Too few: decisions require a follow-up meeting to reach missing stakeholders.

PARTICIPANT FRAMEWORK

DRIVER (1 person)
  Owns the outcome; facilitates the discussion; accountable for what happens after
  This person cannot be passive; they are running the meeting with a purpose
  Common failure: no one is the Driver; the meeting has an organizer but not an owner

APPROVER (1–2 people)
  Has final decision authority on any Type 1 (irreversible) decisions in this meeting
  If the Approver is not present: no Type 1 decisions should be made
  If the Approver is present: their decision closes the discussion; advocacy after is noted, not revisited

CONTRIBUTOR (2–5 people)
  Has information, expertise, or stake that materially affects the quality of the discussion
  Above 5 Contributors: meeting size is too large; split or send async briefing to peripheral Contributors
  Test: "If this person were not in the room, would the output be materially different?"
    YES → Contributor (required)
    NO → Informed (do not invite; send notes afterward)

INFORMED (no limit)
  Needs to know the outcome but does not need to participate in the meeting
  Action: Send meeting notes and decision log entry, not a meeting invitation
  Common failure: Informed people are invited to meetings as a courtesy; cost rises; engagement drops

Attendee number guidelines:
  Decision meeting: 3–7 people (Driver + Approver + 1–5 Contributors)
  Alignment meeting: 5–12 people
  Brainstorm: 4–8 people (diverse; size over 8 reduces per-person contribution)
  Status meeting: 5–12 people (any more: use async)
  Retrospective: the full team (no upper limit; but over 15 requires facilitation design changes)

When the attendee list is wrong:
  "I need to have everyone" → Symptom of unclear decision authority; apply DACI
  "Just in case" invites → Apply the Contributor test; fail = Informed; not invited
  Missing the Approver → Do not hold a Type 1 Decision meeting; reschedule or change decision type
```

### Step 4 — Select Format and Determine Pre-Read Requirements

```
FORMAT SELECTION

Synchronous (video or in-person):
  Required when: Real-time dialogue produces better outcomes (conflict, nuance, trust-building)
  Required when: Type 1 decisions (irreversible) with multiple stakeholders
  Required when: Psychological safety issues require live human presence
  Duration guidance: 25 or 50 minutes (never 30 or 60 — respects calendar transitions)

Async-first (document + comment + decision):
  Required when: Decision is Type 2 (reversible) and within one person's authority
  Required when: Information sharing with no decision needed
  Required when: Timezone distribution makes synchronous impractical
  Tool: Shared document with explicit response deadline; decision owner makes the call

Hybrid (async pre-work + short sync):
  Best for: Brainstorming, retrospectives, and alignment meetings
  Format: 24–48h async divergence → 30–45min synchronous convergence and decision
  Risk: Half the team does the pre-work; half arrives unprepared; pre-work becomes decoration

PRE-READ DESIGN

Pre-read required when:
  — The meeting involves Type 1 decisions
  — Background context takes more than 5 minutes to explain
  — Attendees need time to form a view before the session (especially introverts)
  — The meeting is with executives (always send a pre-read)

Pre-read must contain:
  — Context (1 paragraph): what situation prompted this meeting
  — The question being decided or discussed (1 sentence, specific)
  — Options being considered (if decision meeting): enough to form a view
  — What a good outcome looks like: so attendees know the success criteria before arriving

Pre-read must NOT contain:
  — Everything the presenter is going to say (defeats the purpose of attending)
  — Raw data without synthesis (shifts analysis work to the attendees)
  — More than 2 pages (longer = not read; send an exec summary first)

Pre-read timing:
  Minimum: 24 hours before the meeting
  Preferred: 48 hours before for Decision meetings
  Executive meetings: always 48 hours; check they received and read it
```

---

## Decision Tree

```
What does the meeting planning assessment reveal?

├── PURPOSE CANNOT BE STATED IN ONE SENTENCE
│   └── Do not schedule the meeting
│       An unclear purpose produces a confusing meeting and no outcome
│       Work: Write the one-sentence purpose; if it can't be written, the meeting isn't ready

├── OUTCOME CAN BE ACHIEVED ASYNC
│   └── Send the document; set a comment/response deadline; make the decision
│       Cancel or prevent the meeting from being scheduled
│       Async path: [document] → [people] → [response by date] → [decision by owner]

├── TYPE 1 DECISION MEETING — APPROVER UNAVAILABLE
│   └── Reschedule — do not proceed without decision authority present
│       Alternative: Downgrade to alignment meeting if decision can wait
│       Risk of proceeding: meeting produces a recommendation that requires another meeting

├── ATTENDEE LIST FAILS CONTRIBUTOR TEST (too many people)
│   └── Reduce to core Contributors; convert others to Informed
│       Send pre-meeting briefing to Informed parties; send notes after
│       Rule: Every additional attendee who isn't a Contributor adds cost without adding value

├── PRE-READ NOT SENT 24H BEFORE DECISION MEETING
│   └── Delay the meeting or convert to a lower-stakes format
│       A decision meeting without a pre-read requires 10–20 minutes of context-setting
│       that could have been async — and often surfaces missing information that derails the session

├── MEETING IS STATUS/INFORMATION SHARING TYPE
│   └── Evaluate async alternative before scheduling
│       If async works: async document + comment thread
│       If sync required (live Q&A, safety-sensitive topic): 25 minutes maximum; capture in notes

└── MEETING PLANNING COMPLETE
    └── Proceed to agenda builder (skills/meetings/agenda-builder.md)
        Every meeting needs: specific agenda / time-boxed items / talking points / risks / decisions / actions
```

---

## Output

### Meeting Planning Brief

```
MEETING PLANNING BRIEF — {{Meeting Name}} — {{Proposed Date}}

NECESSITY TEST
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Purpose (one sentence): {{...}}
Required outcome: {{What must be true at the end that is not true now}}
Async alternative considered: {{Y/N}} | Why insufficient: {{...}}
Necessity test result: {{PASS / FAIL — async path / DEFER}}

MEETING CLASSIFICATION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Type: {{Decision / Alignment / Brainstorm / Status / Retrospective / Relationship}}
Decision type (if applicable): {{Type 1 (irreversible) / Type 2 (reversible)}}
Format: {{Synchronous / Async-first / Hybrid}}
Duration: {{25 / 50 / 75 minutes}}

ATTENDEE DESIGN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Driver: {{Name}} | Approver: {{Name or N/A}} | Contributors: {{Names (max 5)}}
Informed (not invited): {{Names — will receive notes}}
Attendee count: {{N}} | Cost estimate: {{N people × N hours × $N/hr = $N}}

PRE-READ
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Pre-read required: {{Y/N}} | Send by: {{date/time — 48h before}}
Pre-read owner: {{Name}} | Max 2 pages
Contents: Context / The question / Options / Success criteria

AGENDA BUILT: {{Y/N}} → skills/meetings/agenda-builder.md
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Purpose stated in one sentence before scheduling | Base: 65% |
| Async alternative explicitly evaluated | +10% |
| Meeting type classified and format matched | +10% |
| Attendee list designed with Participant Framework | +10% |
| Pre-read sent 48h before for Decision meetings | +10% |
| Meeting cost estimated against expected outcome value | +5% |
| Meeting scheduled without stated purpose | −35% |
| Async alternative not considered | −15% |
| Attendee list includes Informed parties as invitees | −10% |
| Decision meeting held without Approver present | −25% |
| No pre-read for Type 1 decision meeting | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Meeting as default** | Any problem, update, or discussion gets scheduled as a meeting | Apply necessity test. Async first. Meeting only when sync produces better outcomes. |
| **Attendee inflation** | 12 people in a 6-person decision meeting; half contribute nothing | Apply Contributor test. Convert non-Contributors to Informed; send notes. |
| **Missing Approver** | Decision meeting held; no one with authority in the room; meeting produces a "recommendation" that needs another meeting | Never hold a Type 1 decision meeting without the Approver. Reschedule. |
| **No pre-read for decision meetings** | First 20 minutes of meeting spent on context; real discussion has 10 minutes | Pre-read 48h before; context is async; meeting time is for discussion and decision. |
| **Purpose drift** | Meeting starts as a decision meeting; becomes a brainstorm; no decision made | State the purpose and required outcome at the meeting open. Return to it when drift occurs. |

---

## References

- `skills/meetings/agenda-builder.md` — Agenda construction for every meeting type
- `skills/meetings/decision-log.md` — Decision capture for Type 1 and Type 2 decisions
- `skills/meetings/action-items.md` — Action item design and tracking
- `skills/meetings/executive-meeting.md` — Executive meeting planning has additional requirements

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/agenda-builder.md` | Follows meeting planning; builds the specific agenda |
| `skills/meetings/executive-meeting.md` | Executive meetings require all planning steps plus additional preparation |
| `skills/conflict/stakeholder-resolution.md` | When the meeting involves conflict: planning must include neutrality and mediation design |
