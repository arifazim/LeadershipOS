# Skill: Delivery Confidence

**Domain**: Executive Confidence — Execution Reliability
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly, end of sprint, or before executive reporting

---

## Purpose

Measure how reliably the team delivers on its commitments. Delivery confidence answers: "When this team commits to a release, milestone, or feature, can leadership count on it happening on time and with quality?"

This skill answers three questions:
1. Does the team hit its delivery commitments consistently, or is delivery unpredictable?
2. When scope changes occur, are they communicated early with impact analysis?
3. What is the track record of releases — do they ship on time, with minimal incidents, and with customer bugs contained?

**Invoke this skill when**: Preparing for executive reviews, before major release announcements, or when leadership has asked "are we going to hit the date?"

**Do not invoke this skill for**: Sprint-level analysis (use `skills/delivery/review-sprint.md`), risk management (use `risk_confidence.md`), or architectural stability (use `architecture_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| On-time delivery rate | Release tracking / Jira | % of committed releases/milestones delivered on date |
| Scope change rate | Jira / change management | % of original scope changed after commitment |
| Release success rate | Release tracking | % of releases that shipped without rollback or hotfix |
| Escaped bug rate | Support / QA | Customer bugs found post-release per 1,000 users or per release |

### Supplementary

| Input | Source | Format |
|---|---|---|
| Release cycle time | Release tracking | Average days from code-complete to production |
| Rollback frequency | Incident log | Count and cause of rollbacks in last 6 releases |
| Hotfix rate | Incident log | % of releases requiring a hotfix within 7 days |
| Blocker resolution time | Jira | Average time to resolve blockers identified in planning |
| Capacity buffer usage | Sprint planning | % of planned capacity consumed by unplanned work |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — On-Time Delivery Rate

Calculate:
`(Deliveries on time ÷ Total committed deliveries) × 100`

| On-Time Delivery Rate | Interpretation |
|---|---|
| ≥ 90% | High. Team delivers predictably. |
| 80–89% | Acceptable. Occasional delays with reasonable explanation. |
| 70–79% | Concern. Delivery is inconsistent. |
| < 70% | Critical. Commitments are not credible. |

### Step 2 — Scope Stability Assessment

Measure how much scope changes after commitment:

`(Scope change effort ÷ Original commitment) × 100`

| Scope Change Rate | Interpretation |
|---|---|
| ≤ 10% | High. Scope is stable. |
| 11–20% | Acceptable. Minor adjustments with communication. |
| 21–40% | Concern. Scope is drifting; planning is not binding. |
| > 40% | Critical. Scope is uncontrolled; original commitment is meaningless. |

Identify the nature of scope changes:
- **Stakeholder-driven**: External requests added after commitment
- **Discovery-driven**: Team found additional work during execution
- **Quality-driven**: Bugs or technical debt required rework
- **Priority-driven**: Business reprioritized mid-stream

### Step 3 — Release Reliability Score

Calculate a composite release health metric:

| Release Outcome | Score |
|---|---|
| Shipped on time, zero incidents, zero escaped bugs | 100 |
| Shipped on time, minor incidents (no rollback), ≤ 2 escaped bugs | 85 |
| Shipped on time, minor incidents with hotfix, 3–5 escaped bugs | 70 |
| Shipped late or rolled back, incident involved | 50 |
| Shipped late, rolled back, multiple incidents | 25 |
| Not shipped | 0 |

`Release Reliability Score = Average of last 6 release scores`

| Release Reliability | Interpretation |
|---|---|
| ≥ 85 | High. Releases are smooth and predictable. |
| 70–84 | Acceptable. Releases have minor issues but land. |
| 50–69 | Concern. Releases are consistently bumpy. |
| < 50 | Critical. Shipping is a crisis every time. |

### Step 4 — Customer Bug Containment

Assess the team's ability to catch bugs before customers do:

| Escaped Bug Rate (per 1,000 users) | Interpretation |
|---|---|
| ≤ 1 | High. Excellent quality gate. |
| 1–3 | Acceptable. Normal defect escape rate. |
| 4–10 | Concern. Quality gate is weak. |
| > 10 | Critical. Customer is acting as QA. |

Track trend direction: improving, stable, or degrading.

---

## Decision Tree

```
What is the overall delivery confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────
│   Scope change rate ≤ 15%?
│   ├── YES  → OUTCOME: Team is reliably delivering with controlled scope.
│   │          Recommendation: Sustain. Share delivery track record with executives.
│   └── NO  → OUTCOME: Team delivers but scope is unstable.
│             Recommendation: Improve change control process; require impact analysis for scope changes.
│
├── 60–79 (Yellow) ──────────────────────────────────────
│   Primary gap?
│   ├── ON-TIME DELIVERY → OUTCOME: Dates slip but quality is okay.
│   │                  Recommendation: Improve estimation and capacity planning.
│   ├── SCOPE → OUTCOME: Dates are hit but scope is reduced.
│   │             Recommendation: Implement change control; freeze scope after commitment.
│   └── RELEASE QUALITY → OUTCOME: On time but bumpy releases.
│                     Recommendation: Improve release process; add staging validation.
│
└── < 60 (Red) ──────────────────────────────────────────
    OUTCOME: Delivery is unreliable.
    Recommendation: Leadership cannot commit to dates or scope without contingency.
    Immediate action: EM to publish delivery risk register for next 3 releases.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: delivery confidence score, primary driver, trend direction, and one immediate action. Include confidence level.

> **Example**: "Delivery confidence is 74 (Yellow), stable from last quarter. On-time delivery rate is 82%, but scope changes consume 22% of original commitment on average. Release reliability score is 78/100. The primary issue is scope creep driven by stakeholder requests added after commitment. Immediate action: implement scope change approval process before next release. Confidence: Medium (82%)."

### 2. Confidence Scorecard

| Metric | This Period | 3-Period Average | Status |
|---|---|---|---|
| On-time delivery rate | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Scope stability | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Release reliability | {{score}} | {{score}} | {{Green/Yellow/Red}} |
| Escaped bug rate | {{per 1k}} | {{per 1k}} | {{Green/Yellow/Red}} |
| Delivery confidence | {{score}}/100 | {{score}}/100 | {{Green/Yellow/Red}} |

### 3. Evidence Log

- **GitHub**: {{Deployment frequency, PR merge patterns, revert rates, late-stage PR spikes}}
- **Jira**: {{Sprint completion, milestone status, scope change stories, blocker resolution time}}
- **Incidents**: {{Post-release incidents, rollbacks, hotfixes, MTTR during releases}}
- **Customer Bugs**: {{Escaped defects, severity distribution, time-to-detect post-release}}
- **Historical Releases**: {{Release success rate, rollback frequency, on-time vs. late releases, patterns}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{estimation failure | scope creep | quality issues | dependency failure | capacity shortfall}}
- **Evidence**: {{2–3 specific releases or milestones}}
- **Is this recurring?** {{Yes / No / Unknown}}

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
**Next quarter**: {{1 delivery process improvement}}
**Systemic** (if applicable): {{1 sustained delivery capability change}}

### 6. Recent Release Analysis

| Release | Date | Scope | On Time | Incidents | Escaped Bugs | Score | Notes |
|---|---|---|---|---|---|---|---|
| {{Release}} | {{date}} | {{original vs. final}} | {{Y/N}} | {{count}} | {{count}} | {{score}} | {{notes}} |

---

## Examples

### Example A — High Delivery Confidence

**Inputs**
- On-time delivery rate: 94% (last 6 releases)
- Scope change rate: 8% (minor adjustments with stakeholder sign-off)
- Release reliability score: 92/100 (5 of 6 releases clean, 1 minor incident)
- Escaped bug rate: 0.8 per 1,000 users
- No rollbacks in last 6 releases

**Output Summary**
> Delivery confidence is 94 (High). The team delivered 94% of commitments on time with minimal scope changes. Release reliability is 92/100 with zero rollbacks in the last 6 releases. Escaped bug rate is 0.8/1,000 users, well within acceptable range. Leadership can trust delivery dates and scope. Confidence: High (94%).

**Recommendations**
- *This sprint*: Continue current delivery practices.
- *Next quarter*: Share delivery track record with executives to support roadmap commitments.
- *Systemic*: None.

---

### Example B — Delivery Unreliability

**Inputs**
- On-time delivery rate: 58% (last 6 releases)
- Scope change rate: 38% (frequent stakeholder interventions)
- Release reliability score: 52/100 (2 rollbacks, 3 hotfixes)
- Escaped bug rate: 6.2 per 1,000 users
- Blocker resolution time: 4.2 days average

**Output Summary**
> Delivery confidence is 52 (Red). On-time delivery is 58% with 38% scope changes. Two releases required rollbacks and three required hotfixes. Escaped bug rate is 6.2/1,000 users — 6x the acceptable threshold. Leadership should not commit to dates without contingency plans. Confidence: High (89%).

**Recommendations**
- *This sprint*: EM to publish delivery risk register for next 3 releases with mitigation plans.
- *Next quarter*: Implement scope freeze process; add staging validation gate before production.
- *Systemic*: If delivery reliability does not improve within 60 days, recommend to leadership that the team's release cadence be reduced from bi-weekly to monthly until processes stabilize.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available | +5% |
| 6+ releases of historical data | +5% |
| GitHub, Jira, and incident data are consistent | +5% |
| One or more required inputs MISSING | −15% each |
| < 4 releases of historical data | −10% |
| Data source conflicts unresolved | −10% |
| Significant team composition change | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Date vs. scope deception** | Team "hits the date" by cutting scope | On-time delivery is high but scope change rate is > 30% | Report scope-adjusted delivery rate alongside raw date |
| **Quality deferral** | Team ships on time but accumulates technical debt | Release reliability is high short-term but MTTR is increasing | Include MTTR trend in confidence assessment |
| **Escaped bug under-reporting** | Customer bugs are not captured in tracking system | Support tickets show bugs not in engineering tracking | Reconcile support and engineering bug databases |
| **Release definition creep** | "Shipped" means different things across releases | Some releases marked complete without production validation | Lock definition of "shipped"; require production sign-off |
| **Blocker normalization** | Blockers are expected and not tracked as anomalies | High blocker resolution time but not flagged | Add blocker time to scorecard; escalate if > 2 days |
| **Hero dependency** | Delivery succeeds due to individual effort, not process | Releases ship but same 1–2 engineers are always involved | Flag as systemic risk; recommend knowledge sharing |

---

## References

- `docs/principles.md` — Principle 10: Optimize Flow; Principle 12: Measure Outcomes
- `docs/engineering-playbook.md` → *Release Management*, *Quality Assurance*, *Change Management*
- `CLAUDE.md` — DORA metrics; confidence scoring
- `skills/delivery/review-sprint.md` — Sprint delivery analysis methodology
- `skills/operations/postmortem.md` — Release incident analysis
- `integrations/github.md` — Deployment and PR data
- `integrations/jira.md` — Sprint and milestone tracking
- `integrations/pagerduty.md` — Incident data

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/review-sprint.md` | Sprint-level delivery data feeds this assessment |
| `skills/operations/postmortem.md` | Release incidents feed into reliability scoring |
| `confidence-engine/prediction_confidence.md` | Correlates with delivery confidence — compare forecasts vs. outcomes |
| `confidence-engine/architecture_confidence.md` | Architectural stability affects release reliability |
| `confidence-engine/executive_confidence.md` | This dimension feeds into the master confidence score |
| All `confidence-engine/*` skills | Individual assessments feed into executive synthesis |
