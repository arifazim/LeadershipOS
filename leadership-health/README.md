# Leadership Health Module

**Domain**: Leadership
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly assessment + continuous signal monitoring
**Canonical skill**: `skills/leadership-health/leadership-health-engine.md`
**Graph migration**: `graph/migrations/2026-08-consolidation.json` (edges `sup-001` through `sup-014`)

---

## Purpose

Leadership Health is a 13-dimension diagnostic system for engineering managers. It produces evidence-based assessments of leadership capability across trust, alignment, communication, delegation, coaching, decision quality, ownership, autonomy, influence, political awareness, meeting quality, and execution clarity.

This module answers three questions:
1. Where is leadership capability strong, and where is it creating risk?
2. What patterns across dimensions reveal systemic issues?
3. What are the highest-leverage improvements for the next quarter?

**Invoke when**: Structured leadership assessment, 360 prep, manager concerns about team dynamics, baseline before promotion or role change.

**Do not invoke for**: Individual performance reviews (`skills/people/performance-review.md`), sprint delivery (`skills/delivery/review-sprint.md`), incident post-mortems (`skills/operations/postmortem.md` — planned).

---

## Architecture (Post-Consolidation)

The module previously split 13 dimension skills + a master synthesis pad. These are now **one unified engine**:

```
┌─────────────────────────────────────────────────────────────┐
│           LEADERSHIP HEALTH ENGINE (canonical)                 │
│     skills/leadership-health/leadership-health-engine.md     │
│                                                              │
│  Pillar 1: Trust & Relationships                             │
│    executive_trust · stakeholder_alignment ·                 │
│    organizational_clarity · political_awareness              │
│                                                              │
│  Pillar 2: Communication & Influence                         │
│    communication_effectiveness · influence_score ·           │
│    meeting_quality                                           │
│                                                              │
│  Pillar 3: Execution & Ownership                             │
│    delegation_score · decision_quality · ownership_index ·   │
│    execution_clarity                                         │
│                                                              │
│  Pillar 4: Team Development                                  │
│    coaching_score · team_autonomy                            │
│                                                              │
│  Output → analytics/master-leadership-dashboard.md           │
└─────────────────────────────────────────────────────────────┘
```

**Deprecated paths** (redirect stubs with `supersedes` edges in graph migration):
- `leadership-health/master-leadership-health.md` → canonical engine
- `skills/leadership-health/{dimension}_score.md` (13 files) → absorbed into engine
- `skills/leadership-health/generate-dashboard.md` → `analytics/master-leadership-dashboard.md`

Dimension names remain valid as **scenario input variables** in eval datasets and feature files.

---

## Workflow

| Scenario | Approach |
|---|---|
| Quarterly leadership review | Full 13-dimension assessment via engine |
| Promotion or role change | Full assessment + deep-dive on 2–3 target dimensions |
| Specific concern from manager/peer | Engine with 3–5 dimension scores as focused inputs |
| Mid-quarter pulse | Engine with highest-risk dimensions only |
| Post-mortem leadership angle | Focus on decision_quality + execution_clarity inputs |

### Steps

1. Gather inputs for each relevant dimension (mark unavailable as `MISSING`)
2. Run `skills/leadership-health/leadership-health-engine.md` Analysis + scoring
3. Apply systemic pattern detection (Micromanagement, Trust Deficit, Clarity Gap, etc.)
4. Produce development plan (top 3 priorities)
5. Log to `memory/executive/` or `memory/mentoring/` if durable pattern emerged

---

## Scoring Overview

| Holistic Score | Status |
|---|---|
| 80–100 | Green — strong leadership |
| 60–79 | Yellow — functional with localized gaps |
| 40–59 | At Risk — structured intervention required |
| 0–39 | Red — leadership crisis |

Each dimension: 0–100 score + Green/Yellow/At Risk/Red label + confidence level.

---

## Integration Points

| Integration | Description |
|---|---|
| `analytics/master-leadership-dashboard.md` | Operational dashboard consuming engine output |
| `skills/people/performance-review.md` | Leadership scores as 360 evidence |
| `skills/delivery/review-sprint.md` | Execution/decision dimensions correlate with sprint outcomes |
| `skills/executive/executive-communication.md` | Communication + stakeholder dimensions inform exec narratives |
| `skills/organizational/political-intelligence.md` | Org risk signals vs. EM political_awareness dimension |
| `graph/artifact-contracts.md` | `LeadershipHealthArtifact` typed output schema |

---

## File Index

| File | Purpose |
|---|---|
| `README.md` | This file — module overview |
| `skills/leadership-health/leadership-health-engine.md` | **Canonical** — unified 13-dimension engine |
| `leadership-health/master-leadership-health.md` | Redirect stub → canonical engine |
| `features/leadership-health.feature` | BDD scenarios (dimension names as inputs) |
| `evaluations/golden/leadership-health/` | Golden outputs (skill ref updated to engine) |
| `evaluations/datasets/leadership-health/` | Regression scenarios |
| `templates/leadership-health-dashboard.md` | Dashboard artifact template |
