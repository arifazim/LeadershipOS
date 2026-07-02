# Leadership Health Module

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly, quarterly, or on-demand when leadership signals change

---

## Purpose

Leadership Health is a 13-dimension diagnostic system for engineering managers. It produces evidence-based assessments of leadership capability across trust, alignment, communication, delegation, coaching, decision quality, ownership, autonomy, influence, political awareness, meeting quality, execution clarity, and organizational clarity.

This module answers three questions:
1. Where is leadership capability strong, and where is it creating risk?
2. What patterns across dimensions reveal systemic issues?
3. What are the highest-leverage improvements for the next quarter?

**Invoke this skill when**: You need a structured leadership assessment, you are preparing for a 360 review, your manager has raised concerns about team dynamics, or you want a baseline before a promotion or role change.

**Do not invoke this skill for**: Individual performance reviews (use `skills/people/performance-review.md`), sprint delivery assessments (use `skills/delivery/review-sprint.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## How Skills Relate

The 13 dimension skills are standalone analysis procedures. Each produces a scorecard for one dimension. The master assessment pad synthesizes all 13 into a holistic leadership health score.

```
┌─────────────────────────────────────────────────────────────┐
│                  MASTER LEADERSHIP HEALTH                    │
│         (master-leadership-health.md)                        │
│                                                              │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐  │
│  │ executive_ │ │stakeholder│ │ organiz-  │ │communica- │  │
│  │ trust_score│ │ _alignment│ │ ational_  │ │ tion_effec│  │
│  │           │ │           │ │ clarity    │ │ tiveness   │  │
│  └───────────┘ └───────────┘ └───────────┘ └───────────┘  │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐  │
│  │ delegation │ │ coaching_  │ │ decision_  │ │ownership_ │  │
│  │ _score     │ │ score     │ │ quality    │ │ index      │  │
│  └───────────┘ └───────────┘ └───────────┘ └───────────┘  │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐  │
│  │team_autonomy│ │influence_ │ │political_  │ │meeting_   │  │
│  │           │ │ score     │ │ awareness  │ │ quality    │  │
│  └───────────┘ └───────────┘ └───────────┘ └───────────┘  │
│                                                              │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              execution_clarity (standalone pad)         │  │
│  └───────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### Dimension Categories

Dimensions are grouped into four leadership pillars:

| Pillar | Dimensions |
|---|---|
| **Trust & Relationships** | executive_trust_score, stakeholder_alignment, organizational_clarity, political_awareness |
| **Communication & Influence** | communication_effectiveness, influence_score, meeting_quality |
| **Execution & Ownership** | delegation_score, decision_quality, ownership_index, execution_clarity |
| **Team Development** | coaching_score, team_autonomy |

---

## Master Pad Workflow

### When to Run Full Assessment vs. Individual Skills

| Scenario | Approach |
|---|---|
| Quarterly leadership review | Full 13-dimension assessment |
| Promotion or role change | Full assessment + deep-dive on 2–3 target dimensions |
| Specific concern raised by manager or peer | Run 2–3 relevant dimensions + targeted master synthesis |
| Mid-quarter pulse check | Run 3–5 highest-risk dimensions only |
| Incident or project post-mortem | Run decision_quality + execution_clarity only |

### Running the Assessment

1. **Select dimensions**: Use the full set for quarterly reviews; 3–5 targeted dimensions for specific concerns.
2. **Gather inputs**: Collect data for each dimension using the Inputs table in each skill file. Mark unavailable inputs as `MISSING`.
3. **Execute analysis**: Run each skill's step-by-step Analysis section. Do not skip steps.
4. **Score each dimension**: Apply the Confidence Score modifier system. Record the final score and label (Green / Yellow / Red).
5. **Synthesize**: Feed all dimension scores into the master assessment pad. Apply cross-dimensional pattern recognition.
6. **Produce output**: Generate the holistic leadership health report with weighted score, prioritized recommendations, and development plan.

### Integration Points

| Integration | Description |
|---|---|
| `skills/people/performance-review.md` | Leadership health scores provide evidence for 360 and self-assessment sections |
| `skills/delivery/review-sprint.md` | Execution and decision quality dimensions correlate with sprint outcomes |
| `skills/executive/executive-communication.md` | Communication effectiveness and stakeholder alignment inform executive narratives |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Stakeholder alignment and execution clarity feed into strategic planning inputs |
| `skills/people/career-development.md` | Coaching score and team autonomy identify development opportunities for reports |
| `docs/engineering-playbook.md` | All dimensions reference playbook principles for calibration |
| `skills/leadership-health/generate-dashboard.md` | Converts master assessment into visual scannable dashboard |
| `templates/leadership-health-dashboard.md` | Dashboard artifact template for sharing and tracking |

---

## Scoring Overview

Each dimension produces:
- **Dimension Score**: 0–100
- **Label**: Green (≥ 80), Yellow (60–79), Red (< 60)
- **Confidence**: High (≥ 90%), Medium (70–89%), Low (50–69%), Speculative (< 50%)

The master assessment computes a **weighted holistic score** with cross-dimensional pattern detection. No single dimension contributes more than 25% of the total score.

---

## File Index

Dimension skills live under `skills/leadership-health/`, matching the convention used by `political-signals/` and `decision-memory/` — this module and `confidence-engine/` were the two exceptions until this reorganization.

| File | Purpose |
|---|---|
| `README.md` | This file — module overview and integration guide |
| `master-leadership-health.md` | Master assessment pad — synthesis, weighting, cross-dimensional patterns |
| `skills/leadership-health/executive_trust_score.md` | Measures leadership team trust in the EM |
| `skills/leadership-health/stakeholder_alignment.md` | Measures engineering priority-to-expectation mapping |
| `skills/leadership-health/organizational_clarity.md` | Measures role, goal, and decision-rights understanding |
| `skills/leadership-health/communication_effectiveness.md` | Measures clarity, frequency, and audience fit |
| `skills/leadership-health/delegation_score.md` | Measures ownership and decision-making distribution |
| `skills/leadership-health/coaching_score.md` | Measures 1:1 and development conversation quality |
| `skills/leadership-health/decision_quality.md` | Measures soundness, speed, and durability of decisions |
| `skills/leadership-health/ownership_index.md` | Measures initiative vs. direction requirement |
| `skills/leadership-health/team_autonomy.md` | Measures team's independent technical and process decisions |
| `skills/leadership-health/influence_score.md` | Measures shaping outcomes beyond direct authority |
| `skills/leadership-health/political_awareness.md` | Measures organizational dynamics navigation |
| `skills/leadership-health/meeting_quality.md` | Measures meeting effectiveness |
| `skills/leadership-health/execution_clarity.md` | Measures priority, success criteria, and accountability clarity |
| `skills/leadership-health/generate-dashboard.md` | Generates visual dashboard from master assessment output |
| `templates/leadership-health-dashboard.md` | Dashboard template with visual score bars and trend indicators |
