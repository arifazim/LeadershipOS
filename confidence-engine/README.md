# Confidence Engine Module

**Domain**: Executive Confidence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly, quarterly, or before executive reviews

---

## Purpose

The Confidence Engine answers the executive question: **"Can I trust this team?"** Traditional dashboards answer "What happened?" — this module answers "How much confidence should leadership have in this team's commitments, data, and execution?"

The Confidence Engine produces evidence-based confidence assessments across six dimensions. Each recommendation includes:
- **Recommendation**: What should leadership do or expect
- **Confidence**: % score with explicit evidence trail
- **Supporting Evidence**: GitHub, Jira, Incidents, Customer Bugs, Historical Releases

This module answers three questions:
1. How much confidence should leadership place in this team's commitments and forecasts?
2. Which dimensions are eroding confidence, and what is driving the erosion?
3. What specific evidence supports or undermines confidence in each area?

**Invoke this skill when**: Preparing for executive reviews, board updates, skip-levels with directors/VPs, or when leadership has raised concerns about team reliability.

**Do not invoke this skill for**: Sprint-level delivery reviews (use `skills/delivery/review-sprint.md`), individual performance assessments (use `skills/people/performance-review.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## How Skills Relate

```
┌─────────────────────────────────────────────────────────────┐
│                  EXECUTIVE CONFIDENCE ENGINE                  │
│         (executive_confidence.md)                             │
│                                                               │
│  ┌───────────────┐ ┌───────────────┐ ┌───────────────┐      │
│  │ prediction_    │ │ data_         │ │ risk_         │      │
│  │ confidence     │ │ quality       │ │ confidence    │      │
│  └───────────────┘ └───────────────┘ └───────────────┘      │
│  ┌───────────────┐ ┌───────────────┐ ┌───────────────┐      │
│  │ delivery_      │ │ roadmap_      │ │ architecture_ │      │
│  │ confidence     │ │ confidence    │ │ confidence    │      │
│  └───────────────┘ └───────────────┘ └───────────────┘      │
│                                                               │
│  Output: Confidence scorecard + evidence-backed recommendations│
└─────────────────────────────────────────────────────────────┘
```

---

## Dimension Categories

| Category | Dimensions |
|---|---|
| **Forecasting** | prediction_confidence, data_quality |
| **Execution** | delivery_confidence, roadmap_confidence |
| **Risk & Stability** | risk_confidence, architecture_confidence |

---

## Master Pad Workflow

### When to Run Full Assessment vs. Individual Skills

| Scenario | Approach |
|---|---|
| Quarterly executive review | Full 6-dimension assessment |
| Specific incident or missed commitment | Run 2–3 relevant dimensions + targeted synthesis |
| Board update preparation | Full assessment + data_quality and delivery_confidence deep-dive |
| Roadmap reprioritization discussion | roadmap_confidence + prediction_confidence |
| Post-incident executive briefing | risk_confidence + architecture_confidence |

### Evidence Standards

Every confidence assessment must cite evidence from at least two of the following sources:
- **GitHub**: PR patterns, cycle time, deployment frequency, PR review turnaround
- **Jira**: Sprint data, story point accuracy, blocker trends, milestone completion
- **Incidents**: P1/P2 history, MTTR, post-mortem action item completion
- **Customer Bugs**: Escaped defect rate, severity distribution, time-to-detect
- **Historical Releases**: Release success rate, rollback frequency, feature adoption

---

## Scoring Overview

Each dimension produces:
- **Dimension Score**: 0–100
- **Label**: Green (≥ 80), Yellow (60–79), Red (< 60)
- **Confidence**: High (≥ 90%), Medium (70–89%), Low (50–69%), Speculative (< 50%)

The master assessment computes a **weighted executive confidence score** with cross-dimensional pattern detection. No single dimension contributes more than 30% of the total score.

---

## File Index

| File | Purpose |
|---|---|
| `README.md` | This file — module overview and integration guide |
| `executive_confidence.md` | Master assessment pad — synthesis, weighting, cross-dimensional synthesis |
| `prediction_confidence.md` | Forecast accuracy, estimation reliability, sprint goal hit rate |
| `data_quality.md` | Reporting completeness, data timeliness, dashboard accuracy |
| `risk_confidence.md` | Risk surfacing, escalation timeliness, mitigation effectiveness |
| `delivery_confidence.md` | On-time delivery, scope stability, release reliability |
| `roadmap_confidence.md` | Milestone hit rate, roadmap stability, feature delivery accuracy |
| `architecture_confidence.md` | System stability, change failure rate, technical debt trajectory |

---

## Integration Points

| Integration | Description |
|---|---|
| `skills/delivery/review-sprint.md` | Delivery confidence uses sprint analysis as primary input |
| `skills/operations/postmortem.md` | Risk confidence and architecture confidence use incident data |
| `skills/strategy/align-priorities.md` | Roadmap confidence feeds into strategic planning |
| `skills/executive/executive-status-report.md` | Executive confidence scores provide the "can we trust them" narrative |
| `integrations/github.md` | GitHub data feeds prediction, delivery, and architecture confidence |
| `integrations/jira.md` | Jira data feeds prediction, delivery, and roadmap confidence |
| `integrations/datadog.md` | Datadog data feeds architecture confidence |
| `integrations/pagerduty.md` | PagerDuty data feeds risk confidence |

---

## Output Contract

Every recommendation in the Confidence Engine follows this format:

**Recommendation**
{{Specific action or expectation for leadership}}

**Confidence**
{{X}}%

**Supporting Evidence**
- GitHub: {{Specific PR, deployment, or cycle time data}}
- Jira: {{Sprint data, milestone status, story point accuracy}}
- Incidents: {{P1/P2 count, MTTR, action item completion}}
- Customer Bugs: {{Escaped defects, severity, time-to-detect}}
- Historical Releases: {{Release success rate, rollback frequency, patterns}}

---

## Confidence Score Interpretation

| Score | Label | Executive Takeaway |
|---|---|---|
| 90–100% | High | Leadership can rely on this team's commitments and data |
| 75–89% | Medium | Leadership should validate key claims; team is mostly reliable |
| 60–74% | Low | Leadership should expect variance and have contingency plans |
| < 60% | Critical | Leadership cannot trust this team's commitments without verification |
