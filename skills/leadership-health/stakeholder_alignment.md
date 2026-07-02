# Skill: Stakeholder Alignment

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or before major planning cycles

---

## Purpose

Measure how well engineering priorities map to stakeholder expectations. Misalignment is the primary cause of delivery surprises, missed commitments, and relationship strain between engineering and the business.

This skill answers three questions:
1. Do stakeholders understand what engineering is building and why?
2. Are engineering priorities changing in response to stakeholder needs, or in reaction to noise?
3. Where are the alignment gaps, and what is causing them?

**Invoke this skill when**: Preparing for a QBR, a roadmap review, before a major planning cycle, or when stakeholder surprise has occurred.

**Do not invoke this skill for**: Internal team priority alignment (use `skills/strategy/align-priorities.md` (planned — not yet built)), sprint delivery reviews (use `skills/delivery/review-sprint.md`), or individual stakeholder management (use `skills/stakeholder/manage-expectations.md` (planned — not yet built)).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Current roadmap | Product / engineering planning artifact | List of initiatives with target dates and owners |
| Stakeholder interviews (last 30 days) | 1:1s, QBRs, syncs | 3–5 verbatim expectations or concerns from each key stakeholder group |
| Requirement change rate | Jira / issue tracker | % of requirements that changed after being committed to a sprint |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Executive status update history | EM's written updates | Last 3 updates with stakeholder reactions noted |
| Priority conflict log | EM tracking | Instances where two stakeholders requested conflicting priorities |
| Stakeholder satisfaction survey | Formal or informal survey | Score or themes from product, sales, marketing, support |
| Roadmap version history | Product management tool | Count of roadmap revisions in last quarter |
| Surprise event log | Incident / escalation log | Instances where stakeholders were surprised by delivery outcomes |
| Cross-functional meeting attendance | Calendar data | % of stakeholder meetings EM attended vs. sent a delegate |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Roadmap Mapping
Map each current roadmap initiative to the stakeholder expectations gathered in interviews:

- For each initiative: does at least one key stakeholder explicitly expect it? (Yes / Partial / No)
- For each stakeholder expectation: is it covered by a roadmap initiative? (Yes / Partial / No)

Calculate:
- **Stakeholder coverage** = `(Initiatives with at least one stakeholder expectation ÷ Total initiatives) × 100`
- **Expectation coverage** = `(Stakeholder expectations covered by an initiative ÷ Total stakeholder expectations) × 100`

### Step 2 — Requirement Change Rate Assessment
Review the requirement change rate against the following thresholds:

| Requirement Change Rate | Interpretation |
|---|---|
| < 10% | Healthy. Requirements are stable and well-understood. |
| 10–20% | Acceptable. Some requirements evolve during execution. |
| 20–35% | At Risk. Requirements are frequently unclear or changing. |
| > 35% | Critical. Engineering is building moving targets. |

If the rate is > 20%, classify the changes:
- **Clarification changes**: Original requirement was ambiguous; change adds clarity. (Lower risk)
- **Scope changes**: Original requirement was clear but stakeholder changed their mind. (Higher risk)
- **New requirements**: New requests added mid-stream. (Highest risk)

### Step 3 — Misalignment Cause Classification
If coverage is below 80% or requirement change rate is above 20%, identify the primary cause:

| Cause | Detection | Interpretation |
|---|---|---|
| **Unclear requirements** | Stakeholder expectations are vague or missing acceptance criteria | Engineering does not know what "done" looks like |
| **Changing priorities** | Roadmap revisions are frequent; stakeholder interviews reveal shifting goals | Stakeholder leadership has not committed to a stable direction |
| **Missing status communication** | Stakeholders report surprise at delivery outcomes; EM status updates are infrequent or low-detail | Engineering is working but stakeholders do not know it |
| **Conflicting stakeholder demands** | Two or more stakeholders have incompatible expectations for the same timeline | EM has not mediated or escalated the conflict |
| **Capacity mismatch** | Stakeholders expect more than the team can deliver in the timeline | Expectations are not calibrated to engineering capacity |

Assign **one primary cause**. Multiple causes may be present; name the dominant one.

### Step 4 — Surprise Event Analysis
If surprise events are present in the log:
- Count surprises in the last 90 days.
- For each surprise: was it a delivery miss, a priority shift, or a capability gap?
- Determine if the surprise was foreseeable given the information available to stakeholders.

A surprise that was foreseeable given public roadmap data is a communication failure. A surprise that was not foreseeable is an estimation or capacity failure.

### Step 5 — Synthesize Alignment Signal
Combine coverage metrics, requirement stability, misalignment cause, and surprise analysis into an overall alignment assessment.

---

## Decision Tree

Use this tree to determine the alignment classification and primary recommendation.

```
What is the expectation coverage?
│
├── ≥ 90% ────────────────────────────────────────────────
│   What is the requirement change rate?
│   │
│   ├── < 20% ───────────────────────────────────────────
│   │   What is the stakeholder coverage?
│   │   │
│   │   ├── ≥ 90%
│   │   │   └── OUTCOME: Alignment is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Maintain current communication cadence.
│   │   │
│   │   └── < 90%
│   │       └── OUTCOME: Alignment is functional but some
│   │             initiatives lack stakeholder ownership.
│   │             Recommendation: Identify "orphan" initiatives —
│   │             initiatives that no stakeholder explicitly expects.
│   │             Either assign an owner or deprioritize.
│   │
│   └── ≥ 20% ──────────────────────────────────────────
│       └── OUTCOME: Alignment is functional but requirements are unstable.
│             Recommendation: Investigate requirement change cause.
│             If scope changes: escalate to product leadership.
│             If clarifications: improve acceptance criteria process.
│
├── 70–89% ───────────────────────────────────────────────
│   What is the requirement change rate?
│   │
│   ├── < 20%
│   │   └── OUTCOME: Alignment has gaps but requirements are stable.
│   │             Recommendation: Identify the gap —
│   │             are there stakeholder expectations without roadmap coverage,
│   │             or roadmap initiatives without stakeholder expectation?
│   │             Close the gap with explicit communication.
│   │
│   └── ≥ 20%
│       └── OUTCOME: Alignment is at risk.
│             Recommendation: Run a stakeholder alignment session
│             before next planning cycle. Map every expectation
│             to a roadmap item with a date and owner.
│
└── < 70% ─────────────────────────────────────────────────
    What is the primary misalignment cause?
    │
    ├── UNCLEAR REQUIREMENTS
    │   └── OUTCOME: Alignment is broken due to requirement ambiguity.
    │         Recommendation: Implement acceptance criteria workshop
    │         before any initiative enters sprint planning.
    │
    ├── CHANGING PRIORITIES
    │   └── OUTCOME: Alignment is broken due to unstable direction.
    │         Recommendation: Escalate to product and engineering leadership.
    │         A stable 2-quarter roadmap is required before planning can resume.
    │
    ├── MISSING STATUS COMMUNICATION
    │   └── OUTCOME: Alignment is broken due to information gap.
    │         Recommendation: Increase status communication frequency
    │         and detail. Move from "what we did" to "what it means
    │         for stakeholders."
    │
    ├── CONFLICTING STAKEHOLDER DEMANDS
    │   └── OUTCOME: Alignment is broken due to unresolved conflict.
    │         Recommendation: EM to mediate a stakeholder alignment session.
    │             If conflict persists, escalate to director level for prioritization.
    │
    └── CAPACITY MISMATCH
        └── OUTCOME: Alignment is broken due to expectation miscalibration.
              Recommendation: Publish capacity model and current commitments
              in a format stakeholders can read. Renegotiate scope or timeline.
```

---

## Output

Produce the following artifacts in order.

### 1. Alignment Summary (3–5 sentences)

State: overall alignment signal (strong / functional / at risk / broken), coverage metrics, requirement stability, primary misalignment cause, and one immediate action. Include confidence level.

> **Example**: "Stakeholder alignment is functional but at risk. Expectation coverage is 82% — 9 of 11 stakeholder expectations map to roadmap initiatives, but 2 stakeholder groups have expectations with no roadmap coverage. Requirement change rate is 24%, primarily due to scope changes from the sales team. The primary misalignment cause is conflicting stakeholder demands. Immediate action: EM to schedule a stakeholder alignment session with product and sales before the next planning cycle. Confidence: High (85%)."

### 2. Alignment Scorecard

| Metric | Value | Threshold | Status |
|---|---|---|---|
| Stakeholder coverage | {{%}} | ≥ 90% = Green, 70–89% = Yellow, < 70% = Red | {{G/Y/R}} |
| Expectation coverage | {{%}} | ≥ 90% = Green, 70–89% = Yellow, < 70% = Red | {{G/Y/R}} |
| Requirement change rate | {{%}} | < 10% = Green, 10–20% = Yellow, > 20% = Red | {{G/Y/R}} |
| Surprise events (90 days) | {{count}} | 0 = Green, 1–2 = Yellow, ≥ 3 = Red | {{G/Y/R}} |

### 3. Coverage Map

List initiatives and their stakeholder alignment:

| Initiative | Stakeholder(s) | Coverage Status | Notes |
|---|---|---|---|
| {{Initiative 1}} | {{Stakeholder group}} | {{Covered / Partial / Uncovered}} | {{Any gap or risk}} |
| {{Initiative 2}} | {{Stakeholder group}} | {{Covered / Partial / Uncovered}} | {{Any gap or risk}} |

### 4. Root Cause (if alignment is At Risk or Broken)

- **Primary cause**: {{Unclear requirements / Changing priorities / Missing status communication / Conflicting stakeholder demands / Capacity mismatch}}
- **Evidence**: {{2–3 specific observations}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to alignment practice}}
- **Escalation** (if applicable): {{Specific conflict or priority issue to escalate to director level}}

---

## Examples

### Example A — Strong Alignment

**Inputs**
- Roadmap: 8 initiatives across Q3
- Stakeholder interviews: 4 stakeholder groups (Product, Sales, Marketing, Support) — all expectations are specific and time-bound
- Requirement change rate: 8% — all changes were clarifications, not scope changes
- Surprise events: 0 in the last 90 days
- Stakeholder coverage: 100% (all initiatives have at least one stakeholder owner)
- Expectation coverage: 95% (19 of 20 expectations mapped)

**Output Summary**
> Stakeholder alignment is strong. All roadmap initiatives have stakeholder owners, and 95% of stakeholder expectations are covered by roadmap items. Requirement change rate is 8% with no scope changes — requirements are stable and well-understood. Zero surprise events in the last 90 days. The one uncovered expectation is a support tooling request that was not prioritized; it should be evaluated for Q4. Confidence: High (94%).

---

### Example B — Alignment Broken

**Inputs**
- Roadmap: 6 initiatives for Q3
- Stakeholder interviews: 3 stakeholder groups — expectations are vague ("we need better performance") or conflicting (Sales wants Q3 launch, Product wants Q4)
- Requirement change rate: 38% — 14 of 37 requirements changed after sprint commitment; 8 were scope changes
- Surprise events: 3 in the last 90 days — all were delivery surprises where stakeholders reported they "didn't know that was the plan"
- Stakeholder coverage: 67% (4 of 6 initiatives have a stakeholder owner; 2 are "platform health" with no business stakeholder)
- Expectation coverage: 58% (7 of 12 expectations mapped to roadmap)

**Output Summary**
> Stakeholder alignment is broken. Expectation coverage is 58% — 5 stakeholder expectations have no roadmap coverage, and 2 roadmap initiatives have no stakeholder owner. Requirement change rate is 38%, driven by scope changes from Sales and Product. Three surprise events in 90 days indicate that status communication is not reaching stakeholders in a format they can act on. The primary misalignment cause is conflicting stakeholder demands — Sales and Product have incompatible timelines for the same initiative. Confidence: High (88%).

**Recommendations**
- *This week*: EM to publish the current roadmap with initiative owners and dates in a shared format accessible to all stakeholders.
- *This quarter*: Implement a monthly stakeholder sync with structured agenda: roadmap review, expectation check, and upcoming changes.
- *Escalation*: EM to escalate the Sales vs. Product timeline conflict to the director level for prioritization decision before next planning cycle.

---

## Confidence Score

The confidence score reflects how much to trust this alignment assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any alignment assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 6) | +10% |
| Stakeholder interviews include all key groups (Product, Sales, GTM) | +5% |
| Requirement change data is tracked in a tool (not self-reported) | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Stakeholder interviews cover fewer than 3 groups | −10% |
| Requirement change rate is self-reported only | −10% |
| No roadmap artifact exists (priorities are verbal only) | −15% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in planning and stakeholder communication |
| 70–89% | Medium | Use output; flag gaps to stakeholders |
| 50–69% | Low | Use output as hypothesis; validate coverage claims before acting |
| < 50% | Speculative | Do not use for executive communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Roadmap theater** | Roadmap exists but is not used as a planning or communication tool | Roadmap is not referenced in sprint planning or stakeholder updates | Treat roadmap as a living document or retire it |
| **Requirement change under-reporting** | Changes are tracked informally or not at all | EM reports low change rate but delivery variance is high | Require tool-tracked requirement changes before scoring |
| **Stakeholder sampling bias** | Only supportive stakeholders are interviewed | Feedback is uniformly positive but surprises occur | Interview at least one stakeholder who has raised concerns |
| **Surprise normalization** | Surprises are so frequent they are no longer flagged | Surprise event log is incomplete because "that's just how it works" | Count every instance where a stakeholder said "I didn't know" |
| **Coverage inflation** | An initiative is counted as "covered" because a stakeholder was informed, not because they expect it | Coverage is high but stakeholder satisfaction is low | Define coverage as explicit expectation, not mere awareness |
| **Conflict avoidance** | Conflicting stakeholder demands are smoothed over in reporting | Multiple stakeholders have incompatible expectations but no escalation is noted | Name the conflict explicitly; do not resolve through ambiguity |

---

## References

- `docs/principles.md` — Principle 8: *Predict before React*; Principle 12: *Measure Outcomes*
- `docs/engineering-playbook.md` → *Managing Up*, *Roadmapping*, *Stakeholder Communication*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/stakeholder/manage-expectations.md` (planned — not yet built) — Tactical stakeholder communication (complementary)
- `skills/strategy/align-priorities.md` (planned — not yet built) — Internal priority alignment (complementary)
- `skills/executive/executive-communication.md` — Executive update format and cadence
- Spitzmuller et al. — *The Proactive Personality Scale and Business Performance* (2021): Proactive stakeholder management outcomes

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) | Tactical communication with individual stakeholders |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Internal team priority alignment |
| `skills/executive/executive-communication.md` | Executive status update format and cadence |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `execution_clarity.md` | Closely related — unclear priorities affect both alignment and execution clarity |
| `communication_effectiveness.md` | Communication quality affects stakeholder comprehension |
| `skills/delivery/plan-sprint.md` | Planning inputs should reflect aligned stakeholder expectations |
