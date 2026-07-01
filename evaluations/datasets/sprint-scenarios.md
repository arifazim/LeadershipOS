# Dataset: Sprint Scenarios

**Used by**: `skills/delivery/review-sprint.md`
**Linked scenarios**: `features/sprint.feature`
**Purpose**: Standard inputs for regression testing and prompt calibration

Each scenario provides a complete input payload that can be fed to the sprint review skill. The expected output classification is noted for each. Full golden outputs exist only for the Healthy and Critical cases (see `evaluations/golden/`).

---

## Scenario S-01 — Healthy (Canonical)
*Maps to: `@healthy` — "Healthy Sprint — all signals green"*
*Full golden output: `evaluations/golden/sprint-review-healthy.md`*

```
Sprint goal: Ship onboarding flow v2 to production
Sprint goal status: Achieved
Committed: 40 pts | Completed: 38 pts
Carry-over: 1 story (agreed deferral — UX polish)
Unplanned work: 3 pts (7.5%)
Blockers reported: 1 (resolved day 2)
Deploy frequency: 4 | CFR: 0% | PR cycle time: 1.6 days
Team satisfaction: Green
4-sprint average: 39 pts

Expected: DELIVERY STATUS = Green | CONFIDENCE = High | ROOT CAUSE = None
```

---

## Scenario S-02 — Goal Met, Low Points
*Maps to: `@healthy` — "Sprint Goal Achieved Despite Low Point Completion"*

```
Sprint goal: Migrate user authentication to new service
Sprint goal status: Achieved
Committed: 32 pts | Completed: 24 pts (75%)
Carry-over: 2 stories — agreed deferrals (non-goal work deprioritized)
Unplanned work: 0 pts
Blockers reported: 0
Deploy frequency: 2 | CFR: 0% | PR cycle time: 2.1 days
Team satisfaction: Green
4-sprint average: 30 pts

Expected: DELIVERY STATUS = Green | CONFIDENCE = High | ROOT CAUSE = None
Note: Do NOT flag low completion rate as a failure — goal was achieved and deferrals were agreed
```

---

## Scenario S-03 — Warning (Degraded Velocity)
*Maps to: `@warning` — "Degraded Sprint — velocity drop within acceptable range"*

```
Sprint goal: Add export functionality to reporting module
Sprint goal status: Partial (core export shipped; scheduled export deferred)
Committed: 35 pts | Completed: 29 pts (83%)
Carry-over: 2 stories (non-goal)
Unplanned work: 4 pts (11%)
Blockers reported: 1 (resolved day 4 — later than ideal)
Deploy frequency: 3 | CFR: 3% | PR cycle time: 2.3 days
Team satisfaction: Yellow (1 engineer mentioned increased workload)
4-sprint average: 35 pts

Expected: DELIVERY STATUS = Yellow | CONFIDENCE = Medium | ROOT CAUSE = Blocker-Driven
```

---

## Scenario S-04 — Warning (Scope Creep)
*Maps to: `@warning` — "Scope Creep Detected"*

```
Sprint goal: Harden error handling in payment service
Sprint goal status: Partial
Committed: 30 pts | Completed: 27 pts (90%)
Carry-over: 1 story (the primary goal story — half-complete)
Unplanned work: 12 pts (40% of original commitment)
Unplanned source: Hotfix for customer-facing bug escalated by support
Blockers reported: 0
Deploy frequency: 4 | CFR: 5% | PR cycle time: 1.8 days
Team satisfaction: Green
4-sprint average: 31 pts

Expected: DELIVERY STATUS = Yellow | ROOT CAUSE = Scope Creep | CONFIDENCE = High
Note: High completion rate does NOT override the goal miss — the sprint goal was not achieved
```

---

## Scenario S-05 — At Risk (Velocity Below Threshold)
*Maps to: `@at-risk` — "At-Risk Sprint — velocity below threshold"*

```
Sprint goal: Complete API rate limiting implementation
Sprint goal status: Missed
Committed: 40 pts | Completed: 30 pts (75%)
Carry-over: 3 stories
Unplanned work: 5 pts (12.5%)
Blockers reported: 2 (1 resolved, 1 open at sprint end)
Deploy frequency: 2 | CFR: 8% | PR cycle time: 3.1 days
Team satisfaction: Yellow
4-sprint average: 39 pts

Expected: DELIVERY STATUS = At Risk | CONFIDENCE = Medium | ROOT CAUSE = Blocker-Driven
```

---

## Scenario S-06 — Critical (Velocity Collapse)
*Maps to: `@critical` — "Failed Sprint — velocity collapse"*
*Full golden output: `evaluations/golden/sprint-review-critical.md`*

```
Sprint goal: Complete payment retry logic and harden error handling
Sprint goal status: Missed
Committed: 38 pts | Completed: 24 pts (63%)
Carry-over: 4 stories including primary goal feature
Unplanned work: 11 pts (29%) — 2 P2 incident investigations
Blockers: None formally reported (platform API broken 2 days — not escalated)
Deploy frequency: 1 | CFR: 18% | PR cycle time: 4.1 days
Team satisfaction: Red (2 engineers flagged burnout)
4-sprint average: 38 pts | On-call pages: 8/week (6 off-hours)

Expected: DELIVERY STATUS = Red | CONFIDENCE = High | IMMEDIATE_ACTION = 1:1 with burnout-flagging engineers
```

---

## Scenario S-07 — Critical (Goal Missed Despite High Completion)
*Maps to: `@critical` — "Sprint Goal Missed Despite High Completion Rate"*

```
Sprint goal: Ship onboarding A/B test to production
Sprint goal status: Missed — A/B test infrastructure not completed
Committed: 36 pts | Completed: 34 pts (94%)
Carry-over: 2 stories (both are the A/B test infrastructure)
Unplanned work: 6 pts (other priorities pulled in instead)
Blockers reported: 0
Deploy frequency: 5 | CFR: 2% | PR cycle time: 1.4 days
Team satisfaction: Green
4-sprint average: 35 pts

Expected: DELIVERY STATUS = Red | ROOT CAUSE = Planning Failure | CONFIDENCE = High
Critical check: Do NOT report this as a healthy sprint because DORA metrics are good.
The sprint goal — the primary measure — was missed. DORA metrics are secondary.
```

---

## Regression Run Instructions

To run regression against all scenarios:

1. Feed each scenario's input block to `skills/delivery/review-sprint.md`
2. Compare output to the `Expected:` line for each scenario
3. For S-01 and S-06, compare the full output to the golden output files
4. Flag any scenario where DELIVERY STATUS or ROOT CAUSE does not match
5. Flag any scenario where CONFIDENCE label is wrong (High/Medium/Low)
6. Record results in `evaluations/regression/{{YYYY-MM-DD}}-sprint-results.md`

**Pass threshold**: All 7 scenarios must produce correct DELIVERY STATUS and CONFIDENCE label. Full golden output match (with tolerance) required for S-01 and S-06.
