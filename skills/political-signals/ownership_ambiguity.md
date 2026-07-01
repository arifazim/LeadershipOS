# Skill: Ownership Ambiguity

**Domain**: Political Signals  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly or after organizational changes

---

## Purpose

Detect "Ownership ambiguity" signal and assess organizational risk from unclear decision rights and accountability structures. This skill maps decision rights across the team/organization to identify areas where multiple people claim ownership or no one claims ownership.

This skill answers three questions:
1. Where are decision rights and accountability unclear in the team/organization?
2. When ownership is ambiguous, who steps up, who defers, and who is bypassed?
3. Is the RACI framework complete and current, or does it create confusion?

**Invoke this skill when**: Work is falling through cracks, multiple people claim ownership of the same area, no one takes responsibility for decisions, or after a reorg or restructuring.

**Do not invoke this skill for**: Individual accountability (use `leadership-health/ownership_index.md`), sprint task ownership (use `skills/delivery/review-sprint.md`), or project status tracking (use `skills/communication/weekly-update.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Decision rights mapping | Org chart, RACI, role definitions | Who owns which decisions and outcomes |
| Ownership incident log | 1:1 notes, incident logs, ticket history | Last 6 months of ownership ambiguity incidents |
| Response pattern data | Meeting notes, chat logs | Who stepped up, who deferred, who was bypassed in each incident |
| RACI completeness score | Documentation review | Percentage of key decisions with clear RACI |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Recent reorg/changes | HR, org changes | Timeline of organizational changes affecting ownership |
| Stakeholder expectation mapping | 1:1s, surveys | What each stakeholder expects others to own |
| Bypass incidents | Chat logs, meeting notes | Instances where work went around formal owners |
| Workload distribution | OKRs, project assignments | Who is overloaded vs. who has capacity |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Ownership Clarity Analysis

Evaluate clarity of decision rights:

| Clarity Score | Interpretation |
|---|---|
| 90–100% | High — ownership is clear for all key decisions |
| 70–89% | Good — ownership is clear for most decisions |
| 50–69% | At Risk — ownership ambiguity for key areas |
| < 50% | Critical — unclear ownership is systemic |

### Step 2 — Ambiguity Pattern Detection

Identify patterns of ownership ambiguity:

| Pattern Type | Description | Risk Level |
|---|---|---|
| **Shared ownership** | Multiple people claim ownership of same area; work may be duplicated or contested | Medium |
| **Vacuum ownership** | No one claims ownership; work falls through cracks; decisions delayed | High |
| **Contested ownership** | Multiple claimants actively in conflict; work blocked pending resolution | High |
| **Bypass ownership** | Work consistently goes around formal owners; informal routing emerges | Critical |

### Step 3 — Response Pattern Analysis

Analyze team behavior during ownership ambiguity:

| Response Pattern | Risk Level | Interpretation |
|---|---|---|
| Someone steps up and defers to process | Low | Functional ambiguity resolution |
| Multiple people claim ownership, work proceeds | Medium | Shared ownership, potential conflict |
| No one claims ownership, work stalls | High | Ownership vacuum |
| Work bypassed to someone "getting things done" | Critical | Informal power override of formal structure |

### Step 4 — RACI Freshness Assessment

Evaluate RACI documentation quality:

| Assessment | Indicator |
|---|---|
| **Current** | Updated within last 6 months, reflects recent changes |
| **Stale** | Older than 6 months, may not reflect current reality |
| **Incomplete** | Missing key decisions or roles |
| **Contradicted** | Formal RACI contradicts actual practice |

### Step 5 — Ownership Classification

Classify each ambiguity incident:

| Classification | Criteria |
|---|---|
| **Shared but functional** | Multiple owners coordinate effectively; no work duplication or conflict; clear communication of boundaries |
| **Ambiguous but active** | Uncertainty exists but work continues; temporary overlap during transitions |
| **Vacuum** | No one owns the area; stakeholders unsure who to ask; decisions delayed or not made |
| **Contested** | Multiple claimants in active conflict; work blocked; requires intervention to resolve |

---

## Decision Tree

```
What is the overall ownership clarity score?
│
├── 90–100% (Green) ────────────────────────────────────────────────
│   What is the response pattern in ambiguity incidents?
│   │
│   ├── Clear escalation, no vacuums
│   │   └── OUTCOME: Ownership is clear and functional.
│   │         Recommendation: Monitor and refresh RACI annually.
│   │         Confidence: High.
│   │
│   └── Vacuums or contests occurring
│       └── OUTCOME: Green score masking process gaps.
│             Recommendation: Document current practices in RACI.
│             Review decision rights for recently ambiguous areas.
│             Confidence: Medium.
│
├── 70–89% (Yellow) ───────────────────────────────────────────────
│   What is the primary ambiguity pattern?
│   │
│   ├── Shared ownership (functional)
│   │   └── OUTCOME: Acceptable overlap.
│   │         Recommendation: Define boundaries and handoff protocols.
│   │         Confidence: Medium.
│   │
│   ├── Vacuums in non-critical areas
│   │   └── OUTCOME: At-risk — ownership gaps emerging.
│   │         Recommendation: Ethical Response Protocol applies.
│   │         Assign owners to vacuum areas.
│   │         Confidence: High.
│   │
│   └── Contested ownership
│       └── OUTCOME: At-risk — active ownership conflicts.
│             Recommendation: Ethical Response Protocol applies.
│             Intervene to resolve contest.
│             Confidence: High.
│
└── < 70% (Red) ───────────────────────────────────────────────
    What is driving the low clarity?
    │
    ├── Recent reorg without RACI update
    │   └── OUTCOME: Structural gap.
    │         Recommendation: Urgent RACI update required.
    │         Include all stakeholders in ownership definition.
    │         Confidence: High.
    │
    ├── No RACI exists or is contradicted
    │   └── OUTCOME: Critical ambiguity.
    │         Recommendation: Immediate RACI creation workshop.
    │         Ethical Response Protocol applies.
    │         Confidence: High.
    │
    └── Consistent bypass pattern
        └── OUTCOME: Informal power overriding formal structure.
              Recommendation: Map actual vs. formal ownership.
              Address power dynamics directly.
              Confidence: High.
```

---

## Output

Produce the following artifacts in order.

### 1. Ownership Ambiguity Risk Summary (3–5 sentences)

State: overall risk level, ownership clarity score, primary pattern, response behavior, and one immediate ethical action. Include confidence level.

> **Example**: "Ownership ambiguity risk is Yellow (48). Clarity score is 65% with gaps in customer escalation ownership. Response pattern shows vacuums in 3 of 5 incidents. RACI is stale — last updated 8 months ago after reorg. Immediate action: Propose RACI refresh workshop to clarify decision rights. Confidence: Medium (78%)."

### 2. Ownership Scorecard

| Signal | Value | Threshold | Status |
|---|---|---|---|
| Ownership clarity score | {{%}} | ≥90%=Green, 70–89%=Yellow, <70%=Red | {{G/Y/R}} |
| RACI freshness | {{status}} | Current<6mo=Green, 6–12mo=Yellow, >12mo=Red | {{G/Y/R}} |
| Ambiguity incidents | {{count}} | 0–2=Green, 3–6=Yellow, 7+=Red | {{G/Y/R}} |
| Vacuums/contests ratio | {{%}} | <10%=Green, 10–30%=Yellow, >30%=Red | {{G/Y/R}} |
| **Risk Score** | **{{0–100}}** | **≤30=Green, 31–60=Yellow, >60=Red** | **{{G/Y/R}}** |

### 3. Ownership Incident Log

| Date | Area | Claimants | Response | Outcome | Classification |
|---|---|---|---|---|---|
| {{YYYY-MM-DD}} | {{area}} | {{claimants}} | {{stepped up/deferred/bypassed}} | {{outcome}} | {{Shared/Vacuum/Contested}} |

### 4. RACI Gap Analysis

| Decision Area | Formal Owner | Actual Owner | Gap Type | Recommended Action |
|---|---|---|---|---|
| {{Area}} | {{owner}} | {{actual}} | {{Missing/Stale/Conflicted}} | {{Action}} |

### 5. Ethical Response Protocol

Apply these recommendations when ownership ambiguity creates vacuums or contests:

1. **Name the pattern, not the person** — "I've observed ownership ambiguity in X area creating confusion" rather than "Y doesn't know what they own"
2. **Recommend transparency** — Propose that ownership decisions and RACI be documented and shared
3. **Recommend dialogue** — Suggest a RACI workshop with all stakeholders to clarify roles
4. **Recommend stakeholder alignment** — Ensure all affected parties participate in ownership definition

**Prohibited responses** (never recommend or engage in):
- Accepting ambiguity as "how things work here"
- Letting one person claim ownership without consensus
- Bypassing formal owners without addressing the gap
- Using ambiguity to avoid difficult ownership conversations

### 6. Risk Mitigation Recommendations

- **This week**: {{1 immediate action — e.g., propose RACI workshop}}
- **This quarter**: {{1 systemic change — e.g., implement ownership review process}}
- **Ongoing**: {{Monitoring approach}}

---

## Examples

### Example A — Clear Ownership Structure

**Inputs**
- Ownership clarity score: 94%
- RACI last updated: 3 months ago after minor reorg
- Ambiguity incidents: 1 (new team member learning scope)
- Response: Team lead clarified ownership, work completed
- Workload: Balanced across team

**Output Summary**
> Ownership ambiguity risk is Green (22). Clarity score is 94% with RACI updated recently. One ambiguity incident resolved within 24 hours. All key decisions have clear owners. No ethical response protocol needed. Confidence: High (92%).

**Risk Score**: 22 (Green)

---

### Example B — Ownership Vacuum After Reorg

**Inputs**
- Ownership clarity score: 52%
- RACI last updated: 14 months ago (before reorg)
- Ambiguity incidents: 9 in last 6 months
- Pattern: 5 vacuums, 2 contests, 2 shared ownership
- Response: Work stalled in 6 of 9 incidents; informal routing emerged in 3
- Recent changes: Team merged 4 months ago

**Output Summary**
> Ownership ambiguity risk is Red (71). Clarity score is 52% — significant gaps. Nine ambiguity incidents since reorg. Five ownership vacuums causing work delays. Three instances of informal work routing bypassing formal owners. RACI is stale and does not reflect current structure. Ethical Response Protocol applies — name pattern, recommend RACI refresh workshop, initiate dialogue with all stakeholders. Confidence: High (86%).

**Risk Score**: 71 (Red)

**Recommendations**
- *This week*: Request emergency RACI workshop for top 3 ambiguous areas
- *This quarter*: Implement weekly check on ownership clarity during 1:1s
- *Systemic*: Establish ownership review process after any organizational change

---

## Confidence Score

The confidence score reflects how much to trust this assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs with RACI documentation | +10% |
| Stakeholder mapping confirms clarity score | +5% |
| Multiple data sources corroborate pattern | +5% |
| Recent reorg data available | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| Missing RACI or ownership documentation | −15% each |
| No ownership incident data | −10% |
| Assessment based on a single event | −15% |
| Stakeholder group in active conflict | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in organizational health discussions |
| 70–89% | Medium | Use output; flag any gaps to manager or team |
| 50–69% | Low | Use output as hypothesis; validate with additional data |
| < 50% | Speculative | Do not use for formal assessment; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **RACI acceptance** | Accepting outdated RACI without verification | RACI contradicts actual practice but not questioned | Map actual ownership patterns separately from formal RACI |
| **Informal normalization** | Accepting bypass as "how work gets done" | Work consistently bypasses formal owners without intervention | Document informal patterns; address structural gaps |
| **Conflict avoidance** | Not addressing contested ownership | Areas with multiple claimants but no resolution | Explicitly name contest; facilitate resolution conversation |
| **Transition blindness** | Missing ownership gaps after reorg | New structure implemented but ownership unclear | Audit all decision areas within 30 days of any change |
| **Scope creep** | Expanding ownership scope without agreement | One person's responsibilities grow without discussion | Track ownership scope changes explicitly |

---

## References

- `docs/principles.md` — Principle 8: *Think in Systems*; Principle 3: *Default to Transparency*
- `political-signals/README.md` — Module overview and Ethical Response Protocol
- `skills/delivery/review-sprint.md` — Template for structure and confidence scoring
- `leadership-health/ownership_index.md` — Related: individual ownership behavior
- `leadership-health/organizational_clarity.md` — Related: clarity of roles and responsibilities

---

## Related Skills

| Skill | Relationship |
|---|---|
| `political-signals/decision_reversals.md` | Ownership ambiguity drives decision instability |
| `political-signals/escalation_patterns.md` | Unclear ownership triggers bypass escalation |
| `political-signals/meeting_exclusion.md` | Unclear ownership creates meeting confusion |
| `political-signals/incentive_misalignment.md` — Ownership affects incentive alignment |
| `political-signals/political-signals.md` | This dimension feeds into the holistic risk score |
| `confidence-engine/executive_confidence.md` | Ownership ambiguity undermines confidence in execution |