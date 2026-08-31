# Graph Artifact Contracts

**Domain**: Graph Engineering
**Owner**: `core/orchestrator.py`
**Version**: 2.0 (spec only — runtime enforcement planned Phase 1)
**Changelog**: v1.0 → v2.0 — added ConfidenceAssessment, DecisionMemoryArtifact, ExecutiveBriefArtifact

---

## Purpose

Typed schemas for agent handoffs. Subagents communicate through **bounded artifacts**, not unlimited conversation transcripts — per Ng's multi-agent guidance and Anthropic's orchestrator-workers pattern.

The orchestrator receives structured fields (~200 tokens per worker), not full LLM output (~5,000 tokens).

---

## Base Contract

Every artifact includes:

```yaml
artifact_id: string          # UUID or RUN-YYYY-MM-DD-NNN-artifact-N
artifact_type: string        # DeliveryAssessment | PeopleAssessment | etc.
run_id: string               # Links to graph Run node
producer: string             # subagent name
confidence:
  level: High | Medium | Low | Speculative
  score_pct: 0-100
status: Healthy | Warning | At Risk | Critical
claims:
  - id: string
    text: string
    sources: [source_id]
```

---

## DeliveryAssessment

**Producer**: `delivery-manager`
**Consumer**: `engineering-manager`, `executive-summary`

```yaml
artifact_type: DeliveryAssessment
dora_snapshot:
  deploy_freq: string
  lead_time: string
  change_failure_rate: string
  mttr: string
top_risk:
  description: string
  likelihood: Low | Medium | High
  impact: Low | Medium | High
  mitigation: string
recommendations:
  - action: string
    owner: string
    horizon: immediate | week | systemic
```

---

## PeopleAssessment

**Producer**: `engineering-coach`
**Consumer**: `engineering-manager`

```yaml
artifact_type: PeopleAssessment
team_health_signal: string
burnout_risk: [person_name]
coaching_priorities:
  - person: string
    focus: string
    urgency: Low | Medium | High
recommendations:
  - action: string
    owner: string
    horizon: immediate | week | systemic
```

---

## LeadershipHealthArtifact

**Producer**: `skills/leadership-health/leadership-health-engine.md`
**Consumer**: `engineering-manager`, `analytics/master-leadership-dashboard.md`

```yaml
artifact_type: LeadershipHealthArtifact
holistic_score: 0-100
top_strength: string         # dimension name
primary_gap: string
active_patterns: [string]
dimension_scorecard:
  - pillar: string
    dimension: string
    score: 0-100
    status: Healthy | Warning | At Risk | Critical
development_plan: [string]   # top 3 priorities
```

---

## PoliticalRiskArtifact

**Producer**: `skills/organizational/political-intelligence.md`
**Consumer**: `engineering-manager`, `analytics/master-leadership-dashboard.md`

```yaml
artifact_type: PoliticalRiskArtifact
holistic_score: 0-100        # higher = more risk
active_patterns: [string]
signal_scorecard:
  - signal: string
    score: 0-100
    status: Healthy | Warning | At Risk | Critical
    observation: string
intervention_plan:
  immediate: string
  short_term: string
  systemic: string
```

---

## SynthesisArtifact

**Producer**: `engineering-manager` (when multiple specialists invoked)
**Consumer**: User, `executive-summary`

```yaml
artifact_type: SynthesisArtifact
specialist_findings:
  - agent: string
    summary: string
conflicts_resolved:
  - agents: [string]
    resolution: string
    tradeoff: string
recommendations:
  - action: string
    owner: string
    horizon: immediate | week | systemic
open_questions: [string]
```

---

## ConfidenceAssessment

**Producer**: `confidence-engine/executive_confidence.md`
**Consumer**: `engineering-manager`, `analytics/master-leadership-dashboard.md`, `skills/executive/board-level-summary.md`

```yaml
artifact_type: ConfidenceAssessment
holistic_score: 0-100
overall_confidence: High | Medium | Low | Speculative
dimension_scorecard:
  - dimension: string        # prediction | data_quality | risk | delivery | roadmap | architecture
    score: 0-100
    status: Healthy | Warning | At Risk | Critical
    evidence_summary: string
    evidence_sources:
      - type: GitHub | Jira | Incidents | Customer Bugs | Historical Releases
        reference: string
top_risk:
  dimension: string
  description: string
  mitigation: string
recommendations:
  - action: string
    owner: string
    horizon: immediate | week | systemic
    confidence_pct: 0-100
    supporting_evidence: [string]
trend:
  direction: improving | stable | declining
  comparison_period: string  # "vs. last quarter" etc.
```

---

## DecisionMemoryArtifact

**Producer**: `skills/decision-memory/record-decision.md`
**Consumer**: `engineering-manager`, `decision-memory/decision-memory.md`, `skills/decision-memory/recall-decisions.md`

```yaml
artifact_type: DecisionMemoryArtifact
decision_id: string          # DEC-YYYY-MM-DD-NNN
operation: record | recall | detect_patterns
# --- Record fields (when operation == record) ---
decision:
  summary: string
  alternatives: [string]
  why: string
  who: string                # decision maker(s)
  expected_outcome: string
  domain: string             # delivery | architecture | people | process | product | organizational
quality_score:
  rubric_score: 0-100        # per schema.md quality rubric
  evidence_strength: Strong | Moderate | Weak
  reversibility: Reversible | Partially Reversible | Irreversible
# --- Recall fields (when operation == recall) ---
matching_decisions:
  - decision_id: string
    summary: string
    relevance_score: 0-100
    outcome: string          # actual outcome if known
    lesson: string
# --- Pattern detection fields (when operation == detect_patterns) ---
patterns_detected:
  - pattern_type: string     # Similar failure | Optimism bias | Underestimated complexity | Stakeholder neglect | Reversibility trap | Success blindness
    frequency: integer
    decisions: [decision_id]
    recommendation: string
```

---

## ExecutiveBriefArtifact

**Producer**: `executive-summary`
**Consumer**: User, external stakeholders (VP, Board, HR Partners)

```yaml
artifact_type: ExecutiveBriefArtifact
brief_type: status_update | board_summary | incident_report | quarterly_review
audience: string             # VP Engineering | Board | HR Partner | Cross-functional
executive_summary: string    # 2-4 sentences: situation, recommendation, confidence
confidence:
  level: High | Medium | Low | Speculative
  score_pct: 0-100
key_metrics:
  - metric: string
    current_value: string
    target: string
    trend: improving | stable | declining
    status: Healthy | Warning | At Risk | Critical
top_risks:
  - description: string
    likelihood: Low | Medium | High
    impact: Low | Medium | High
    mitigation: string
    owner: string
recommendations:
  - action: string
    owner: string
    horizon: immediate | week | systemic
source_artifacts:            # provenance — which specialist artifacts fed this brief
  - artifact_id: string
    artifact_type: string
    producer: string
```

---

## Conflict Resolution

When two artifacts have contradicting `status` or `claims`:

1. Write `contradicts` edge between conflicting claims
2. Invoke `skills/conflict/conflict-diagnosis.md`
3. Producer writes `SynthesisArtifact.conflicts_resolved`
4. Write `resolved_by` edge linking to Run node

---

## Implementation Status

| Contract | Spec | Runtime enforcement |
|---|---|---|
| Base | ✅ | ⏳ Phase 1 |
| DeliveryAssessment | ✅ | ⏳ Phase 1 |
| PeopleAssessment | ✅ | ⏳ Phase 1 |
| LeadershipHealthArtifact | ✅ | ⏳ Phase 1 |
| PoliticalRiskArtifact | ✅ | ⏳ Phase 1 |
| SynthesisArtifact | ✅ | ⏳ Phase 1 |
| ConfidenceAssessment | ✅ | ⏳ Phase 1 |
| DecisionMemoryArtifact | ✅ | ⏳ Phase 1 |
| ExecutiveBriefArtifact | ✅ | ⏳ Phase 1 |
