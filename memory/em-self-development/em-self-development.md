# Leadership Memory: EM Self-Development

**Domain**: Leadership Memory → EM Self-Development
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (private; inward-facing — not a team artifact)
**Cadence**: Record after each `loops/em-growth-loop.md` run; also after pressure decisions, skip-levels, and difficult messages

---

## Purpose

The rest of `memory/` captures how the team, stakeholders, and organization behave. This domain captures how the **EM** behaves — dominant defaults, growth edges, what was applied, and what was avoided under pressure.

Without this file, `em-growth-loop` has nowhere to write, and next month's self-coaching cannot close the loop on last month's edge.

**Questions this domain answers:**
- "What growth edge did I set last month, and did I actually practice it?"
- "Which default shows up when I am under time pressure?"
- "What skip-level or 360 signal about me has repeated?"
- "When did I coach the team well and still fail to apply the same standard to myself?"

---

## Domain-Specific Entry Fields

```
Period:               {{month / event}}
Growth edge set:      {{one observable behavior for the next 30 days}}
Prior edge applied?:  {{Yes / Partial / No / First entry}}
Dominant default:     {{the move the EM makes automatically under load}}
Situation weakness:   {{context where the default fails}}
Evidence:             {{decision IDs, kaizen Q9, leadership-health dimensions, skip-level themes}}
Next test:            {{upcoming situation where the new edge can be observed}}
```

---

## What to Record

- Monthly `em-growth-loop` output (required)
- A pressure decision where option collapse was noticed after the fact
- Skip-level synthesis that names the EM as subject
- A difficult message whose delivery quality can be scored
- A kaizen failure where EM behavior was an execution fault

Do not record team coaching notes here — those belong in `memory/mentoring/` or `memory/career/`.

---

## Query Patterns

```
Q: "Did I apply last month's growth edge?"
→ Filter: domain EMG, most recent entry, Prior edge applied field

Q: "What is my default under pressure?"
→ Filter: tag situation:pressure-decision + Dominant default field
```

---

## Active Entries

Count: **8** (7 backfilled from named kaizen/graph failures + 1 live monthly loop). Live coaching cadence still monthly; do not treat backfill as eight months of practiced edges.

### EMG-2026-07-01-001

```
ID: EMG-2026-07-01-001
Date: 2026-07-01
Domain: em-self-development
Month: July 2026
Confidence: Established — FAIL-001
Dominant default: Ship a new structure when a pipeline gap is named, without grepping for an existing module
Evidence: kaizen/failures.md FAIL-001 (competing memory/ stub)
Situation weakness: Architecture / layering under time pressure
Growth edge then: "When I want a new top-level directory, I will search the repo for the noun first."
Prior edge: first reconstruction
Patterns: GP-001
```

### EMG-2026-07-01-002

```
ID: EMG-2026-07-01-002
Date: 2026-07-01
Domain: em-self-development
Confidence: Established — FAIL-002
Dominant default: Finish the narrative skill; defer golden/regression
Evidence: FAIL-002 four diagnostic modules never run against goldens
Situation weakness: Quality gate skipped at "looks complete"
Growth edge then: "When a module ships, I will either run goldens the same day or file a FAIL."
Patterns: GP-002
```

### EMG-2026-07-08-001

```
ID: EMG-2026-07-08-001
Date: 2026-07-08
Domain: em-self-development
Confidence: Medium — FAIL-003 / FAIL-004 / upward-feedback
Dominant default: Design skills for aggregates (6-month counts) and miss the same-day single incident
Evidence: FAIL-003 escalation path; FAIL-004 eval gap on EM-as-subject feedback
Situation weakness: EM as the subject of skip-level / attribution-conflated feedback
Growth edge then: "When I hear I was discussed above me, I will run the single-incident path the same day."
Patterns: GP-002
```

### EMG-2026-08-20-001

```
ID: EMG-2026-08-20-001
Date: 2026-08-20
Domain: em-self-development
Confidence: High — Graph Phase 0 run log
Dominant default: Find-replace canonical paths instead of recording supersedes
Evidence: graph/migrations/2026-08-consolidation.json created after dangling refs
Situation weakness: Consolidation under delivery pressure
Growth edge then: "When I delete a pad, I will add a redirect stub and a supersedes edge in the same change."
Patterns: GP-001
```

### EMG-2026-08-31-001

```
ID: EMG-2026-08-31-001
Date: 2026-08-31
Domain: em-self-development
Confidence: Medium — strategy spec, not yet practiced
Dominant default: Optimize the team-facing OS and leave the EM un-coached
Evidence: ROADMAP v0.7 + docs/superpowers platform-evolution-strategy
Situation weakness: Inward layer missing while outward loops proliferate
Growth edge then: "When I add a team loop, I will name the EM-as-subject counterpart or explicitly defer it."
Patterns: GP-003 precursor
```

### EMG-2026-09-20-001

```
ID: EMG-2026-09-20-001
Date: 2026-09-20
Domain: em-self-development
Confidence: High — ROADMAP leftover table
Dominant default: Mark versions complete while commands, fallbacks, and status labels disagree
Evidence: leftover close (commands/em-growth, crisis goldens, crisis-loop fallbacks)
Situation weakness: Status language vs file reality
Growth edge then: "When I change a version label, I will update the leftover table in the same edit."
```

### EMG-2026-09-21-001

```
ID: EMG-2026-09-21-001
Date: 2026-09-21
Domain: em-self-development
Confidence: High — ingest _source fields
Dominant default: Treat dashboard numbers as live because the UI looks finished
Evidence: Gemini growth report at 88% on mock DORA; metrics tagged _source mock
Situation weakness: Confidence language under incomplete integrations
Growth edge then: "When I quote DORA upward, I will read _source first and say mock or live."
```

### EMG-2026-09

```
ID: EMG-2026-09
Date: 2026-09-21
Domain: em-self-development
Month: September 2026
Confidence of this record: Medium (70%) — first live loop run; DORA/Jira/PD inputs were mock (`_source: mock`). Team topology from config/team.json is real.

Dominant default identified: Protective Shield / Tactical Orchestrator — absorb agency and hierarchy friction personally; step into .NET↔Python glue and triage
Evidence: first em-growth CLI run (2026-09-21); mock 12% unplanned work, 3 incidents/30d, 8% scope inflation; four-layer reporting chain (KSheeraj → Vanessa → Jeff → Tim)
Situation weakness: Scope pressure from Social Security / health-care agency asks + dual-stack context switching with 7 engineers

Prior growth edge:
  Edge: first month
  Applied: n/a
  Assessment: First entry
  Key instance: n/a

This month's growth edge:
  "When an unplanned agency ask arrives, I will run a Trade-off Gate (capacity vs milestone slip) and name the owner, instead of absorbing the request myself."
  Confidence: Medium
  Review date: 2026-10-21 (cadence)

Supporting habits:
  - 1:1s with KSheeraj: capacity vs agency asks, risks, decisions needed — not PR/deploy vanity
  - Assign a senior as interface reviewer for .NET↔Python; EM steps back from that review
  - 15-minute cognitive-load check in 1:1s (AWS/Azure or .NET/Python switching)

Patterns closing this month: none (baseline); see GP-003
Linked failures closed: none
```

---

## Related

- `loops/em-growth-loop.md`
- `skills/mentoring/em-self-coaching.md`
- `skills/executive/pressure-decision-framework.md`
- `memory/schema.md` — prefix `EMG`
