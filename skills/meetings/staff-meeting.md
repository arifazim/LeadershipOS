# Skill: Staff Meeting

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Weekly or biweekly; standing agenda reviewed monthly

---

## Purpose

Run a staff or team meeting that engineers want to attend — because it surfaces real blockers, makes decisions that affect their work, and provides information they cannot get async — rather than a status theater that trains the team to disengage.

**What the EM does automatically**: In staff meetings, the EM:
1. Distinguishes what belongs in the staff meeting (decisions, blockers, team-affecting information) from what belongs async (individual status, FYI updates, lengthy design discussions)
2. Maintains a standing agenda with consistent sections while creating space for the real problems the team is experiencing this week
3. Reads engagement signals during the meeting — who is not speaking, who looks disengaged — and creates space for those voices
4. Reviews open action items from the prior week before adding new ones
5. Closes every meeting with a read-back of decisions and actions in under 5 minutes

**Ethical principle**: A staff meeting that the team could have received as a document is an act of disrespect for engineers' time and focus. Every recurring meeting must continuously earn its place on the calendar. If the team says "this could have been an email" — they're right, and the meeting design needs to change. The EM who keeps meetings on the calendar because "that's when we have our check-in" without evaluating whether the check-in is earning its time has made a lazy organizational decision.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Open action items from last meeting** | What was committed to; what is complete, in progress, or overdue |
| **Blockers and at-risk items** | What is preventing the team from moving at expected velocity this week |
| **Decisions needed this week** | Team-level decisions that require group input or confirmation |

### Optional
| Input | Description |
|---|---|
| **DORA/SPACE metric signals** | Any delivery or team health metrics that need team attention |
| **Announcements or org changes** | Information from leadership that affects the team |
| **Retrospective items** | Process improvement topics surfaced since the last meeting |

---

## Analysis

### Step 1 — Design the Standing Agenda

```
A standing agenda provides predictability without rigidity.
Consistent sections reduce cognitive overhead; reserved space for "real stuff" prevents predictability
from becoming stagnation.

STANDING AGENDA STRUCTURE (50-minute meeting)

SECTION 1 — OPEN ACTION ITEMS (5 minutes)
  Review all open action items from the prior meeting
  Status per item: Complete (confirm) / In progress (on track?) / Blocked (remove blocker) / Overdue (escalate)
  Purpose: Accountability; demonstrates that commitments made in this meeting are tracked
  Failure mode: Skip this section "because we're busy"; this signals action items don't matter

SECTION 2 — BLOCKERS AND AT-RISK ITEMS (10 minutes)
  Standing question to the team: "What is blocking you or at risk this week that this group can help with?"
  Format: Round-robin or raised hands; not a status recitation
  What belongs here: Cross-team dependencies, unclear requirements, resource constraints, decisions pending
  What doesn't belong: Individual technical questions that require one-on-one debugging
  Purpose: Surface problems while there is still time to address them in the current sprint/week
  Facilitation note: EM does not solve every blocker in the room; "who can help with this?" distributes ownership

SECTION 3 — DECISIONS AND ALIGNMENT (15 minutes)
  The highest-value section; protected from overrun by other sections
  Contains: 1–2 items requiring team input, decision, or alignment
  Format: Decision owner presents in 2 minutes; team discusses; decision made or escalated
  Item source: EM's preparation + team members who submit items to the agenda before the meeting
  No surprises: decision items must be in the agenda sent 24h before; no same-day additions except urgent
  Failure mode: This section is never used because nothing is ready; staff meeting becomes status-only

SECTION 4 — ANNOUNCEMENTS / CONTEXT (5–7 minutes)
  Information from leadership, cross-functional partners, or the org that affects the team
  Format: EM delivers; team asks questions; no extended discussion (park if needed)
  What belongs here: Org changes, product direction updates, policy changes, roadmap shifts
  What doesn't belong: Information that didn't change since the pre-read / general company updates
    that are available on the company wiki
  Failure mode: This section becomes a 20-minute EM monologue that the team could have read

SECTION 5 — TEAM VOICE (5 minutes)
  Unstructured space for anything the team wants to raise that doesn't fit other sections
  Standing question: "Is there anything else that's weighing on the team this week?"
  This section cannot be cut — it is where real problems surface if the rest of the meeting felt safe
  Failure mode: EM fills the silence with more announcements; team learns this section isn't real

CLOSE (5 minutes)
  Read-back: decisions made + actions assigned (owner + date)
  Next meeting: confirm date or any format changes
  "Anything I missed?"

STANDING AGENDA REVIEW (monthly):
  Is Section 3 (Decisions) being used? If not: why? What decisions are being made elsewhere?
  Is Section 2 (Blockers) surfacing real problems? Or is the team self-censoring?
  Is Section 4 (Announcements) running long? Move content to async pre-read.
  Should this meeting exist? → skills/meetings/meeting-planner.md necessity test
```

### Step 2 — Prepare Agenda Items Before the Meeting

```
AGENDA PREPARATION (EM completes 24 hours before the meeting)

FOR SECTION 2 — BLOCKERS:
  Review: What do I know about blockers from 1:1s this week?
  Prepare: Are there cross-team dependencies I should name first to create space?
  Signal detection: Who have I not heard from recently? Is there a team member who may be blocked
  but not raising it?

FOR SECTION 3 — DECISIONS:
  Identify the 1–2 most important team-level decisions needed this week
  For each: prepare talking points using the agenda-builder framework (skills/meetings/agenda-builder.md)
    — Context (30 seconds)
    — Options being considered (if applicable)
    — Decision needed from the team
  If no decision items are ready: replace with a brief design discussion or retrospective item
  Do not fill the slot with another announcement

FOR SECTION 4 — ANNOUNCEMENTS:
  Identify what the team does not yet know that affects their work
  Translate organizational information into team-relevant terms:
    "Leadership announced a focus on enterprise customers" →
    "Starting Q3, 30% of our sprint capacity will be allocated to the enterprise integration features.
     This affects [sprint N] planning. Here's what changes for us specifically."

AGENDA SENT TO TEAM (24 hours before):
  Sections visible with rough time allocations
  Any decision items identified with enough context to form a view before arriving
  Standing agenda format means team already knows the structure; updates are additive

TEAM CONTRIBUTION TO AGENDA:
  Create a mechanism for team members to add agenda items before the meeting
  Slack message: "Add your agenda items for [day] staff meeting here by [time]"
  Submitted items reviewed: fit the meeting → include; require dedicated time → schedule separately;
  can be handled async → respond async before the meeting

TALKING POINTS PER DECISION ITEM:
  Prepared using the full agenda-builder format
  Risks surfaced: Who might disagree? Is there missing information? Power dynamics in the room?
  Decisions named: Specific question the team must answer
```

### Step 3 — Facilitate Engagement and Signal Detection

```
A team meeting where two people speak and seven listen has failed.
The EM's facilitation responsibility is to create the conditions for real conversation.

ENGAGEMENT FACILITATION TECHNIQUES

Round-robin for blockers:
  "I want to go around the room. What's one thing blocking you or at risk this week?
  [Name], let's start with you."
  Prevents the same two voices from dominating; gives quiet contributors a predictable opportunity
  Failure mode: Round-robin becomes status recitation → remind: "Just blockers or risks, not full status"

Directed questions:
  "I haven't heard from [Name] on this — what's your take?"
  Brings in voices that haven't spoken; signals that everyone's input matters
  Do not direct to the same person repeatedly; rotate

Parking lot use:
  "That's important — let me park it so we can keep moving. [Name], will you follow up with [person]?"
  Prevents one item from consuming all available time; assigns ownership before moving on

SIGNAL DETECTION (EM monitors throughout)

Disengagement signals:
  Camera off consistently (video meetings)
  Short answers; one-word responses to direct questions
  Not raising hand or contributing to rounds
  Checking phone or other screen (in-person)
  Interpretation: not necessarily disengaged; may be overwhelmed, have something they're not saying,
  or not feel safe raising something in the group

What to do with disengagement signals:
  In the meeting: directed question (low-friction surface)
  After the meeting: "I noticed you were quiet today — is there something you wanted to raise
  that we didn't get to?" (1:1 or direct message)
  Pattern across 3+ meetings: address in 1:1 directly; skills/people/engagement.md

Conflict or tension signals:
  Short, clipped responses between specific people
  One person consistently disagreeing with another's suggestions
  Non-verbal tension (arms crossed, sustained eye contact, clipped tone)
  EM action: do not ignore; do not amplify by addressing publicly unless it's already public
  After the meeting: address bilaterally; skills/conflict/difficult-conversations.md

PSYCHOLOGICAL SAFETY CHECK (monthly)
  Is the team raising problems in the meeting, or only in 1:1s?
  If problems surface in 1:1s but not in group: the group is not safe enough for real conversation
  If the same people always speak: the meeting culture is not inclusive
  Fix: Structured turns; anonymous input (pre-meeting Slack) for sensitive topics;
  explicit EM statement: "I want to hear the real situation, not the polished version."
```

### Step 4 — Metrics Signal Review (When Applicable)

```
Staff meetings are an appropriate venue for brief, team-level metrics reviews
when a metric has changed significantly or requires team attention.

When to include metrics in the staff meeting:
  A DORA metric has changed significantly this sprint (deployment frequency, lead time, CFR)
  An incident last week produced a MTTD or MTTR signal worth discussing
  Sprint velocity has diverged from forecast (over or under) and the reason needs surfacing

When NOT to include metrics:
  Routine reporting of stable metrics ("our deployment frequency was 2.3 this week")
  Metrics the team already sees on a shared dashboard
  Individual performance metrics (these belong in 1:1s)

Metrics brief format (3 minutes maximum):
  "I want to flag [metric]. This week it was [value], which is [above / below] our target of [value].
  My read is [interpretation]. Is there context I'm missing from your side?"
  Then: specific question to the team; not a lecture

DORA signals and what they mean in the staff meeting:
  Deployment frequency drops: Are we accumulating work in progress? → sprint planning conversation
  Lead time increases: Where is time being lost in the pipeline? → process conversation
  Change failure rate rises: What's producing the regressions? → quality conversation
  MTTR increases: Are on-call engineers resourced and supported? → workload conversation

SPACE metric signals:
  Energy or wellbeing concern: → engagement / burnout conversation; skills/people/burnout.md
  Collaboration signal: → structure or cross-team conversation
  Efficiency signal: → WIP, focus time, or context-switching conversation
```

---

## Decision Tree

```
What does the staff meeting assessment reveal?

├── THE TEAM CONSISTENTLY PROVIDES NO REAL BLOCKERS IN SECTION 2
│   └── Two possibilities:
│       1. No blockers exist (unlikely; validate in 1:1s)
│       2. Team does not feel safe raising blockers in group (more likely)
│       Investigate: Are blockers raised privately that aren't raised publicly?
│       If yes: psychological safety gap; structured turns; pre-meeting anonymous input

├── SECTION 3 (DECISIONS) NEVER HAS ITEMS
│   └── Decisions are being made elsewhere — where? And is the team aware?
│       If EM is making team-affecting decisions without team input: recalibrate
│       If decisions require dedicated time: schedule separate decision meetings
│       If truly no decisions: is this meeting earning its spot? → necessity test

├── ANNOUNCEMENTS SECTION RUNNING >10 MINUTES
│   └── Content belongs in the pre-read or an async document
│       Translate to team impact; deliver in 5 minutes; park questions
│       If not possible in 5 minutes: the announcement requires a dedicated session

├── TWO OR THREE PEOPLE DOMINATE EVERY MEETING
│   └── Round-robin for blockers; directed questions; intentional facilitation
│       Monitor: is the same person silent every meeting?
│       Address in 1:1: "I noticed you haven't been contributing in staff meetings. Is there
│       something you want to raise that you haven't been able to?"

├── ACTION ITEMS CONSISTENTLY NOT COMPLETED BEFORE NEXT MEETING
│   └── This is an accountability gap or a capacity gap — diagnose before adding more items
│       Review: Are items unrealistically scoped? Are owners overloaded?
│       skills/meetings/action-items.md — escalation protocol

├── THE TEAM SAYS "THIS COULD HAVE BEEN AN EMAIL"
│   └── They're right. Don't argue. Change something.
│       Remove Section 4 (announcements) → async
│       If Section 2 and 3 are empty most weeks → reduce to biweekly or cancel
│       Earn the meeting back when there is real work for it to do

└── STAFF MEETING IS RUNNING WELL
    → Monthly review: are all sections earning their time?
    → Quarterly: should the format change? (New team members, new working model, new cadence)
    → Do not let a healthy meeting drift without active maintenance
```

---

## Output

### Staff Meeting Agenda and Brief

```
STAFF MEETING AGENDA — {{Team}} — {{Date}} — 50 min

GOAL: Surface blockers early. Make 1–2 team decisions. Provide context. Nothing this team
could have read in a document.

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECTION 1 — OPEN ACTION ITEMS (5 min)
Prior week's actions:
  {{Owner}} — {{action}} — Status: {{Complete / In progress / Blocked / Overdue}}
  {{Owner}} — {{action}} — Status: {{...}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECTION 2 — BLOCKERS AND AT-RISK ITEMS (10 min)
Round-robin: "What is blocking you or at risk this week?"
EM pre-identified risks: {{Any cross-team dependency or known blocker to name first}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECTION 3 — DECISIONS AND ALIGNMENT (15 min)

Item A — {{Decision topic}} | DECISION | 8 min
  Talking points: {{context + options + recommendation + decision question}}
  Risk: {{Who might push back; what information is missing}}
  Decision needed: "{{Specific question}}: Option A or Option B?"

Item B — {{Alignment or discussion topic}} | DISCUSSION | 7 min
  Talking points: {{context + the specific question for the team}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECTION 4 — ANNOUNCEMENTS (5–7 min)
{{Org or product update translated to team impact}}
  "What this means for us specifically: {{team-relevant consequence}}"

METRICS SIGNAL (if applicable): {{DORA or SPACE metric with a notable change}}
  "This week {{metric}} was {{value}}, {{above/below}} target. My read: {{interpretation}}. Context?"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SECTION 5 — TEAM VOICE (5 min)
"Anything else weighing on the team this week?"

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
CLOSE (5 min)
DECISIONS: {{read-back}}
ACTIONS: {{Owner — action — date}}
PARKING LOT: {{items → owner → scheduled time}}

RISKS THIS MEETING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Risk 1: Section 3 item may generate extended disagreement — prepared facilitation move}}
{{Risk 2: Specific team member disengagement signal noted — direct question planned}}
{{Risk 3: Announcement may generate anxiety — prepare space for questions}}

FOLLOW-UP ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Meeting notes sent by: {{Name}} within 2 hours
Parking lot items scheduled by: {{Owner}} within 48 hours
Disengagement follow-up: {{Name}} via DM before end of day
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Standing agenda with consistent sections | Base: 60% |
| Blockers section produces real problems (not status) | +15% |
| Decision items prepared with talking points 24h before | +15% |
| Round-robin or directed questions used to surface all voices | +10% |
| Action items from prior week reviewed at open | +5% |
| Meeting is a status recitation with no decisions | −30% |
| Same 2–3 people speak every meeting | −15% |
| No open action item review; accountability not tracked | −15% |
| Announcement section runs >10 minutes | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Status theater** | Meeting is 50 minutes of individual updates; no decisions; no blockers | Remove status from the agenda. Reserve that time for decisions and blockers. Send status async. |
| **Same voices every meeting** | 3 of 8 people speak; 5 are silent | Round-robin for blockers; directed questions; address silence patterns in 1:1s. |
| **Announcements dominate** | EM speaks for 20 minutes; team is passive | Move context to pre-read. Deliver announcements in 5 minutes. Park all questions. |
| **No psychological safety for real problems** | Blockers are raised privately but not in the meeting | Structured turns; anonymous pre-meeting input for sensitive topics; EM models vulnerability. |
| **Meeting not earning its time** | Team says "this could have been an email" | They're right. Apply the necessity test. Change the format or cancel the meeting. |

---

## References

- `skills/meetings/meeting-planner.md` — Necessity test applied monthly to the standing meeting
- `skills/meetings/agenda-builder.md` — Decision items in Section 3 use full agenda-builder format
- `skills/meetings/decision-log.md` — Decisions made in Section 3 captured in the decision log
- `skills/meetings/action-items.md` — Section 1 review and close read-back feed the action item tracker
- `skills/people/engagement.md` — Engagement signals detected in staff meetings

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/agenda-builder.md` | Section 3 decision items follow the full agenda-builder preparation |
| `skills/people/engagement.md` | Disengagement signals from staff meetings trigger engagement assessment |
| `skills/conflict/difficult-conversations.md` | Tension signals in staff meetings may require bilateral conversation after |
