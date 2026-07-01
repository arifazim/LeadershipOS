# Skill: Data Quality Confidence

**Domain**: Executive Confidence — Data Integrity
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or before executive reporting

---

## Purpose

Measure the reliability and completeness of the data used to make engineering decisions and report to leadership. Data quality confidence answers: "When leadership sees a dashboard or report from this team, how much should they trust the numbers?"

This skill answers three questions:
1. Is the data leadership receives complete, timely, and accurate?
2. Where are the data gaps that could hide problems or inflate confidence?
3. What is the risk that executives are making decisions on bad data?

**Invoke this skill when**: Preparing for executive reviews, when data discrepancies are noticed between systems, or when leadership has questioned the accuracy of reporting.

**Do not invoke this skill for**: Prediction accuracy (use `prediction_confidence.md`), delivery performance (use `delivery_confidence.md`), or architectural stability (use `architecture_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Dashboard completeness | Engineering dashboard | % of expected metrics that are populated and current |
| Reporting lag | EM log / reporting timestamps | Average hours/days between event and report |
| Data source reliability | Integration health checks | Status of GitHub, Jira, Datadog, PagerDuty connections |
| Metric definition consistency | Documentation / team agreement | Are metrics defined and used consistently across reports? |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Data correction frequency | Report revision logs | Count of times reported data was corrected post-publication |
| Missing data incidents | Incident log | Count of times decisions were made with incomplete data |
| Cross-system reconciliation | Weekly data audit | Discrepancies between Jira, GitHub, and Datadog |
| Audit trail completeness | Decision log | % of decisions with supporting data citations |
| Stakeholder data challenges | Meeting notes | Instances where stakeholders questioned or rejected data presented |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Data Completeness Audit

For each critical data feed, assess completeness:

| Data Source | Required Metrics | Current Completeness | Gap |
|---|---|---|---|
| GitHub | Deployment frequency, PR cycle time, merge rate | {{%}} | {{count missing}} |
| Jira | Sprint velocity, commitment vs. actual, milestone status | {{%}} | {{count missing}} |
| Datadog | DORA metrics, SLO compliance, error budgets | {{%}} | {{count missing}} |
| PagerDuty | Incident count, MTTR, on-call burden | {{%}} | {{count missing}} |
| CRM/Support | Customer bugs, severity, time-to-detect | {{%}} | {{count missing}} |

**Completeness Score** = (Populated metrics ÷ Total required metrics) × 100

| Completeness | Interpretation |
|---|---|
| ≥ 95% | High. Data is comprehensive. |
| 85–94% | Acceptable. Minor gaps exist but do not affect decisions. |
| 75–84% | Concern. Gaps may hide problems. |
| < 75% | Critical. Data is insufficient for executive decisions. |

### Step 2 — Data Timeliness Assessment

Measure how quickly data is available after an event occurs:

| Data Category | Target Timeliness | Actual | Status |
|---|---|---|---|
| Deployment data | Within 1 hour | {{actual}} | {{Green/Yellow/Red}} |
| Incident data | Within 4 hours | {{actual}} | {{Green/Yellow/Red}} |
| Sprint data | Within 24 hours of sprint end | {{actual}} | {{Green/Yellow/Red}} |
| Customer bug data | Within 48 hours of report | {{actual}} | {{Green/Yellow/Red}} |
| Roadmap milestone updates | Within 1 week of change | {{actual}} | {{Green/Yellow/Red}} |

**Timeliness Score** = Average of all category scores

### Step 3 — Data Accuracy Check

Identify known data quality issues:
- **Systematic errors**: Metrics that consistently report incorrectly (e.g., cycle time excludes review time)
- **Definition drift**: Same metric reported differently across time periods
- **Source conflicts**: GitHub says one thing, Jira says another
- **Manual override frequency**: How often is automated data manually corrected?

| Accuracy Issue | Frequency | Severity | Impact |
|---|---|---|---|
| {{Issue}} | {{count/month}} | {{High/Medium/Low}} | {{What decisions are affected}} |

### Step 4 — Stakeholder Trust Signal

Has leadership challenged or questioned the data?
- **No challenges**: Data is trusted
- **Occasional questions**: Minor credibility issues
- **Repeated corrections**: Data reliability is in question
- **Explicit distrust**: Leadership sources data independently

---

## Decision Tree

```
What is the overall data quality confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────
│   Are there any data source conflicts?
│   ├── NO  → OUTCOME: Data is trustworthy and complete.
│   │         Recommendation: Continue current reporting. Document metrics for continuity.
│   └── YES (minor) → OUTCOME: Data is mostly reliable with known gaps.
│               Recommendation: Resolve conflicts; publish data definitions.
│
├── 60–79 (Yellow) ──────────────────────────────────────
│   Is the primary issue completeness or timeliness?
│   ├── COMPLETENESS → OUTCOME: Some data is missing but core metrics are solid.
│   │               Recommendation: Add missing sources before next executive cycle.
│   └── TIMELINESS → OUTCOME: Data exists but arrives too late for decisions.
│                   Recommendation: Automate data pipelines; reduce reporting lag.
│
└── < 60 (Red) ──────────────────────────────────────────
    OUTCOME: Data quality is insufficient for executive decisions.
    Recommendation: Do not present data to executives without a data quality disclaimer.
    Immediate action: EM to publish data source status dashboard for transparency.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: data quality confidence score, primary gap, risk to executive decisions, and one immediate action. Include confidence level.

> **Example**: "Data quality confidence is 65 (Yellow). GitHub and Jira integration are complete, but customer bug data has a 5-day lag and Datadog SLO metrics report 30% of the time. The risk is that executives are seeing a 5-day-old view of reliability when making prioritization decisions. Immediate action: automate customer bug pipeline to reduce lag to 24 hours. Confidence: Medium (76%)."

### 2. Data Quality Scorecard

| Data Source | Completeness | Timeliness | Accuracy | Status |
|---|---|---|---|---|
| GitHub | {{%}} | {{status}} | {{status}} | {{Green/Yellow/Red}} |
| Jira | {{%}} | {{status}} | {{status}} | {{Green/Yellow/Red}} |
| Datadog | {{%}} | {{status}} | {{status}} | {{Green/Yellow/Red}} |
| PagerDuty | {{%}} | {{status}} | {{status}} | {{Green/Yellow/Red}} |
| Customer Bugs | {{%}} | {{status}} | {{status}} | {{Green/Yellow/Red}} |
| **Overall** | **{{%}}** | — | — | **{{Green/Yellow/Red}}** |

### 3. Evidence Log

- **GitHub**: {{Integration health, metric population rate, known sync issues}}
- **Jira**: {{Sprint data completeness, board accuracy, reporting lag}}
- **Incidents**: {{Data gaps during incident response that hindered decision-making}}
- **Customer Bugs**: {{Pipeline status, lag time, severity accuracy}}
- **Historical Releases**: {{Release data completeness, retrospective data availability}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{integration failure | manual process | source conflict | definition drift | timeliness gap}}
- **Evidence**: {{2–3 specific data points}}
- **Impact**: {{What executive decisions are affected by this gap}}

### 5. Recommendations

Each recommendation MUST include Confidence % and Supporting Evidence:

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
**Next quarter**: {{1 data quality initiative}}
**Systemic** (if applicable): {{1 sustained data governance change}}

### 6. Data Definition Reference

| Metric | Definition | Source | Last Verified |
|---|---|---|---|
| {{Metric}} | {{How it is calculated}} | {{System}} | {{Date}} |

---

## Examples

### Example A — High Data Quality

**Inputs**
- GitHub: 100% complete, real-time sync, no issues
- Jira: 98% complete, 2-hour lag
- Datadog: 95% complete, SLO metrics 100% populated
- PagerDuty: 100% complete, 1-hour sync
- Customer Bugs: 90% complete, 24-hour pipeline

**Output Summary**
> Data quality confidence is 93 (High). All critical data sources are above 90% completeness with acceptable timeliness. Customer bug data has the lowest completeness at 90% but is still within acceptable range. No data source conflicts detected. Confidence: High (94%).

**Recommendations**
- *This sprint*: Continue current data pipeline. Document metric definitions for continuity.
- *Next quarter*: Improve customer bug pipeline to 95% completeness.
- *Systemic*: Establish quarterly data audit cadence.

---

### Example B — Data Integrity Risk

**Inputs**
- GitHub: 85% complete, 4-hour sync lag
- Jira: 70% complete, sprint data often manually updated
- Datadog: 40% complete, SLO metrics missing for 3 of 7 services
- PagerDuty: 90% complete
- Customer Bugs: 50% complete, 5-day lag from support system
- Stakeholder challenges: "The numbers in the dashboard don't match what we're hearing from customers"

**Output Summary**
> Data quality confidence is 48 (Red). Datadog integration is missing 3 of 7 services, and customer bug data has a 5-day lag. Jira completeness is 70% due to manual update dependency. Executive decisions about reliability and prioritization are being made on incomplete data. This is a credibility risk. Confidence: High (85%).

**Recommendations**
- *This sprint*: EM to publish a data source status dashboard showing what is and isn't available.
- *Next quarter*: Fix Datadog integration to cover all services; automate customer bug pipeline.
- *Systemic*: If data quality cannot be improved within 60 days, recommend to leadership that reports include explicit data quality disclaimers.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available | +5% |
| Cross-system reconciliation performed | +5% |
| Data definitions documented | +5% |
| One or more required inputs MISSING | −15% each |
| No historical data for trend comparison | −5% |
| Data source conflicts unresolved | −10% |
| Significant integration changes this period | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Dashboard theater** | Metrics are populated but measure the wrong thing | Dashboard looks complete but doesn't answer executive questions | Review metric definitions against executive information needs |
| **Lag masking** | Data is accurate but too old to be actionable | Reporting lag exceeds decision-making window | Flag timeliness separately; recommend real-time sources for critical metrics |
| **Source conflict denial** | GitHub and Jira disagree but team doesn't reconcile | Discrepancies noted but not investigated | Require reconciliation before any executive report |
| **Definition drift** | Metric definition changed without notice | Current period metric differs from historical baseline | Lock metric definitions; version all scorecards |
| **Completeness inflation** | Team reports 90%+ completeness by excluding hard-to-measure items | High score but key decisions still lack data | Audit against executive decision checklist, not just metric list |
| **Correction suppression** | Data errors are fixed silently before executives see them | No record of corrections but stakeholders sense inaccuracy | Log all data corrections; share correction log with leadership |

---

## References

- `docs/principles.md` — Principle 5: Data over Opinions; Principle 6: Automation over Repetition
- `docs/engineering-playbook.md` → *Engineering Health Metrics*, *Reporting*
- `CLAUDE.md` — Confidence scoring scale; measurable metrics preference
- `integrations/github.md` — GitHub integration data feeds
- `integrations/jira.md` — Jira integration data feeds
- `integrations/datadog.md` — Datadog integration data feeds
- `integrations/pagerduty.md` — PagerDuty integration data feeds

---

## Related Skills

| Skill | Relationship |
|---|---|
| `confidence-engine/prediction_confidence.md` | Shares Jira and GitHub data; compare prediction accuracy vs. data quality |
| `confidence-engine/delivery_confidence.md` | Uses data quality as input to delivery confidence assessment |
| `confidence-engine/executive_confidence.md` | This dimension feeds into the master confidence score |
| `skills/delivery/review-sprint.md` | Sprint data quality affects sprint review reliability |
| `skills/executive/executive-status-report.md` | Data quality determines how much trust to place in status reports |
| All `confidence-engine/*` skills | Individual assessments feed into executive synthesis |
