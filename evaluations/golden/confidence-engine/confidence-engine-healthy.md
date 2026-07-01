# Golden Output: Confidence Engine — Healthy

**Skill**: `confidence-engine/executive_confidence.md`
**Scenario**: `confidence-engine/features/confidence-engine.feature` → `@healthy` — "Healthy Confidence — all 6 dimensions green"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `executive_confidence.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
prediction_confidence: 88 (High)
data_quality: 92 (High)
risk_confidence: 85 (High)
delivery_confidence: 90 (High)
roadmap_confidence: 87 (High)
architecture_confidence: 91 (High)

GitHub: Average PR cycle time 1.2 days, deployment frequency bi-weekly, revert rate 2%
Jira: Sprint velocity 85%, milestone achievement 88%, story point accuracy 90%
Incidents: 2 P3 incidents in last quarter, no P1/P2, average MTTR 2.5 hours
Customer Bugs: 5 escaped defects per release, 0.3 per 1k users, time-to-detect average 1.5 days

EM self-assessment: Team is operating well. Strong delivery track record. Data pipelines are automated and reliable.
360 feedback: "Dependable team. Delivers on commitments. Good escalation practices. Data is trustworthy."
Previous quarter scores available: Yes
Stakeholder feedback: "Reliable forecasts. Clear roadmap. Trustworthy delivery estimates."
```

---

## Golden Output

```
CONFIDENCE ENGINE STATUS: Green
CONFIDENCE: High — 94%

EXECUTIVE CONFIDENCE SCORE: 87.4 / 100

DIMENSION SCORECARD:
| Dimension            | Score | Label | Confidence | Trend  |
|----------------------|-------|-------|------------|--------|
| prediction_confidence | 88    | Green | High       | Stable |
| data_quality         | 92    | Green | High       | Up     |
| risk_confidence      | 85    | Green | High       | Stable |
| delivery_confidence  | 90    | Green | High       | Up     |
| roadmap_confidence   | 87    | Green | High       | Stable |
| architecture_confidence | 91 | Green | High       | Stable |

CROSS-DIMENSIONAL ANALYSIS: No material conflicts. All dimensions show consistent Green status with strong evidence alignment.

EVIDENCE SYNTHESIS:
- GitHub: PR cycle time improved 15% over last quarter with reduced revert rate
- Jira: 85% velocity achievement with strong milestone completion and estimation accuracy
- Incidents: Minimal incident rate with rapid resolution; no systemic reliability issues
- Customer Bugs: Low defect escape rate with fast detection; quality gates are effective
- Historical Releases: 97% release success rate over 12 releases; zero rollbacks

RECOMMENDATIONS:
- Immediate: None required
- Next quarter: (1) Share confidence track record with executive stakeholders to reinforce trust
  (2) Consider team for increased roadmap ownership based on proven reliability
- Systemic: None

DEVELOPMENT PRIORITIES:
1. None — all dimensions are performing at or above threshold. Continue current practices.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Confidence Status | Exact | Must be "Green" |
| Confidence label | Exact | Must be "High" |
| Executive Confidence Score | Numeric | Must be 85–90 |
| All dimension labels | Exact | Must be "Green" |
| roadmap_confidence | Label | Must be "Green" (lowest dimension) |
| Recommendations → Immediate | Semantic | Must indicate no immediate action required |
| Cross-dimensional analysis | Semantic | Must confirm no conflicts detected |

**Hard failures** (output must be rejected if):
- Confidence Status is not Green
- Confidence is not High
- Any dimension is labeled Yellow or Red instead of Green
- roadmap_confidence is labeled incorrectly

**Soft failures** (flag for review but do not reject):
- Executive Confidence Score outside 85–90 range
- Recommendation content varies but intent is preserved
- Cross-dimensional analysis phrasing differs but confirms no conflicts