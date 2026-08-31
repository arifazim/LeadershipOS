# Political Signals Module

**Domain**: Organizational Risk Detection & Ethical Response
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly detection + quarterly holistic review
**Canonical skill**: `skills/organizational/political-intelligence.md`
**Graph migration**: `graph/migrations/2026-08-consolidation.json` (edges `sup-016` through `sup-021`)

---

## Purpose

Detects subtle organizational risk patterns and provides ethical, transparent response strategies. Grounded in transparency, data-driven assessment, and systems thinking — not manipulation.

Answers three questions:
1. What organizational risk patterns are present, and how severe?
2. What is the root cause in system terms (not individual blame)?
3. What ethical, transparent responses de-escalate risk?

**Invoke when**: Organizational tension, unexpected pushback, information asymmetries, pre-promotion or pre-reorg assessment.

**Do not invoke for**: Individual performance (`skills/people/performance-review.md`), sprint reviews, incident post-mortems.

---

## Architecture (Post-Consolidation)

Five dimension skills + master pad consolidated into **Political Intelligence**:

```
┌─────────────────────────────────────────────────────────────┐
│         POLITICAL INTELLIGENCE (canonical)                     │
│   skills/organizational/political-intelligence.md            │
│                                                              │
│  Signal 1: Decision Reversals                                │
│  Signal 2: Meeting Exclusion                                 │
│  Signal 3: Ownership Ambiguity                               │
│  Signal 4: Escalation Patterns                               │
│  Signal 5: Incentive Misalignment                            │
│                                                              │
│  + Systemic patterns (Targeted Erasure, Power Vacuum, etc.)  │
│  + Ethical Response Protocol                                 │
│  Output → analytics/master-leadership-dashboard.md             │
└─────────────────────────────────────────────────────────────┘
```

**Deprecated paths** (redirect stubs with `supersedes` edges):
- `political-signals/political-signals.md` → canonical skill
- `skills/political-signals/{signal}.md` (5 files) → absorbed into engine

Signal names remain valid as **scenario input variables** in eval datasets.

---

## Distinction from Related Modules

| Module | Focus |
|---|---|
| **Political Intelligence** (this module) | The *environment* — org risk signals |
| `skills/leadership-health/leadership-health-engine.md` → political_awareness | The EM's *capability* within that environment |
| `skills/conflict/conflict-prediction.md` | Proactive conflict prevention |
| `skills/conflict/mediation.md` | Human resolution when conflict erupts |

**Pipeline:** Detection (political-intelligence) → Prevention (conflict-prediction) → Resolution (mediation/team-alignment)

---

## Ethical Response Framework

1. Name the pattern, not the person
2. Recommend transparency over opacity
3. Recommend dialogue over maneuvering
4. Recommend stakeholder alignment over unilateral action
5. Recommend data over narrative

**Never recommend:** manipulation, exclusion, ambiguity for accountability avoidance, escalation for positioning, misaligned incentives.

---

## Scoring Overview

| Holistic Risk Score | Status |
|---|---|
| 0–30 | Green |
| 31–40 | Yellow |
| 41–60 | At Risk |
| > 60 | Red |

Higher score = more organizational risk.

---

## File Index

| File | Purpose |
|---|---|
| `README.md` | This file — module overview |
| `skills/organizational/political-intelligence.md` | **Canonical** — unified five-signal engine |
| `political-signals/political-signals.md` | Redirect stub → canonical skill |
| `features/political-signals.feature` | BDD scenarios |
| `evaluations/golden/political-signals/` | Golden outputs (skill ref updated) |
| `evaluations/datasets/political-signals/` | Regression scenarios |

---

## Integration Points

| Integration | Description |
|---|---|
| `confidence-engine/executive_confidence.md` | Signals undermine executive trust |
| `skills/leadership-health/leadership-health-engine.md` | political_awareness dimension |
| `skills/organizational/stakeholder-analysis.md` | Cross-checks signals during stakeholder mapping |
| `memory/conflicts/` | Escalation and ownership patterns |
| `graph/artifact-contracts.md` | `PoliticalRiskArtifact` typed output schema |
