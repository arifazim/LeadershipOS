# Skill: Executive Trust Score

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Monthly or on-demand

---

## Purpose

Measure the leadership team's trust in the engineering manager. Trust is the foundation of all other leadership capability — without it, alignment, delegation, and influence are all degraded.

This skill answers three questions:
1. Does the leadership team trust this EM to follow through and act with integrity?
2. Is trust building or eroding over time?
3. What specific behaviors are driving the trust signal?

**Invoke this skill when**: Preparing for a skip-level with a director/VP, a 360 review, or when you sense trust has shifted.

**Do not invoke this skill for**: Measuring peer trust (use `skills/people/assess-team-health.md`), measuring team trust in the EM (use `skills/people/assess-engagement.md`), or sprint delivery reviews.

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Peer feedback (last 90 days) | Skip-levels, 1:1s with cross-functional peers, stakeholder surveys | 3–5 verbatim themes or data points |
| Follow-through rate | EM tracking / project management tool | % of stated commitments delivered on time |
| Mistake admission rate | 1:1 records, incident post-mortems | Count of times EM acknowledged error or corrected a wrong decision |
| Visibility of results | Executive updates, sprint reviews, demo attendance | Binary: results are visible / results are not visible |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Credit attribution patterns | Meeting notes, public communications | Observed instances of taking vs. giving credit |
| Transparency in failures | Incident post-mortems, retros | EM's framing of team failures — owned vs. deflected |
| Stakeholder sentiment trend | Informal feedback, QBR themes | Trending up / down / stable |
| Escalation pattern | EM log | Frequency and tone of escalations to leadership |
| Response time to leadership requests | Email / Slack / meeting request log | Average hours to respond to director+ requests |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Follow-Through Audit
Calculate the follow-through rate: `(Commitments delivered on time ÷ Total stated commitments) × 100`.

| Follow-Through Rate | Trust Signal |
|---|---|
| ≥ 95% | High. EM is reliable. |
| 85–94% | Acceptable. Occasional misses are contextual. |
| 70–84% | Concern. Pattern of partial delivery is visible to leadership. |
| < 70% | Critical. Leadership cannot plan on this EM's commitments. |

A commitment is "stated" when it is communicated to a stakeholder in a meeting, email, or status update. A verbal "I'll handle it" in a 1:1 with a report does not count as a leadership-facing commitment.

### Step 2 — Mistake Admission Assessment
Review the mistake admission data:
- **Admission rate** = `(Times EM acknowledged error ÷ Total observable errors) × 100`
- An "observable error" is a decision or statement that was demonstrably wrong and visible to stakeholders.

| Admission Rate | Trust Signal |
|---|---|
| ≥ 80% | High. EM models accountability. |
| 50–79% | Acceptable. Some defensiveness but generally owns outcomes. |
| 30–49% | Concern. EM deflects or minimizes errors. |
| < 30% | Critical. Leadership sees EM as unaccountable. |

### Step 3 — Credit Attribution Review
Examine 3–5 recent communications or meetings:
- Does the EM take credit for team work as personal achievement?
- Does the EM name team members when success is discussed?
- Does the EM deflect praise to reports when receiving recognition?

| Attribution Pattern | Trust Signal |
|---|---|
| Team-first consistently | High. Leadership sees EM as a force multiplier. |
| Mixed (sometimes team-first, sometimes self-referential) | Acceptable. Inconsistent but not damaging. |
| Self-referential consistently | Concern. Leadership sees EM as taking credit for team output. |

### Step 4 — Transparency in Failures
Review how the EM frames failures in leadership forums:
- Does the EM present failures as "the team's learning" or as "my mistake"?
- Does the EM share the full context, or only the parts that cast the team positively?
- Does the EM propose corrective actions, or minimize the failure?

| Transparency Level | Trust Signal |
|---|---|
| Full ownership + corrective action | High. Leadership trusts EM to surface problems early. |
| Partial ownership + corrective action | Acceptable. Generally transparent but occasionally protective. |
| Minimization or deflection | Concern. Leadership suspects EM hides problems. |
| Blame-shifting to team or external factors | Critical. Leadership cannot trust EM's reporting. |

### Step 5 — Synthesize Trust Signal
Combine the four signals into an overall trust assessment. Weight: Follow-through (40%), Mistake Admission (25%), Credit Attribution (20%), Transparency (15%).

---

## Decision Tree

Use this tree to determine the trust classification and primary recommendation.

```
What is the follow-through rate?
│
├── ≥ 95% ────────────────────────────────────────────────
│   What is the mistake admission rate?
│   │
│   ├── ≥ 80% ───────────────────────────────────────────
│   │   What is the credit attribution pattern?
│   │   │
│   │   ├── Team-first consistently
│   │   │   └── OUTCOME: Trust is strong and building.
│   │   │         Recommendation: Sustain. Maintain current behaviors.
│   │   │         Monitor quarterly.
│   │   │
│   │   └── Mixed or Self-referential
│   │       └── OUTCOME: Trust is functional with attribution gap.
│   │             Recommendation: Practice naming team members in
│   │             every executive update or demo.
│   │
│   ├── 50–79% ─────────────────────────────────────────
│   │   └── OUTCOME: Trust is functional with accountability gap.
│   │         Recommendation: When you make a mistake, say so explicitly
│   │         in the same forum where the original commitment was made.
│   │         Do not wait for private conversations.
│   │
│   └── < 50% ──────────────────────────────────────────
│       └── OUTCOME: Trust is eroding. Follow-through is strong
│             but accountability is weak.
│             Recommendation: Leadership sees EM as unreliable
│             on follow-through or unaccountable on errors.
│             Schedule a 1:1 with your manager to discuss trust signals.
│
├── 85–94% ───────────────────────────────────────────────
│   What is the mistake admission rate?
│   │
│   ├── ≥ 80% ───────────────────────────────────────────
│   │   └── OUTCOME: Trust is functional with minor follow-through gap.
│   │             Recommendation: Review commitment log.
│   │             Are missed commitments due to scope changes
│   │             or over-commitment? Tighten commitment cadence.
│   │
│   └── < 80% ──────────────────────────────────────────
│       └── OUTCOME: Trust is at risk on two fronts.
│             Recommendation: Prioritize follow-through AND accountability.
│             Reduce commitment volume; increase admission frequency.
│
└── < 85% ─────────────────────────────────────────────────
    What is the mistake admission rate?
    │
    ├── ≥ 80% ───────────────────────────────────────────
    │   └── OUTCOME: Trust is eroding due to follow-through failures.
    │             Admission is good but leadership cannot plan on
    │             commitments that are not kept.
    │             Recommendation: Reduce commitment scope by 20%.
    │             Track every commitment in a shared log.
    │
    └── < 80% ──────────────────────────────────────────
        └── OUTCOME: Trust is critically low.
              Recommendation: Immediate intervention required.
              Schedule a trust repair conversation with your manager.
              Do not wait for formal review cycle.
```

---

## Output

Produce the following artifacts in order.

### 1. Trust Summary (3–5 sentences)

State: overall trust signal (building / stable / eroding / critical), primary driver of the signal, and one behavior change that would have the highest impact on trust. Include confidence level.

> **Example**: "Executive trust is functional but eroding. Follow-through is at 78% (missed 3 of 14 commitments this quarter), and mistake admission is at 60%. The primary driver is over-commitment: EM stated 14 commitments to leadership but team capacity only supported 11. The highest-impact change is reducing commitment volume by 20% and tracking every commitment in a shared log visible to stakeholders. Confidence: High (88%)."

### 2. Trust Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Follow-through rate | {{%}} | ≥ 95% = Green, 85–94% = Yellow, < 85% = Red | {{G/Y/R}} |
| Mistake admission rate | {{%}} | ≥ 80% = Green, 50–79% = Yellow, < 50% = Red | {{G/Y/R}} |
| Credit attribution | {{pattern}} | Team-first = Green, Mixed = Yellow, Self-referential = Red | {{G/Y/R}} |
| Transparency in failures | {{level}} | Full ownership = Green, Partial = Yellow, Minimization = Red | {{G/Y/R}} |

### 3. Root Cause (if trust is Yellow or Red)

- **Primary cause**: {{Over-commitment / Defensiveness / Credit-seeking / Opaque reporting / Other}}
- **Evidence**: {{2–3 specific observations}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 4. Recommendations

- **This week**: {{1 immediate behavior change}}
- **This quarter**: {{1 systemic change to commitment or communication practice}}
- **Stakeholder conversation** (if applicable): {{Specific 1:1 or skip-level to schedule}}

---

## Examples

### Example A — Trust Building

**Inputs**
- Peer feedback: "When the platform migration slipped, EM owned the delay in the Monday exec meeting and presented the recovery plan. No blame."
- Follow-through rate: 96% (27 of 28 commitments delivered on time)
- Mistake admission rate: 83% (5 of 6 observable errors acknowledged)
- Credit attribution: In the last 3 public communications, EM named 4 team members by name when discussing successes.
- Transparency in failures: In the last incident post-mortem, EM said "I underestimated the migration complexity — that's on me" and shared the full timeline.

**Output Summary**
> Executive trust is strong and building. Follow-through is at 96%, mistake admission is at 83%, and credit attribution is consistently team-first. Transparency in failures is exemplary. The one gap is that EM has not yet made a mistake admission in a formal leadership forum — all admissions have been in 1:1s. To convert strong trust to exceptional trust, make the next mistake admission in the next exec meeting. Confidence: High (92%).

---

### Example B — Trust Eroding

**Inputs**
- Peer feedback: "EM promised the API migration would be done by end of Q2. It's now mid-July and the team is still on the old platform. No update was offered until we asked."
- Follow-through rate: 71% (10 of 14 commitments delivered on time; 2 were silently dropped)
- Mistake admission rate: 25% (1 of 4 observable errors acknowledged; 3 were reframed as "the team decided")
- Credit attribution: In the last 2 executive updates, EM used "I" 8 times and named team members 0 times.
- Transparency in failures: In the last retro, EM framed the missed commitment as "the team underestimated" rather than "I committed to an aggressive date."

**Output Summary**
> Executive trust is eroding. Follow-through is at 71%, with 2 commitments silently dropped. Mistake admission is at 25%, and credit attribution is consistently self-referential. The primary driver is a pattern of over-committing to leadership, then reframing failures as team errors when the commitment is missed. Leadership is beginning to see EM as unreliable on follow-through and unaccountable on errors. Confidence: High (90%).

**Recommendations**
- *This week*: EM to send a direct message to the VP acknowledging the missed API migration commitment and presenting the actual status.
- *This quarter*: Implement a commitment log shared with the VP. Before making any new commitment to leadership, check the log for open commitments.
- *Stakeholder conversation*: Schedule a 1:1 with the VP to discuss trust signals and commitment practices.

---

## Confidence Score

The confidence score reflects how much to trust this trust assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any trust score with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Pattern is consistent with last 2–3 assessments | +5% |
| Multiple independent data sources corroborate the signal | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Peer feedback is from a single source only | −10% |
| Follow-through data is self-reported only (not tracked externally) | −10% |
| No historical data available for trend comparison | −5% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in development planning |
| 70–89% | Medium | Use output; flag gaps to manager |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for executive communication; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Recency bias** | Most recent incident drives the trust score | One recent miss dominates the assessment; earlier quarter was strong | Weight the full 90-day window equally; do not let one event override the trend |
| **Self-reported follow-through** | EM tracks commitments in a personal log only | No external verification of delivery | Require stakeholder confirmation of at least 3 commitments before scoring |
| **Attribution blindness** | EM genuinely believes they are team-first but leadership experiences differently | EM self-assessment conflicts with peer feedback | Use peer feedback as primary input; self-assessment is supplementary |
| **Single-source feedback** | Only one peer provides feedback | All themes come from a single stakeholder | Flag as incomplete; seek additional sources before scoring |
| **Commitment ambiguity** | EM distinguishes "aspirations" from "commitments" but leadership does not | Follow-through rate is low because EM did not count aspirational statements as commitments | Define commitment broadly: any statement of future action to a stakeholder is a commitment |
| **Admission under-reporting** | EM is aware of errors but does not surface them | Admission rate is high but qualitative review shows errors were known | Include "known but unacknowledged" errors in the denominator |

---

## References

- `docs/principles.md` — Principle 3: *Default to Transparency*; Principle 8: *Predict before React*
- `docs/engineering-playbook.md` → *Managing Up*, *Executive Communication*, *Building Trust*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `skills/people/assess-engagement.md` — Team trust in the EM (complementary perspective)
- Covey — *The Speed of Trust* (2018): Trust as a leadership multiplier
- Lencioni — *The Five Dysfunctions of a Team* (2002): Trust as the foundation of team health

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/review-sprint.md` | Template for this skill's structure and confidence scoring |
| `skills/executive/executive-communication.md` | Executive updates are a primary input to this dimension |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `skills/stakeholder/align-priorities.md` | Stakeholder alignment is a related but distinct dimension |
| `skills/people/assess-engagement.md` | Team engagement assessment (complementary to executive trust) |
| `skills/people/performance-review.md` | 360 feedback is an input to this dimension |
| `stakeholder_alignment.md` | Closely related — trust and alignment are inter-dependent |
