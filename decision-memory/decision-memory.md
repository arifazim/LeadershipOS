# Skill: Decision Memory Master

**Domain**: Institutional Knowledge & Decision Learning  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Continuous — record decisions as they happen; review patterns quarterly

---

## Purpose

Decision Memory is a learning system that prevents organizational amnesia. When a leader asks "what should we do?" the answer should be informed by what we have already tried.

This module transforms decision-making from a series of isolated events into an accumulated knowledge base. It answers three questions:

1. What decisions have we made, and what was the full context?
2. What did we learn from the outcome?
3. Are we repeating patterns that have failed before?

**Invoke this skill when**: Making a significant decision, preparing for a retrospective, entering a similar situation to a past decision, or when leadership wants to understand the team's decision history.

**Do not invoke this skill for**: Sprint-level tactical decisions (use `skills/delivery/review-sprint.md`), individual performance decisions (use `skills/people/performance-review.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Decision record | New or retrieved | Full decision record per `schema.md` format |
| Context query | Current situation analysis | Keywords, domain, stakeholder context |
| Historical records | Decision memory archive | All decisions in relevant domain(s) |

### From Sub-Skills

| Sub-Skill | Input Contribution |
|---|---|
| `skills/decision-memory/record-decision.md` | Complete decision record with alternatives, rationale, stakeholders |
| `skills/decision-memory/recall-decisions.md` | Relevant historical decisions matching context query |
| `skills/decision-memory/detect-patterns.md` | Pattern analysis across decision history |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Contextualize

Determine if this situation warrants recording or is significant enough to archive:

- **Significance threshold**: Decision affects ≥ 2 sprints, ≥ 3 team members, or ≥ $50k budget
- **Irreversibility check**: Can this be undone with ≤ 20% cost of original decision?
- **Stakeholder impact**: Does any stakeholder group have meaningful impact (> 10% of their work)?

If any threshold is met, proceed to recording. If not, log for sprint review instead.

### Step 2 — Record (invoke `record-decision.md`)

Run the record-decision skill when:
- A new significant decision is made
- The decision record is incomplete (missing fields)

The skill captures:
- Decision statement and alternatives
- Rationale, constraints, and principles applied
- Stakeholders (makers, consulted, affected)
- Expected outcome with measurable criteria

### Step 3 — Retrieve (invoke `recall-decisions.md`)

Run the recall-decisions skill when:
- Facing a decision with similar context
- Preparing for executive review
- Before making irreversible commitments

The skill retrieves decisions by:
- Domain match
- Stakeholder overlap
- Context tag similarity
- Outcome relevance

### Step 4 — Pattern Check (invoke `detect-patterns.md`)

Run the detect-patterns skill when:
- Decision is retrieved (always compare for pattern risk)
- New decision is being recorded (check for emerging pattern)
- Quarterly review is scheduled

The skill analyzes for:
- Similar failure patterns
- Optimism bias trends
- Complexity underestimation
- Stakeholder neglect cycles
- Reversibility trap repetitions
- Success blindness gaps

### Step 5 — Synthesize

Combine new decision with historical signal to produce:
- Quality assessment against rubric
- Historical analog comparison
- Pattern match alerts
- Recommendations for action

---

## Decision Tree

```
Is this a new decision?
├── YES → Is it significant enough to record?
│   ├── YES → Invoke record-decision.md
│   │   └── Record complete? → Proceed to Step 3
│   │       └── Historical analogs exist? → Yes → Invoke recall-decisions.md
│   │           └── Pattern risk detected? → Yes → Invoke detect-patterns.md → Warn
│   │               └── No → Continue normally
│   └── NO → Log for sprint review; do not record
└── NO → Is this a repeat context?
    ├── YES → Invoke recall-decisions.md
    │   └── Historical analogs found? → Yes → Present comparison
    │       └── Failure pattern detected? → Yes → WARN: Prior failures exist
    │           └── Success pattern detected? → Yes → Recommend replication
    │               └── No patterns → Share historical context
    └── NO → Continue with current decision
```

### Status Mapping

**Added 2026-07-01** (first regression run found this mapping was never made explicit, even though the regression dataset and golden outputs assume it): `DECISION MEMORY STATUS` derives from pattern severity and frequency (per `schema.md`'s Pattern Classification), not a numeric formula:

| Pattern State | Frequency | Status |
|---|---|---|
| No patterns detected, or Warning-severity process pattern (e.g. estimation/scope, not a failure) | First occurrence | Green |
| Warning-severity pattern | Recurring, non-failure context | Yellow |
| Failure pattern (Similar failure, Optimism bias, etc.) | Recurring (2x) | At Risk |
| Failure pattern | Repeated (3x+) or Critical severity | Red |

---

## Output

### 1. Decision Summary

State: decision ID, date, domain, confidence at time, and one-sentence summary of what was decided.

> **Example**: "DEC-2024-014 (architecture, Medium confidence): Migrate user service from monolith to microservice to improve deployment independence."

### 2. Quality Assessment

| Dimension | Score | Label | Evidence |
|---|---|---|---|
| Alternatives breadth | {{1–4}} | {{Poor/Acceptable/Strong/Excellent}} | {{Evidence from record}} |
| Rationale depth | {{1–4}} | {{Poor/Acceptable/Strong/Excellent}} | {{Evidence from record}} |
| Stakeholder inclusion | {{1–4}} | {{Poor/Acceptable/Strong/Excellent}} | {{Evidence from record}} |
| Outcome measurability | {{1–4}} | {{Poor/Acceptable/Strong/Excellent}} | {{Evidence from record}} |
| Learning completeness | {{1–4}} | {{Poor/Acceptable/Strong/Excellent}} | {{Evidence from record}} |
| **Average Quality** | **{{1.0–4.0}}** | **{{Poor/Acceptable/Strong/Excellent}}** | |

**Quality Interpretation**:
- **Excellent (3.5–4.0)**: Decision record is complete and informative
- **Strong (2.5–3.4)**: Decision record has minor gaps
- **Acceptable (1.5–2.4)**: Decision record lacks key elements
- **Poor (< 1.5)**: Decision record is insufficient; re-record required

### 3. Historical Analogs

| Decision ID | Date | Domain | Similarity | Outcome | Key Lesson |
|---|---|---|---|---|---|
| {{DEC-ID}} | {{date}} | {{domain}} | {{High/Medium/Low}} | {{Success/Failure/Mixed}} | {{1-sentence lesson}} |

If no historical decisions are relevant, state: "No historical decisions match this context."

### 4. Pattern Alerts

| Pattern Type | Detection | Severity | Evidence | Recommendation |
|---|---|---|---|---|
| {{Pattern name}} | {{Yes/No}} | {{Critical/Warning/Healthy}} | {{2–3 observations}} | {{Action to take}} |

If no patterns are detected, state: "No repeated patterns detected across decision history."

### 5. Recommendations

- **For this decision**: {{1 immediate action based on quality gap or pattern risk}}
- **For historical learning**: {{1 process improvement based on pattern detection}}
- **For system improvement**: {{1 change to decision recording or analysis process}}

---

## Examples

### Example A — New Decision with No Historical Signal

**Inputs**
- Decision record in progress: "Adopt PostgreSQL for analytics warehouse"
- Context: New architecture domain, no prior analytics decisions
- Historical records: Empty in analytics domain

**Analysis**
- Contextualize: Significance met (affects 6 months of work, 4 team members)
- Record: Invoke record-decision.md to capture full context
- Retrieve: No relevant historical decisions found
- Pattern check: No patterns (new domain)
- Synthesize: Quality assessment shows 3 alternatives, medium rationale depth

**Output Summary**
> "DEC-2024-015 (architecture, Medium confidence): Adopt PostgreSQL for analytics warehouse. Quality assessment is Strong (3.2 average). No historical decisions found in analytics domain. No patterns detected. Recommendation: Proceed with decision; this is a well-scoped first in this domain."

### Example B — Decision That Mirrors Past Failure

**Inputs**
- Decision record: "Commit to 12-week delivery with fixed scope"
- Context query: Q4 planning, resource-constrained environment
- Historical records: DEC-2023-008 (failed), DEC-2022-012 (failed)

**Analysis**
- Contextualize: Significant commitment (3-team sprint, Q4 deadline)
- Retrieve: DEC-2023-008 and DEC-2022-012 both in delivery domain
- Pattern check: "Similar failure" pattern detected (2 prior failures)
- Synthesize: Pattern alert triggered, recommendation to reconsider

**Output Summary**
> "DEC-2024-016 (delivery, High confidence): Commit to 12-week delivery with fixed scope. Historical analogs found: DEC-2023-008 (failed), DEC-2022-012 (failed). PATTERN ALERT: Similar failure pattern detected (Warning severity). Both prior decisions failed due to underestimated QA capacity and scope creep. Recommendation: Do not approve fixed-scope commitment without buffer; reference past failures in stakeholder discussion."

---

## Confidence Score

The confidence score reflects how much to trust this synthesis. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for synthesis with required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All 5 quality dimensions assessed | +10% |
| Historical decisions available and reviewed | +10% |
| Pattern detection completed | +5% |
| Decision record completeness score ≥ 80% | +5% |
| Stakeholder inclusion documented | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Decision record missing alternatives field | −10% |
| No historical decisions in relevant domain | −10% |
| Pattern detection incomplete | −5% |
| Stakeholder impact unclear | −5% |
| No outcome criteria defined | −5% |
| More than 2 pattern alerts active | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 85–100% | High | Use output directly for decision-making |
| 70–84% | Medium | Use output; validate key claims before acting |
| 50–69% | Low | Use output as hypothesis; collect additional data |
| < 50% | Speculative | Do not use for decision-making; gather missing inputs |

---

## Failure Modes

Conditions under which this synthesis produces unreliable output. Identify and flag before sharing results.

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Decision theater** | Record looks complete but lacks real alternatives | Alternatives section has 1+ options but no trade-offs explained | Require explicit trade-off criteria for each alternative |
| **Pattern blindness** | Fails to detect repeated failures in same context | Similar past failures exist but are not surfaced | Run detect-patterns.md with stricter similarity thresholds |
| **Incomplete context** | Missing alternatives or rationale | Record has "TBD" or single-sentence rationale | Require complete record before proceeding |
| **Hindsight bias** | Judging past decisions by current outcomes | Rationale cites past outcomes that weren't known at decision time | Focus on in-the-moment reasoning; separate from outcome |
| **Quality inflation** | Poor records marked as acceptable | Quality scores don't match rubric evidence | Re-assess against quality rubric; downgrade if needed |
| **Over-confidence in pattern** | Single instance treated as pattern | Pattern alert triggered on only 1 prior decision | Require minimum 2 instances for pattern classification; 1 instance is "historical signal only" |

---

## References

- `docs/principles.md` — Principle 9: *Learn from Every Failure*
- `decision-memory/schema.md` — Decision record format specification
- `skills/leadership-health/decision_quality.md` — Decision quality dimension uses decision memory as evidence
- `confidence-engine/executive_confidence.md` — Decision outcomes feed into confidence assessment
- `skills/organizational/political-intelligence.md` — Decision reversals cross-reference with decision memory (Signal 1: Decision Reversals)
- `skills/delivery/review-sprint.md` — Integration point for sprint retrospective decision recall
- `skills/operations/postmortem.md` — Incident post-mortems reference similar past incidents

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/decision-memory/record-decision.md` | Captures new decisions with full context and alternatives |
| `skills/decision-memory/recall-decisions.md` | Retrieves relevant historical decisions by context |
| `skills/decision-memory/detect-patterns.md` | Finds repeated patterns across decision history |
| `skills/leadership-health/decision_quality.md` | Decision outcomes and quality feed into EM assessment |
| `confidence-engine/executive_confidence.md` | Decision quality and learning build executive confidence |
| `skills/organizational/political-intelligence.md` | Decision reversals are tracked against original records (Signal 1) |