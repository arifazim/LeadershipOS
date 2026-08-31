# Skill: On-Call Fatigue Analytics

**Domain**: Delivery Management & Team Health
**Owner**: `subagents/incident-manager.md`
**Cadence**: Monthly Review + Post-Major Incident

---

## Purpose

Detect and quantify "On-Call Fatigue" before it leads to senior engineer burnout or attrition. This skill distinguishes between "normal incident volume" and "systemic fatigue" caused by poor on-call rotation design, alert noise, or political inability to fix root causes.

---

## The Fatigue Model

Fatigue is measured across three dimensions:
1. **Intensity**: Number of pages/incidents per shift.
2. **Disruption**: Number of out-of-hours pages (night/weekend).
3. **Recovery**: Time between on-call shifts and time spent on "Post-Incident To-dos" vs. roadmap work.

---

## Analysis & Detection Signals

### 1. The Sleep-Deprivation Signal
- **Signal**: Ratio of 12 AM – 6 AM pages to total pages.
- **Metric**: If an engineer is paged > 2 times between 12 AM – 6 AM in a single week, flag for "Critical Disruption."

### 2. The "To-do" Debt Signal
- **Signal**: Count of "Action Items" from post-mortems that are > 30 days overdue.
- **Metric**: High overdue rate indicates the team is paged for the same issues repeatedly because they lack the capacity to fix them.

### 3. Senior Concentrated Risk
- **Signal**: % of P1 incidents handled by the same top 20% of the team.
- **Metric**: If 80% of critical incidents are handled by 2 senior engineers, flag for "Concentration Fatigue."

---

## Strategic Interventions

- **Alert Triage**: Force-delete any alert with a < 10% actionability rate.
- **Capacity Re-allocation**: Explicitly block 20% of the next sprint for "On-call Debt" if the Fatigue Score is Red.
- **Rotation Redesign**: Implement follow-the-sun or increase rotation size if shift frequency is > 1 in 4 weeks.
- **The Political Ask**: If fatigue is driven by a legacy system, use the [Legacy Migration Tracker](file:///c:/Users/ArAzim/Documents/Works/Arif/engineering-manager-os/skills/delivery/legacy-migration-tracker.md) to demand headcount or budget for decommissioning.

---

## Output Template

```markdown
### ON-CALL FATIGUE REPORT: [Month]
**Team Status**: [Healthy | Warning | Critical]

#### 1. FATIGUE METRICS
- **Avg Pages per Shift**: [N]
- **Out-of-Hours Disruption**: [Low | Med | High]
- **Senior Concentration**: [% of load on seniors]

#### 2. ROOT CAUSE ANALYSIS
- **Top Alert Source**: [Service Name]
- **Action Item Backlog**: [N items > 30 days old]

#### 3. INTERVENTION PLAN
- **Immediate**: [e.g., Silence Alert X]
- **Operational**: [e.g., Block 2 days for post-mortem fixes]
- **Strategic**: [e.g., Request budget for automated remediation]
```
