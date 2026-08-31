# Skill: Scope-Drift Detector

**Domain**: Product Partnership & Delivery Management
**Owner**: `subagents/product-partner.md`
**Cadence**: Bi-Weekly (Sprint Review)

---

## Purpose

Detect and flag "Silent Scope Creep," specifically in AI and agent-based projects where a "Pilot" or "Proof of Concept" (PoC) quietly absorbs production requirements or traffic without a formal re-scoping conversation. This skill protects the team from "hidden" production support burdens and ensures architectural alignment.

---

## The Drift Model

Scope drift occurs in three stages:
1. **Feature Padding**: Small "nice-to-have" additions that aren't in the original charter.
2. **Production-ization**: A PoC starts being used by a small group of real users, requiring "minimal" stability fixes.
3. **The Hidden Prod**: The PoC is now mission-critical for a department, but still lacks formal SLA, monitoring, or redundancy.

---

## Analysis & Detection Signals

### 1. Charter vs. Current Work Diff
- **Signal**: Compare the original Project Charter/PRD against the current Sprint backlog and recent PR titles.
- **Metric**: If > 30% of active tasks are not mapped to a Charter objective, flag "Uncharted Work."

### 2. Traffic/Requirement Infiltration
- **Signal**: Check for keywords in PRs or Slack: "temporary fix for [User X]," "production hotfix for pilot," "manual data patch."
- **Metric**: Presence of production-level urgency in a project defined as "Experimental."

### 3. Capability Creep
- **Signal**: An AI agent designed for "Summarization" starts handling "PII Redaction" or "Financial Calculation."
- **Metric**: Mismatch between the "Agent Intent" in the original design and the "Agent Actions" in the latest code.

---

## Decision Framework

| Signal | Severity | Recommendation |
|---|---|---|
| **Pilot has real user traffic** | **High** | Halt new features; initiate "Production Graduation" review. |
| **Agent handling unapproved data types** | **Critical** | Immediate security audit; revert code; re-scope security contract. |
| **>20% work is bug fixing a PoC** | **Medium** | Re-evaluate PoC stability; block new feature work. |
| **Pilot duration > 2x original estimate** | **Medium** | Force "Keep/Kill/Pivot" decision meeting. |

---

## Output Template

```markdown
### SCOPE-DRIFT DETECTOR: [Project Name]
**Date**: YYYY-MM-DD
**Drift Status**: [Stable | Warning | Critical]

#### 1. DRIFT ANALYSIS
- **Original Charter**: [Link/Summary]
- **Current Reality**: [2-3 sentences on what is actually being built/supported]
- **Drift Ratio**: [% of work not in charter]

#### 2. RISKS OF SILENT GRADUATION
- **Technical**: [e.g., "Lacks PagerDuty integration but has 50 users"]
- **Product**: [e.g., "Pilot metrics are being used for executive reporting"]
- **Compliance**: [e.g., "Processing PII without a formal security review"]

#### 3. RECOMMENDED ACTION
- [ ] **Option A**: Formal Re-scoping (Update Charter)
- [ ] **Option B**: Production Graduation (Add SLAs/Monitoring)
- [ ] **Option C**: Feature Freeze (Return to PoC boundaries)
```
