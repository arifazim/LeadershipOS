# Skill: Action Items

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Real-time capture at meeting close + 24-hour delivery to owners + Weekly tracking review

---

## Purpose

Capture, assign, and track every action item to completion — with a named owner, a specific commitment, and a concrete due date — so that meetings produce forward progress rather than a record of conversations.

**What the EM does automatically**: In action item management, the EM:
1. Captures action items in real-time during meetings using the owner-action-date formula — no anonymous commitments
2. Reads back every action item at meeting close and confirms owner acceptance
3. Sends the action item list to all owners within 2 hours of the meeting close
4. Reviews open action items weekly and escalates stalled items before they become blockers
5. Tracks completion rate as a team health metric — low completion rates signal either meeting quality problems or accountability gaps

**Ethical principle**: An action item without a named individual owner and a specific date is not an action item — it is a hope. When action items are assigned to "the team," "we," or "everyone," accountability is dissolved and the work does not happen. This is not a failure of memory — it is a structural failure in how the commitment was captured. The EM who accepts anonymous or date-free action items has accepted no real commitment.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Action commitment made** | What was agreed to; who committed; when |
| **Meeting context** | Which meeting; what decision or discussion generated this action |
| **Owner** | The specific individual who accepted this action — not a team or a role |

### Optional
| Input | Description |
|---|---|
| **Dependency** | Whether this action is blocked by or blocking another action item |
| **Priority** | Urgent (blocks another team or decision) / Normal / Low (can slip a cycle without cost) |
| **Connected decision** | If this action implements a specific decision from the decision log |

---

## Analysis

### Step 1 — Capture Action Items in the Meeting

```
The capture discipline determines whether the action item system works.
A system that requires perfect compliance produces no compliance.
A system with a simple, enforced format at close produces consistent results.

THE THREE-FIELD FORMULA (non-negotiable)

Field 1 — OWNER: One named individual
  "The team will..." → Invalid; no owner
  "Engineering will..." → Invalid; no owner
  "{{Name}} will..." → Valid

  Owner acceptance test: The named person must explicitly agree in the meeting.
  "I'm assigning this to [Name] — [Name], does that work for you?"
  Assigned without acceptance: lower probability of completion; re-negotiation happens later

Field 2 — ACTION: Specific and observable
  "Follow up on the metrics question" → Invalid; what does "follow up" mean?
  "Get back to the team on the deployment timeline" → Invalid; no observable output
  "Send the Q2 deployment timeline document to the team Slack channel" → Valid
  "Schedule a 30-minute meeting with [Name] to align on the API contract before Sprint 15" → Valid
  Test: Would two independent observers agree on whether this action was completed?

Field 3 — DUE DATE: Specific, not relative
  "Soon" → Invalid
  "ASAP" → Invalid; means different things to different people
  "By end of week" → Acceptable but weaker; "by [specific day and date]" is stronger
  "[Specific date]" → Valid
  Urgency rule: if the action is blocking another team or decision, it must have the
  earliest defensible date — not the latest acceptable date.

CAPTURE IN THE MEETING
  Designate a notetaker (not the facilitator — they cannot capture and run at once)
  Running action log: visible to the room in real-time (shared doc or screen)
  Capture as committed: do not wait until the close to reconstruct from memory
  If unclear: pause and clarify before moving on. "What exactly is the action, and by when?"
```

### Step 2 — Read Back at Meeting Close

```
The close read-back is the single highest-leverage action item practice.
It takes 60–90 seconds and prevents 80% of post-meeting confusion.

READ-BACK PROTOCOL

"Before we close, let me read back the actions we committed to."

For each action item:
  "[Owner], you committed to [specific action] by [specific date]. Is that correct?"
  — Wait for verbal confirmation ("yes" / "confirmed" / correction)
  — If correction: update in real-time; confirm the correction

Correction types and responses:
  Owner correction: "Actually that should be [other person]" → update; get new owner's confirmation
  Date correction: "I can't do that by [date]; [later date] is more realistic" → update; note if blocking
  Action correction: "The action is actually [clearer description]" → update; confirm

What the read-back catches:
  — Assigned actions the owner didn't realize they accepted
  — Unrealistic timelines that will slip before anyone follows up
  — Missing actions that were discussed but not captured
  — Owner who is already overloaded (read-back makes it visible to the room)

What happens if someone objects during the read-back:
  Owner says "I can't do this by [date]" → Problem: either the timeline is wrong or the owner is
  at capacity. Address now, not in a follow-up email.
  Solution: "What date is realistic? / Is there someone else who can own this? / Can we descope?"
  Do not leave the meeting with an unresolved commitment.
```

### Step 3 — Distribute and Track Action Items

```
DISTRIBUTION (within 2 hours of meeting close)

Send to: All meeting attendees + any named action item owners not in the meeting
Format: Short message with the action item list; link to full meeting notes if needed
Channel: The channel the team already uses for written communication (do not create a new one)

Format:
  "Actions from [Meeting Name] [Date]:
  [Owner] — [Action] — Due [date]
  [Owner] — [Action] — Due [date]
  [decisions made, brief list]
  Full notes: [link]"

Do not send: A transcript of the entire meeting; subjective interpretations; long prose

TRACKING SYSTEM

Weekly review cadence:
  Every Monday (or first day of the week): review all open action items
  For each open item:
    — Is it due this week? → verify owner is on track
    — Is it overdue? → escalate (see below)
    — Is it blocked? → identify and remove the blocker
    — Is it no longer relevant? → close it formally; document why

Tracking format (maintained in the shared action item log):
  | Owner | Action | Due Date | Status | Notes |
  | [Name] | [Action] | [Date] | Open / Complete / Blocked / Overdue | [Update or blocker] |

Status definitions:
  OPEN: Not yet due; no signals of being off track
  IN PROGRESS: Owner has started; on track for the due date
  COMPLETE: Action finished; deliverable shared or outcome achieved; owner confirms
  BLOCKED: Owner cannot proceed without something outside their control; blocker named
  OVERDUE: Past due date; not completed; escalation triggered
  CANCELLED: No longer relevant; documented reason

Completion rate tracking (monthly):
  Total actions completed on time / Total actions due = completion rate
  Target: >85% completion on original due date
  Below 75%: systemic problem with action item quality (unrealistic dates, wrong owners, overload)
  Below 60%: meeting accountability has broken down; address this before adding more items
```

### Step 4 — Escalate Stalled Items

```
Escalation protocol is the difference between a system that works and one that degrades.
Escalation is not blame — it is visibility.

ESCALATION TRIGGERS

TRIGGER 1 — OVERDUE (past due date, no completion)
  Day 1 overdue: Direct message to owner: "Hey — [action] was due [date]. What's the status?"
  Day 3 overdue: Second message; if no response: raise in the next team sync or 1:1
  Day 7 overdue: Formal escalation: "I'm flagging that [action] is 7 days overdue. What's blocking it?"
  Day 14 overdue: EM makes a decision: extend date with plan / reassign / cancel with documentation

TRIGGER 2 — BLOCKER IDENTIFIED
  Owner reports: "I can't proceed because [specific blocker]"
  EM action: Remove the blocker, not the action
  Steps: Identify what the blocker requires → who has authority to resolve → resolve within 48 hours
  If blocker cannot be resolved in 48 hours: escalate the blocker to the correct authority immediately

TRIGGER 3 — OWNER AT CAPACITY
  Signal: Owner has 4+ open action items in the same week; consistently missing dates
  This is a workload problem, not a follow-through problem
  EM action: Review the owner's full action item list; prioritize with them; defer or reassign
  Do not add new action items to a full owner without removing something else

TRIGGER 4 — WRONG OWNER
  The named owner does not actually have the authority or access to complete the action
  Signal: Owner comes back with "I need [X] to do this" more than once
  Fix: Reassign to the person with the access / authority; update the log; confirm the new owner

ESCALATION LANGUAGE:
  Not: "Why haven't you done this?"
  Yes: "I want to make sure [action] stays on track. What's the current status?
       Is there something you need from me to move this forward?"
  Escalation maintains accountability without creating defensiveness.
```

### Step 5 — Close and Learn from Completion Patterns

```
Action item completion patterns carry diagnostic information about meeting quality.

PATTERN: Low completion rate overall (<75%)
  Diagnosis: Actions are being assigned unrealistically; dates are aspirational not committed;
             or owners don't have the capacity or authority
  Fix: Reduce action items per meeting; require specific dates not general timelines;
  do the owner acceptance check at every read-back

PATTERN: One person consistently owns most actions
  Diagnosis: EM is hoarding action items; or team is deferring ownership
  Fix: Deliberate distribution; challenge every item: "Who is the right owner for this?"
  Connection: skills/mentoring/delegation.md — action items are also delegation opportunities

PATTERN: Actions consistently slipping 1 week but completing in week 2
  Diagnosis: Due dates are being set to the optimistic case; real capacity requires more time
  Fix: Set due dates at the 80% confidence interval; add 20–30% buffer to estimates;
  separate urgent from normal items explicitly

PATTERN: Actions completed but not confirmed
  Diagnosis: Owners complete the work but don't close the loop; tracker stays open;
             team doesn't know the action is done
  Fix: Require completion confirmation: owner sends a message to the team channel:
  "[Action] is done. [What was delivered]." — not email, not a verbal mention in the next meeting

PATTERN: Actions completed on time, consistently
  Diagnosis: Healthy meeting accountability culture
  Continue: Monthly calibration check to ensure dates remain realistic as team load changes
  Do not take this for granted — it degrades without active maintenance
```

---

## Decision Tree

```
What does the action item assessment reveal?

├── ACTION ITEM MISSING OWNER
│   └── Do not accept it. "Who specifically is taking this?"
│       If no one accepts: "Then this is not an action item yet — let's decide who before we close."
│       A nameless action item is a failed commitment.

├── ACTION ITEM MISSING DUE DATE
│   └── "By when? Specifically — what day?"
│       If owner says "I'll try to get to it" → that is not a date; press for a specific day
│       If genuinely unknown: "What's the latest this can be done without causing a problem?"

├── ACTION OVERDUE (not completed by due date)
│   └── Day 1: Direct message to owner — status check
│       Day 3: If no response or still blocked — raise in 1:1 or team sync
│       Day 7: Formal escalation; identify blocker or reassign
│       Day 14: EM decision — extend with plan / reassign / cancel with documentation

├── OWNER IS BLOCKED
│   └── Name the blocker specifically: what is needed, who has it, what the EM must do
│       Remove the blocker within 48 hours or escalate it to the next authority
│       The action stays assigned to the owner; the blocker is what gets escalated

├── COMPLETION RATE <75% (monthly review)
│   └── Diagnose before adding more actions:
│       Unrealistic dates → require committed dates not optimistic ones
│       Wrong owners → apply owner acceptance check at every read-back
│       Overloaded owners → review full action item list; prioritize and defer
│       Poor meeting discipline → reduce actions per meeting; improve capture quality

├── ONE PERSON OWNS 4+ ACTIONS IN ONE WEEK
│   └── Stop. Review the list together.
│       Prioritize: which 2 are most critical?
│       Defer or reassign the others explicitly
│       Overloaded owners fail silently — the actions stop being tracked before they're escalated

└── ALL ACTIONS COMPLETE (weekly review)
    └── Confirm completion with evidence not just "yes"
        Close formally in the tracker
        Monthly: review completion rate trend — is it stable, improving, or degrading?
```

---

## Output

### Action Item Tracker

```
ACTION ITEM TRACKER — {{Team}} — {{Date}}

OPEN ACTION ITEMS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# | Owner    | Action (specific, observable)         | Due Date   | Status     | Notes
1 | {{Name}} | {{specific action with clear output}}  | {{date}}   | Open       | —
2 | {{Name}} | {{specific action}}                    | {{date}}   | In Progress| {{update}}
3 | {{Name}} | {{specific action}}                    | {{date}}   | Blocked    | {{blocker: what/who}}
4 | {{Name}} | {{specific action}}                    | {{date}}   | Overdue    | {{escalation step taken}}

COMPLETIONS THIS WEEK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# | Owner    | Action                 | Completed  | Evidence
1 | {{Name}} | {{action}}             | {{date}}   | {{what was delivered}}

COMPLETION RATE (monthly)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Total actions due: {{N}} | Completed on time: {{N}} | Rate: {{%}}
Pattern detected: {{Low rate / One owner overloaded / Dates slipping / Healthy}}
Intervention: {{specific}}

ESCALATIONS ACTIVE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Action: {{...}} | Days overdue: {{N}} | Last contact: {{date}} | Next step: {{specific}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Every action has named owner + specific action + specific date | Base: 65% |
| Read-back performed at meeting close with owner confirmation | +15% |
| Action item list distributed within 2 hours of close | +10% |
| Weekly review of open items with escalation protocol | +10% |
| Completion rate tracked monthly | +5% |
| Actions assigned to "the team" or without dates | −35% |
| No read-back at close; actions reconstructed from memory | −20% |
| No escalation protocol; overdue items sit unaddressed | −15% |
| No completion tracking; no feedback loop | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Anonymous ownership** | "The team will..." or "We should..." | Three-field formula: owner + action + date. No exceptions. Press for a name in the meeting. |
| **Aspirational due dates** | Dates set to the optimistic case; consistently missed by one week | Set dates at 80% confidence. Ask "what date can you commit to?" not "when do you think you can finish?" |
| **No read-back** | People leave the meeting with different recollections of what they agreed to | Read-back at every close. 90 seconds of insurance against three follow-up conversations. |
| **No escalation** | Overdue items stay overdue for weeks; system loses credibility | Day 1 message. Day 3 raise. Day 7 formal escalation. Day 14 EM decision. |
| **Owner overload** | One person has 6 open actions; nothing gets done | Review the full list with the owner. Prioritize 2. Defer or reassign the rest. |

---

## References

- `skills/meetings/agenda-builder.md` — Action items captured during close protocol in the agenda
- `skills/meetings/decision-log.md` — Decisions generate action items for implementation
- `skills/meetings/meeting-planner.md` — Meeting necessity partly measured by whether prior actions were completed
- `skills/mentoring/delegation.md` — Action items are delegation opportunities; apply maturity model

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/decision-log.md` | Every Type 1 decision generates implementation action items |
| `skills/meetings/agenda-builder.md` | Close protocol in the agenda is the capture point for action items |
| `skills/mentoring/delegation.md` | Deliberate assignment of action items can serve as delegation maturity practice |
