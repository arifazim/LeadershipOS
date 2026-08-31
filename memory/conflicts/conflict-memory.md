# Leadership Memory: Conflicts

**Domain**: Leadership Memory → Conflicts
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs conflict resolution strategy and escalation decisions)
**Cadence**: Record during and after every significant conflict; review quarterly

---

## Purpose

Conflicts that appear novel are usually recurring. The same two engineers clash over the same type of disagreement in a different guise. The same stakeholder function repeatedly contests the same type of engineering decision. The same escalation path is triggered by the same conditions. Without memory, each conflict is addressed from scratch. With memory, patterns surface early enough to intervene before conflict develops.

**Questions this domain answers:**
- "What approach resolved similar conflicts before?"
- "Which parties tend to escalate vs. resolve laterally?"
- "Are there recurring conflict themes between specific teams or people?"
- "What de-escalation approaches have worked with [person]?"
- "Which conflict types have I avoided addressing and what was the cost?"

---

## Domain-Specific Entry Fields

```
Parties:            {{roles and/or names of people involved}}
Conflict type:      {{interpersonal / resource / priority / process / credit / technical / cross-functional}}
Root cause:         {{structural / communication / incentive misalignment / history / personality}}
EM role:            {{Party (EM has a stake) / Facilitator (neutral) / Bystander (naming impact)}}
Approach used:      {{direct conversation / mediated / escalated / ignored / reframed}}
Time to resolution: {{days from identification to resolution, or "unresolved"}}
Resolution:         {{Resolved / Ongoing / Escalated / Dormant / Relapsed}}
What worked:        {{specific approach or framing that reduced tension}}
What didn't work:   {{approach that increased tension or stalled resolution}}
Recurrence check:   {{First occurrence / Recurring — prior entry ID}}
```

---

## What to Record

Create an entry after any of the following:

- A conflict between two or more parties was identified and addressed
- An approach to conflict resolution produced an unexpected outcome
- A conflict was ignored and subsequently escalated or worsened
- A recurring conflict theme appeared for the second or third time
- An engineer expressed a grievance that revealed a structural issue
- A cross-functional conflict affected delivery or relationship trust
- The EM's own role in a conflict (Party/Facilitator/Bystander) changed

---

## Pattern Detection

After three or more conflict entries, look for:

**Recurring conflict themes**: Is the same type of conflict (priority, credit, resource) appearing repeatedly? Recurring themes are structural, not interpersonal — the system is generating the conflict regardless of who is involved.

**Chronic conflict pairs**: Are the same two people or functions in conflict repeatedly? Chronic conflicts that survive one resolution attempt are relationship failures, not conflict management failures.

**Escalation patterns by person**: Who escalates? Who resolves laterally? Escalation preference is a consistent behavioral pattern that shapes how urgently to resolve ambiguity before it reaches the person's leadership.

**Dormant conflict reactivation**: Conflicts marked as Resolved that reappear under pressure are not resolved — they are suppressed. Suppression is a temporary condition.

**EM avoidance pattern**: Are there conflicts the EM has marked as Ongoing or Dormant for 60+ days? Avoidance is itself a pattern with a cost.

---

## Query Patterns

```
Q: "What approach has worked for [conflict type] before?"
→ Filter by: Conflict type matching + outcome:positive
→ Retrieve: What worked fields + Resolution fields

Q: "Which parties tend to escalate?"
→ Filter by: Approach used: escalated; aggregate by party
→ Pattern: escalation frequency per person/function

Q: "Are there recurring conflict themes?"
→ Filter by: Recurrence check: Recurring; sort by frequency
→ Retrieve: Root cause + Conflict type to identify structural causes

Q: "What de-escalation has worked with [person]?"
→ Filter by: person:[name/role] + outcome:positive
→ Retrieve: What worked fields

Q: "Which conflicts have I avoided?"
→ Filter by: Resolution: Ongoing or Dormant; sort by date ascending
→ Flag: any entry >45 days without movement
```

---

## Entry Log

```
CONFLICT MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example entry — replace with real entries]

ID: CON-2026-07-01-001
Date: 2026-07-01
Domain: conflicts
Actors: Two senior engineers ([Eng A] and [Eng B])
Context: Technical disagreement over API contract ownership that had been simmering for
  two sprints. Each had made cross-team commitments that contradicted the other's.
  No active hostility but visible friction in architecture reviews.
What happened: Facilitated a structured conversation using the blameless retrospective
  approach — focused on "what did the system allow" rather than "who made the wrong call."
  Named the structural cause: no DACI for API contract decisions across teams.
Outcome: Resolved in one session. Parties agreed to a DACI for API contracts. No relapse
  in subsequent 60 days.
Lesson: Technical ownership conflicts between peers resolve faster when the root cause is
  named as structural (no DACI) rather than behavioral (someone made the wrong call).
  Behavioral framing triggers defensiveness; structural framing creates shared problem-ownership.
Confidence: Emerging (second time this approach resolved a technical ownership conflict)
Parties: Two senior ICs (peer level)
Conflict type: technical / process
Root cause: structural — no decision ownership framework for cross-team contracts
EM role: Facilitator
Approach used: mediated — blameless structural framing
Time to resolution: 5 days from identification
Resolution: Resolved
What worked: Naming the structural cause; DACI proposal as a shared solution
What didn't work: Not tested; conflict identified before it became interpersonal
Recurrence check: Recurring — see CON-2025-11-10-003
Tags: situation:conflict-resolution, pattern:framing-effect, outcome:positive, person:senior-ic
Related entries: CON-2025-11-10-003
```

---

## Pattern Summary (team-level)

```
CONFLICT PATTERN PROFILE: {{Team / Quarter}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Conflict type frequency:
  Interpersonal:     {{N occurrences}}
  Resource/priority: {{N occurrences}}
  Technical/process: {{N occurrences}}
  Cross-functional:  {{N occurrences}}
  Credit/recognition:{{N occurrences}}

Structural root cause frequency:
  {{root cause type}}: {{N}} times — likely systemic; address at the system level

Escalation pattern:
  {{Name/role}} escalates: {{N}} times; lateral resolution: {{N}} times
  Escalation risk: {{Low / Medium / High}}

Chronic conflicts (unresolved 60+ days):
  {{list with entry IDs}}

Recurring themes (same conflict type 3+ times in 12 months):
  {{list — these require structural intervention, not repeated mediation}}

EM avoidance scan:
  Conflicts in Ongoing/Dormant status >45 days: {{list}}

Last updated: {{date}}
```

---

## Recall Output Format

```
CONFLICT RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{what was asked}}
Entries reviewed: {{N}} entries, {{date range}}

PATTERN ({{Established / Emerging / Single}}):
  {{What the entries reveal about this conflict type or party}}

WHAT HAS WORKED:
  {{Specific approach, entry ID, date}}

WHAT HAS NOT WORKED:
  {{Specific approach, entry ID, date}}

STRUCTURAL SIGNAL:
  {{Is this conflict recurring? What structural cause is generating it?}}

RECOMMENDATION:
  {{Specific approach for the current conflict, based on pattern}}

CONFIDENCE: {{High / Medium / Low}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Conflict avoidance normalized** | Long-running Dormant entries; EM treats avoidance as "letting it resolve itself" | Monthly review; any Ongoing/Dormant >45 days requires explicit decision: intervene or close |
| **Behavioral vs. structural root cause** | Recurring conflict attributed to personality; same theme appears with different people | Check: if the same conflict type appears with different people, the root cause is structural |
| **Resolution theater** | Conflict marked Resolved after one conversation; no follow-up | Mark as Resolved only after 30-day observation period without relapse; check for Dormant status |
| **Chronic conflict pair** | Same two parties in conflict repeatedly; treated as isolated incidents | Flag chronic pairs after second occurrence; third occurrence is a relationship failure requiring a different intervention |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `skills/conflict/stakeholder-resolution.md` — Conflict resolution skill
- `skills/conflict/blameless-retrospectives.md` — Blameless framing technique
- `political-signals/political-signals.md` — Escalation and ownership ambiguity signals (redirect → `skills/organizational/political-intelligence.md`)
