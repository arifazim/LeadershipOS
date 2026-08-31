# Skill: AI Governance & Decision Framework

**Domain**: Organizational Strategy & Governance
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly Review + Per Major Initiative

---

## Purpose

Establish clear guardrails for the use of AI in engineering decisions and product features. This skill ensures that AI-assisted decisions are transparent, accountable, and aligned with organizational risk appetites. It prevents the "Black Box" leadership problem where decisions are made by models without human accountability.

---

## The AI Governance Pillars

### 1. Human-in-the-Loop (HITL) Policy
- **Rule**: Every AI-generated decision with a "High" impact (budget, architecture, people) must be reviewed and signed off by a human authority.
- **Metric**: Ratio of "AI-proposed" vs. "Human-approved" decisions in the [Decision Provenance Agent](file:///c:/Users/ArAzim/Documents/Works/Arif/engineering-manager-os/subagents/decision-provenance-agent.md).

### 2. Model Routing & Transparency
- **Rule**: The rationale for choosing a specific model (e.g., Gemini-1.5-Pro vs. GPT-4o) for a task must be logged.
- **Metric**: Cost/Performance/Risk trade-off record for every major agent deployment.

### 3. Data Privacy & Redaction
- **Rule**: No agent may process PII or proprietary secrets without an active Redaction Pipeline.
- **Metric**: Audit log of "Redaction Failures" or "Sensitive Data Leakage" attempts.

### 4. Accountability Mapping
- **Rule**: An AI cannot "own" an outcome. A human owner must be mapped to every agentic workflow.
- **Metric**: % of agents with a mapped "Responsible Human" in the [team.json](file:///c:/Users/ArAzim/Documents/Works/Arif/engineering-manager-os/config/team.json).

---

## Risk Assessment Matrix

| AI Use Case | Risk Level | Governance Requirement |
|---|---|---|
| **Code Generation** | Low | Peer review by human; Skill Atrophy monitoring. |
| **Architectural Recommendations** | Medium | Decision Provenance log; ADR required. |
| **People Analytics/Feedback** | High | Human-only decision; AI used for synthesis ONLY. |
| **Automated Prod Deployment** | Critical | Strict HITL; Multi-stage canary; Rollback automation. |

---

## Output Template

```markdown
### AI GOVERNANCE REVIEW: [Initiative/Agent Name]
**Date**: YYYY-MM-DD
**Risk Rating**: [Low | Medium | High | Critical]

#### 1. USE CASE & BOUNDARIES
- **Intent**: [What is the AI doing?]
- **Boundaries**: [What is it NOT allowed to do?]

#### 2. GOVERNANCE CONTROLS
- **HITL Owner**: [Name]
- **Redaction Strategy**: [Link to pipeline/config]
- **Atrophy Mitigation**: [e.g., "Manual code review required for all AI PRs"]

#### 3. COMPLIANCE CHECK
- [ ] PII/Secrets handled?
- [ ] Rationale logged in Decision Provenance?
- [ ] Human owner assigned?

#### 4. RECOMMENDATION
- [ ] **Approved**: Proceed with current controls.
- [ ] **Conditional**: Requires [X] additional control.
- [ ] **Rejected**: Risk exceeds organizational appetite.
```
