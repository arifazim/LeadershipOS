# Skill: Prediction Confidence

**Domain**: Executive Confidence — Forecasting
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or end of quarter
**Contract**: `contracts/prediction.contract.md`
**Loop**: `loops/prediction-loop.md` (standalone, cadence-bound invocation)

---

## Purpose

Measure how accurately the team predicts its own delivery capacity and timeline. Prediction confidence answers: "When this team says they will deliver something, how often does that prediction match reality?"

This skill answers three questions:
1. Does the team estimate work accurately, or is there systematic over- or under-commitment?
2. When the team commits to a sprint goal or milestone, how often do they achieve it?
3. What patterns in estimation or planning are causing prediction drift?

**Invoke this skill when**: Preparing executive updates, after sprint reviews show estimation variance, or when leadership questions the team's forecasting reliability.

**Do not invoke this skill for**: Actual delivery performance (use `skills/delivery/review-sprint.md`), data reporting issues (use `data_quality.md`), or architectural stability (use `architecture_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Sprint velocity history | Jira / sprint tracking | Last 6–8 sprints: committed vs. completed story points |
| Sprint goal achievement rate | Sprint review artifacts | Count of achieved / partial / missed goals |
| Estimation accuracy log | EM judgment or team tracking | % of stories estimated within 20% of actual effort |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Capacity planning accuracy | Sprint planning snapshots | Planned capacity vs. actual available capacity |
| Story point distribution | Jira | Breakdown of story sizes (1, 2, 3, 5, 8, 13) |
| Estimation revision rate | Sprint planning | % of stories re-estimated during sprint |
| Blockers during planning | Standup notes | Count of planning-assumed dependencies that became blockers |
| Cross-team dependency accuracy | Dependency register | % of assumed external dependencies that were delivered on time |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Estimation Accuracy Audit

Calculate the estimation accuracy ratio:
`(Actual effort ÷ Estimated effort) × 100`

| Estimation Accuracy | Interpretation |
|---|---|
| 90–110% | High. Estimates are reliable. |
| 75–89% or 111–125% | Acceptable. Minor over/under-estimation is normal. |
| 60–74% or 126–150% | Concern. Systematic bias detected. |
| < 60% or > 150% | Critical. Estimates are not credible. |

Identify the direction:
- **Over-estimation**: Team consistently takes less effort than predicted (inflated estimates)
- **Under-estimation**: Team consistently exceeds estimates (optimistic planning)

### Step 2 — Sprint Goal Achievement Rate

Calculate:
`(Sprints with achieved goal ÷ Total sprints) × 100`

| Goal Achievement Rate | Interpretation |
|---|---|
| ≥ 85% | High. Team sets and hits realistic goals. |
| 70–84% | Acceptable. Some goals are ambitious or disrupted. |
| 60–69% | Concern. Goal setting or execution is unreliable. |
| < 60% | Critical. Sprint goals are not a credible planning unit. |

### Step 3 — Commitment Variance Analysis

Compare committed story points to completed story points over the last 6–8 sprints:
- **Mean variance**: Average of `|committed - completed| / committed`
- **Variance trend**: Is variance increasing or decreasing?

| Mean Variance | Interpretation |
|---|---|
| ≤ 15% | High. Commitments are predictable. |
| 16–30% | Acceptable. Normal sprint-to-sprint variation. |
| 31–50% | Concern. Commitments are unreliable. |
| > 50% | Critical. Sprint planning has no predictive value. |

### Step 4 — Forecasting Pattern Detection

Identify systematic patterns:
- **Optimistic sprint goal setting**: Team consistently misses goals despite reasonable point completion
- **Padding culture**: Team inflates estimates to guarantee completion
- **Dependency blindness**: Planning assumes external dependencies will deliver without verification
- **Scope drift**: Unplanned work consistently consumes 20%+ of capacity

---

## Decision Tree

```
What is the overall prediction confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────
│   Is there a consistent estimation bias?
│   ├── NO  → OUTCOME: Team is predictable and credible.
│   │         Recommendation: Sustain. Share prediction track record with executives.
│   └── YES (minor) → OUTCOME: Predictable but with known bias.
│               Recommendation: Calibrate estimates; adjust for known direction.
│
├── 60–79 (Yellow) ──────────────────────────────────────
│   Is the primary issue estimation accuracy or goal achievement?
│   ├── ESTIMATION → OUTCOME: Team can hit goals but planning is noisy.
│   │               Recommendation: Improve story decomposition and sizing discipline.
│   └── GOAL ACHIEVEMENT → OUTCOME: Goals are set incorrectly.
│                   Recommendation: Review goal-setting process; ensure goals are binary and achievable.
│
└── < 60 (Red) ──────────────────────────────────────────
    OUTCOME: Prediction confidence is critically low.
    Recommendation: Do not present sprint forecasts to executives until root cause is addressed.
    Immediate action: EM to run estimation calibration session with team.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: prediction confidence score, primary driver of confidence (or lack thereof), trend direction, and one immediate action. Include confidence level.

> **Example**: "Prediction confidence is 72 (Yellow), down from 81 last quarter. The team's estimation accuracy has degraded from 95% to 78%, driven by increased story complexity and insufficient decomposition. Sprint goal achievement remains at 75%, but the variance around commitments has widened. Immediate action: implement story point calibration before next sprint planning. Confidence: Medium (78%)."

### 2. Confidence Scorecard

| Metric | This Period | 3-Period Average | Status |
|---|---|---|---|
| Estimation accuracy | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Sprint goal achievement | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Commitment variance | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Prediction confidence | {{score}}/100 | {{score}}/100 | {{Green/Yellow/Red}} |

### 3. Evidence Log

- **GitHub**: {{PR review turnaround trends, deployment predictability patterns}}
- **Jira**: {{Sprint data showing committed vs. completed, story point distribution, milestone status}}
- **Incidents**: {{Incidents that disrupted sprint execution, unplanned work from production issues}}
- **Customer Bugs**: {{Escaped defects that required sprint interruption for hotfixes}}
- **Historical Releases**: {{Release success rate, rollback patterns, feature delivery timeliness}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{estimation bias | goal misalignment | dependency failure | scope creep | planning process failure}}
- **Evidence**: {{2–3 specific data points}}
- **Is this recurring?** {{Yes / No / Unknown}}

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

### 6. Trend Analysis (if historical data available)

| Period | Score | Primary Driver |
|---|---|---|
| {{Period}} | {{score}} | {{driver}} |
| {{Period}} | {{score}} | {{driver}} |
| {{Period}} | {{score}} | {{driver}} |

---

## Examples

### Example A — High Prediction Confidence

**Inputs**
- Estimation accuracy: 96% (last 6 sprints)
- Sprint goal achievement: 88%
- Commitment variance: 12%
- Story point distribution: 70% small stories (1–3 pts), 30% medium (5–8 pts)

**Output Summary**
> Prediction confidence is 91 (High). The team estimates within 4% of actual effort on average. Sprint goal achievement is 88% over 6 sprints. No systematic bias detected. Confidence: High (92%).

**Recommendations**
- *This sprint*: Continue current estimation practices.
- *Next quarter*: Share prediction track record with executives to build confidence in roadmap commitments.
- *Systemic*: None.

---

### Example B — Eroding Prediction Confidence

**Inputs**
- Estimation accuracy: 72% (last 6 sprints) — was 91% two quarters ago
- Sprint goal achievement: 62%
- Commitment variance: 38%
- Story point distribution shifted to larger stories (40% are 8+ pts)
- 3 of last 5 sprints had unplanned work > 25%

**Output Summary**
> Prediction confidence is 58 (Red). Estimation accuracy has degraded from 91% to 72% over two quarters, driven by increasing story complexity and insufficient decomposition. Sprint goal achievement is 62% with wide variance. This pattern will undermine executive confidence in roadmap commitments. Confidence: High (88%).

**Recommendations**
- *This sprint*: EM to run story decomposition workshop; cap story size at 5 points.
- *Next quarter*: Implement estimation calibration at start of each sprint planning.
- *Systemic*: If complexity is increasing due to product scope, propose dedicated technical writer or UX support to reduce sizing ambiguity.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| 6+ sprints of historical data | +5% |
| Supplementary inputs available | +5% |
| Pattern is consistent over 3+ periods | +5% |
| Root cause is clear and supported by multiple data points | +5% |
| One or more required inputs MISSING | −15% each |
| Trend data available (< 4 sprints of history) | −10% |
| Significant team composition change | −10% |
| Root cause is inferred with no direct evidence | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Estimation gaming** | Team inflates or deflates points to hit targets | Estimation accuracy is near 100% but sprint goals are missed | Use goal achievement as primary metric, not point accuracy |
| **Missing variance context** | Single sprint's variance reported without trend | Variance is high but only 1 sprint of data | Require 3+ sprints before flagging as systemic |
| **Goal redefinition** | Sprint goal is changed mid-sprint to make achievement easier | Goal text differs from original planning artifact | Compare current goal to original; flag redefinitions |
| **Dependency omission** | Planning assumes external delivery without verification | External dependencies consistently miss | Add dependency tracking to planning process |
| **Size shift masking** | Story point distribution changes (small→large) without recalibration | Average story size increased 30%+ | Recalibrate team's point scale; compare throughput not just points |
| **Data source mismatch** | Jira and GitHub data tell different stories | PR completion rate differs from Jira story completion | Investigate definition of "done"; align tracking systems |

---

## References

- `docs/principles.md` — Principle 5: Data over Opinions; Principle 12: Measure Outcomes
- `docs/engineering-playbook.md` → *Running Sprint Planning*, *Estimation*, *Risk*
- `CLAUDE.md` — Confidence scoring scale; DORA metric frameworks
- `skills/delivery/review-sprint.md` — Sprint analysis methodology and completion rate interpretation
- `skills/delivery/track-sprint.md` — Mid-sprint prediction tracking
- `integrations/jira.md` — Jira data extraction for sprint metrics
- `integrations/github.md` — GitHub PR and deployment data

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/review-sprint.md` | Uses this skill's output to explain delivery variance |
| `skills/delivery/manage-risk.md` | If dependency failure is root cause, invoke for risk mitigation |
| `skills/strategy/align-priorities.md` | Roadmap confidence uses prediction data as input |
| `confidence-engine/executive_confidence.md` | This dimension feeds into the master confidence score |
| `confidence-engine/delivery_confidence.md` | Correlates with prediction confidence — compare outputs |
| All `confidence-engine/*` skills | Individual assessments feed into executive synthesis |
