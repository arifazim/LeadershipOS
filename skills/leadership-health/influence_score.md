# Skill: Influence Score

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly

---

## Purpose

Measure the engineering manager's ability to shape outcomes beyond their direct authority. Influence is how an EM gets things done when they do not have direct control — cross-team projects, organizational change, resource allocation.

This skill answers three questions:
1. Does the EM shape outcomes beyond their team, or are they confined to their own org chart?
2. Is the EM building coalitions and informal leadership, or relying solely on formal authority?
3. What is the EM's organizational impact beyond their direct reports?

**Invoke this skill when**: Preparing for a promotion conversation, when cross-team collaboration is required, or when the EM wants to expand their organizational impact.

**Do not invoke this skill for**: Measuring direct team leadership (use `coaching_score.md` or `delegation_score.md`), measuring political navigation (use `political_awareness.md`), or measuring stakeholder alignment (use `stakeholder_alignment.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Cross-team project involvement | Project management tool / EM tracking | Last 10 cross-team projects: EM role, impact, outcome |
| Informal network analysis | EM self-assessment or peer feedback | 5–10 key relationships outside the team: strength, reciprocity, influence |
| Peer nominations | 360 feedback, skip-levels | 3–5 peer nominations for "who would you go to for X?" |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Coalition building instances | Meeting notes, project records | Count of times EM brought together stakeholders to achieve an outcome |
| Informal leadership signals | Team forum, skip-levels | Instances where EM was turned to for guidance outside their team |
| Organizational impact metrics | Project outcomes, initiative results | Outcomes achieved that required cross-team coordination |
| Request frequency from outside the team | Slack / email / meeting data | Count of unsolicited requests for input or collaboration |
| Peer EM calibration | Calibration sessions | Relative positioning of EM influence compared to peer EMs |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Cross-Team Project Impact
Review the last 10 cross-team projects:
- **Project impact rate** = `(Projects where EM's involvement changed the outcome ÷ Total cross-team projects) × 100`

| Project Impact Rate | Interpretation |
|---|---|
| ≥ 60% | High. EM is a significant contributor to cross-team outcomes. |
| 40–59% | Acceptable. EM contributes to cross-team outcomes in some projects. |
| 20–39% | At Risk. EM's cross-team involvement is mostly observational. |
| < 20% | Critical. EM has no visible cross-team impact. |

### Step 2 — Coalition Building Assessment
Review coalition building instances:
- **Coalition count** = Number of times EM brought together 3+ stakeholders to achieve an outcome in the last quarter

| Coalition Count | Interpretation |
|---|---|
| ≥ 3 | High. EM is actively building coalitions. |
| 1–2 | Acceptable. EM builds coalitions occasionally. |
| 0 | At Risk. EM does not build coalitions. |
| Negative (EM blocked coalition) | Critical. EM is a barrier to cross-team collaboration. |

### Step 3 — Informal Network Strength
Review informal network analysis:
- **Network density** = `(Number of strong, reciprocal relationships outside the team ÷ Total relationships outside the team) × 100`

| Network Density | Interpretation |
|---|---|
| ≥ 60% | High. EM has a strong informal network. |
| 40–59% | Acceptable. EM has some strong relationships outside the team. |
| 20–39% | At Risk. EM's informal network is weak. |
| < 20% | Critical. EM has no meaningful relationships outside their team. |

### Step 4 — Peer Recognition
Review peer nominations and request frequency:
- **Peer nomination count** = Number of times peers nominated EM for influence in a specific domain
- **Request frequency** = Count of unsolicited requests from outside the team

| Peer Recognition | Interpretation |
|---|---|
| 3+ nominations across domains | High. Peers recognize EM as an influencer. |
| 1–2 nominations | Acceptable. Some peer recognition exists. |
| 0 nominations | At Risk. Peers do not turn to EM for influence. |
| EM is the last resort (only asked when others fail) | Critical. EM has negative influence. |

### Step 5 — Synthesize Influence Signal
Combine project impact, coalition building, network strength, and peer recognition into an overall influence assessment. Weight: Project impact (35%), Coalition building (25%), Network strength (25%), Peer recognition (15%).

---

## Decision Tree

Use this tree to determine the influence classification and primary recommendation.

```
What is the project impact rate?
│
├── ≥ 60% ────────────────────────────────────────────────
│   What is the coalition count?
│   │
│   ├── ≥ 3 ────────────────────────────────────────────
│   │   What is the network density?
│   │   │
│   │   ├── ≥ 60%
│   │   │   └── OUTCOME: Influence is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Leverage influence for organizational initiatives.
│   │   │
│   │   └── < 60%
│   │       └── OUTCOME: Influence is strong with network gap.
│   │             Recommendation: Invest in relationships
│   │             outside your immediate peer group.
│   │             Attend cross-team forums. Build reciprocity.
│   │
│   └── 1–2 ────────────────────────────────────────────
│       └── OUTCOME: Influence is functional but coalition building is limited.
│             Recommendation: Identify one cross-team initiative
│             where you can bring stakeholders together.
│             Build a coalition before proposing the initiative.
│
├── 40–59% ───────────────────────────────────────────────
│   What is the peer nomination count?
│   │
│   ├── 1–2
│   │   └── OUTCOME: Influence is functional with impact gap.
│   │             Recommendation: Focus on one cross-team project
│   │             where you can demonstrate measurable impact.
│   │             Document the outcome for your next review.
│   │
│   └── 0
│       └── OUTCOME: Influence is at risk.
│             Recommendation: Peers do not recognize your influence.
│             Review your cross-team interactions.
│             Are you contributing, or are you extracting?
│             Shift to a contribution posture.
│
└── < 40% ─────────────────────────────────────────────────
    What is the primary influence failure?
    │
    ├── NO CROSS-TEAM IMPACT
    │   └── OUTCOME: Influence is broken — EM is confined to their team.
    │         Recommendation: Join one cross-team initiative this quarter.
    │         Do not lead it — contribute first, then build influence.
    │
    ├── NO COALITION BUILDING
    │   └── OUTCOME: Influence is broken — EM works alone.
    │         Recommendation: Practice coalition building.
    │         Before any cross-team proposal, identify 2–3 allies
    │         and align with them before the broader meeting.
    │
    ├── WEAK NETWORK
    │   └── OUTCOME: Influence is broken — EM has no informal relationships.
    │         Recommendation: Map your network. Identify 3 relationships
    │         to build this quarter. Invest in reciprocity.
    │
    └── NEGATIVE PEER RECOGNITION
        └── OUTCOME: Influence is broken — EM is not trusted outside the team.
              Recommendation: Diagnose the trust gap.
              Are you known for taking credit, blocking decisions,
              or not following through? Address the root cause.
```

---

## Output

Produce the following artifacts in order.

### 1. Influence Summary (3–5 sentences)

State: overall influence signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Influence is functional with an impact gap. Project impact rate is 48% — EM contributes to cross-team projects but rarely changes the outcome. Coalition count is 1 this quarter, and network density is 45%. Peer recognition is 2 nominations. The primary gap is impact: EM is present in cross-team projects but not driving outcomes. Immediate action: EM to identify one cross-team initiative where they can take a lead role on a specific deliverable. Confidence: High (82%)."

### 2. Influence Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Project impact rate | {{%}} | ≥ 60% = Green, 40–59% = Yellow, < 20% = Red | {{G/Y/R}} |
| Coalition count | {{count}} | ≥ 3 = Green, 1–2 = Yellow, 0 = Red | {{G/Y/R}} |
| Network density | {{%}} | ≥ 60% = Green, 40–59% = Yellow, < 20% = Red | {{G/Y/R}} |
| Peer nominations | {{count}} | 3+ = Green, 1–2 = Yellow, 0 = Red | {{G/Y/R}} |

### 3. Network Map

| Relationship | Domain | Strength | Reciprocity | Influence Potential |
|---|---|---|---|---|
| {{Name / Role}} | {{Domain}} | {{Strong / Moderate / Weak}} | {{High / Med / Low}} | {{High / Med / Low}} |

### 4. Root Cause (if influence is At Risk or Broken)

- **Primary cause**: {{No cross-team impact / No coalition building / Weak network / Negative peer recognition}}
- **Evidence**: {{2–3 specific observations from project records or peer feedback}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to influence practice}}
- **Network investment** (if applicable): {{Specific relationship to build}}

---

## Examples

### Example A — Strong Influence

**Inputs**
- Cross-team projects: 8 projects — EM's involvement changed the outcome in 6 (75% impact rate)
- Coalition building: 4 coalitions formed this quarter — EM brought together platform, product, and data teams for a shared initiative
- Informal network: 12 relationships outside the team — 8 are strong and reciprocal (67% density)
- Peer nominations: 4 nominations — peers nominated EM for "best cross-team collaborator" and "go-to for platform decisions"
- Request frequency: 8 unsolicited requests from outside the team this quarter

**Output Summary**
> Influence is strong. Project impact rate is 75%, coalition count is 4, network density is 67%, and peer nominations are 4. EM is a recognized cross-team leader who builds coalitions and drives outcomes. The one gap is that influence is concentrated in the engineering domain — EM has less influence with product and GTM stakeholders. Confidence: High (93%).

---

### Example B — Influence Broken

**Inputs**
- Cross-team projects: 7 projects — EM's involvement changed the outcome in 1 (14% impact rate)
- Coalition building: 0 coalitions formed this quarter
- Informal network: 8 relationships outside the team — 2 are strong and reciprocal (25% density)
- Peer nominations: 0 nominations
- Request frequency: 1 unsolicited request from outside the team this quarter

**Output Summary**
> Influence is broken. Project impact rate is 14% — EM is present in cross-team projects but does not change outcomes. Coalition count is 0, network density is 25%, and peer nominations are 0. EM is not building relationships or coalitions outside the team. The primary cause is that EM is fully consumed by team operations and has not invested in cross-team relationships or visibility. Confidence: High (85%).

**Recommendations**
- *This week*: EM to identify one cross-team forum or meeting to attend this month.
- *This quarter*: Join one cross-team initiative as a contributor. Focus on delivering value before seeking influence.
- *Network investment*: Identify 3 peers in other teams to build relationships with. Schedule informal coffee chats.

---

## Confidence Score

The confidence score reflects how much to trust this influence assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any influence assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Project data is tool-tracked | +5% |
| Peer nominations are from multiple sources | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Network analysis is self-reported only | −10% |
| No peer nominations available | −10% |
| Project data is incomplete | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in influence development planning |
| 70–89% | Medium | Use output; flag gaps to manager |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for promotion or development planning; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Impact inflation** | EM attributes cross-team success to themselves | Project impact rate is high but peers report EM was a participant, not a driver | Use peer feedback as primary impact signal |
| **Network self-reporting** | EM overestimates relationship strength | Network density is high but request frequency is low | Cross-reference self-reported network with actual request frequency |
| **Coalition tokenism** | EM attends cross-team meetings but does not build coalitions | Coalition count is low despite meeting attendance | Measure coalition building as active alignment, not passive attendance |
| **Influence as authority** | EM equates formal authority with influence | EM has a senior title but low peer nominations | Influence is informal — measure peer recognition, not org chart position |
| **Domain confinement** | EM has influence only within engineering | Influence is strong in engineering but absent in product or GTM | Expand influence scope deliberately |
| **Negative influence blindness** | EM does not recognize when they are a barrier | Peer nominations are 0 but EM reports positive cross-team interactions | Use 360 and skip-level feedback as primary signal |

---

## References

- `docs/principles.md` — Principle 4: *Influence Before Authority*; Principle 7: *Grow the Team*
- `docs/engineering-playbook.md` → *Managing Across*, *Cross-Team Collaboration*, *Organizational Influence*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `political_awareness.md` — Closely related — political awareness enables influence
- `stakeholder_alignment.md` — Closely related — alignment is a form of influence
| `communication_effectiveness.md` | Closely related — communication is a primary influence tool |
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) — Stakeholder management (complementary) |
| Kotter — *Leading Change* (2012): Building coalitions as a change leadership step |
| Cialdini — *Influence* (2021): Six principles of persuasion |

---

## Related Skills

| Skill | Relationship |
|---|---|
| `political_awareness.md` | Closely related — political awareness enables effective influence |
| `stakeholder_alignment.md` | Closely related — alignment is a form of influence |
| `communication_effectiveness.md` | Closely related — communication is a primary influence tool |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `executive_trust_score.md` | Trust is a prerequisite for influence |
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) | Stakeholder management (complementary) |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Strategic alignment requires influence |
