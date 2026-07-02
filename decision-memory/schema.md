# Decision Memory Schema

**Version**: 1.0
**Module**: `decision-memory/`

This document specifies the exact format for decision records stored in the Decision Memory module.

---

## Record Format

### Required Fields

```markdown
---
decision_id: DEC-2024-001
date: 2024-01-15
domain: architecture
confidence_at_time: Medium
reversibility: Partial
---

## Decision

{{1–2 sentence statement of what was decided}}

## Alternatives

1. {{Alternative 1}} — {{Why it was considered}}
2. {{Alternative 2}} — {{Why it was considered}}
3. {{Alternative 3}} — {{Why it was considered}} (if applicable)

## Why

### Rationale
{{The reasoning behind the decision — include data, constraints, principles applied}}

### Principles Applied
- {{Principle 1 from docs/principles.md or other framework}}
- {{Principle 2}}

### Constraints
- {{Constraint 1: budget, time, resources, dependencies}}
- {{Constraint 2}}

## Who

### Decision Makers
- {{Name/Role}} — {{Role in decision: decider,approver,advisor}}

### Consulted
- {{Name/Role}} — {{Input provided}}

### Affected
- {{Team/Role}} — {{How they are affected}}

## Expected Outcome

### Success Criteria
- {{Measurable criterion 1}}
- {{Measurable criterion 2}}

### Timeline
- {{When outcome should be observable}}

### Risk Assessment
- {{Known risks and mitigations}}

## Actual Outcome

### What Happened
{{Objective description of what actually occurred}}

### Metrics
- {{Quantitative measures: dates, numbers, percentages}}
- {{Qualitative measures: team feedback, stakeholder response}}

### Variance
| Expected | Actual | Variance | Explanation |
|---|---|---|---|
| {{metric}} | {{value}} | {{+/− %}} | {{Why}} |

### Outcome Date
{{When this assessment was completed}}

### Outcome Confidence
{{High / Medium / Low — based on data availability}}

## Lessons Learned

### What Worked
{{1–2 things that should be repeated}}

### What Did Not Work
{{1–2 things that should not be repeated}}

### Systemic Insights
{{Patterns, process gaps, or organizational dynamics revealed}}

### Applied Changes
{{What was changed in process/behavior as a result}}

## Repeated Patterns

### Similar Past Decisions
| Decision ID | Date | Domain | Similarity | Outcome | Pattern |
|---|---|---|---|---|---|
| {{DEC-ID}} | {{date}} | {{domain}} | {{High/Medium/Low}} | {{Success/Failure/Mixed}} | {{Pattern type}} |

### Pattern Classification
- **Pattern Type**: {{Similar failure | Optimism bias | Underestimated complexity | Stakeholder neglect | Reversibility trap | Success blindness | None detected}}
- **Severity**: {{Critical | Warning | Healthy}}
- **Frequency**: {{First occurrence | Recurring (2x) | Repeated (3x+)}}

### Temporal Context
- Time since similar decision: {{days/months}}
- Context similarity: {{What is the same / what is different}}
```

---

## Domain Categories

Decisions are classified into one of these domains:

| Domain | Description | Examples |
|---|---|---|
| `delivery` | Sprint, release, or feature delivery decisions | Scope commitment, release date, quality bar |
| `architecture` | Technical architecture and system design | Tech stack, service boundaries, data model |
| `hiring` | Team composition and talent decisions | Role definition, candidate selection, offer |
| `resource` | Budget, headcount, tooling | Vendor selection, tooling investment, reallocation |
| `stakeholder` | External or cross-team commitments | Roadmap promise, customer commitment, partnership |
| `process` | Team process and operating model | Meeting cadence, planning format, reporting |
| `risk` | Risk acceptance or mitigation | Security posture, compliance, incident response |

---

## Reversibility Classification

| Classification | Description | Action Required |
|---|---|---|
| `Yes` | Decision can be undone without significant cost | Safe to experiment; record reversal if undone |
| `Partial` | Decision can be reversed but with trade-offs | Document reversal cost; track reversal events |
| `No` | Decision is effectively permanent | Require extra rigor before recording; high learning value |

---

## Quality Rubric

When recording or reviewing a decision, assess against this rubric:

| Dimension | Poor (1) | Acceptable (2) | Strong (3) | Excellent (4) |
|---|---|---|---|---|
| **Alternatives breadth** | 1 option | 2 options | 3 options with trade-offs | 3+ options with explicit trade-offs and criteria |
| **Rationale depth** | "Felt right" | Data or intuition cited | Data + judgment + principles | Data + judgment + principles + stakeholder input + risk assessment |
| **Stakeholder inclusion** | Decided alone | Key stakeholders informed | Key stakeholders consulted | All affected parties had input |
| **Outcome measurability** | Vague | Clear qualitative criteria | Quantitative + qualitative | Quantitative + qualitative + timeline |
| **Learning completeness** | None | 1 lesson | Systemic + specific | Systemic + specific + applied changes |

---

## Decision IDs

Format: `DEC-YYYY-NNN`

- `YYYY`: Calendar year
- `NNN`: Sequential number within the year (001, 002, ...)
- Example: `DEC-2024-014` is the 14th decision recorded in 2024

Decision IDs are auto-assigned when a decision is recorded and never reused.

---

## Storage Conventions

**Current state**: no decision has been recorded yet, so `decision-memory/records/` doesn't exist on disk — it is created on first use by `skills/decision-memory/record-decision.md`, not pre-provisioned.

- Decisions are stored as individual Markdown files in `decision-memory/records/`
- Filename format: `DEC-YYYY-NNN.md`
- Cross-references use short ID format: `DEC-2024-014` links to `decision-memory/records/DEC-2024-014.md`
- Frontmatter uses YAML for machine-readable fields
- Body uses Markdown for human-readable narrative

---

## Example Record

**Planned — not yet built.** `decision-memory/examples/` does not exist yet; no decisions have been recorded to draw examples from. `decision-memory.md`'s own Examples A and B (in its Examples section) illustrate the expected shape until real examples exist here.
