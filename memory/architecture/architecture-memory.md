# Leadership Memory: Architecture

**Domain**: Leadership Memory → Architecture
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM + technical leads (informs future architecture decisions and risk assessments)
**Cadence**: Record decisions immediately; add outcome entries 6 and 12 months after the decision

---

## Purpose

Architecture decisions carry long tails. The consequences of a choice made in Q2 may not surface until Q4 — often too late to reverse. If the EM and technical leads don't deliberately capture what was believed at decision time and what actually happened, they will repeat the same reasoning errors because the failure conditions are never made explicit. This domain is the institutional memory that connects architectural intent to architectural outcome.

**Questions this domain answers:**
- "Which technical risks did we repeatedly underestimate?"
- "What did we believe would happen with [decision] versus what actually happened?"
- "Which types of architecture decisions have aged well? Which have degraded?"
- "What concerns raised in architecture reviews proved accurate?"
- "What framing of technical constraints has been most effective with non-technical stakeholders?"

---

## Domain-Specific Entry Fields

```
Decision:              {{the architecture choice made — be specific}}
Entry type:            {{Decision record / 6-month outcome / 12-month outcome / Risk materialized}}
Decision date:         {{when the decision was made}}
Decision-makers:       {{who made or ratified the decision}}
Belief at decision:    {{what the team believed would be true as a result — the hypothesis}}
Alternatives rejected: {{what was considered and why it was ruled out}}
Risks identified:      {{what concerns were raised at decision time}}
Risks dismissed:       {{what concerns were raised but not acted on — and why}}
Outcome (6-month):     {{what actually happened — fill in retrospectively}}
Outcome (12-month):    {{longer-tail consequence — fill in retrospectively}}
Risk materialized:     {{which dismissed risk actually appeared; or "None"}}
Estimation accuracy:   {{Did the effort and timeline match the prediction? Ratio if off}}
Non-technical framing: {{how the decision was explained to non-technical stakeholders; what landed}}
```

---

## What to Record

**Decision record entries** (at time of decision):
- Any decision that meets the Type 1 classification criteria (irreversible, cross-team impact, >1 quarter of work, security/compliance, scalability risk)
- Any architecture decision that was contentious in the review — disagreement is a signal to capture

**Outcome entries** (6 and 12 months after):
- What actually happened versus what was predicted
- Which risks materialized; which risks that were dismissed actually appeared
- How the decision aged — better, worse, or as expected

**Risk materialized entries** (when a dismissed risk appears):
- What was dismissed and why
- What the actual manifestation was
- What the cost was
- What the detection signal was (could earlier detection have reduced cost?)

---

## Pattern Detection

After three or more outcome entries, look for:

**Systematically underestimated risk categories**: Is the same category of risk (operational complexity, migration effort, third-party dependency, team context-switching cost) consistently dismissed at decision time and materializing later? This is a systemic blind spot, not a one-time miss.

**Optimism calibration**: Is the team's timeline estimation consistently off in one direction? If so, by how much? Knowing the team's estimation ratio (e.g., "we consistently underestimate by 1.6x") is directly actionable.

**Framing patterns for non-technical stakeholders**: What arguments have gotten non-technical stakeholders to support engineering constraints? What has been rejected? This pattern informs how to frame the next technical constraint.

**Architecture decision aging**: Which decision types have tended to age well (still valid at 12 months), and which have degraded (required significant rework or caused problems)?

---

## Query Patterns

```
Q: "Which risks did we repeatedly underestimate?"
→ Filter by: Risk materialized ≠ None; aggregate by risk category
→ Pattern: which risk categories appear most frequently

Q: "What happened with [specific decision]?"
→ Filter by: Decision matching description; retrieve all related entries (decision + outcomes)

Q: "What did we predict vs. what actually happened?"
→ Filter by: Entry type: 6-month outcome or 12-month outcome
→ Compare: Belief at decision vs. Outcome fields

Q: "What framing has worked with non-technical stakeholders?"
→ Filter by: outcome:positive + Non-technical framing field populated
→ Pattern: which framing types consistently land

Q: "Which decisions have aged poorly?"
→ Filter by: 12-month outcome entries where outcome describes rework or problems
→ Aggregate by: common characteristics of those decisions
```

---

## Entry Log

```
ARCHITECTURE MEMORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example decision record entry]

ID: ARC-2026-01-15-001
Date: 2026-01-15
Domain: architecture
Actors: Platform team + Infrastructure lead + Engineering Manager
Entry type: Decision record
Decision: Adopt event-driven architecture for the order processing pipeline using an
  internal message broker over a third-party managed service.
Decision date: 2026-01-15
Decision-makers: Infrastructure lead (Driver); EM (Approver)
Belief at decision: Internal broker gives more control; avoids vendor lock-in; estimated
  4 weeks to implement and stabilize.
Alternatives rejected: Managed SaaS broker — rejected on cost and control; rejected
  on concern about third-party reliability in our specific use case.
Risks identified: Operational burden of running own broker; on-call complexity.
Risks dismissed: "Data loss under broker failure" — team believed the retry mechanism
  would handle all failure cases. Not fully validated.
Outcome (6-month): TBD — due 2026-07-15
Outcome (12-month): TBD — due 2026-01-15
Risk materialized: TBD
Estimation accuracy: TBD
Non-technical framing: "Running our own messaging layer gives us control over
  reliability — we're not dependent on a third party's uptime for customer orders."
  Product Director responded: "What's the risk if it goes down?" — should have had
  a prepared answer for operational failure modes.
Tags: situation:architecture-review, pattern:underestimated-risk, outcome:neutral
Related entries: DEC-2026-01-15-001

---

[Example outcome entry — added 6 months later]

ID: ARC-2026-07-15-001
Date: 2026-07-15
Domain: architecture
Entry type: 6-month outcome
Decision: Event-driven architecture for order processing (see ARC-2026-01-15-001)
Outcome (6-month): Broker operational complexity significantly underestimated. Two P1
  incidents in 6 months — both caused by broker configuration drift under load. On-call
  escalations increased 40% for the platform team. Retry mechanism did not handle the
  specific failure mode (broker timeout under sustained high load) — the dismissed risk
  materialized.
Risk materialized: "Data loss under broker failure" — partial. No permanent data loss,
  but duplicate order events were generated in 3 incidents, requiring manual reconciliation.
Estimation accuracy: Implementation was 4 weeks as predicted; ongoing operational cost
  was 3x the initial estimate.
Lesson: The team's optimism about the retry mechanism was untested under realistic failure
  conditions. Next time: any dismissed risk about failure handling must include a test
  scenario before the risk is closed. "We have retries" is not sufficient evidence.
Tags: pattern:underestimated-risk, outcome:negative
Related entries: ARC-2026-01-15-001
```

---

## Pattern Summary

```
ARCHITECTURE PATTERN PROFILE: {{Team / System}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Systematically underestimated risk categories:
  {{risk type}}: {{N times materialized after dismissal}}
  {{risk type}}: {{N times materialized after dismissal}}

Estimation calibration:
  Timeline accuracy: {{avg ratio — e.g., 1.4x overrun}}
  Complexity accuracy: {{avg ratio}}
  Operational cost accuracy: {{avg ratio}}

Decisions that have aged well (valid at 12 months):
  {{list with entry IDs}}

Decisions that degraded (required significant rework):
  {{list with entry IDs + root cause}}

Non-technical framing that landed:
  {{framing type + entry ID}}

Non-technical framing that failed:
  {{framing type + entry ID}}

Last updated: {{date}}
```

---

## Recall Output Format

```
ARCHITECTURE RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{what was asked}}
Entries reviewed: {{N}} entries, {{date range}}

PATTERN ({{Established / Emerging / Single}}):
  {{What the entries reveal}}

UNDERESTIMATED RISK HISTORY:
  {{risk category}}: appeared {{N}} times; first in entry {{ID}}
  Treatment when dismissed: {{how it was rationalized}}

ESTIMATION ACCURACY HISTORY:
  Average overrun: {{ratio}} | Worst case: {{ratio}} (entry {{ID}})

RECOMMENDATION FOR CURRENT DECISION:
  Risk to not dismiss: {{specific risk category based on pattern}}
  Framing for stakeholders: {{what has worked}}
  Test required before closing: {{what must be validated}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Decision recorded; outcome never added** | Entry log full of decision records with no outcome follow-up | 6-month and 12-month outcome entries are non-optional; create reminder at decision time |
| **Risk dismissed without evidence** | "We have retries" or "that won't happen to us" without a validation test | Any dismissed risk must include the specific evidence or test that justifies dismissal |
| **Pattern recognition blocked by pride** | Team won't acknowledge that a dismissed risk materialized | Outcome entries are written factually, not judgmentally; the goal is pattern capture, not blame |
| **Framing lessons lost** | Non-technical stakeholder engagement lessons not captured | Non-technical framing field is mandatory for any decision that required stakeholder approval |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `skills/meetings/architecture-review.md` — Architecture review skill; ADR format
- `decision-memory/decision-memory.md` — Engineering decision record (complementary)
- `analytics/master-leadership-dashboard.md` (View 5) — Innovation and architecture quality signals
