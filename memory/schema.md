# Leadership Memory: Schema

**Domain**: Leadership Memory
**Owner**: `subagents/engineering-manager.md`
**Applies To**: All subdirectories in `memory/`
**Cadence**: Record within 24 hours of a significant event; review monthly

---

## Purpose

Leadership intelligence degrades when it lives only in the EM's head. When a VP responds unexpectedly to a proposal, when a communication style breaks through with a difficult stakeholder, when a risk pattern surfaces for the third time — those observations are organizational assets. If they are not captured, they will not be retrieved. If they are not retrieved, they will not compound into better decisions.

This schema governs all memory entries across the ten leadership memory domains. Consistent structure makes retrieval possible; retrieval makes experience actionable.

---

## Universal Entry Format

Every memory entry, regardless of domain, uses this structure:

```
MEMORY ENTRY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ID:               {{DOMAIN-YYYY-MM-DD-NNN}}
Date:             {{YYYY-MM-DD}}
Domain:           {{executive / stakeholders / career / conflicts / mentoring / promotions / architecture / roadmaps / customer-feedback / decision-history / retrospectives}}
Actors:           {{roles + names; use role when the person may change; use name when person-specific}}
Context:          {{2–3 sentences: what was the situation? what was the state of trust/momentum going in?}}
What happened:    {{specific and behavioral: what was said, done, proposed, decided — no interpretation yet}}
Outcome:          {{immediate result + downstream consequence if known; fill in retrospectively if not yet known}}
Lesson:           {{the transferable insight — framed to apply to future situations, not just this event}}
Confidence:       {{Single instance / Emerging (2–3 observations) / Established (4+) / Refuted}}
Tags:             {{see tagging taxonomy below — use tags from all four categories}}
Related entries:  {{IDs of entries in any domain that connect to this one}}
```

---

## Domain Prefixes

| Domain | Prefix | Example ID |
|---|---|---|
| executive | EXE | EXE-2026-07-01-001 |
| stakeholders | STK | STK-2026-07-01-001 |
| career | CAR | CAR-2026-07-01-001 |
| conflicts | CON | CON-2026-07-01-001 |
| mentoring | MEN | MEN-2026-07-01-001 |
| promotions | PRO | PRO-2026-07-01-001 |
| architecture | ARC | ARC-2026-07-01-001 |
| roadmaps | RMP | RMP-2026-07-01-001 |
| customer-feedback | CUS | CUS-2026-07-01-001 |
| decision-history | DEC | DEC-2026-07-01-001 |
| retrospectives | RET | RET-2026-07-01-001 |
| em-self-development | EMG | EMG-2026-08-01-001 |

---

## Tagging Taxonomy

Tags are the retrieval mechanism. Apply tags from all four categories on every entry. Under-tagging is the primary reason memory systems fail to surface relevant entries.

### Person Tags
Format: `person:[role-or-name]`

Prefer role over name for executives and stakeholders (the role persists; the person may change).
Use first name for direct reports (the relationship is person-specific).

```
person:vp-engineering       person:product-director      person:design-lead
person:cto                  person:cfo                   person:skip-level
person:peer-em              person:[engineer-first-name]  person:customer
```

### Situation Tags
Format: `situation:[type]`

```
situation:proposal-reception      situation:conflict-resolution     situation:escalation
situation:promotion-discussion    situation:roadmap-negotiation     situation:budget-ask
situation:performance-conv        situation:hiring-decision         situation:incident
situation:reorg                   situation:skip-level-meeting      situation:board-update
situation:career-conversation     situation:architecture-review     situation:executive-sync
```

### Pattern Tags
Format: `pattern:[name]`

```
pattern:underestimated-risk      pattern:communication-style       pattern:framing-effect
pattern:trust-building           pattern:trust-erosion             pattern:repeated-mistake
pattern:negotiation              pattern:stakeholder-avoidance      pattern:scope-creep
pattern:estimation-miss          pattern:coaching-response          pattern:calibration-bias
pattern:strategic-exclusion      pattern:decision-reversal         pattern:attribution-conflation
```

### Outcome Tags
Format: `outcome:[type]`

```
outcome:positive      outcome:negative      outcome:neutral
outcome:unexpected    outcome:reversed      outcome:deferred
```

---

## Confidence Levels

| Level | Label | Definition | Action |
|---|---|---|---|
| 1 | Single instance | One observation | Record; monitor for recurrence |
| 2 | Emerging | 2–3 consistent observations | Begin treating as likely; test deliberately |
| 3 | Established | 4+ consistent observations; no disconfirming evidence | Rely on; share with peers where appropriate |
| 4 | Refuted | Was Emerging or Established; subsequent evidence contradicts | Keep with refuted status and context note |

**Promotion rule**: When a new observation matches an existing pattern, update the existing entry — add an observation note and promote the confidence level. Do not create a duplicate entry.

**Refutation rule**: When an established pattern fails, add a refutation note explaining the conditions under which it failed. Context shifts (new executive, reorg, new project pressure) often explain pattern failures. Do not delete refuted entries — they define the boundary conditions of the pattern.

---

## Query Protocol

Five query types. Each maps to a primary domain and a retrieval approach.

### Q1 — Person Query
*"How has [person/role] responded to [situation type]?"*

Primary domain: executive/ or stakeholders/
Retrieval: filter by `person:[tag]` + `situation:[tag]`; sort by date descending to find most recent pattern

### Q2 — Pattern Query
*"What works when [context or situation]?"*

Primary domain: conflicts/ or stakeholders/ depending on context
Retrieval: filter by `pattern:communication-style` or `pattern:negotiation`; filter by `outcome:positive`
Cross-reference: memory/memory.md for established cross-domain patterns

### Q3 — Evidence Query
*"What evidence do I have for [claim about a person or decision]?"*

Primary domain: promotions/ for promotion claims; career/ for growth claims; decision-history/ for strategic claims
Retrieval: filter by `person:[tag]` + `situation:[type]`; collect Outcome fields

### Q4 — Risk Query
*"What risks have we repeatedly underestimated?"*

Primary domain: architecture/ for technical risks; roadmaps/ for delivery risks; decision-history/ for strategic risks
Retrieval: filter by `pattern:underestimated-risk` across all domains; Confidence = Established entries only

### Q5 — Outcome Query
*"What happened last time we [action]?"*

Primary domain: matches the action type
Retrieval: filter by `situation:[matching tag]`; retrieve Outcome field; check Related entries for cross-domain context

---

## Maintenance Rules

**Record within 24 hours.** Memory accuracy degrades rapidly. An entry written a week later is a reconstruction, not a record.

**Promote, don't duplicate.** When a new observation confirms an existing pattern, update the confidence level on the original entry and add an observation note in the Lesson field. One entry per pattern, not one entry per occurrence.

**Refute explicitly.** When a pattern fails, mark Refuted and add the failure context. Do not delete.

**Review monthly.** Scan for Single instance entries older than 90 days — either they have been confirmed (promote) or they were isolated events (add a note and archive).

**Cross-link generously.** The same event often creates entries in multiple domains. Link them. Cross-domain connections surface the patterns that single-domain analysis misses.

**Never treat memory as fact without verification.** Memory entries describe what appeared to be true at the time of recording. Before acting on a recalled pattern, verify current conditions — people change, context shifts, priorities evolve.

---

## Memory Decay Rules

Memory degrades in two distinct ways: entries become stale (the world has changed), and entries accumulate noise (too many low-signal records dilute the high-signal ones). Decay rules govern both.

### Decay Tiers

Every entry has an implicit decay tier based on its confidence level and age. Apply these tiers during the monthly review.

| Tier | Condition | Action |
|---|---|---|
| **Active** | Any entry < 90 days old, regardless of confidence | No action — in active recall window |
| **Watch** | Single instance entry 90–180 days old with no confirming observation | Add `[WATCH]` tag; flag for deliberate testing in next relevant situation |
| **Stale** | Single instance entry > 180 days old with no confirming observation | Add `[STALE — archive if not confirmed by {{date + 90 days}}]` note |
| **Archive** | Stale entry that reaches its archive deadline without confirmation | Move to `## Archived Entries` section in the domain file; add archive date and reason |
| **Decay-weight** | Emerging or Established entry > 12 months since last confirming observation | Add `[DECAY-WEIGHT]` tag; treat as one confidence level lower until reconfirmed |
| **Context-expired** | Any entry where a major context shift has occurred (new executive, reorg, role change, team restructure) | Add `[CONTEXT-EXPIRED — revalidate before use]` note; do not delete |

### Decay Clock Rules

- The decay clock starts on the **entry date**, not the event date.
- The clock **resets** when a new confirming observation is added (update the Last confirmed date).
- The clock does **not** reset when an entry is merely referenced — only new confirming evidence resets it.
- Refuted entries are **exempt from decay archival** — they are permanently retained as boundary-condition records.

### Archival Mechanics

When an entry is archived, it moves within its domain file to a clearly marked `## Archived Entries` section at the bottom. It is not deleted. The entry retains its full content and gains two additional fields:

```
Archived:     {{YYYY-MM-DD}}
Archive reason: {{Stale — no confirming observation in 270 days / Context-expired — [explain shift] / Superseded by {{entry ID}}}}
```

Archived entries remain searchable. If a previously archived pattern re-emerges, restore it to Active status with a new observation note — do not create a duplicate entry.

### Decay-Weight Application

A Decay-weight entry should be surfaced in recall responses with an explicit caveat:

```
[DECAY-WEIGHT] This pattern was Established but has not been confirmed in > 12 months.
Treat as Emerging (not Established) until reconfirmed. Last confirmed: {{date}}.
```

### Context-Expiry Triggers

Apply `[CONTEXT-EXPIRED]` immediately — do not wait for monthly review — when any of the following occur:

- The person an entry describes changes roles, leaves, or joins the team
- A reorg changes the reporting structure or team composition
- The EM changes roles (their own patterns observed in a prior context may not transfer)
- A major project or product pivot changes what "good delivery" looks like for this team

### What Does Not Decay

| Entry type | Decay applies? | Reason |
|---|---|---|
| Refuted entries | No | Failure conditions are permanent boundary records |
| Archived entries (already archived) | No | Already out of active recall |
| Established entries < 12 months since last confirmation | No | Still within active validity window |
| Decision-history entries linked to outcomes | No | Outcome facts do not expire (the decision happened) |

---

## Cross-Domain Linking

A single significant event frequently generates entries in multiple domains. Example: A promotion conversation with the VP that reveals calibration bias and triggers a career conversation generates three linked entries:

```
EXE-2026-07-01-003 → PRO-2026-07-01-001 → CAR-2026-07-01-002
```

Cross-domain patterns that emerge from linked entries are recorded in `memory/memory.md` as the master observation surface.

---

## What This Module Is Not

This module captures **leadership patterns** — relationship dynamics, communication effectiveness, organizational behavior. It does not replace:

- `decision-memory/` — engineering and organizational decisions with full rationale context
- `analytics/` — scored metrics dashboards
- `skills/performance/` — structured performance assessment tools

When an event generates both a leadership lesson and a formal decision record, create entries in both modules and cross-link them.

---

## References

- `memory/memory.md` — Master recall engine and cross-domain pattern detection
- `decision-memory/schema.md` — Engineering decision schema (distinct scope)
- All domain files in `memory/` subdirectories
