# Skill: Roadmap Confidence

**Domain**: Executive Confidence — Planning Execution
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or end of quarter

---

## Purpose

Measure how accurately the team executes against roadmap commitments. Roadmap confidence answers: "When this team commits to roadmap milestones, how reliably do they deliver on scope, timeline, and quality?"

This skill answers three questions:
1. Does the team achieve the milestones they commit to on the roadmap?
2. Is the roadmap stable, or does scope change undermine planning reliability?
3. When the team delivers roadmap features, do they meet promised quality and completeness?

**Invoke this skill when**: Preparing quarterly business reviews, after milestone misses, when roadmap changes exceed thresholds, or when leadership questions roadmap credibility.

**Do not invoke this skill for**: Sprint-level prediction analysis (use `prediction_confidence.md`), data quality issues (use `data_quality.md`), or architectural concerns (use `architecture_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Roadmap milestone history | Jira / product roadmap | Milestones with committed dates and achieved dates (last 3–6 quarters) |
| Milestone achievement rate | Roadmap tracking | Count of achieved / partially achieved / missed milestones |
| Roadmap change log | Product planning | Record of scope additions/removals, date shifts, priority changes |
| Feature delivery completeness | Release tracking | Features delivered vs. roadmap-scoped features |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Feature scope fidelity | Product requirement docs | Delivered features matching original scope |
| Quality acceptance rate | QA / customer feedback | % of roadmap features passing quality gates on first release |
| Cross-team dependency impact | Dependency register | Milestones affected by external team delivery failures |
| Roadmap forecast accuracy | Historical comparison | Original timeline vs. actual delivery dates |
| Stakeholder feedback | Customer success / sales | Qualitative feedback on roadmap delivery |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Milestone Achievement Rate

Calculate:
`(Milestones achieved exactly ÷ Total milestones) × 100`

| Achievement Rate | Interpretation |
|---|---|
| ≥ 85% | High. Roadmap execution is reliable and predictable. |
| 70–84% | Acceptable. Some slippage but core commitments met. |
| 60–69% | Concern. Systematic milestone misses indicate planning issues. |
| < 60% | Critical. Roadmap commitments lack credibility. |

Include partially achieved milestones as a separate metric:
`(Milestones partially achieved ÷ Total milestones) × 100`

### Step 2 — Roadmap Stability Assessment

Analyze roadmap change log for scope and timeline stability:

| Metric | Threshold | Interpretation |
|---|---|---|
| Scope changes per milestone | ≤ 10% | High. Scope is stable. |
| | 11–25% | Acceptable. Some scope evolution is normal. |
| | > 25% | Concern. Scope creep undermines roadmap credibility. |
| Date shifts per milestone | ≤ 5% | High. Timelines are stable. |
| | 6–15% | Acceptable. Minor timeline adjustments. |
| | > 15% | Concern. Roadmap dates lack predictive value. |

Calculate roadmap volatility index:
`(Number of scope changes + date shifts) ÷ Total milestones`

### Step 3 — Feature Delivery Accuracy

Evaluate delivered features against roadmap commitments:

| Dimension | Assessment |
|---|---|
| On-time delivery | Compare committed milestone dates to actual delivery dates |
| Full scope delivery | Compare roadmap-scoped features to actually delivered features |
| Quality met | % of features passing quality gates without post-release issues |

Feature delivery score = `(On-time × 40% + Full scope × 35% + Quality × 25%)`

### Step 4 — Forecasting Drift Detection

Identify patterns in roadmap prediction accuracy:

- **Systematic date optimism**: Features consistently delivered later than committed
- **Scope reduction masking**: Milestones marked achieved with reduced scope
- **Quality compromise**: Features delivered on time but with post-release issues
- **Dependency cascading failures**: Missed milestones due to external dependencies
- **Priority inversion**: Higher-priority items delayed for lower-priority work

---

## Decision Tree

```
What is the overall roadmap confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────────────
│   Are milestones being achieved with full scope and quality?
│   ├── YES  → OUTCOME: Roadmap execution is credible and reliable.
│   │         Recommendation: Trust roadmap commitments; share track record with executives.
│   └── YES but quality gaps → OUTCOME: Timelines accurate but quality risk.
│               Recommendation: Address quality gaps; consider separate quality tracking.
│
├── 60–79 (Yellow) ─────────────────────────────────────────────
│   Is the primary issue date slips or scope changes?
│   ├── DATE SLIP → OUTCOME: Team hits scope but timing is unreliable.
│   │           Recommendation: Implement date buffer analysis; investigate root causes.
│   └── SCOPE CHANGE → OUTCOME: Delivering but roadmap scope is fluid.
│               Recommendation: Stabilize roadmap; establish change control process.
│
└── < 60 (Red) ──────────────────────────────────────────────────
    OUTCOME: Roadmap confidence is critically low.
    Recommendation: Do not present roadmap forecasts to executives until root cause is addressed.
    Immediate action: EM to conduct roadmap retrospective and establish clear escalation criteria.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: roadmap confidence score, primary driver of confidence (or lack thereof), trend direction, and one immediate action. Include confidence level.

> **Example**: "Roadmap confidence is 68 (Yellow), down from 82 last quarter. Milestone achievement has improved to 76%, but scope changes have increased from 12% to 28% of milestones. Quality acceptance rate remains strong at 91%. Immediate action: Implement roadmap change control to stabilize scope. Confidence: High (85%)."

### 2. Confidence Scorecard

| Metric | This Period | 3-Period Average | Status |
|---|---|---|---|
| Milestone achievement | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Roadmap stability | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Feature delivery accuracy | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Roadmap confidence | {{score}}/100 | {{score}}/100 | {{Green/Yellow/Red}} |

### 3. Evidence Log

- **GitHub**: {{PR completion patterns aligned with roadmap milestones, release tags vs. milestone dates}}
- **Jira**: {{Milestone status, roadmap epic completion, scope change logs}}
- **Incidents**: {{Post-release issues related to roadmap features, hotfixes for roadmap items}}
- **Customer Bugs**: {{Escaped defects from roadmap features, SLA violations for roadmap commitments}}
- **Historical Releases**: {{Release date variance, feature completeness by release}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{scope creep | date slippage | quality compromise | dependency failure | planning misalignment}}
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

### Example A — High Roadmap Confidence

**Inputs**
- Milestone achievement: 92% (last 4 quarters)
- Roadmap stability: 8% scope changes, 3% date shifts
- Feature delivery accuracy: 89% on-time, 94% full scope, 96% quality
- Cross-team dependency impact: 2% of milestones affected

**Output Summary**
> Roadmap confidence is 94 (High). The team achieves 92% of committed milestones with minimal scope changes. Feature delivery is on-time 89% with strong quality acceptance. No systemic issues detected. Confidence: High (90%).

**Recommendations**
- *This sprint*: Continue current roadmap execution practices.
- *Next quarter*: Share roadmap track record with executives to support annual planning.
- *Systemic*: None.

---

### Example B — At-Risk Roadmap Confidence

**Inputs**
- Milestone achievement: 64% (last 4 quarters)
- Roadmap stability: 28% scope changes, 18% date shifts
- Feature delivery accuracy: 62% on-time, 71% full scope, 83% quality
- 4 of last 6 milestones had scope reductions after date slippage
- Stakeholder feedback indicates roadmap unpredictability

**Output Summary**
> Roadmap confidence is 58 (Red). Milestone achievement has declined to 64% with significant scope changes affecting 28% of milestones. Features are delivered late 38% of the time, and 29% of committed scope is reduced. Stakeholder feedback confirms roadmap unpredictability. Confidence: High (88%).

**Recommendations**
- *This sprint*: EM to run roadmap retrospective; freeze non-critical scope changes.
- *Next quarter*: Implement roadmap change control requiring stakeholder approval for scope shifts.
- *Systemic*: Establish separate quality and timeline tracks to isolate confidence dimensions.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| 4+ quarters of historical data | +5% |
| Supplementary inputs available | +5% |
| Milestone achievement ≥ 80% | +10% |
| Roadmap stability ≤ 15% changes | +10% |
| Feature delivery accuracy > 80% | +5% |
| Pattern is consistent over 3+ quarters | +5% |
| Root cause is clear and supported by multiple data points | +5% |
| One or more required inputs MISSING | −15% each |
| < 3 quarters of historical data | −10% |
| Significant team composition change | −10% |
| Root cause is inferred with no direct evidence | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Date vs scope deception** | Team marks milestones achieved with significantly reduced scope | Milestone achieved but feature count reduced ≥ 30% | Report both date achievement and scope reduction separately; require scope sign-off |
| **Roadmap theater** | Roadmap is updated to match reality without acknowledging slips | Roadmap shows all milestones achieved; historical comparison shows high changes | Maintain immutable roadmap snapshot; compare to actual delivery |
| **Optimism bias** | Team consistently commits to aggressive dates | Average date slip > 25%; scope reduction follows slips | Implement date buffer analysis; calibrate against historical performance |
| **Scope creep normalization** | Frequent scope additions accepted as normal | Scope changes > 20% per quarter; no change control | Establish formal scope change approval process with stakeholder sign-off |
| **Dependency omission** | Roadmap assumes external delivery without verification | External dependencies miss; roadmap milestones fail | Add dependency owner verification to roadmap planning checklist |
| **Forecasting drift denial** | Team refuses to acknowledge past prediction errors | No pattern recognition in retrospective; same mistakes repeat | Mandate prediction tracking; compare forecasts to outcomes quarterly |

---

## References

- `CLAUDE.md` — Confidence scoring scale; roadmap execution framework
- `docs/principles.md` — Principle 5: Data over Opinions; Principle 12: Measure Outcomes
- `docs/engineering-playbook.md` → *Roadmap Planning*, *Milestone Tracking*, *Stakeholder Communication*
- `skills/delivery/review-sprint.md` — Sprint data feeds into milestone tracking
- `confidence-engine/prediction_confidence.md` — Prediction accuracy feeds into roadmap forecasting
- `integrations/jira.md` — Jira roadmap epic and milestone tracking

---

## Related Skills

| Skill | Relationship |
|---|---|
| `confidence-engine/prediction_confidence.md` | Uses prediction data as input for milestone forecasting |
| `confidence-engine/delivery_confidence.md` | Correlates with roadmap execution outcomes |
| `skills/strategy/align-priorities.md` | Roadmap confidence informs priority reprioritization |
| `skills/risk/manage-risk.md` | High roadmap risk triggers risk mitigation workflows |
| `skills/communication/stakeholder-update.md` | Roadmap confidence is core input for executive updates |
| `confidence-engine/executive_confidence.md` | This dimension feeds into the master confidence score |