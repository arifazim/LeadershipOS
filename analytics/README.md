# Analytics

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Mostly monthly refresh (career-dashboard is quarterly); each file's own header states its exact cadence

---

## Purpose

Six operational dashboards, each answering a different "is this healthy?" question for a different audience — career trajectory, executive trust, organizational structure, individual people signals, stakeholder relationships, and strategic execution. Unlike `leadership-health/`, `confidence-engine/`, and `political-signals/` (which score the *EM's own* capability or the *organization's* risk posture through a fixed dimension set), analytics dashboards are broader operational scorecards that pull from many skill families at once — performance, people, meetings, DORA, political-signals — and render them as something scannable in a skip-level or exec review.

This module was previously undocumented — six real, non-duplicative files with no module-level README, unlike every comparable module in this repo. Found during the 2026-07-01 full-project audit.

## File Index

| File | Audience | Answers |
|---|---|---|
| `career-dashboard.md` | EM, HR partner, skip-level | Is each direct report's career momentum healthy, or is stagnation risking attrition? |
| `executive-dashboard.md` | VP/C-suite/Board | Can I trust this team to deliver? |
| `organization-dashboard.md` | EM, leadership team | Can the organization sustain performance over 12+ months? |
| `people-dashboard.md` | EM, HR partner | Which direct report needs which intervention, and how urgently? |
| `stakeholder-dashboard.md` | EM, cross-functional partners | Is engineering a trusted partner or a bottleneck others route around? |
| `strategy-dashboard.md` | EM, executives, product leadership | Is engineering executing against strategy, or has execution drifted from it? |

## How the Six Relate

These are not six independent scorecards — several share computed metrics and explicitly reference each other rather than recomputing:

- `stakeholder-dashboard.md` and `organization-dashboard.md` share a Cross-Functional Alignment Score.
- `career-dashboard.md`'s index feeds `people-dashboard.md`'s career-momentum column.
- `executive-dashboard.md` consumes `confidence-engine/executive_confidence.md` as one of six inputs, adds DORA/Customer Impact/Risk Signal Index, and is itself consumed downstream by `skills/executive/board-level-summary.md` for the jargon-free board translation.

The intended pipeline for executive-facing output is: `confidence-engine/` (dimension scoring) → `analytics/executive-dashboard.md` (operational scorecard + narrative draft) → `skills/executive/board-level-summary.md` (board-ready translation). Don't skip a stage — each does a distinct transformation.

## Relationship to Other Scoring Modules

`leadership-health/`, `confidence-engine/`, and `political-signals/` each score a fixed dimension set with a defined weighting formula and produce a Health/Confidence/Risk label. Dashboards here don't define new scoring dimensions — they aggregate outputs from those modules plus other skill families (performance, people, meetings) into an audience-specific view. If you need a new scored dimension, it belongs in one of those three modules, not a new analytics dashboard.

## Contract Coverage

`contracts/dashboard.contract.md` names `skills/leadership-health/generate-dashboard.md` as its flagship and states these six files follow the same shape — true at the format level (scores/thresholds/scorecards), but each computes its own bespoke multi-metric composite rather than visualizing one existing master assessment. Treat the contract as the reference shape, not yet an enforced spec per-dashboard.
