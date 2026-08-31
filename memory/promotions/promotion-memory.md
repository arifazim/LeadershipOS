# Leadership Memory: Promotions

**Domain**: Leadership Memory → Promotions
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs promotion case construction, calibration preparation, sponsorship strategy)
**Cadence**: Record evidence continuously; record calibration outcomes immediately; review before each cycle

---

## Purpose

Promotion cases are won or lost on evidence quality and sponsorship effectiveness. The EM who walks into calibration with a narrative but no specific behavioral examples will lose to the EM who walks in with dated, attributed, business-impact evidence. This domain does two things: accumulates promotion evidence for each engineer in real time (so the case isn't reconstructed from memory at calibration), and records calibration outcomes so the EM learns what the committee actually responds to.

**Questions this domain answers:**
- "What evidence have I accumulated for [engineer]'s promotion case?"
- "What arguments landed in calibration? What was challenged?"
- "What has the calibration committee consistently promoted vs. held?"
- "What sponsorship activity has been done for [engineer]?"
- "Has [engineer] been visible to the decision-makers who will vote?"

---

## Domain-Specific Entry Fields

```
Engineer:             {{first name}}
Entry type:           {{Evidence / Calibration outcome / Sponsorship activity}}
Level target:         {{what level the promotion is targeting}}
Evidence type:        {{Technical / Scope-and-ownership / Communication / Leadership / Track-record}}
Evidence description: {{specific behavioral observation — dated, attributed, impact-quantified where possible}}
Calibration cycle:    {{quarter if a calibration outcome entry}}
EM assessment:        {{if calibration: what the EM submitted}}
Calibration outcome:  {{if calibration: what the group produced — Promoted / Held / Downgraded}}
What landed:          {{arguments or evidence the committee responded to positively}}
What was challenged:  {{arguments or evidence the committee pushed back on}}
Sponsorship action:   {{if sponsorship: where the engineer was named, by whom, in what forum}}
```

---

## What to Record

**Evidence entries** (continuous):
- A specific behavioral observation that demonstrates next-level behavior
- A deliverable that had cross-team or customer impact
- A situation where the engineer operated above their level
- Feedback received from a stakeholder about the engineer's contribution
- A risk the engineer identified and addressed without being asked

**Calibration outcome entries** (each cycle):
- What was submitted; what the committee produced
- Specific arguments that landed
- Specific challenges raised
- What evidence was missing that would have strengthened the case
- What the EM would do differently next cycle

**Sponsorship entries** (each event):
- Which forum, who was present, what was said
- Whether the attribution was specific (named + behavior) or general ("great team")
- How the recipient responded to the sponsorship (if known)

---

## Pattern Detection

After two or more calibration cycles, look for:

**Committee response patterns**: What does this calibration committee consistently promote? Scope breadth? Business impact? Peer testimony? Technical depth? Committees have personalities — learn it and build evidence accordingly.

**EM assessment bias**: Are the EM's assessments consistently above or below calibration outcomes? Consistent downward divergence means over-assessment. Consistent upward divergence means under-assessment or a visibility gap — the committee doesn't know what the EM knows.

**Evidence gap patterns**: What evidence type is consistently missing or weak at calibration time? If scope evidence is always thin, the engineer needs more scope opportunities. If business impact is always thin, the evidence needs to be framed differently.

**Sponsorship effectiveness**: Does naming an engineer in executive forums actually move their visibility? Which forums have produced subsequent positive committee signals?

**Overdue submission accumulation**: Engineers at readiness 42+ for two or more quarters without submission. This is both a career failure and a retention risk escalator.

---

## Query Patterns

```
Q: "What evidence have I accumulated for [engineer]?"
→ Filter by: person:[name] + Entry type: Evidence
→ Organize by Evidence type; note gaps

Q: "What arguments landed in calibration for [level/domain]?"
→ Filter by: Entry type: Calibration outcome + outcome:positive
→ Retrieve: What landed fields; identify patterns

Q: "What has the committee challenged?"
→ Filter by: Entry type: Calibration outcome
→ Retrieve: What was challenged fields; identify patterns

Q: "What sponsorship has been done for [engineer]?"
→ Filter by: person:[name] + Entry type: Sponsorship activity
→ Retrieve: Forum, audience, attribution specificity

Q: "Is [engineer]'s promotion overdue?"
→ Filter by: person:[name] + Level target; check date of first entry at this readiness level
→ Flag: 2+ quarters at readiness 42+ without promotion outcome
```

---

## Entry Log

```
PROMOTION MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example evidence entry]

ID: PRO-2026-07-01-001
Date: 2026-07-01
Domain: promotions
Actors: [Engineer first name]
Entry type: Evidence
Level target: Senior Engineer
Evidence type: Scope-and-ownership
Evidence description: Led the cross-team dependency mapping for the Q3 platform migration.
  Proactively identified two upstream dependencies (Auth service and Billing API) that the
  original design hadn't accounted for. Coordinated resolution with both teams without EM
  involvement. Migration completed on schedule. Auth team lead explicitly credited [Engineer]
  in the post-migration retrospective.
Calibration cycle: N/A (evidence accumulation)
What landed: N/A
What was challenged: N/A
Sponsorship action: N/A
Tags: person:[first-name], situation:promotion-discussion, pattern:trust-building, outcome:positive
Related entries: CAR-2026-04-01-002

---

[Example calibration outcome entry]

ID: PRO-2026-06-15-003
Date: 2026-06-15
Domain: promotions
Actors: [Engineer first name]
Entry type: Calibration outcome
Level target: Senior Engineer
Calibration cycle: Q2 2026
EM assessment: Exceeds (ready for promotion)
Calibration outcome: Held (Meets expectations; not ready)
What landed: Technical depth evidence well-received; specific examples with dates
What was challenged: "We don't see cross-team ownership yet" — committee saw scope as
  team-limited despite the Auth dependency coordination work. The evidence wasn't
  visible to the committee; they only knew what was surfaced in the brief.
Sponsorship action: None prior to this cycle — visibility gap likely contributed
Lesson: Evidence that is real but invisible to the committee doesn't count. For next cycle:
  name [Engineer] at the leadership sync before calibration; ensure the Auth team lead's
  specific credit is in the brief.
Tags: person:[first-name], situation:promotion-discussion, pattern:calibration-bias, outcome:negative
Related entries: PRO-2026-07-01-001
```

---

## Promotion Case Summary (per engineer)

```
PROMOTION CASE: {{Engineer name}} → {{Target level}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Current level:          {{role / level}}
Target level:           {{next level}}
Readiness score:        {{0–50}} — {{Ready / 1Q away / 2-3Q away / Early}}
At readiness ≥42 since: {{date}} — {{N quarters}} — {{OVERDUE FLAG if 2+ quarters}}

EVIDENCE BANK (by type):
  Technical:          {{N entries}} | Strongest: {{description}}
  Scope/Ownership:    {{N entries}} | Strongest: {{description}}
  Communication:      {{N entries}} | Strongest: {{description}}
  Leadership:         {{N entries}} | Strongest: {{description}}
  Track record:       {{N entries}} | Strongest: {{description}}
  GAP: {{which evidence type is thin}}

SPONSORSHIP HISTORY:
  {{date}}: {{forum}} — {{what was said}} — audience: {{who was present}}
  Visibility to calibration committee: {{High / Medium / Low}}

CALIBRATION HISTORY:
  Cycle        | EM Assessment | Outcome  | Key challenge
  {{Q}}-{{Y}}  | {{Exceeds}}   | {{Held}} | {{what was challenged}}
  {{Q}}-{{Y}}  | {{Exceeds}}   | {{Promo}}| {{what landed}}

COMMITTEE RESPONSE PATTERN:
  Responds to: {{evidence types that landed}}
  Challenges: {{evidence types consistently questioned}}

Next submission target: {{cycle}}
Evidence gap to close: {{specific}}
Sponsorship action needed: {{by date}}
```

---

## Recall Output Format

```
PROMOTION RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Engineer: {{name}} | Target level: {{level}}
Entries reviewed: {{N}} entries, {{date range}}

EVIDENCE INVENTORY:
  Strong: {{evidence types with entries}}
  Thin: {{evidence types with no or weak entries}}

COMMITTEE PATTERN ({{Established / Emerging}}):
  This committee responds to: {{list}}
  This committee challenges: {{list}}

SPONSORSHIP STATUS:
  Actions taken: {{list with dates}}
  Visibility assessment: {{High / Medium / Low}}

RECOMMENDATION:
  Next action: {{evidence gap to close / sponsorship needed / submit now}}
  By: {{date}}

OVERDUE FLAG: {{Y/N}} — at readiness 42+ since {{date}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Evidence reconstruction** | Promotion case built from memory at calibration time; evidence is approximate and undated | Evidence entries recorded continuously; calibration is assembly, not creation |
| **Visibility assumption** | EM knows the evidence; assumes committee knows it too | Committee knows what is surfaced in the brief and what has been named in forums; sponsorship is the transmission mechanism |
| **Calibration bias uncorrected** | EM consistently over- or under-assesses; divergence not tracked | Calibration outcome entries each cycle; compare EM assessment to outcome to identify bias direction |
| **Overdue submission ignored** | Engineer at 42+ for multiple quarters; EM treats as "not the right time" | Any engineer at 42+ for 2+ quarters without submission is in an overdue state requiring immediate action |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `analytics/master-leadership-dashboard.md` (View 3) — Career progression index and promotion pipeline
- `skills/performance/promotion-readiness-tracking.md` — Readiness scoring methodology
- `skills/performance/calibration.md` — Calibration preparation skill
