# Skill: Record Decision

**Domain**: Decision Memory
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — immediately after any decision with potential future reference value

---

## Purpose

Capture a new decision with full context so it becomes part of institutional memory, enabling future recall-decisions lookups and detect-patterns analysis.

**What the EM does automatically**: When a decision is made, the EM:
1. Validates that all 8 core fields are present and meaningful
2. Assigns a sequential decision ID following the schema convention
3. Assesses the decision quality using the rubric in schema.md
4. Checks for immediate pattern triggers against similar recent decisions
5. Formats and persists the record in the correct location

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Decision statement** | Clear 1-2 sentence statement of what was decided |
| **Alternatives** | List of options considered with reasoning for each |
| **Rationale** | The reasoning behind the decision including data, constraints, principles |
| **Stakeholders** | Decision makers, consulted parties, and affected teams |
| **Expected outcome** | Success criteria with measurable metrics and timeline |
| **Domain** | Classification: delivery, architecture, hiring, resource, stakeholder, process, risk |
| **Confidence** | At-time assessment: High, Medium, or Low |
| **Reversibility** | Classification: Yes, Partial, or No |

### Optional
| Input | Description |
|---|---|
| **Pattern triggers** | Known similar decisions to explicitly check against |
| **Principle application** | Specific principles invoked during decision-making |

---

## Analysis

### Step 1 — Validate Completeness

Check for all 8 core fields using the Quality Rubric:

```
Required field validation:
  Decision statement: Must be specific, not vague ("we'll try" → "we'll migrate to Rust")
  Alternatives: Minimum 2 options; record why each was considered
  Rationale: Include at least data OR intuition; better: data + principles + constraints
  Stakeholders: Minimum decision maker + 1 consulted or affected party
  Expected outcome: At least 1 measurable criterion with target date
  Domain: Must map to one of 7 schema categories
  Confidence: Must be explicitly stated; "feels right" is Low
  Reversibility: Must be classified; default to Partial if unsure
```

**Threshold check**: If any field scores 1 on the rubric, flag for missing context.

### Step 2 — Assign Decision ID

```
ID assignment logic:
  Year: Current calendar year (e.g., 2024)
  Sequence: Count existing records in decision-memory/records/ for current year
  If none exist: 001
  If DEC-2024-014 exists: 015
  Format: DEC-YYYY-NNN
```

### Step 3 — Assess Decision Quality

Using the rubric from schema.md:

```
Quality assessment:
  Alternatives breadth: 1→Poor, 2→Acceptable, 3→Strong, 3+→Excellent
  Rationale depth: Scale 1-4 as defined in schema
  Stakeholder inclusion: Scale 1-4 as defined in schema
  Outcome measurability: Scale 1-4 as defined in schema
  Learning completeness: Scale 1-4 as defined in schema

Minimum threshold for High quality: 3+ across all dimensions
Warning threshold: 2 in any dimension triggers "incomplete record" flag
```

### Step 4 — Check for Pattern Triggers

```
Pattern trigger check:
  Domain filter: Same domain as current decision
  Time window: Last 90 days for Strong signal, 180 days for Warning signal
  Context similarity: Check for same stakeholders, same constraints, same type

Alert thresholds:
  Same domain + same stakeholders + similar timeframe → Caution
  Past decision with Negative outcome + same context → Critical alert
  Pattern detected → Add to Repeated Patterns section before saving
```

### Step 5 — Format and Persist

```
Storage format:
  Location: decision-memory/records/DEC-YYYY-NNN.md
  Frontmatter: YAML with decision_id, date, domain, confidence_at_time, reversibility
  Body: Follow exact schema format with all sections
  Cross-link: Add to decision-network.md if cross-team impact
```

---

## Decision Tree

```
Is the decision significant enough to record?
├── Is this a routine operational choice (daily standup, lunch order)?
│   └── NO — Skip recording, return "routine decision"
├── Does this affect future decisions, context, or require coordination?
│   └── YES — Proceed to full record

Are all 8 core fields present?
├── Any field missing or scoring 1 on rubric?
│   └── FLAG MISSING — Return "incomplete: [field]" with guidance
│   └── Wait for user to provide missing context
└── All fields present with score ≥2?
    └── Proceed to ID assignment

Is this a repeat of a recent failure?
├── Pattern trigger check finds DEC-2024-008 (failed architecture rewrite during Q4)?
│   └── SURFACE ALERT — "WARNING: Similar decision failed 3 months ago. 
│   └── Consider alternatives or escalate for review."
│   └── Wait for user acknowledgment or override
└── No pattern match found?
    └── Proceed to record creation
```

---

## Output

### Decision Record

```
DECISION RECORDED — {{Decision ID}} — {{Date}}

DECISION RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision: {{Clear statement of what was decided}}
Domain: {{One of 7 categories}}
Confidence at time: {{High/Medium/Low}}
Reversibility: {{Yes/Partial/No}}

QUALITY SCORE: {{Rubric score: 2-4 per dimension, overall rating}}

PATTERN ALERT: {{None | Warning — similarity to DEC-ID | Critical — failed precedent}}

STORAGE LOCATION: decision-memory/records/{{DEC-YYYY-NNN}}.md

NEXT STEPS:
- Add to decision-network.md if cross-team (Y/N)
- Set reminder for outcome assessment in {{30/60/90}} days
- Follow up on reversibility tracking if Partial/No
```

---

## Examples

### High-Quality Record Example

```
DEC-2024-042 — 2024-06-15
Domain: Architecture
Confidence: Medium
Reversibility: Partial

Decision: Migrate user notifications from RabbitMQ to Kafka to reduce operational overhead and improve throughput.

Alternatives:
1. Keep RabbitMQ — Already stable, no immediate issues
2. Migrate to Kafka — Higher throughput, better tooling, but migration cost
3. Migrate to AWS SNS — Managed service, but vendor lock-in concerns

Rationale:
- Current RabbitMQ cluster requires 4 hrs/month maintenance by SRE
- Kafka throughput 5x RabbitMQ; aligns with Q3 scale requirements
- Migration estimated 3 weeks by 2 engineers
- Principles applied: tech-debt paydown, scalability-before-comfort

Stakeholders:
- Decision maker: Sarah Chen (Staff EM)
- Consulted: Mike Torres (SRE), Lisa Park (Product)
- Affected: Notification team (2 engineers), Analytics team (downstream)

Expected Outcome:
- 50% reduction in notification latency
- <1hr/month maintenance by Q4 2024
- Migration completed by 2024-07-15
- Risk: 2-week rollback window if performance degrades
```

### Low-Quality Record Example

```
INCOMPLETE — Missing Fields Detected

Missing or insufficient fields:
- Alternatives: Only 1 option provided. Add at least one alternative with trade-offs.
- Rationale: "Seemed like the right choice" scores Poor on rubric. Add data, principles, or constraints.
- Expected outcome: No measurable criteria. Add specific success metrics and timeline.

Please provide missing context before recording.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All 8 core fields present | Base: 60% |
| Decision quality ≥3 on all rubric dimensions | +20% |
| At least 2 stakeholders consulted | +10% |
| Measurable outcome criteria specified | +5% |
| Pattern trigger check performed | +5% |
| Any field scoring 1 (Poor) | -15% |
| No alternatives provided | -30% |
| Vague outcome description | -10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Decision theater** | Decision recorded but never referenced; feels performative | Set automatic outcome review reminder; require 6-month follow-up |
| **Context omission** | Key constraint or stakeholder missing; future reader would be misled | Use field validation checklist; require "constraints considered" section |
| **Hindsight contamination** | Recording outcome at decision time instead of expected outcome | Separate "Expected Outcome" from "Actual Outcome"; never fill outcome at record time |
| **Quality inflation** | Every decision rated Excellent regardless of rigor | Calibrate against rubric; peer review for High/Low ratings |
| **Stale reference** | Links to people or systems that changed | Annual review of decision links; archive outdated references |

---

## References

- `decision-memory/schema.md` — Record format, quality rubric, and ID conventions
- `decision-memory/examples/` — Complete example records at each quality level
- `skills/organizational/decision-network.md` — Cross-reference for cross-team decisions
- `docs/principles.md` — Principles to cite in rationale section

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/decision-memory/recall-decisions.md` | Retrieves this record for future decision context |
| `skills/decision-memory/detect-patterns.md` | Analyzes this record for pattern detection |
| `skills/organizational/decision-network.md` | Links to record if cross-team impact exists |
| `skills/strategy/risk-planning.md` | Informs risk assessment in expected outcome |