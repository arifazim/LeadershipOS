# Skill: Architecture Confidence

**Domain**: Executive Confidence — Technical Integrity
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly or after significant changes

---

## Purpose

Measure confidence in the system's stability, scalability, and technical integrity. Architecture confidence answers: "Can I trust this system to perform reliably under load, and are technical decisions being made to sustain long-term health?"

This skill answers three questions:
1. How stable is the system in production, and how quickly are issues resolved?
2. Are technical decisions improving or degrading system scalability and maintainability?
3. Is technical debt being managed proactively or accumulating as hidden risk?

**Invoke this skill when**: Preparing for scaling initiatives, after production incidents, during technical reviews, or when leadership questions system reliability.

**Do not invoke this skill for**: Sprint-level delivery analysis (use `delivery_confidence.md`), data quality concerns (use `data_quality.md`), or roadmap execution (use `roadmap_confidence.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Incident rates by severity | Monitoring / incident log | Count of Sev1-4 incidents per period |
| Change failure rate | CI/CD pipeline | % of deployments causing production incidents |
| SLO compliance | Monitoring dashboards | % of time meeting availability/latency/error rate targets |
| Technical debt trend | Code analysis / planning | Technical debt items tracked with effort estimates |
| Deployment success rate | CI/CD pipeline | % of deployments completing without rollback |
| System reliability metrics | Monitoring | Uptime, error rates, performance metrics |

### Supplementary

| Input | Source | Format |
|---|---|---|
| MTTR by severity | Incident response | Mean time to recovery for Sev1-4 incidents |
| Code quality metrics | Static analysis | Code coverage, complexity, maintainability scores |
| Dependency health | Security scanning | Outdated/vulnerable dependencies count |
| Performance trend | Load testing | Response time and throughput trends |
| Architecture review completion | Tech lead | % of significant changes reviewed for architectural impact |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Change Failure Rate

Calculate the percentage of deployments causing production issues:
`(Deployments with incidents ÷ Total deployments) × 100`

| Change Failure Rate | Interpretation |
|---|---|
| ≤ 5% | High. Deployment pipeline is reliable. |
| 6–10% | Acceptable. Controlled risk with learning. |
| 11–20% | Concern. Quality gates may be insufficient. |
| > 20% | Critical. Deployment process needs immediate attention. |

Identify failure patterns:
- Large batch deployments vs. continuous delivery
- Missing test coverage areas
- External dependency changes

### Step 2 — MTTR Trend Analysis

Calculate Mean Time to Recovery across incident severities:
- Sev1 MTTR target: < 1 hour
- Sev2 MTTR target: < 4 hours
- Sev3 MTTR target: < 24 hours

| MTTR Trend | Interpretation |
|---|---|
| Decreasing or stable | High. Incident response is effective. |
| Increasing < 20% | Acceptable. Minor degradation, monitor closely. |
| Increasing 20–50% | Concern. Response effectiveness degrading. |
| Increasing > 50% | Critical. System reliability is eroding. |

### Step 3 — SLO Compliance Assessment

Evaluate service level objective adherence:
- Availability SLO (typically 99.9%+)
- Latency SLO (typically p95/p99 targets)
- Error rate SLO (typically < 0.1%)

Calculate:
`(Time meeting all SLOs ÷ Total time period) × 100`

| SLO Compliance | Interpretation |
|---|---|
| ≥ 99% | High. System meets reliability commitments. |
| 95–98% | Acceptable. Occasional breaches are manageable. |
| 90–94% | Concern. Reliability risks are material. |
| < 90% | Critical. SLO breaches require immediate remediation. |

### Step 4 — Technical Debt Trajectory

Analyze technical debt trends:
- Debt items created vs. resolved per period
- Debt effort estimates (story points or hours)
- Debt distribution (code, infrastructure, documentation)

| Technical Debt Trend | Interpretation |
|---|---|
| Net reduction or stable | High. Debt is being managed. |
| 10–25% net increase | Acceptable. Growth balanced by new features. |
| 26–50% net increase | Concern. Unsustainable debt accumulation. |
| > 50% net increase | Critical. Technical bankruptcy risk. |

### Step 5 — System Reliability Analysis

Compile reliability signals:
- Uptime percentage
- Error rate trends
- Performance degradation indicators
- Scalability indicators (resource utilization under load)

| Reliability Score | Interpretation |
|---|---|
| 99.9%+ uptime, stable error rates | High. System is production-ready. |
| 99–99.9% uptime, minor error fluctuations | Acceptable. Normal operational variation. |
| 95–98% uptime, increasing error rates | Concern. System reliability is degrading. |
| < 95% uptime, volatile error rates | Critical. System requires stabilization. |

---

## Decision Tree

```
What is the overall architecture confidence?
│
├── ≥ 80 (Green) ────────────────────────────────────────────────
│   Are all reliability metrics stable and debt controlled?
│   ├── YES  → OUTCOME: System health is strong and sustainable.
│   │         Recommendation: Continue current architecture practices; invest in proactive improvements.
│   └── DEBT GROWING → OUTCOME: Stable but debt trajectory concerning.
│               Recommendation: Allocate dedicated capacity for debt reduction.
│
├── 60–79 (Yellow) ─────────────────────────────────────────────
│   Is the primary issue reliability or technical debt?
│   ├── RELIABILITY → OUTCOME: System has stability concerns.
│   │           Recommendation: Focus on incident reduction and SLO compliance.
│   └── TECH DEBT → OUTCOME: System accumulating unmanaged complexity.
│               Recommendation: Implement debt paydown sprint; review architecture decisions.
│
└── < 60 (Red) ──────────────────────────────────────────────────
    OUTCOME: Architecture confidence is critically degraded.
    Recommendation: Do not commit to scaling initiatives until stability is restored.
    Immediate action: EM to conduct architecture retrospective and establish reliability SLA.
```

---

## Output

### 1. Executive Summary (3–5 sentences)

State: architecture confidence score, primary driver of confidence (or lack thereof), trend direction, and one immediate action. Include confidence level.

> **Example**: "Architecture confidence is 71 (Yellow), down from 85 last quarter. Change failure rate has increased from 4% to 12%, and technical debt has grown 35% while SLO compliance remains at 97%. MTTR has degraded slightly but is still within targets. Immediate action: Investigate root cause of deployment failures before next release. Confidence: High (88%)."

### 2. Confidence Scorecard

| Metric | This Period | 3-Period Average | Status |
|---|---|---|---|
| Change failure rate | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| MTTR trend | {{hours}} | {{hours}} | {{Green/Yellow/Red}} |
| SLO compliance | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Technical debt trend | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Architecture confidence | {{score}}/100 | {{score}}/100 | {{Green/Yellow/Red}} |

### 3. Evidence Log

- **GitHub**: {{Deployment PR patterns, incident root cause PRs, technical debt tickets}}
- **Jira**: {{Reliability tickets, tech debt items, architecture review tasks}}
- **Incidents**: {{Sev1-4 incident reports, MTTR data, post-mortem findings}}
- **Customer Bugs**: {{Production issues, reliability complaints, performance concerns}}
- **Historical Releases**: {{Rollback patterns, hotfix frequency, release stability}}

### 4. Root Cause (if score is Yellow or Red)

- **Primary cause**: {{deployment instability | technical debt | SLO breaches | scaling limitations}}
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

### Example A — Healthy Architecture Confidence

**Inputs**
- Change failure rate: 3% (last 3 months)
- SLO compliance: 99.2% uptime, 98.7% latency
- Technical debt: Net -12% (more resolved than created)
- Deployment success rate: 96%
- MTTR (Sev1): 42 minutes average
- System reliability: 99.95% uptime, stable error rates

**Output Summary**
> Architecture confidence is 89 (High). Deployment pipeline shows 3% change failure rate with 96% success rate. SLO compliance is at 99.2% uptime with strong latency adherence. Technical debt is being reduced at 12% per quarter while reliability remains excellent. Confidence: High (92%).

**Recommendations**
- *This sprint*: Continue current reliability practices.
- *Next quarter*: Invest proactive improvements in performance optimization.
- *Systemic*: None.

---

### Example B — At-Risk Architecture Confidence

**Inputs**
- Change failure rate: 22% (last 3 months) — was 5% two quarters ago
- SLO compliance: 93% uptime, 89% latency
- Technical debt: Net +45% (significant accumulation)
- Deployment success rate: 78%
- MTTR (Sev1): 95 minutes average — increasing trend
- 3 Sev1 incidents in last month; rollback performed twice

**Output Summary**
> Architecture confidence is 54 (Red). Change failure rate has jumped from 5% to 22%, with deployment success dropping to 78%. Technical debt has grown 45% while SLO compliance has degraded to 93% uptime. MTTR is rising and incident frequency has tripled. Confidence: High (90%).

**Recommendations**
- *This sprint*: EM to run deployment retrospective; freeze non-critical changes.
- *Next quarter*: Allocate 20% capacity for technical debt reduction and stability fixes.
- *Systemic*: Implement architecture review checklist for all significant changes.

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| 3+ months of historical data | +5% |
| Supplementary inputs available | +5% |
| Change failure rate ≤ 10% | +10% |
| SLO compliance ≥ 95% | +10% |
| Technical debt stable or decreasing | +5% |
| MTTR improving or stable | +5% |
| Pattern is consistent over 3+ periods | +5% |
| Root cause is clear and supported by multiple data points | +5% |
| One or more required inputs MISSING | −15% each |
| < 2 months of historical data | −10% |
| Significant team composition change | −10% |
| Root cause is inferred with no direct evidence | −10% |

**Base Score**: 70%

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **SLO manipulation** | Team changes SLO definitions to avoid breach reporting | SLO targets shifted after breaches; historical comparison inconsistent | Maintain immutable SLO definitions; compare against original targets |
| **Technical debt deferral** | Team consistently pushes debt tickets to future sprints | Debt items always deprioritized; no dedicated paydown sprints | Mandate debt allocation in sprint planning; set debt reduction goals |
| **Stability masking** | Team focuses on uptime while ignoring error rates | Uptime looks good but error rates increasing | Track all reliability signals: availability, latency, error rate |
| **Change failure normalization** | Team accepts high deployment failure as normal | No improvement initiatives; repeated similar failures | Lower deployment tolerance; require incident analysis before next deploy |
| **Monitoring blind spots** | Team lacks visibility into system health signals | SLOs look good but customer complaints high | Expand observability coverage; correlate customer feedback with metrics |

---

## References

- `CLAUDE.md` — Confidence scoring scale; reliability and DORA metric frameworks
- `docs/principles.md` — Principle 5: Data over Opinions; Principle 12: Measure Outcomes
- `docs/engineering-playbook.md` → *Deployment Practices*, *Incident Response*, *Technical Debt Management*
- `skills/operations/incident-response.md` — Incident analysis methodology
- `confidence-engine/delivery_confidence.md` — Delivery metrics correlate with deployment success
- `integrations/github.md` — Deployment PR and incident analysis
- `integrations/monitoring.md` — SLO and reliability metric collection

---

## Related Skills

| Skill | Relationship |
|---|---|
| `confidence-engine/delivery_confidence.md` | Deployment reliability directly impacts delivery confidence |
| `skills/operations/incident-response.md` | Incident patterns inform architecture risk assessment |
| `skills/delivery/review-sprint.md` | Sprint instability may indicate architectural issues |
| `skills/risk/manage-risk.md` — Technical debt risk management |
| `confidence-engine/executive_confidence.md` — This dimension feeds into the master confidence score |
| `confidence-engine/prediction_confidence.md` — Unstable systems affect prediction reliability |