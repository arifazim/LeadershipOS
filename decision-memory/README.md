# Decision Memory Module

**Domain**: Institutional Knowledge & Decision Learning
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Continuous (record decisions as they happen; review patterns quarterly)

---

## Purpose

Decision Memory captures leadership decisions, their context, and their outcomes so that the organization learns from experience rather than repeating it. Most AI forgets. Leaders shouldn't.

This module transforms decision-making from a series of isolated events into an accumulated knowledge base. When facing a new decision, the AI can recall:

> "We made a similar decision eight months ago. It failed because QA capacity was underestimated."

That recall is more valuable than any dashboard.

This module answers three questions:
1. What decisions have we made, and what was the full context?
2. What did we learn from the outcome?
3. Are we repeating patterns that have failed before?

**Invoke this skill when**: Making a significant decision, preparing for a retrospective, entering a similar situation to a past decision, or when leadership wants to understand the team's decision history.

**Do not invoke this skill for**: Sprint-level tactical decisions (use `skills/delivery/review-sprint.md`), individual performance decisions (use `skills/people/performance-review.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## Decision Record Schema

Every decision is recorded as a structured artifact with the following fields:

### Core Fields
| Field | Description | Requirement |
|---|---|---|
| **Decision** | What was decided (1–2 sentences) | Required |
| **Alternatives** | What other options were considered | Required |
| **Why** | Rationale, constraints, and principles applied | Required |
| **Who** | Decision makers, consulted stakeholders, affected parties | Required |
| **Expected Outcome** | What success looks like, with measurable criteria | Required |
| **Actual Outcome** | What actually happened (filled after outcome is observable) | Required (updated post-hoc) |
| **Lessons Learned** | What the decision revealed about context, process, or judgment | Required (updated post-hoc) |
| **Repeated Patterns** | Whether this decision type has been made before with similar or different outcomes | Auto-detected |

### Supplementary Fields
| Field | Description | Requirement |
|---|---|---|
| **Decision ID** | Unique identifier (format: `DEC-YYYY-NNN`) | Auto-generated |
| **Date** | When the decision was made | Required |
| **Domain** | Category (delivery, hiring, architecture, stakeholder, resource, process) | Required |
| **Confidence at Time** | How confident the decision maker was (High/Medium/Low) | Required |
| **Reversibility** | Can this be undone? (Yes/Partial/No) | Required |
| **Stakeholder Impact** | Who is affected and how | Supplementary |
| **Context Tags** | Keywords for recall (e.g., "reorg", "Q4 freeze", "vendor change") | Supplementary |
| **Outcome Date** | When actual outcome became observable | Auto-filled |
| **Outcome Confidence** | How certain we are about the outcome assessment | Auto-filled |

---

## Decision Memory Flow

```
┌─────────────────────────────────────────────────────────────┐
│                    DECISION MEMORY CYCLE                     │
│                                                               │
│  ┌───────────┐    ┌───────────┴───────────┐    ┌──────────┐│
│  │ 1. RECORD │───▶│ 2. EXECUTE            │───▶│ 3. REVIEW││
│  │ Decision  │    │ Decision with tracking│    │ Outcome  ││
│  └───────────┘    └──────────────────────┘    └─────┬────┘│
│                                                  │      │
│  ┌───────────┐    ┌───────────┐    ┌─────────────┴────┐ │
│  │ 5. RECALL │◀───│ 4. PATTERN│◀───│ 6. UPDATE RECORD │ │
│  │ for new   │    │ DETECTION │    │ with lessons      │ │
│  │ decisions │    │ across    │    │ learned           │ │
│  └───────────┘    │ history   │    └──────────────────┘ │
│                   └───────────┘                          │
└─────────────────────────────────────────────────────────────┘
```

---

## How Skills Relate

**Interaction with other modules:**
- `confidence-engine/` — Decision outcomes feed into delivery confidence, risk confidence, and executive confidence assessments
- `political-signals/` — Decision patterns interact with decision reversals and escalation patterns
- `skills/leadership-health/decision_quality.md` — Decision quality dimension uses decision memory as evidence
- `skills/leadership-health/organizational_clarity.md` — Decision ownership clarity feeds into ownership ambiguity detection
- `skills/delivery/review-sprint.md` — Sprint outcomes include decision recall check
- `skills/operations/postmortem.md` — Incident post-mortems reference past similar incidents

---

## Master Pad Workflow

### When to Record a Decision
| Scenario | Action |
|---|---|
| Major architectural or technical decision | Record immediately |
| Hiring or team structure change | Record immediately |
| Stakeholder commitment or roadmap change | Record immediately |
| Resource allocation or priority trade-off | Record immediately |
| Process or policy change affecting the team | Record immediately |
| Incident response or post-mortem action | Record within 24 hours |
| Sprint planning scope decision | Record in sprint review |
| Weekly or 1:1 routine decisions | Do NOT record (too noisy) |

### When to Recall Decisions
| Scenario | Action |
|---|---|
| Facing a decision with similar context to past | Recall and compare |
| Preparing for executive review | Surface decision track record |
| Detecting repeated patterns | Run pattern detection |
| Onboarding a new EM or team member | Share decision history |
| Before repeating a previously failed approach | Check decision memory first |

---

## Decision Quality Rubric

Each decision record is assessed on these quality dimensions:

| Dimension | Poor | Acceptable | Strong |
|---|---|---|---|
| **Alternatives breadth** | 1 option considered | 2–3 options | 3+ options with explicit trade-offs |
| **Rationale depth** | "Seemed like the right call" | Data + judgment cited | Principles + data + stakeholder input + risk assessment |
| **Stakeholder inclusion** | Decided in isolation | Key stakeholders consulted | All affected parties input before decision |
| **Outcome measurability** | Vague "went well/poorly" | Clear success criteria cited | Quantitative + qualitative outcome assessment |
| **Learning completeness** | No learning extracted | 1–2 lessons identified | Systemic lessons + process changes identified |

---

## Pattern Detection Framework

The module detects repeated patterns across decisions:

### Pattern Types
| Pattern | Description | Risk Level |
|---|---|---|
| **Similar failure** | Same type of decision failed more than once | High |
| **Optimism bias** | Consistently over-estimated positive outcomes | High |
| **Underestimated complexity** | Repeatedly missed hidden effort or integration cost | High |
| **Stakeholder neglect** | Decisions repeatedly made without key input | Medium |
| **Reversibility trap** | Made irreversible decisions that required reversal | Medium |
| **Success blindness** | Successful decisions not replicated | Low |

### Pattern Severity
- **Critical (Red)**: 3+ instances of similar failure pattern
- **Warning (Yellow)**: 2 instances of similar failure pattern
- **Healthy (Green)**: No repeated failures; lessons actually applied

---

## File Index

| File | Purpose |
|---|---|
| `README.md` | This file — module overview, schema, and integration guide |
| `decision-memory.md` | Master pad — synthesize decisions, recall, pattern detection |
| `record-decision.md` | Skill for capturing a new decision with full context |
| `recall-decisions.md` | Skill for retrieving relevant past decisions by context |
| `detect-patterns.md` | Skill for finding repeated patterns across decision history |
| `schema.md` | Decision record format specification with examples |

---

## Integration Points

| Integration | Description |
|---|---|
| `skills/leadership-health/decision_quality.md` | Decision outcomes feed into leadership quality assessment |
| `confidence-engine/executive_confidence.md` | Decision track record builds executive confidence |
| `political-signals/decision_reversals.md` | Detected reversals cross-reference with decision memory |
| `skills/delivery/review-sprint.md` | Sprint retrospective includes decision recall |
| `skills/operations/postmortem.md` | Post-mortems reference similar past incidents |
| `docs/principles.md` | Principle 9: Learn from Every Failure — decision memory operationalizes this |
