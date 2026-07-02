# Skill: Decision Quality

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or after major decisions

---

## Purpose

Measure the soundness, speed, and durability of decisions made by or with the engineering manager. Decision quality is the core of leadership value — every other leadership behavior depends on making good decisions and making them in time.

This skill answers three questions:
1. Are decisions made by the EM and team sound — do they achieve their intended outcomes?
2. Are decisions made quickly enough to matter, or do delays create downstream cost?
3. Are decisions durable, or are they frequently reversed?

**Invoke this skill when**: After a major architectural or hiring decision, when decisions are being reversed frequently, or before a quarterly planning cycle.

**Do not invoke this skill for**: Delivery outcome assessment (use `skills/delivery/review-sprint.md`), individual decision review (use `skills/strategy/assess-option.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Decision log | EM or team tracking | Last 20 decisions: context, options considered, outcome, date |
| Outcome tracking | Project management / incident log | Outcomes for each decision: achieved / partially achieved / failed |
| Rework rate | Project tracking | % of decisions that required significant rework or reversal |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Decision speed | Decision log | Time from decision request to decision made |
| Stakeholder satisfaction with decisions | 1:1s, surveys | Themes from stakeholders about decision quality |
| Decision reversal log | Decision log | Count and reason for reversals |
| Option consideration depth | Decision log | Number of options evaluated per decision |
| Pre-mortem or risk assessment | Decision documentation | Whether risks were considered before deciding |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Outcome Assessment
Review the last 20 decisions and their outcomes:
- **Success rate** = `(Decisions with achieved outcomes ÷ Total decisions with tracked outcomes) × 100`

| Success Rate | Interpretation |
|---|---|
| ≥ 80% | High. Decisions are achieving their intended outcomes. |
| 65–79% | Acceptable. Some decisions miss but learnings are captured. |
| 50–64% | At Risk. Decisions frequently fail to achieve intended outcomes. |
| < 50% | Critical. Decision-making is unreliable. |

### Step 2 — Decision Speed Assessment
Review time-to-decision for the last 20 decisions:
- **Average time to decision** = `(Sum of decision times ÷ Total decisions)` in days
- **On-time rate** = `(Decisions made within the required timeline ÷ Total time-sensitive decisions) × 100`

| On-Time Rate | Interpretation |
|---|---|
| ≥ 85% | High. Decisions are made quickly enough to matter. |
| 70–84% | Acceptable. Occasional delays are contextual. |
| 55–69% | At Risk. Decision delays are creating downstream cost. |
| < 55% | Critical. EM is bottlenecking the organization. |

| Average Time to Decision | Interpretation |
|---|---|
| < 2 days for routine, < 5 days for major | High |
| 2–4 days for routine, 5–10 days for major | Acceptable |
| 4–7 days for routine, 10–20 days for major | At Risk |
| > 7 days for routine, > 20 days for major | Critical |

### Step 3 — Rework and Reversal Assessment
Review rework and reversal patterns:
- **Rework rate** = `(Decisions requiring significant rework ÷ Total decisions) × 100`
- **Reversal rate** = `(Decisions reversed after implementation began ÷ Total decisions) × 100`

| Rework Rate | Interpretation |
|---|---|
| < 10% | High. Decisions are well-formed. |
| 10–20% | Acceptable. Some rework is expected in complex decisions. |
| 20–35% | At Risk. Decisions are frequently incomplete or incorrect. |
| > 35% | Critical. Decision-making process is broken. |

| Reversal Rate | Interpretation |
|---|---|
| < 5% | High. Decisions are durable. |
| 5–10% | Acceptable. Some reversals are learning opportunities. |
| 10–20% | At Risk. Decisions are frequently overturned. |
| > 20% | Critical. Decision-making lacks rigor or conviction. |

### Step 4 — Option Consideration Depth
Review how many options were evaluated for major decisions:
- **Option depth** = Average number of options evaluated per decision

| Average Options Evaluated | Interpretation |
|---|---|
| ≥ 3 options for major decisions | High. Decisions are well-explored. |
| 2 options for major decisions | Acceptable. Binary decisions are sometimes appropriate. |
| 1 option for major decisions | At Risk. Decisions are made without exploration. |
| Decisions made without documented options | Critical. Decision-making is arbitrary. |

### Step 5 — Synthesize Decision Quality Signal
Combine outcome, speed, rework, reversal, and option depth into an overall decision quality assessment. Weight: Outcome (35%), Speed (25%), Rework rate (20%), Reversal rate (12%), Option depth (8%).

---

## Decision Tree

Use this tree to determine the decision quality classification and primary recommendation.

```
What is the success rate?
│
├── ≥ 80% ────────────────────────────────────────────────
│   What is the reversal rate?
│   │
│   ├── < 10% ───────────────────────────────────────────
│   │   What is the on-time rate?
│   │   │
│   │   ├── ≥ 85%
│   │   │   └── OUTCOME: Decision quality is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Document your decision-making framework for the team.
│   │   │
│   │   └── < 85%
│   │       └── OUTCOME: Decision quality is strong but speed is a gap.
│   │             Recommendation: Identify the decisions that were delayed.
│   │             Was delay due to information gaps, EM availability,
│   │             or unnecessary consensus-building?
│   │
│   └── ≥ 10% ──────────────────────────────────────────
│       └── OUTCOME: Decision quality is functional but durability is a gap.
│             Recommendation: Investigate reversal causes.
│             Are reversals due to incomplete information at decision time,
│             or EM changing mind after the fact?
│             If the latter: strengthen pre-decision analysis.
│
├── 65–79% ───────────────────────────────────────────────
│   What is the primary failure pattern?
│   │
│   ├── OPTIONS NOT EXPLORED
│   │   └── OUTCOME: Decision quality is at risk due to insufficient analysis.
│   │             Recommendation: Require minimum 2 options
│   │             for any decision with > 1 week impact.
│   │             Document trade-offs before deciding.
│   │
│   ├── DELAYED DECISIONS
│   │   └── OUTCOME: Decision quality is at risk due to speed.
│   │             Recommendation: Set decision deadlines.
│   │             If a decision is not made by the deadline,
│   │             the default option is enacted.
│   │
│   └── FREQUENT REWORK
│       └── OUTCOME: Decision quality is at risk due to incomplete decisions.
│             Recommendation: Add a "decision completeness checklist"
│             before implementing any decision.
│
└── < 65% ─────────────────────────────────────────────────
    What is the primary failure mode?
    │
    ├── OUTCOME FAILURE
    │   └── OUTCOME: Decision quality is broken — decisions do not achieve outcomes.
    │         Recommendation: Run a pre-mortem for the next 3 major decisions.
    │         Identify failure modes before deciding.
    │
    ├── SPEED FAILURE
    │   └── OUTCOME: Decision quality is broken — EM is bottlenecking decisions.
    │         Recommendation: Audit all decisions EM is making.
    │         Delegate decisions the team can own.
    │         Set decision deadlines with escalation triggers.
    │
    └── REVERSAL CULTURE
        └── OUTCOME: Decision quality is broken — decisions do not stick.
              Recommendation: Publicly commit to decision durability.
              Name the conditions under which a decision will be revisited.
              Do not reverse decisions without explicit rationale.
```

---

## Output

Produce the following artifacts in order.

### 1. Decision Quality Summary (3–5 sentences)

State: overall decision quality signal (strong / functional / at risk / broken), success rate, primary gap, and one immediate action. Include confidence level.

> **Example**: "Decision quality is functional with a speed gap. Success rate is 76% — 15 of 20 decisions achieved their intended outcomes. On-time rate is 68% — 5 decisions were delayed by 3 or more days, all due to EM availability. Reversal rate is 8%, and rework rate is 15%. The primary gap is decision speed: the EM is the bottleneck for decisions that should be delegated or made faster. Immediate action: EM to define decision types that do not require their involvement and delegate them this week. Confidence: High (85%)."

### 2. Decision Quality Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Success rate | {{%}} | ≥ 80% = Green, 65–79% = Yellow, < 50% = Red | {{G/Y/R}} |
| On-time rate | {{%}} | ≥ 85% = Green, 70–84% = Yellow, < 55% = Red | {{G/Y/R}} |
| Rework rate | {{%}} | < 10% = Green, 10–20% = Yellow, > 35% = Red | {{G/Y/R}} |
| Reversal rate | {{%}} | < 10% = Green, 10–15% = Yellow, > 20% = Red | {{G/Y/R}} |
| Option depth | {{avg options}} | ≥ 3 = Green, 2 = Yellow, 1 = Red | {{G/Y/R}} |

### 3. Decision Log Review

| Date | Decision | Owner | Options | Outcome | Speed | Reversal | Notes |
|---|---|---|---|---|---|---|---|
| {{Date}} | {{Decision}} | {{Owner}} | {{Count}} | {{A/P/F}} | {{Days}} | {{Y/N}} | {{Context}} |

### 4. Root Cause (if decision quality is At Risk or Broken)

- **Primary cause**: {{Outcome failure / Speed failure / Reversal culture / Insufficient analysis}}
- **Evidence**: {{2–3 specific observations from decision log}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 5. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to decision-making practice}}
- **Framework** (if applicable): {{Specific decision framework to adopt}}

---

## Examples

### Example A — Strong Decision Quality

**Inputs**
- Decision log: 20 decisions — 17 achieved intended outcomes (85% success rate)
- Outcome tracking: 1 partial outcome (a hiring decision where the candidate declined after accepting — external factor); 2 failed (both were technology choices that required rework)
- Rework rate: 10% — 2 decisions required rework
- Reversal rate: 5% — 1 decision was reversed after new information emerged
- Decision speed: Average 3.2 days for routine, 7.1 days for major decisions
- On-time rate: 88%
- Option depth: Average 2.8 options per major decision

**Output Summary**
> Decision quality is strong. Success rate is 85%, on-time rate is 88%, rework rate is 10%, and reversal rate is 5%. Decisions are achieving outcomes, made in reasonable time, and durable. The 2 failures were technology choices that required rework — both were decisions where the team did not have sufficient data at decision time. The primary improvement opportunity is option depth: for complex technology decisions, evaluating 3+ options would reduce rework. Confidence: High (92%).

---

### Example B — Decision Quality Broken

**Inputs**
- Decision log: 18 decisions — 8 achieved intended outcomes (44% success rate)
- Outcome tracking: 5 partial outcomes, 5 failures
- Rework rate: 39% — 7 decisions required significant rework
- Reversal rate: 28% — 5 decisions were reversed after implementation began
- Decision speed: Average 8.5 days for routine, 22 days for major decisions
- On-time rate: 42%
- Option depth: Average 1.1 options per decision — most decisions had one option with no documented alternatives

**Output Summary**
> Decision quality is broken. Success rate is 44%, on-time rate is 42%, rework rate is 39%, and reversal rate is 28%. Decisions are failing, delayed, frequently reversed, and made without exploring alternatives. The primary failure is a combination of speed failure and insufficient analysis: the EM is bottlenecking decisions and making them without adequate option exploration. The team is demoralized by the reversal culture. Confidence: High (86%).

**Recommendations**
- *This week*: EM to identify the 3 decisions that were most delayed and document why. Identify which could have been delegated.
- *This quarter*: Implement a decision framework: (1) define the decision type, (2) evaluate at least 2 options, (3) set a decision deadline, (4) document rationale. Delegate all decisions below a defined impact threshold.
- *Framework*: Adopt the RAPID or DACI framework for major decisions. Train the team on the framework.

---

## Confidence Score

The confidence score reflects how much to trust this decision quality assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any decision quality assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Decision log is contemporaneous and structured | +5% |
| Outcome tracking includes both success and failure data | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Decision log is reconstructed from memory | −10% |
| Outcome tracking is incomplete (< 70% of decisions have tracked outcomes) | −10% |
| No reversal data available | −5% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in decision-making practice |
| 70–89% | Medium | Use output; flag gaps to team |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for leadership development; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Decision log under-reporting** | EM only logs "important" decisions | Log is thin but team reports frequent decision delays | Require log of all decisions above a defined scope threshold |
| **Outcome attribution error** | EM attributes decision success to themselves and failure to external factors | Success rate is high but team reports decisions were made with incomplete information | Use team observations as primary outcome signal |
| **Speed vs. quality trade-off blindness** | EM equates fast decisions with good decisions | On-time rate is high but success rate is low | Measure both speed and outcome independently |
| **Reversal normalization** | Reversals are so frequent they are no longer flagged | Reversal rate is high but EM reports "that's normal in our environment" | Count every reversal; high reversal rate is a process failure, not a norm |
| **Option depth theater** | EM documents multiple options but the decision was already made | Options are listed but evaluation is superficial | Evaluate options against criteria before deciding, not after |
| **Decision attribution error** | Team decisions are attributed to EM or vice versa | Ownership is unclear in the decision log | Name the decision owner explicitly; do not conflate EM-involved with EM-owned |

---

## References

- `docs/principles.md` — Principle 6: *Decisions at the Right Level*; Principle 8: *Predict before React*
- `docs/engineering-playbook.md` → *Decision Making*, *Risk Management*, *Engineering Leadership*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/strategy/assess-option.md` — Option evaluation methodology (complementary)
- `skills/operations/postmortem.md` — Decision outcome tracking in incident reviews
- Hammond — *The Hidden Brain* (2012): Decision-making biases and how to mitigate them
- Kahneman — *Thinking, Fast and Slow* (2011): System 1 vs. System 2 thinking in decisions

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/strategy/assess-option.md` | Option evaluation methodology (complementary) |
| `skills/operations/postmortem.md` | Decision outcome tracking in incident reviews |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `delegation_score.md` | Closely related — decision ownership affects decision quality |
| `organizational_clarity.md` | Decision rights clarity affects who makes decisions |
| `execution_clarity.md` | Closely related — clear priorities enable good decisions |
| `influence_score.md` | Decision quality builds influence |
| `political_awareness.md` | Organizational context affects decision options |
