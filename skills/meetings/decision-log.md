# Skill: Decision Log

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Real-time capture during meetings + 24-hour review post-meeting + Monthly decision audit

---

## Purpose

Capture every significant decision at the moment it is made — with the reasoning, alternatives considered, and reversibility — so that teams can implement without ambiguity, leadership can audit decision quality, and future engineers can understand why the system is the way it is.

**What the EM does automatically**: In decision logging, the EM:
1. Classifies every decision as Type 1 (irreversible/high-stakes) or Type 2 (reversible/low-stakes) — and applies the appropriate capture standard to each
2. Records the reasoning and alternatives considered, not just the decision itself — a decision without reasoning is an instruction, not a record
3. Identifies who made the decision using the DACI framework so accountability is clear
4. Maintains a queryable decision log that engineers and stakeholders can reference when the context is forgotten
5. Conducts a monthly audit to identify decisions that need revisiting due to changed circumstances

**Ethical principle**: Undocumented decisions are not decisions — they are verbal agreements that everyone remembers differently. The EM who makes decisions in meetings but does not record them forces the team to reconstruct intent from memory, invitation list, and inference. This produces rework, re-litigation, and organizational distrust. Recording decisions is not bureaucracy; it is accountability in its most basic form.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Decision statement** | What was decided — specific, unambiguous, one sentence |
| **Decision maker(s)** | Who made the call using DACI: Driver / Approver / Contributors consulted |
| **Date and meeting context** | When and where the decision was made |

### Optional
| Input | Description |
|---|---|
| **Alternatives considered** | What other options were discussed and why they were not chosen |
| **Reasoning** | Why this decision was made — the logic, not just the conclusion |
| **Reversibility trigger** | Under what conditions would this decision be revisited |
| **Affected teams** | Who needs to know about this decision and act on it |

---

## Analysis

### Step 1 — Classify the Decision

```
Decision classification determines the capture standard. Type 1 decisions require full capture.
Type 2 decisions require lighter documentation. Applying full capture to every decision
creates administrative burden that defeats the purpose.

TYPE 1 DECISION (Irreversible or High-Stakes)
  Characteristics:
    — Difficult or expensive to undo (architectural, organizational, contractual)
    — Affects multiple teams or stakeholders
    — Has a long implementation tail (6+ months of work flows from this decision)
    — Risk of significant harm if wrong
  Examples:
    — Choosing a technology stack or platform
    — Reorganizing team structure or ownership boundaries
    — Setting a product direction or feature cut
    — Decommissioning a system or capability
    — Making a hire, promotion, or performance management decision
  Capture standard: Full (see Step 2 — all fields required)
  Authority: Requires Approver with explicit authority at the decision's organizational level

TYPE 2 DECISION (Reversible / Low-Stakes)
  Characteristics:
    — Can be undone with moderate effort within weeks
    — Affects one team or a bounded scope
    — Implementation is short; wrong decisions surface quickly and can be corrected
    — Risk of limited, recoverable harm
  Examples:
    — Sprint priority within the team's scope
    — Approach to implementing a defined feature
    — Process changes for a single team
    — Naming conventions, internal tooling choices
  Capture standard: Lightweight (decision + owner + date; reasoning optional but encouraged)
  Authority: Driver makes the call; escalation not required

MISCLASSIFICATION risk:
  Engineering teams frequently classify architectural decisions as Type 2 because the
  upfront cost is low — and discover the irreversibility only after 12 months of
  implementation. Flag: "Is this decision easy to revisit in 6 months, or does reversing
  it require significant rework?" If rework: Type 1.
```

### Step 2 — Capture the Decision in Full (Type 1 Standard)

```
TYPE 1 DECISION RECORD (full capture)

DECISION (1 sentence, specific):
  "We will [action] for [scope] by [date/milestone]."
  Not: "We decided to move forward with the new approach."
  Yes: "We will migrate from REST to gRPC for the notification service by Q3 2026,
       starting with the mobile notification path in Sprint 14."

DECISION DATE AND CONTEXT:
  Date: [ISO 8601 date]
  Meeting/forum: [name of meeting or forum where decision was made]
  Attendees (Contributors): [Names]

DACI:
  Driver: [Name — who ran the discussion and owns the outcome]
  Approver: [Name — who made the final call; whose authority backs this decision]
  Contributors consulted: [Names — who provided input]
  Informed: [Names — who was told after the decision was made]

REASONING (why this decision):
  "We chose [option] because [1–3 specific reasons]. The primary driver was [one key factor]."
  Reasoning must be specific: "It's better" is not reasoning.
  "The gRPC migration reduces serialization overhead by ~30% at our current message volume,
  and our mobile client already supports protobuf." is reasoning.

ALTERNATIVES CONSIDERED:
  Option A (not chosen): [Description] — rejected because [specific reason]
  Option B (not chosen): [Description] — rejected because [specific reason]
  [If no alternatives were considered: flag this — decision quality is lower without alternatives]

REVERSIBILITY:
  Type: [Irreversible / Reversible with effort / Reversible easily]
  Reversal cost: [Low — days / Medium — weeks / High — months / Very high — quarters+]
  Trigger for revisit: "Revisit this decision if [specific condition]: [condition]."
  Examples: "Revisit if mobile team removes protobuf support" / "Revisit if volume exceeds 10M msg/day"

AFFECTED TEAMS / DEPENDENCIES:
  [Team or system] must [action] by [date] as a result of this decision
  [Team or system] must be informed: [Name] sends the notification by [date]

CONFIDENCE AT TIME OF DECISION:
  [High (90%+) / Medium (70–89%) / Low (50–69%) / Speculative (<50%)]
  Context: [What information was available / unavailable at decision time]

TYPE 2 DECISION RECORD (lightweight capture)

DECISION: [One sentence]
DRIVER: [Name] | DATE: [date]
REASONING: [One sentence — optional but recommended]
REVISIT TRIGGER: [Condition — optional]
```

### Step 3 — Maintain the Decision Log

```
A decision log is only useful if it is findable, consistent, and reviewed.

LOG FORMAT AND LOCATION
  Location: Single source of truth — one shared document per team, project, or system
  Tool: Confluence / Notion / GitHub wiki / shared markdown — not email, not meeting notes
  Naming convention: [YYYY-MM-DD] [Team] [Decision title]
  Indexed by: Date / Domain (architecture / product / process / org) / Status (active / superseded / under review)

LOG MAINTENANCE RULES
  One entry per decision: do not combine multiple decisions in one record
  No retroactive editing: decisions are recorded as made; if a decision changes, create a new record
    and reference the original with status "superseded by [new decision ID]"
  Public within the team: decision logs should be accessible to all engineers on the team without
    requiring manager approval; hidden decision logs breed distrust

SUPERSEDED DECISIONS
  When a prior decision is reversed or updated:
    Old record: status → "Superseded by [new decision ID]" + date superseded
    New record: "This supersedes [old decision ID]. Reason for change: [specific]."
  Do not delete superseded records — the history of why decisions changed is as valuable as the decisions

LINKING DECISIONS TO OUTCOMES
  For Type 1 decisions: 6-month check-in
  "Was this decision correct? Evidence: [outcome data]."
  "What would we do differently now? [reflection]"
  Decision quality improves when teams see the outcomes of their decisions — and when they don't.
```

### Step 4 — Run the Monthly Decision Audit

```
The monthly decision audit surfaces:
  1. Decisions that need revisiting (circumstances changed; trigger conditions met)
  2. Decisions that were made but never implemented
  3. Decisions that were implicit (made in conversation but never recorded)

AUDIT CHECKLIST

FOR EACH OPEN DECISION (Type 1):
  — Is the reversal trigger condition met? (If yes: flag for revisit)
  — Is the decision being implemented at the expected pace? (If no: identify blocker)
  — Has the confidence level proven accurate? (Feedback loop for decision quality calibration)

FOR RECENT MEETINGS:
  — Were any significant decisions made that are not in the log?
  — "The team decided to X" in Slack = implicit decision → capture it
  — Decisions made in 1:1s that affect the team → capture them

IMPLICIT DECISION DETECTION:
  Signals: "We've always done it this way" / "That was decided a while ago" / "I think [person] decided X"
  Action: Find the decision record. If it doesn't exist: reconstruct from memory + attendee input + document it now
  Note: A reconstructed decision record is marked: "[Reconstructed from memory — may be imprecise]"
  Purpose: Stop the decision from being re-litigated as if it was never made

DECISION DEBT:
  "Decisions that should have been made but weren't" = decision debt
  Signals: Team members making inconsistent choices in the same situation (no governing decision)
  Ambiguous ownership (two teams both believe they own a decision space)
  Action: Surface the undecided question to the right Approver; schedule a decision meeting;
  record the outcome immediately
```

---

## Decision Tree

```
What does the decision log assessment reveal?

├── DECISION NOT YET CLASSIFIED (Type 1 or Type 2)
│   └── Apply the reversibility test:
│       "Is this easy to reverse in 6 months, or does reversing it require significant rework?"
│       Significant rework → Type 1 (full capture required)
│       Easy reversal → Type 2 (lightweight capture)

├── TYPE 1 DECISION MADE WITHOUT FULL CAPTURE
│   └── Capture it within 24 hours — the longer the delay, the more reasoning is lost
│       Reconstruct from meeting notes / attendees / context
│       Mark as "[Reconstructed]" if not captured in real-time
│       Prevent recurrence: designate a notetaker before every Type 1 decision meeting

├── ALTERNATIVES NOT CONSIDERED (no alternatives field in decision record)
│   └── Flag the decision as lower-quality; note in the record
│       For future high-stakes decisions: require alternatives to be documented in the pre-read
│       "We considered no alternatives" = higher risk of decision regret

├── REVERSIBILITY TRIGGER MET (circumstances changed)
│   └── Bring to the team within 2 weeks — do not wait for the next scheduled review
│       Frame: "We made [decision] in [month]. The trigger condition we set was [condition].
│       That condition is now met. Let's assess whether to change course."
│       Record: new decision with reference to the original

├── DECISION MADE WITHOUT APPROVER
│   └── Assess: Was this a Type 2 decision within the Driver's authority?
│       If yes: capture as Type 2; note the Driver made the call
│       If no: flag as decision without proper authority; escalate to retrospective review
│       Risk: decision may be overruled when the Approver learns of it; creates rework

├── IMPLICIT DECISION DETECTED (team acting on an undocumented decision)
│   └── Reconstruct and document immediately
│       Gather: who made the decision, when, with what reasoning, based on what alternatives
│       Mark: [Reconstructed — [date reconstructed] by [name]]
│       Prevent: Make decision logging a team habit; easy wins = lowering the capture friction

└── DECISION AUDIT REVEALS IMPLEMENTATION GAP (decision made; not acted on)
    └── Investigate: Was the action item not assigned? Lost in a handoff? Blocked?
        skills/meetings/action-items.md — connect decision to action item
        If blocked: surface the blocker; don't let the decision rot
```

---

## Output

### Decision Log Entry

```
DECISION LOG ENTRY — {{Decision ID}} — {{Date}}

CLASSIFICATION: {{Type 1 (Full) | Type 2 (Lightweight)}}
STATUS: {{Active | Superseded by {{ID}} | Under review | Implemented}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
DECISION
"{{Specific, one-sentence decision statement}}"

CONTEXT: {{Meeting/forum}} — {{Date}} — {{Attendees}}

DACI
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Driver: {{Name}} | Approver: {{Name}} | Contributors: {{Names}} | Informed: {{Names}}

REASONING
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
"We chose {{option}} because {{1–3 specific reasons}}. Primary driver: {{key factor}}."

ALTERNATIVES CONSIDERED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Option A (not chosen): {{description}} — rejected because {{specific reason}}
Option B (not chosen): {{description}} — rejected because {{specific reason}}

REVERSIBILITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Type: {{Irreversible / Reversible with effort / Reversible easily}}
Reversal cost: {{Low / Medium / High / Very high}}
Revisit trigger: "Revisit if {{specific condition}}."

AFFECTED PARTIES
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Team/person}} must {{action}} by {{date}}
Notification sent by: {{Name}} by {{date}}

CONFIDENCE AT DECISION TIME: {{High / Medium / Low / Speculative}}
6-MONTH OUTCOME CHECK: {{date}} — {{Was this decision correct? Evidence:}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Decision classified (Type 1 / Type 2) at capture time | Base: 65% |
| Reasoning documented (not just the decision) | +15% |
| Alternatives considered and recorded | +10% |
| Reversibility trigger documented | +10% |
| Decision log accessible to the full team | +5% |
| Decision audit run monthly | +5% |
| Decisions captured only as "we decided X" with no reasoning | −30% |
| No alternatives considered or documented | −15% |
| Decision log exists but is not findable or maintained | −20% |
| Implicit decisions not captured when detected | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Reasoning-free decisions** | Decision records state what was decided but not why; future engineers can't evaluate whether to change course | Require reasoning for every Type 1 decision. "We chose X because Y" is the minimum. |
| **Decision re-litigation** | The same decision is relitigated in every meeting; no one agrees it was made | Maintain the log publicly. Share it at meeting open when a prior decision is relevant. |
| **Implicit decision accumulation** | Team is acting on "how we always do it" with no recorded basis | Monthly audit for implicit decisions. Reconstruct and document when found. |
| **Decision without Approver** | Team makes a Type 1 decision that gets overruled by leadership weeks later | Classify decisions before making them. Type 1 requires an Approver with authority. |
| **Stale decision log** | Log has entries from 18 months ago with no updates; team stopped using it | Monthly audit reactivates the habit. Simplify capture friction. One notetaker per meeting. |

---

## References

- `skills/meetings/meeting-planner.md` — Decision type classified during meeting planning
- `skills/meetings/agenda-builder.md` — "Decision needed" field in the agenda feeds the log
- `skills/meetings/action-items.md` — Implementation of decisions becomes action items
- `skills/meetings/architecture-review.md` — Architecture decisions use the ADR format; extends this log

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/agenda-builder.md` | "Decision needed" field per agenda item is the source for log entries |
| `skills/meetings/action-items.md` | Every Type 1 decision generates one or more action items for implementation |
| `skills/meetings/architecture-review.md` | ADRs (Architecture Decision Records) are Type 1 entries with extended technical fields |
| `skills/conflict/blameless-retrospectives.md` | Post-incident decisions use the same full capture standard |
