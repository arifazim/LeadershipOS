# Skill: Executive Confidence

**Domain**: Executive Confidence — Master Synthesis
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly or on-demand

---

## Purpose

Synthesize all six confidence dimensions into an overall "Can I trust this team?" score for executive decision-making. Executive confidence answers: "Given all available evidence across prediction, roadmap, architecture, delivery, data, and risk, what is my confidence in this team's ability to execute and deliver reliably?"

This skill answers three questions:
1. What is the aggregated confidence across all operational dimensions?
2. Are there systemic patterns indicating deeper organizational issues?
3. What should leadership know to make informed investment and trust decisions?

**Invoke this skill when**: Preparing board updates, quarterly business reviews, investment decisions, or when leadership questions overall team trustworthiness.

**Do not invoke this skill for**: Individual dimension analysis (use the specific confidence skills), tactical delivery issues (use `delivery_confidence.md`), or data quality specific concerns (use `data_quality.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Prediction confidence score | `prediction_confidence.md` | Score/100 with evidence |
| Roadmap confidence score | `roadmap_confidence.md` | Score/100 with evidence |
| Architecture confidence score | `architecture_confidence.md` | Score/100 with evidence |
| Delivery confidence score | `delivery_confidence.md` | Score/100 with evidence |
| Data quality confidence score | `data_quality.md` | Score/100 with evidence |
| Risk confidence score | `risk_confidence.md` | Score/100 with evidence |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Cross-dimensional correlations | Analysis | Patterns across multiple dimensions |
| Historical trend data | All skills | Time-series confidence scores |
| Stakeholder sentiment | Customer success | Qualitative confidence indicators |
| Investment alignment | Product planning | Budget/spend vs. confidence trajectory |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Weighted Score Aggregation

**Fixed 2026-07-01**: this step previously capped every dimension's raw score at 30 before weighting (`Min(score, 30) × weight`), which caps the maximum possible total at 30 regardless of input — reproducing none of the documented examples or golden outputs (e.g. CE-01's all-Green inputs would compute to 30, not the golden 87.4). Confirmed via reverse-engineering: a plain weighted sum with no cap reproduces CE-01 (88.8 vs. golden 87.4, within the 85-90 tolerance) and CE-07 (33.45 vs. golden 38.2, within soft tolerance). The weights themselves already correctly sum to 100% — only the cap was wrong.

Calculate weighted confidence score:

| Dimension | Weight | Calculation |
|---|---|---|
| Prediction | 25% | score × 0.25 |
| Roadmap | 20% | score × 0.20 |
| Architecture | 20% | score × 0.20 |
| Delivery | 15% | score × 0.15 |
| Data Quality | 10% | score × 0.10 |
| Risk | 10% | score × 0.10 |

Sum all weighted contributions. Weights sum to 100% — no remaining weight to distribute.

### Step 2 — Cross-Dimensional Pattern Detection

Identify systemic patterns across all dimensions (each pattern must be triggered by evidence in at least 2 dimensions):

| Pattern | Detection Criteria | Impact |
|---|---|---|
| **Blind Optimism Pattern** | Prediction (Red), Roadmap (Yellow/Red), Delivery (Yellow) | Undermines forecasting credibility |
| **Data Opacity Pattern** | Data Quality (Red), Architecture (Yellow), Prediction (Yellow) | Creates hidden risk exposure |
| **Delivery-Instability Pattern** | Delivery (Red/Yellow), Architecture (Red/Yellow), Roadmap (Yellow) | Execution reliability questioned |
| **Risk Blindness Pattern** | Risk (Red), Prediction (Red), Architecture (Red) | Unmanaged exposure accumulation |
| **Reliability Erosion Pattern** | Architecture (Red), Delivery (Yellow), Data Quality (Yellow) | Systemic degradation underway |

### Step 3 — Confidence Distribution Analysis

Analyze score distribution across dimensions:
- **All Green (≥80)**: Strong confidence, no immediate concerns
- **Multiple Yellow (60–79)**: Warning signs, requires attention
- **Any Red (<60)**: Critical issues requiring immediate action
- **Wide variance**: Some dimensions strong, others weak — identify disconnect

### Step 4 — Trend Synthesis

Combine individual dimension trends into overall trajectory:
- Improving: 3+ dimensions trending up
- Stable: No significant trend changes
- Degrading: 2+ dimensions trending down

---

## Decision Tree

**Fixed 2026-07-01**: this tree previously had only 3 bands (Green ≥80 / Yellow 60-79 / Red <60), inconsistent with this skill's own feature file (`confidence-engine/features/confidence-engine.feature`), which defines 4 bands (80-100 Healthy / 70-79 Warning / 60-69 At Risk / 0-59 Critical). Corrected to match.

```
What is the overall executive confidence classification?
│
├── ≥ 80 (Green) ────────────────────────────────────────────────
│   Are there any systemic patterns detected?
│   ├── NO  → OUTCOME: Team is trustworthy across all dimensions.
│   │         Recommendation: Continue investment; share confidence track record.
│   └── YES → OUTCOME: Overall confidence high but patterns indicate emerging risk.
│               Recommendation: Address patterns proactively; monitor closely.
│
├── 70–79 (Yellow) ─────────────────────────────────────────────
│   How many dimensions are Yellow/Red and what patterns emerge?
│   ├── SINGLE DIMENSION → OUTCOME: Targeted improvement needed.
│   │           Recommendation: Focus on weak dimension; other dimensions support recovery.
│   └── MULTIPLE DIMENSIONS → OUTCOME: Systemic issues require broad attention.
│               Recommendation: Conduct holistic review; consider organizational interventions.
│
├── 60–69 (At Risk) ────────────────────────────────────────────
│   OUTCOME: Confidence is materially compromised across multiple dimensions.
│   Recommendation: Conduct holistic review this cycle. Name the 1-2 dimensions driving
│         the drop and commit to a specific remediation timeline before the next assessment.
│
└── < 60 (Red) ──────────────────────────────────────────────────
    OUTCOME: Team confidence is critically compromised.
    Recommendation: Escalate to leadership; consider restructuring or intervention.
    Immediate action: EM to present detailed dimension breakdown and remediation plan.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: overall confidence score, primary patterns detected, trend direction, and one immediate action. Include confidence level.

> **Example**: "Executive confidence is 74 (Yellow). The delivery-instability pattern is detected: Delivery confidence dropped to 58 while Architecture fell to 61. Prediction and Roadmap remain stable at 82 and 79 respectively. Trend is degrading over the last two assessments. Immediate action: EM to present detailed remediation plan before next leadership review. Confidence: High (90%)."

### 2. Confidence Scorecard

| Dimension | Score | Weight | Weighted | Status |
|---|---|---|---|---|
| Prediction | {{score}} | 25% | {{weighted}} | {{color}} |
| Roadmap | {{score}} | 20% | {{weighted}} | {{color}} |
| Architecture | {{score}} | 20% | {{weighted}} | {{color}} |
| Delivery | {{score}} | 15% | {{weighted}} | {{color}} |
| Data Quality | {{score}} | 10% | {{weighted}} | {{color}} |
| Risk | {{score}} | 10% | {{weighted}} | {{color}} |
| **Overall Confidence** | **{{score}}/100** | **100%** | | **{{color}}** |

### 3. Cross-Dimensional Patterns

| Pattern | Detected | Evidence |
|---|---|---|
| Blind Optimism | {{Yes/No}} | {{Dimension evidence if Yes}} |
| Data Opacity | {{Yes/No}} | {{Dimension evidence if Yes}} |
| Delivery-Instability | {{Yes/No}} | {{Dimension evidence if Yes}} |
| Risk Blindness | {{Yes/No}} | {{Dimension evidence if Yes}} |
| Reliability Erosion | {{Yes/No}} | {{Dimension evidence if Yes}} |

### 4. Evidence Log

- **GitHub**: {{PR patterns across dimensions, architectural changes, deployment data}}
- **Jira**: {{Milestones, sprint data, incident tickets, tech debt items}}
- **Incidents**: {{Production incidents, their dimension impact, resolution patterns}}
- **Customer Bugs**: {{Escaped defects, reliability complaints}}
- **Historical Releases**: {{Release success rates, confidence trend history}}

### 5. Recommendations

Each recommendation MUST include Confidence % and Supporting Evidence in the format:

**Recommendation**
{{Action or expectation for leadership}}

**Confidence**
{{X}}%

**Supporting Evidence**
- GitHub: {{Specific data}}
- Jira: {{Specific data}}
- Incidents: {{Specific data}}
- Customer Bugs: {{Specific data}}
- Historical Releases: {{Specific data}}

**This sprint**: {{1 immediate action with named owner and date}}
**Next quarter**: {{1 planning change to implement}}
**Systemic** (if applicable): {{1 change requiring sustained effort}}

---

## Examples

### Example A — Healthy Executive Confidence

**Inputs**
- Prediction: 88 (High)
- Roadmap: 91 (High)
- Architecture: 85 (High)
- Delivery: 82 (High)
- Data Quality: 94 (High)
- Risk: 89 (High)

**Output Summary**
> Executive confidence is 88 (High). All dimensions score in the Green zone with Prediction at 88, Roadmap at 91, and Architecture at 85. No systemic patterns detected; confidence trajectory is stable. This team demonstrates strong trustworthiness across all operational dimensions. Confidence: High (94%).

**Recommendations**
- *This sprint*: None required; continue current practices.
- *Next quarter*: Share confidence track record to support increased investment.
- *Systemic*: None.

---

### Example B — At-Risk Executive Confidence

**Inputs**
- Prediction: 72 (Yellow)
- Roadmap: 58 (Red)
- Architecture: 61 (Yellow)
- Delivery: 55 (Red)
- Data Quality: 78 (Yellow)
- Risk: 65 (Yellow)
- Cross-dimensional patterns: Delivery-Instability pattern detected (Delivery Red, Architecture Yellow, Roadmap Red)

**Output Summary**
> Executive confidence is 59 (Red). The delivery-instability pattern is active: Delivery confidence is 55, Roadmap is 58, and Architecture has dropped to 61. Prediction and Data Quality remain stable but cannot offset execution risks. Confidence trajectory is degrading over the last two assessments. Confidence: High (88%).

**Recommendations**
- *This sprint*: EM to present detailed remediation plan to leadership within 5 business days.
- *Next quarter*: Restructure sprint planning process; allocate dedicated architecture stability capacity.
- *Systemic*: Implement cross-dimensional confidence dashboard for early warning detection.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All 6 dimension scores available | +10% |
| Cross-dimensional patterns identified | +5% |
| Trend data available (≥3 periods) | +5% |
| Stakeholder sentiment aligned | +5% |
| Pattern detection supported by multiple data points | +5% |
| One or more dimension scores MISSING | −15% each |
| < 2 periods of trend data | −10% |
| Stakeholder sentiment contradicts metrics | −5% |
| Pattern detection based on single indicator | −5% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Dimension masking** | Strong dimensions hide weak ones | One Red dimension hidden by multiple Green | Report all dimensions; require explanation for any Red |
| **Pattern denial** | Team dismisses cross-dimensional signals | No action on detected patterns; repeated issues | Escalate pattern detection with stronger evidence |
| **Score inflation** | Individual dimensions overstate confidence | All scores Green but incidents increasing | Validate scores against independent evidence; adjust downward |
| **Weight manipulation** | Weights changed to hide weak dimensions | Unexplained weight changes; inconsistent methodology | Lock weights in configuration; require approval for changes |
| **Evidence cherry-picking** | Selective evidence supports high score | Evidence omits negative indicators | Require complete evidence log; cross-reference sources |
| **Temporal gaming** | Recent good performance hides long-term issues | No trend data; only current period shown | Require historical trend analysis; compare to baseline |

---

## References

- `CLAUDE.md` — Confidence scoring scale; multi-dimensional assessment framework
- `docs/principles.md` — Principle 5: Data over Opinions; Principle 12: Measure Outcomes
- `docs/engineering-playbook.md` → *Executive Communication*, *Confidence Reporting*, *Cross-Dimensional Analysis*
- `skills/confidence-engine/prediction_confidence.md` — Prediction dimension methodology
- `skills/confidence-engine/roadmap_confidence.md` — Roadmap dimension methodology
- `skills/confidence-engine/architecture_confidence.md` — Architecture dimension methodology
- `skills/confidence-engine/delivery_confidence.md` — Delivery dimension methodology
- `skills/confidence-engine/data_quality.md` — Data quality dimension methodology
- `skills/confidence-engine/risk_confidence.md` — Risk dimension methodology

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/confidence-engine/prediction_confidence.md` | Provides prediction dimension score and analysis |
| `skills/confidence-engine/roadmap_confidence.md` | Provides roadmap dimension score and analysis |
| `skills/confidence-engine/architecture_confidence.md` | Provides architecture dimension score and analysis |
| `skills/confidence-engine/delivery_confidence.md` | Provides delivery dimension score and analysis |
| `skills/confidence-engine/data_quality.md` | Provides data quality dimension score and analysis |
| `skills/confidence-engine/risk_confidence.md` | Provides risk dimension score and analysis |
| `skills/communication/executive-update.md` — Uses this skill's output for leadership communication |
| `skills/strategy/planning.md` — Planning decisions require confidence input |