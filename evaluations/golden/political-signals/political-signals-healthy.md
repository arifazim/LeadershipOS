# Golden Output: Political Signals — Healthy

**Skill**: `skills/organizational/political-intelligence.md`
**Scenario**: `political-signals/features/political-signals.feature` → `@healthy` — "Healthy Organization — no significant political signals"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

This is the reference output. When `political-intelligence.md` is run against the input below, its output must match this golden output within the tolerance defined at the bottom of this file.

---

## Input (Canonical Test Data)

```
decision_reversals: 20 (Green)
meeting_exclusion: 15 (Green)
ownership_ambiguity: 18 (Green)
escalation_patterns: 22 (Green)
incentive_misalignment: 25 (Green)

Observation period: Last 3 months
Data sources: Meeting records, decision log, escalation log, team feedback, HR policies
Confidence per signal: All High
Previous assessment: Available (3 months ago)
```

---

## Golden Output

```
ORGANIZATIONAL RISK STATUS: Green
CONFIDENCE: High — 93%

HOLISTIC RISK SCORE: 20.0 / 100

DIMENSION SCORECARD:
| Signal                    | Score | Label | Confidence | Trend |
|---------------------------|-------|-------|------------|-------|
| decision_reversals        | 20    | Green | High       | Stable|
| meeting_exclusion         | 15    | Green | High       | Stable|
| ownership_ambiguity       | 18    | Green | High       | Stable|
| escalation_patterns       | 22    | Green | High       | Stable|
| incentive_misalignment    | 25    | Green | High       | Stable|

CROSS-DIMENSIONAL PATTERNS: None detected.

RISK ASSESSMENT:
- No material organizational risk patterns detected.
- Team operates with high transparency and clear accountability.

RECOMMENDATIONS (Ethical Response Protocol):
- This quarter: Sustain current practices. Document norms for continuity.
- Systemic: None.

MONITORING PRIORITIES:
1. Continue quarterly assessment cadence.
2. Track decision reversal rate as leading indicator.
```

---

## Tolerance Rules

When evaluating actual output against this golden output:

| Field | Match Type | Tolerance |
|---|---|---|
| Risk Status | Exact | Must be "Green" |
| Confidence label | Exact | Must be "High" |
| Holistic Risk Score | Numeric | Must be 15–25 |
| All signal labels | Exact | Must be "Green" |
| Cross-dimensional patterns | Count | Must be 0 |
| Recommendations → This quarter | Semantic | Must indicate sustain/no action required |

**Hard failures** (output must be rejected if):
- Risk Status is not Green
- Confidence is not High
- Any signal is labeled Yellow or Red
- Cross-dimensional patterns are detected

**Soft failures** (flag for review but do not reject):
- Holistic Score outside 15–25 range
- Recommendation content is correct but phrased differently
- Monitoring priorities include additional optional suggestions
