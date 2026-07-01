# Contract: Dashboard

**Flagship skill**: `skills/leadership-health/generate-dashboard.md`
**Category**: visual/scannable summary skills — also governs `analytics/*.md` dashboards (career, executive, organization, people, stakeholder, strategy)

```
Contract
  Name:                Generate Leadership Health Dashboard
  Owner:                subagents/engineering-manager.md
  Inputs:
    Required:          Master assessment output (master-leadership-health.md), 13 dimension
                        scores (score 0-100 + label + confidence), trend data (vs. previous
                        quarter)
    Optional:           EM name, assessment period, development priorities (top 3 dimensions)
  Required Outputs:      Overall health score + status, per-dimension trend (Improving/
                        Stable/Declining), top 3 development priorities — readable in
                        under 30 seconds
  Failure Conditions:    Missing or incomplete master assessment | Fewer than 13 dimension
                        scores present | No trend data available (render current-state only,
                        flag trend as "Unavailable" rather than fabricating a direction)
  Quality Checks:        Every dimension score traceable to its source skill output | Trend
                        arrows only shown when real prior-period data exists | Top 3
                        priorities match the master assessment's own prioritization, not a
                        re-derived ranking
  Version:               1.0
```

## Applies Also To

`analytics/*.md` dashboards follow the same shape: aggregate a completed assessment into a scannable, trend-aware summary, never fabricating a trend direction when prior-period data is absent. Each should get its own filled contract as they mature; this file is the reference shape until then.
