# Analytics

**Domain**: Leadership Analytics
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly refresh + quarterly deep dive
**Canonical dashboard**: `analytics/master-leadership-dashboard.md`
**Graph migration**: `graph/migrations/2026-08-consolidation.json` (edges `proj-001` through `proj-007`)

---

## Purpose

Operational dashboards answering "is this healthy?" for different leadership audiences. Unlike `leadership-health/`, `confidence-engine/`, and `political-signals/` (fixed-dimension scoring modules), analytics aggregates outputs from those modules plus delivery, people, and strategy skill families into scannable views.

**Post-consolidation:** Six separate dashboard files merged into one **Master Leadership Dashboard** with five views. Old dashboard paths are redirect stubs pointing to the relevant view.

---

## Master Dashboard Views

| View | Replaces (deprecated) | Answers |
|---|---|---|
| **View 1: Executive Confidence** | `executive-dashboard.md` | Can I trust this team to deliver? |
| **View 2: Delivery & Strategic Impact** | `strategy-dashboard.md` (partial) | Is the team shipping what matters? |
| **View 3: Organizational Health & People Risk** | `career-dashboard.md`, `people-dashboard.md`, `organization-dashboard.md` | Is the team healthy, growing, likely to stay? |
| **View 4: Stakeholder & Cross-Functional Alignment** | `stakeholder-dashboard.md` | Is engineering a trusted partner? |
| **View 5: Innovation & Future Readiness** | `strategy-dashboard.md` (partial) | Are we building for the future? |

---

## Pipelines

### Executive / Board

```
confidence-engine/executive_confidence.md
  → analytics/master-leadership-dashboard.md (View 1)
  → skills/executive/board-level-summary.md
```

Do not skip stages — each performs a distinct transformation.

### Leadership Assessment

```
skills/leadership-health/leadership-health-engine.md
  → analytics/master-leadership-dashboard.md
```

### Political Risk

```
skills/organizational/political-intelligence.md
  → analytics/master-leadership-dashboard.md
```

---

## Relationship to Scoring Modules

`leadership-health/`, `confidence-engine/`, and `political-signals/` each score a fixed dimension set with defined weighting. Analytics dashboards **aggregate** those outputs — they do not define new scored dimensions. Add new dimensions in the scoring modules, not new analytics files.

---

## File Index

| File | Status |
|---|---|
| `master-leadership-dashboard.md` | **Canonical** — five views, thresholds, action triggers |
| `executive-dashboard.md` | Redirect → View 1 |
| `strategy-dashboard.md` | Redirect → Views 2 + 5 |
| `career-dashboard.md` | Redirect → View 3 |
| `people-dashboard.md` | Redirect → View 3 |
| `organization-dashboard.md` | Redirect → View 3 |
| `stakeholder-dashboard.md` | Redirect → View 4 |
| `README.md` | This file |

---

## Contract Coverage

`contracts/dashboard.contract.md` defines the reference shape (scores, thresholds, scorecards). The master dashboard follows that shape at the format level; each view computes its own multi-metric composite.

---

## Graph Integration

Dashboard outputs map to `LeadershipHealthArtifact` and `PoliticalRiskArtifact` in `graph/artifact-contracts.md`. Future role-aware filtering (M1/M2/M3) will project subgraphs of the master dashboard — Phase 1.
