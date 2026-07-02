# Skill: Review Sprint

**Domain**: Delivery
**Owner**: `subagents/delivery-manager.md`
**Cadence**: End of every sprint, before retrospective
**Contract**: `contracts/skill.contract.md` (worked example)

---

## Purpose

Analyze a completed sprint to produce an evidence-based assessment of delivery health, team performance signals, and improvement opportunities. Output is used to inform the retrospective agenda, the executive status update, and the next sprint's planning inputs.

This skill answers three questions:
1. Did the team deliver what they committed to, and why or why not?
2. What does the delivery pattern reveal about systemic health?
3. What are the most important one or two things to change?

**Invoke this skill when**: A sprint has ended and you need to synthesize data before the retrospective or before writing an executive update.

**Do not invoke this skill for**: Mid-sprint check-ins (use `skills/delivery/track-sprint.md`), quarterly delivery reviews (use `skills/delivery/review-quarter.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## Inputs

All inputs must be collected before the analysis begins. Mark unavailable inputs as `MISSING` — do not infer or substitute.

### Required
| Input | Source | Format |
|---|---|---|
| Sprint goal | Sprint planning artifact / Jira board | Text — 1–2 sentences |
| Committed story points | Sprint planning snapshot | Integer |
| Completed story points | Jira / board at sprint close | Integer |
| Stories committed | Sprint backlog list | Count + list |
| Stories completed | Done column at sprint close | Count + list |
| Stories carried over | Incomplete at sprint close | Count + reason for each |
| Blockers reported | Standup notes / Jira impediments | List with resolution status |
| Unplanned work added | Stories added after planning | Count + story points |

### Supplementary (include if available)
| Input | Source | Format |
|---|---|---|
| Deployment frequency this sprint | CI/CD pipeline / Datadog | Count of production deploys |
| Change failure rate | Incident log | % of deploys that caused P1/P2 |
| PR cycle time (P50) | GitHub metrics | Hours |
| Team satisfaction signal | 1:1 notes / pulse survey | Red / Yellow / Green |
| On-call burden | PagerDuty | Pages received, pages requiring action |
| Interrupts (unplanned meetings, context switches) | EM log | High / Medium / Low |
| Previous sprint velocity (4-sprint trailing average) | Historical board data | Integer |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Sprint Goal Assessment
- Was the sprint goal achieved? (Yes / Partial / No)
- If Partial or No: was the shortfall due to scope, blockers, estimation, unplanned work, or capacity?
- A sprint goal achieved with < 80% story point completion is still a success if the goal was the right unit of measure.
- A sprint goal missed despite 100% story point completion is a planning failure.

### Step 2 — Commitment vs. Delivery
Calculate:
- **Completion rate** = Completed points ÷ Committed points
- **Unplanned work ratio** = Unplanned points added ÷ Original committed points
- **Carry-over rate** = Carried-over stories ÷ Committed stories

Interpret against the 4-sprint trailing average. A single sprint's numbers are signal; a trend is a fact.

| Completion Rate | Interpretation |
|---|---|
| ≥ 90% | Healthy. Estimation is calibrated. |
| 80–89% | Acceptable. One story slipped — investigate why. |
| 70–79% | Below threshold. Root cause required. |
| < 70% | Significant miss. Treat as a systemic signal, not a one-off. |

### Step 3 — DORA Signal Check
If supplementary data is available, assess against targets from `docs/engineering-playbook.md`:

| Metric | Healthy | At Risk | Critical |
|---|---|---|---|
| Deployment frequency | ≥ 3/week | 1–2/week | < 1/week |
| Change failure rate | < 5% | 5–15% | > 15% |
| PR cycle time (P50) | < 2 business days | 2–4 business days | > 4 business days |
| MTTR (if incidents occurred) | < 4 hours | 4–24 hours | > 24 hours |

Note: DORA metrics are lagging indicators. Use to confirm or challenge the delivery narrative — not as the primary story.

### Step 4 — Team Health Signal
Assess the SPACE dimension most relevant to this sprint:

- **Satisfaction**: Are 1:1 signals or pulse survey results trending down? Any new attrition risk raised?
- **Performance**: Did the team accomplish what matters — not just what was planned?
- **Activity**: Is throughput (PRs merged, deploys shipped) at or above baseline? (Activity is a secondary signal only.)
- **Collaboration**: Were there blockers caused by cross-team friction? Were code reviews timely?
- **Efficiency**: Was on-call burden elevated? Were there significant context-switching events?

Assign an overall team health signal: Green / Yellow / Red.

### Step 5 — Root Cause of Variance
If completion rate < 85% or DORA metrics are At Risk/Critical, identify the primary cause:

- **Estimation error**: Stories took longer than predicted. No external blockers. Unplanned work was low.
- **Scope creep**: Unplanned work ratio > 20%. Stories were added after planning.
- **Blocker-driven**: One or more blockers caused delay. Blockers were reported (or should have been reported earlier).
- **Capacity shortfall**: Team capacity was reduced by unplanned events (illness, interviews, incidents, on-call).
- **Dependency failure**: External team or service did not deliver what was required.
- **Goal misalignment**: Sprint goal shifted mid-sprint due to stakeholder change.
- **Planning failure**: Sprint goal missed despite high story-point completion — the wrong stories were selected relative to the goal during planning (see Step 1).

Assign **one primary cause**. Multiple causes may be true; naming the dominant one is required for action.

---

## Decision Tree

Use this tree to determine the primary recommendation output.

```
Was the sprint goal achieved?
│
├── YES ────────────────────────────────────────────
│   Is team health signal Green?
│   ├── YES → OUTCOME: Healthy sprint.
│   │         Recommendation: Sustain. Surface one improvement from retro.
│   │         Confidence boost: +10%
│   └── NO  → OUTCOME: Goal achieved but team is strained.
│             Recommendation: Protect next sprint's capacity.
│             Investigate SPACE: Satisfaction and Efficiency.
│             Confidence impact: neutral (goal met; risk is forward-looking)
│
└── NO / PARTIAL ───────────────────────────────────
    What is the primary root cause?
    │
    ├── ESTIMATION ERROR
    │   └── Completion rate < 80%?
    │       ├── YES → Recommendation: Story decomposition session before next planning.
    │       │         Cap story size at a threshold the team sets (e.g., 5 points max).
    │       └── NO  → Acceptable variance. No structural change needed.
    │
    ├── SCOPE CREEP
    │   └── Unplanned ratio > 20%?
    │       ├── YES → Recommendation: Add sprint buffer formally (target 80% planned capacity).
    │       │         Identify source of unplanned work — is it recurring? Fix the source.
    │       └── NO  → Minor. Acknowledge in retro. Monitor next sprint.
    │
    ├── BLOCKER-DRIVEN
    │   └── Were blockers escalated in time?
    │       ├── YES → Recommendation: Escalation path worked. Remove the blocker root cause.
    │       │         Was this a cross-team dependency? → Add to dependency register.
    │       └── NO  → Recommendation: Standup is not surfacing blockers early enough.
    │                 Investigate psychological safety or standup format.
    │
    ├── CAPACITY SHORTFALL
    │   └── Was shortfall predictable (scheduled PTO, known interviews)?
    │       ├── YES → Recommendation: Planning did not account for capacity correctly.
    │       │         Update capacity model for next sprint.
    │       └── NO  → Recommendation: Unforeseeable. Acknowledge. Build buffer for next sprint.
    │                 If recurring: team is understaffed for current commitments.
    │
    ├── DEPENDENCY FAILURE
    │   └── Recommendation: Escalate to peer EM immediately (not to their team).
    │                       Add explicit dependency tracking to next sprint planning.
    │                       Reference `docs/engineering-playbook.md → Managing Across`.
    │
    ├── GOAL MISALIGNMENT
    │   └── Recommendation: Mid-sprint goal changes indicate stakeholder expectation failure.
    │                       Run a `skills/stakeholder/align-priorities.md` session before next sprint.
    │                       Surface in executive update.
    │
    └── PLANNING FAILURE
        └── Recommendation: Review how the sprint goal was translated into story selection
                            during planning. Require an explicit goal-to-story traceability
                            check before sprint start — every committed story should name
                            which goal it advances. Do not let high completion rate mask
                            this as a healthy sprint; the goal is the primary measure.
```

---

## Output

Produce the following artifacts in order. Do not produce details before the summary.

### 1. Executive Summary (3–5 sentences)
State: sprint goal outcome, completion rate vs. average, primary health signal, primary root cause if variance exists, and one recommendation. Include confidence level.

> **Example**: "Sprint 42 partially achieved its goal — the checkout flow was delivered but the payment retry logic was carried over. Completion rate was 74%, below the 4-sprint average of 89%. The primary cause was a dependency on the platform team that was not in their sprint. Team health is Yellow based on elevated on-call burden this week. Recommendation: escalate the platform dependency ahead of Sprint 43 planning. Confidence: High."

### 2. Sprint Scorecard

| Metric | This Sprint | 4-Sprint Average | Status |
|---|---|---|---|
| Sprint goal | {{achieved / partial / missed}} | — | {{Green/Yellow/Red}} |
| Completion rate | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| Deployment frequency | {{count}} | {{count}} | {{Green/Yellow/Red}} |
| Change failure rate | {{%}} | {{%}} | {{Green/Yellow/Red}} |
| PR cycle time (P50) | {{hours}} | {{hours}} | {{Green/Yellow/Red}} |
| Team health | {{signal}} | — | {{Green/Yellow/Red}} |

### 3. Root Cause (if variance exists)
- **Primary cause**: {{name from root cause taxonomy}}
- **Evidence**: {{2–3 specific observations that support the diagnosis}}
- **Is this recurring?** {{Yes / No / Unknown — compare to last 2 sprints}}

### 4. Recommendations
- **This sprint**: {{1 immediate action with named owner and date}}
- **Next sprint**: {{1 planning change to implement before next sprint starts}}
- **Systemic** (if applicable): {{1 change that would require a quarter or more to implement}}

### 5. Retrospective Agenda Seed
Propose the top 1–2 items the retrospective should focus on, based on the analysis. This is a recommendation — the team owns the retro agenda.

---

## Examples

### Example A — Healthy Sprint

**Inputs**
- Sprint goal: "Ship onboarding flow v2 to production"
- Committed: 42 points | Completed: 39 points (93%)
- Carry-over: 1 story (3 points) — UX polish, agreed to defer
- Unplanned work: 4 points (9.5% ratio)
- Blockers: 1 blocker (design review delay), resolved day 3
- Deployment frequency: 5 deploys
- Change failure rate: 0%
- PR cycle time: 1.4 days
- Team satisfaction: Green

**Output Summary**
> Sprint 38 achieved its goal. Onboarding flow v2 is in production. Completion rate was 93%, above the 4-sprint average of 87%. One story was deliberately deferred with agreement. DORA metrics are all healthy. Team satisfaction is Green. No material risks for Sprint 39. Confidence: High (95%).

**Recommendation**: Sustain. One item for the retro: the design review blocker on day 1 — is there a way to surface design dependencies in planning?

---

### Example B — Struggling Sprint

**Inputs**
- Sprint goal: "Complete payment retry logic and harden error handling"
- Committed: 38 points | Completed: 24 points (63%)
- Carry-over: 4 stories including the primary sprint goal feature
- Unplanned work: 11 points (29% ratio) — 2 P2 incidents required investigation
- Blockers: None formally reported (retrospectively identified: platform API was broken for 2 days)
- Deployment frequency: 1 deploy
- Change failure rate: 18% (1 of the 5 deploys caused a P2)
- PR cycle time: 4.1 days
- Team satisfaction: Red — 2 engineers flagged burnout concern in 1:1s

**Output Summary**
> Sprint 41 missed its goal. Payment retry logic was not completed and carries into Sprint 42. Completion rate was 63%, the lowest in 6 sprints. Two root causes: unplanned incident investigation consumed ~29% of capacity, and a platform API outage that was not formally escalated as a blocker cost approximately 2 days of throughput. DORA metrics are in the At Risk / Critical range across all dimensions. Team satisfaction is Red. This is a high-severity systemic signal. Confidence: High (92%).

**Recommendations**
- *Immediate*: EM to have 1:1 conversations with both engineers who flagged burnout this week. Do not wait for next scheduled 1:1.
- *Next sprint*: Cap Sprint 42 at 70% of average velocity. Protect capacity for recovery.
- *Systemic*: Platform dependency requires a formal escalation to peer EM and addition to the dependency register. Recurring P2 incidents point to reliability investment needed — propose a debt sprint to address.

**Retro agenda seed**: (1) Why wasn't the platform API outage raised as a blocker — standup format or safety? (2) How do we protect sprint capacity from incident response without leaving incidents unaddressed?

---

## Confidence Score

The confidence score reflects how much to trust this analysis. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any sprint review with complete required inputs.

### Positive Modifiers (add to score)
| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary DORA data available | +5% |
| Team health signal available (not inferred) | +5% |
| Pattern is consistent with last 2–3 sprints | +5% |
| Root cause is clear and supported by multiple data points | +5% |

### Negative Modifiers (subtract from score)
| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Sprint length was non-standard (holiday, team change) | −10% |
| Significant team composition change this sprint | −10% |
| Root cause is inferred with no direct evidence | −10% |
| Velocity baseline is < 3 sprints of history | −10% |

### Interpretation
| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly |
| 70–89% | Medium | Use output; flag gaps to stakeholders |
| 50–69% | Low | Use output as hypothesis; validate key claims before acting |
| < 50% | Speculative | Do not use for executive communication; collect missing inputs first |

---

## Failure Modes

Conditions under which this skill produces unreliable output. Identify and flag before sharing results.

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Velocity gaming** | Team inflates completed points to hit targets | Velocity is consistently 95–100% but sprint goals are partially missed | Use goal achievement as primary metric, not points |
| **Missing DORA data** | No CI/CD integration or no incident tracking | Supplementary inputs are MISSING | State explicitly: "DORA data unavailable; quality assessment is incomplete" |
| **Single sprint bias** | One anomalous sprint drives a recommendation | Variance from 4-sprint average > 30% with no structural change | Always compare to trailing average; weight trend over single data point |
| **Satisfaction signal fabricated** | EM guesses team health instead of collecting it | No 1:1 notes or pulse data available | Mark as INFERRED, reduce confidence by 10% |
| **Scope confusion** | Sprint backlog was modified during the sprint without tracking | Committed list and completed list are inconsistent | Request clean sprint artifact from project management tool before analysis |
| **Attribution error** | Multi-cause variance reduced to single cause incorrectly | Recommendation addresses cause A, but cause B recurs next sprint | Name all contributing causes; name primary cause separately |
| **Carry-over mistreatment** | Carried-over stories counted as failure regardless of context | Velocity appears low but agreed deferral was intentional | Distinguish agreed deferral from unplanned carry-over in the scorecard |

---

## References

- `docs/principles.md` — Principle 8: *Predict before React* (leading vs. lagging indicators); Principle 12: *Measure Outcomes*
- `docs/engineering-playbook.md` → *Running Sprint Planning*, *Running Retrospectives*, *Risk*
- `docs/engineering-playbook.md` → *Engineering Health Metrics* (DORA targets)
- `CLAUDE.md` — Confidence scoring scale; DORA, SPACE, and Accelerate metric frameworks
- Forsgren, Humble & Kim — *Accelerate* (2018): DORA metric definitions and performance bands
- Forsgren et al. — *SPACE Framework* (2021): Developer productivity dimensions
- `templates/sprint-review.md` — Output template for the formal sprint review artifact
- `templates/executive-status.md` — Template for escalating sprint outcomes to leadership

---

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/delivery/track-sprint.md` | Mid-sprint health check — call this instead if the sprint is still in progress |
| `skills/delivery/plan-sprint.md` | Uses this skill's output as the primary input to next sprint planning |
| `skills/delivery/review-quarter.md` | Aggregates sprint reviews into a quarterly delivery narrative |
| `skills/operations/postmortem.md` | If incidents occurred this sprint, run this in parallel |
| `skills/people/burnout.md` | Invoke when team satisfaction is Red or when on-call burden is elevated |
| `skills/executive/executive-communication.md` | Takes this skill's Executive Summary as its primary input |
| `skills/delivery/manage-risk.md` | If systemic risks are identified, invoke to build or update the risk register |
