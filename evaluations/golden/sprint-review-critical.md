# Golden Output: Sprint Review — Critical Sprint

**Skill**: `skills/delivery/review-sprint.md`
**Scenario**: `features/sprint.feature` → `@critical` — "Failed Sprint — velocity collapse"
**Last verified**: {{YYYY-MM-DD}}
**Status**: Active

---

## Input (Canonical Test Data)

```
Sprint goal: Complete payment retry logic and harden error handling
Committed story points: 38
Completed story points: 24
Sprint goal status: Missed — payment retry logic not delivered
Stories committed: 11
Stories completed: 7
Stories carried over: 4 (including the primary sprint goal feature)
Blockers reported: None formally raised
Retrospective finding: Platform API broken for 2 days (not escalated as a blocker)
Unplanned work: 11 points — 2 P2 incidents required investigation (29% of committed capacity)
Deployment frequency: 1 deploy this sprint
Change failure rate: 18% (1 of the 5 deploy attempts caused a P2)
PR cycle time (P50): 4.1 business days
Team satisfaction signal: Red — 2 engineers flagged burnout concern in 1:1s
4-sprint trailing velocity average: 38 points
On-call actionable pages this week: 8 (6 off-hours)
```

---

## Golden Output

```
DELIVERY STATUS: Red
CONFIDENCE: High — 92%

SPRINT SUMMARY:
- Goal: Missed — payment retry logic not completed, carries into next sprint
- Completion rate: 63% vs. 4-sprint average of 100% (severe underperformance)
- Unplanned work ratio: 29% — incident investigation consumed significant capacity
- Carry-over stories: 4, including the primary sprint goal feature

DORA SNAPSHOT:
- Deployment frequency: 1 this sprint — Critical (target: ≥ 3/week)
- Change failure rate: 18% — Critical (target: < 5%)
- PR cycle time (P50): 4.1 business days — Critical (target: < 2 days)
- MTTR: P2 incidents occurred — requires post-mortem review

ROOT CAUSE:
- Primary cause: Scope Creep + Blocker-Driven (combined)
- Evidence:
  1. Unplanned incident investigation consumed 29% of committed capacity
  2. Platform API outage lasted 2 days and was never formally escalated as a blocker
  3. Both causes compounded — removing either alone would not have fully prevented the miss
- Recurring: Unknown — compare to prior 2 sprints for pattern

RISKS:
- Team burnout: High likelihood, High impact — 2 engineers at stated risk; on-call burden at 8 pages/week, 6 off-hours
- Platform dependency: Medium likelihood, High impact — dependency not in partner team's sprint, unresolved
- Quality regression: Medium likelihood, High impact — 18% change failure rate is unsustainable

RECOMMENDATIONS:
- Immediate: EM to 1:1 with both engineers who flagged burnout within 48 hours — do not wait for next scheduled session
- Next sprint: Cap sprint commitment at 70% of trailing average (27 points). Protect capacity for recovery. Escalate platform API dependency to peer EM before planning
- Systemic: Reliability investment required — recurring P2 incidents and elevated on-call burden indicate a reliability debt sprint should be proposed. Standup format may be suppressing blocker escalation — investigate psychological safety

RETRO SEEDS:
1. Why wasn't the platform API outage raised as a blocker? — standup format or safety concern?
2. How do we protect sprint capacity from incident investigation without leaving incidents unaddressed?
```

---

## Tolerance Rules

| Field | Match Type | Tolerance |
|---|---|---|
| DELIVERY STATUS | Exact | Must be "Red" |
| CONFIDENCE label | Exact | Must be "High" |
| CONFIDENCE score | Range | Must be 88–95% |
| Goal status | Exact | Must be "Missed" |
| Completion rate | Numeric | Must be 62–65% |
| Root cause primary | Semantic | Must name both incident and blocker as contributing causes |
| Risks | Minimum | Must name at least burnout risk and platform dependency risk |
| Immediate recommendation | Semantic | Must include 1:1 with engineers who flagged burnout — this is non-negotiable given Red satisfaction signal |
| Next sprint recommendation | Semantic | Must include capacity reduction and platform dependency escalation |

**Hard failures** (output must be rejected if):
- DELIVERY STATUS is not Red
- Burnout risk is not named given the Red satisfaction signal input
- Immediate recommendation does not address the engineers who flagged burnout
- Root cause is a single cause when the data clearly shows two contributing causes
- Confidence is below High given the volume of clear data provided

**Critical constraint**: The immediate recommendation MUST address the people signal (burnout), not only the delivery signal. An output that focuses only on delivery and ignores the Red satisfaction signal violates Principle 1 (People First) and must be rejected.
