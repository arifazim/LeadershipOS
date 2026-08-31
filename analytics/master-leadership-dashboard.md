# Master Leadership Dashboard

**Domain**: Leadership Analytics & Strategy
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM, VP of Engineering, HR Partners, Cross-functional Stakeholders
**Cadence**: Monthly Refresh + Quarterly Deep Dive

---

## Purpose

The single source of truth for engineering leadership health, delivery performance, and organizational risk. This dashboard synthesizes signals from 100+ metrics across 15 layers of the Engineering Manager OS into five actionable views.

---

## View 1: Executive Confidence (Trust & Predictability)
*Answers: "Can I trust this team to deliver what they promised?"*

- **Executive Confidence Score (0-100)**: Composite of Prediction, Data Quality, Risk, Delivery, Roadmap, and Architecture confidence.
- **Decision Provenance Index**: Decision latency trends and authority concentration signals.
- **DORA Delivery Metrics**: Deployment Frequency, Lead Time, Change Failure Rate, and MTTR.
- **Sprint Predictability**: Average feature delivery rate vs. commitment over the last 3 sprints.
- **Risk Signal Index**: Absence of decision reversals, organizational blockers, and key person risks.

---

## View 2: Delivery & Strategic Impact (Value Creation)
*Answers: "Is the team shipping what matters to the business?"*

- **Strategic Alignment Score**: % of delivered features directly connected to Company OKRs.
- **Scope-Drift Alert**: Pilot vs. Production work ratio; un-chartered initiative detection.
- **Customer Impact Score**: Composite of feature delivery rate, quality signal (P1 incidents), and outcome realization.
- **Time to Value**: Average cycle time from feature commit to customer delivery.
- **Roadmap Execution Rate**: % of quarterly roadmap commitments achieved.

---

## View 3: Organizational Health & People Risk (Team Sustainability)
*Answers: "Is the team healthy, growing, and likely to stay?"*

- **Organizational Health Score**: Composite of Engagement, Structural Risk, Leadership Quality, and Process Quality.
- **Trust Recovery Velocity**: Post-reorg sentiment trends and commitment follow-through.
- **Skill Atrophy Signal**: AI-assisted vs. human-debugged code ratios; novel problem-solving latency.
- **Retention Risk Profile**: Distribution of team members across risk levels (Low to Critical).
- **Burnout Heatmap**: Maslach burnout dimensions across the team (Exhaustion, Cynicism, Inefficacy).
- **Career Momentum Index**: Promotion readiness distribution and growth velocity trends.
- **Coaching Effectiveness**: % of team members advancing on their IDP (Individual Development Plan).

---

## View 4: Stakeholder & Cross-Functional Alignment (Influence)
*Answers: "Is engineering a trusted partner or a bottleneck?"*

- **Stakeholder Trust Score**: Weighted average of trust (Reliability, Transparency, Competence) across Product, Design, and Sales.
- **Contract Drift Monitor**: Provider vs. Consumer intent divergence signals.
- **Decision Stickiness**: % of cross-functional decisions not relitigated within 30 days.
- **Influence Score**: Engineering's ability to change non-engineering decisions through technical authority.
- **Blocker Resolution Velocity**: Average time to resolve cross-team dependencies.

---

## View 5: Innovation & Future Readiness (Leverage)
*Answers: "Are we building for the future or just keeping the lights on?"*

- **Capacity Allocation Ratio**: Split between New Capabilities (Target 30-40%), Technical Investment, and Maintenance.
- **AI Governance Score**: HITL compliance rate; Redaction pipeline health; Model routing transparency.
- **Technical Investment Rate**: % of capacity dedicated to infrastructure, CI/CD, and developer experience.
- **Architecture Quality Index**: ADR coverage, tech debt trend, and dependency hygiene.
- **Experimentation Rate**: Number of technical spikes or proof-of-concepts completed per quarter.

---

## Thresholds & Action Triggers

| Score | Status | Primary Action |
|---|---|---|
| **80-100** | **Green** | Maintain and optimize. Share best practices with peer teams. |
| **60-79** | **Yellow** | Address localized gaps. Name the 2-3 specific metrics needing attention. |
| **40-59** | **At Risk** | Multiple systemic risks. Structured intervention required this quarter. |
| **0-39** | **Critical** | Crisis mode. Immediate escalation to leadership and structural reset. |
