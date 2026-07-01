# Golden Output: Leadership Health Assessment — Healthy

**Skill**: `skills/leadership/master-leadership-health.md`
**Scenario**: `features/leadership-health.feature` → `@healthy` — "Healthy Leadership — all 13 dimensions green"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `master-leadership-health.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
Leadership assessment period: Q2 2026
Executive trust score: 85/100 (team trust in EM direction)
Stakeholder alignment: 88/100 (engineering priorities match expectations)
Organizational clarity: 90/100 (roles, goals, and decision rights clear)
Communication effectiveness: 87/100 (clarity, frequency, audience fit strong)
Delegation score: 82/100 (balanced ownership distribution)
Coaching score: 91/100 (regular, high-quality 1:1s and development convos)
Decision quality: 86/100 (sound, timely, durable decisions)
Ownership index: 89/100 (initiative-driven work, minimal direction required)
Team autonomy: 84/100 (independent technical and process decisions)
Influence score: 83/100 (shapes outcomes beyond direct authority)
Political awareness: 80/100 (understands org dynamics and stakeholder motivations)
Meeting quality: 85/100 (effective, time-respected, outcome-oriented)
Execution clarity: 90/100 (clear priorities, success criteria, accountability)
```

---

## Golden Output

```
LEADERSHIP STATUS: Healthy
CONFIDENCE: High — 92%
WEIGHTED SCORE: 84.2/100

DIMENSION SCORECARD:
| Dimension                | Score | Label   | Confidence |
|--------------------------|-------|---------|------------|
| executive_trust_score    | 85    | Green   | High       |
| stakeholder_alignment    | 88    | Green   | High       |
| organizational_clarity   | 90    | Green   | High       |
| communication_effectiveness | 87 | Green   | High       |
| delegation_score         | 82    | Green   | High       |
| coaching_score           | 91    | Green   | High       |
| decision_quality         | 86    | Green   | High       |
| ownership_index          | 89    | Green   | High       |
| team_autonomy            | 84    | Green   | High       |
| influence_score          | 83    | Green   | High       |
| political_awareness      | 80    | Green   | High       |
| meeting_quality          | 85    | Green   | High       |
| execution_clarity        | 90    | Green   | High       |

PILLAR ASSESSMENT:
- Trust & Relationships: Strong — consistent trust signals across executive, stakeholder, and organizational dimensions
- Communication & Influence: Strong — clear communication and effective influence beyond direct authority
- Execution & Ownership: Strong — well-balanced delegation, high ownership, and clear execution
- Team Development: Strong — excellent coaching score and team autonomy

ROOT CAUSE: None — all 13 dimensions scoring in Green zone with High confidence

RISKS:
- None material this assessment period

RECOMMENDATIONS:
- Immediate: None required
- Next quarter: Continue current practices and explore growth opportunities in influence building
- Systemic: None

DEVELOPMENT OPPORTUNITIES:
1. Influence score (83) while Green could be elevated to strengthen peer partnerships
2. Political awareness (80) is at threshold — seek opportunities to deepen org context

CROSS-DIMENSIONAL PATTERNS:
- Consistent scores across all four pillars (82–91) indicate balanced leadership capability
- No significant gaps between trust and execution dimensions
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| LEADERSHIP STATUS | Exact | Must be "Healthy" |
| CONFIDENCE label | Exact | Must be "High" |
| CONFIDENCE score | Range | Must be 88–95% |
| Weighted score | Numeric | Must be 82–86 |
| Dimension scores | Numeric | Each must be within 80–100 range |
| Root cause | Exact | Must be "None" or equivalent |
| Recommendations → Immediate | Semantic | Must indicate no immediate action required |
| Development opportunities count | Minimum | Must include at least 1 opportunity |

**Hard failures** (output must be rejected if):
- LEADERSHIP STATUS is not Healthy
- CONFIDENCE is not High
- Any recommendation names an immediate action that is not warranted
- Root cause names a cause when no cause exists
- Any dimension score is reported outside the Green zone (should be 80+)

**Soft failures** (flag for review but do not reject):
- Confidence score outside 88–95% range
- Development opportunity content is correct but phrased differently
- Recommendations include additional optional suggestions beyond "continue practices"