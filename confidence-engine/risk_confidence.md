# Skill: Risk Confidence

**Domain**: Executive Confidence — Risk Management
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or before executive reporting

---

## Purpose

Measure how effectively the team identifies, escalates, and mitigates risks before they become incidents. Risk confidence answers: "When this team sees a problem coming, do they tell leadership early enough to do something about it?"

This skill answers three questions:
1. Does the team surface risks proactively, or does leadership only hear about them after they materialize?
2. When risks are escalated, are they accompanied by mitigation plans and timelines?
3. Is the team's risk assessment history reliable — do warned risks actually materialize at the predicted rate?

**Invoke this skill when**: Preparing for executive reviews, after a risk became an incident, or when leadership wants assurance that the team is not hiding problems.

**Do not invoke this skill for**: Incident post-mortems (use `skills/operations/postmortem.md`), delivery performance (use `skills/delivery/review-sprint.md`), or architectural stability (use `architecture_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Risk register | Risk management tool / EM tracking | Current risks: description, likelihood, impact, owner, mitigation plan |
| Risk escalation log | EM log / incident records | Historical risks: when escalated, to whom, outcome |
| Incident history | Incident post-mortems | P1/P2 incidents in last 6 months: root cause, pre-indicators, escalation timeliness |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Risk-to-incident conversion rate | Risk register + incident log | % of registered risks that materialized into incidents |
| Escalation timeliness | Risk register | Average time between risk identification and leadership notification |
| Mitigation completion rate | Risk register | % of mitigations completed before risk materialized |
| Unidentified risk incidents | Incident post-mortems | Count of incidents where "this was not on our radar" |
| Risk assessment accuracy | Risk register | % of high-likelihood risks that materialized vs. % of low-likelihood risks that materialized |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Risk Surfacing Rate

Calculate the proportion of incidents that were preceded by a registered risk:

`(Incidents with pre-existing risk registration ÷ Total incidents) × 100`

| Risk Surfacing Rate | Interpretation |
|---|---|
| ≥ 80% | High. Team identifies risks before they become incidents. |
| 60–79% | Acceptable. Most risks are surfaced, some are surprises. |
| 40–59% | Concern. Significant number of incidents are unanticipated. |
| < 40% | Critical. Team is not surfacing risks; leadership is flying blind. |

### Step 2 — Escalation Timeliness

Measure how quickly risks reach leadership after identification:

| Escalation Timeliness | Interpretation |
|---|---|
| Within 24 hours | High. Leadership has time to respond. |
| 1–3 days | Acceptable. Leadership is informed but not immediately. |
| 4–7 days | Concern. Window for mitigation is narrowing. |
| > 7 days or never | Critical. Risk was visible but not escalated; incident likely resulted. |

### Step 3 — Mitigation Effectiveness

Assess whether identified risks were mitigated before materializing:

`(Risks mitigated before materializing ÷ Total registered risks) × 100`

| Mitigation Effectiveness | Interpretation |
|---|---|
| ≥ 70% | High. Team closes gaps before they become problems. |
| 50–69% | Acceptable. Most risks are addressed, some slip through. |
| 30–49% | Concern. Team identifies risks but doesn't follow through. |
| < 30% | Critical. Risk identification is performative without execution. |

### Step 4 — Risk Assessment Accuracy

Evaluate whether the team's risk likelihood estimates match reality:

- **Over-estimation**: Team flagged many high-likelihood risks that never materialized (alarmist)
- **Under-estimation**: Team flagged risks as low-likelihood that then materialized (blind)
- **Accurate**: Risk likelihood matches actual outcome rate

| Assessment Accuracy | Interpretation |
|---|---|
| ≥ 75% | High. Team's risk radar is well-calibrated. |
| 60–74% | Acceptable. Minor calibration drift. |
| 50–59% | Concern. Team is either alarmist or blind to emerging risks. |
| < 50% | Critical. Risk assessment is unreliable. |

---

## Decision Tree

```
What is the overall risk confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────
│   Mitigation effectiveness ≥ 70%?
│   ├── YES  → OUTCOME: Team surfaces risks early and follows through.
│   │          Recommendation: Sustain. Share risk management track record with executives.
│   └── NO  → OUTCOME: Risks are surfaced but not closed.
│             Recommendation: Improve mitigation follow-through; add closure tracking.
│
├── 60–79 (Yellow) ──────────────────────────────────────
│   What is the primary gap?
│   ├── SURFACING → OUTCOME: Some risks are not reaching leadership.
│   │              Recommendation: Require weekly risk summary in status reports.
│   ├── ESCALATION → OUTCOME: Risks are identified but sit too long.
│   │              Recommendation: Set escalation SLA (24 hours for high-impact risks).
│   └── MITIGATION → OUTCOME: Risks are known but not addressed.
│                  Recommendation: Assign mitigation owners with deadlines.
│
└── < 60 (Red) ──────────────────────────────────────────
    OUTCOME: Risk management is not functioning.
    Recommendation: Leadership cannot rely on this team to surface problems early.
    Immediate action: EM to audit risk register completeness and escalation SLAs.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: risk confidence score, primary gap, trend direction, and one immediate action. Include confidence level.

> **Example**: "Risk confidence is 68 (Yellow), down from 78 last quarter. The team surfaces 72% of risks before they become incidents, but escalation timeliness has degraded — high-impact risks now take an average of 5 days to reach leadership. Mitigation completion rate is 55%, meaning nearly half of identified risks are not closed before materializing. Immediate action: implement 24-hour escalation SLA for high-impact risks. Confidence: Medium (75%)."

### 2. Confidence Scorecard

| Metric | This Period | 3-Period Average | Status |
|---|---|---|---|
| Risk surfacing rate | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Escalation timeliness | {{days}} | {{days}} | {{Green/Yellow/Red}} |
| Mitigation effectiveness | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Risk assessment accuracy | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Risk confidence | {{score}}/100 | {{score}}/100 | {{Green/Yellow/Red}} |

### 3. Evidence Log

- **GitHub**: {{PR patterns showing late-stage risk indicators (merge spikes, revert rates)}}
- **Jira**: {{Risks registered, milestone changes, blocker trends}}
- **Incidents**: {{P1/P2 count, pre-indicators, escalation timeliness, action item completion}}
- **Customer Bugs**: {{Severity trends, time-to-detect as leading risk indicator}}
- **Historical Releases**: {{Rollback patterns, release risk assessments, post-release incidents}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{risk blindness | escalation failure | mitigation gap | assessment calibration}}
- **Evidence**: {{2–3 specific incidents or risk register entries}}
- **Is this recurring?** {{Yes / No / Unknown — check last 2–3 periods}}

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
**Next quarter**: {{1 risk process improvement}}
**Systemic** (if applicable): {{1 sustained risk culture change}}

### 6. Risk Register Summary

| Risk | Likelihood | Impact | Status | Escalation Date | Mitigation |
|---|---|---|---|---|---|
| {{Risk}} | {{H/M/L}} | {{H/M/L}} | {{Open/Mitigated/Materialized}} | {{date}} | {{plan}} |

---

## Examples

### Example A — High Risk Confidence

**Inputs**
- Risk surfacing rate: 85% (17 of 20 incidents had pre-existing risk registrations)
- Escalation timeliness: 18 hours average for high-impact risks
- Mitigation effectiveness: 78%
- Risk assessment accuracy: 82%
- No unidentified risk incidents in last period

**Output Summary**
> Risk confidence is 88 (High). The team surfaces risks early and escalates within 18 hours on average. Mitigation effectiveness is 78%, meaning nearly 4 in 5 identified risks are closed before materializing. Risk assessment is well-calibrated. Confidence: High (90%).

**Recommendations**
- *This sprint*: Sustain current risk management practices.
- *Next quarter*: Share risk management track record with executives to build confidence in roadmap commitments.
- *Systemic*: None.

---

### Example B — Risk Blindness

**Inputs**
- Risk surfacing rate: 35% (7 of 20 incidents had no pre-existing risk registration)
- Escalation timeliness: 6 days average for escalated risks
- Mitigation effectiveness: 28%
- Risk assessment accuracy: 42% (team consistently under-estimated likelihood)
- 3 incidents in last period with "this was not on our radar" in post-mortems
- Risk register has 12 open risks, average age 47 days

**Output Summary**
> Risk confidence is 42 (Red). Only 35% of incidents were preceded by risk registration. The team identified risks but failed to escalate or mitigate them — average escalation is 6 days and mitigation completion is 28%. Risk assessment is poorly calibrated. This is a systemic risk management failure. Confidence: High (86%).

**Recommendations**
- *This sprint*: EM to audit all open risks; close or escalate each with owners and deadlines.
- *Next quarter*: Implement weekly risk review in staff meeting; set 24-hour escalation SLA for high-impact risks.
- *Systemic*: If risk management does not improve within 60 days, recommend to leadership that the team's risk reporting process be restructured with executive oversight.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available | +5% |
| Cross-system data (GitHub, Jira, PagerDuty) confirms risk patterns | +5% |
| Risk register is current and complete | +5% |
| One or more required inputs MISSING | −15% each |
| Risk register is incomplete or stale (> 30 days) | −10% |
| No historical trend data available | −5% |
| Significant team composition change | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Risk register theater** | Risks are logged but not acted upon | High registration rate but low mitigation completion | Shift metric from "risks registered" to "risks mitigated" |
| **Post-mortem hindsight bias** | Team claims risk was "unknown" when it was actually visible | Risk register or Slack shows the risk was discussed | Require risk register audit as part of incident review |
| **Escalation avoidance** | Risks are known but not escalated to leadership | High-risk items in register with no escalation record | Add escalation timestamp to risk register fields |
| **Likelihood inflation** | Team flags everything as high-likelihood to get attention | Too many high-likelihood risks for the actual incident rate | Calibrate likelihood scale against historical outcome data |
| **Mitigation without ownership** | Mitigation plans exist but no owner is assigned | Mitigation plan with no named owner or deadline | Require owner + deadline for every mitigation |
| **Closing without verification** | Risks are marked "closed" without evidence of mitigation | Risk closed but pre-conditions still present | Require evidence-based closure (test, deploy, or verify) |

---

## References

- `docs/principles.md` — Principle 8: Predict before React; Principle 9: Learn from Every Failure
- `docs/engineering-playbook.md` → *Risk Management*, *Incident Response*, *Post-Mortems*
- `CLAUDE.md` — Confidence scoring scale; risk detection directives
- `skills/operations/postmortem.md` — Incident analysis methodology
- `skills/delivery/manage-risk.md` — Delivery risk assessment
- `integrations/pagerduty.md` — Incident and on-call data
- `integrations/github.md` — PR and deployment risk indicators

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/operations/postmortem.md` | Incident data feeds risk analysis; post-mortems reveal risk surfacing failures |
| `skills/delivery/manage-risk.md` | Delivery risk register feeds into this assessment |
| `confidence-engine/architecture_confidence.md` | Architectural risks are a subset of overall risk confidence |
| `confidence-engine/executive_confidence.md` | This dimension feeds into the master confidence score |
| All `confidence-engine/*` skills | Individual assessments feed into executive synthesis |
