# Regression Run — sprint-review — 2026-07-01

Triggered by: Manual (first-ever run for this module)
Skill version: `skills/delivery/review-sprint.md` as of commit `d54304d` and prior
Dataset: evaluations/datasets/sprint-scenarios.md

## Results

Computed by hand-applying `review-sprint.md`'s Analysis steps (1-5) and Decision Tree to each scenario's inputs.

| Scenario | Expected Status | Actual Status | Expected Root Cause | Actual Root Cause | Expected Confidence | Pass/Fail |
|---|---|---|---|---|---|---|
| S-01 Healthy (canonical) | Green | Green | None | None | High | PASS |
| S-02 Goal met, low points | Green | Green | None | None | High | PASS |
| S-03 Warning (degraded velocity) | Yellow | Yellow | Blocker-Driven | Blocker-Driven | Medium | PASS |
| S-04 Warning (scope creep) | Yellow | Yellow | Scope Creep | Scope Creep | High | PASS |
| S-05 At Risk (velocity below threshold) | At Risk | At Risk | Blocker-Driven | Blocker-Driven | Medium | PASS |
| S-06 Critical (velocity collapse) | Red | Red | Scope Creep + Blocker-Driven (combined) | Scope Creep + Blocker-Driven (combined) | High | PASS |
| S-07 Critical (goal missed despite high completion) | Red | Red | Planning Failure | Red reached correctly via Step 1's explicit prose rule; root-cause label not reachable through Step 5's taxonomy | High | PASS with finding |

## Golden Output Comparison

| Scenario | Hard Failures | Soft Failures | Pass/Fail |
|---|---|---|---|
| S-01 Healthy | None | None | PASS |
| S-06 Critical | None — burnout risk correctly named, immediate recommendation correctly addresses it first per the "People First" hard constraint | None | PASS |

## Overall Result

**PASS overall (7/7), with one confirmed skill-file finding:**

**Root-cause taxonomy gap**: Step 5's formal taxonomy lists 6 causes (Estimation error, Scope creep, Blocker-driven, Capacity shortfall, Dependency failure, Goal misalignment). S-07 requires a 7th: **Planning Failure** — a sprint goal missed despite high story-point completion, because the wrong stories were selected relative to the goal. Step 1 already anticipates this in prose ("A sprint goal missed despite 100% story point completion is a planning failure") but Step 5's taxonomy and the Decision Tree's branches never formalize it as a named, actionable category with its own recommendation branch. The correct Red/Critical status is still reachable by applying Step 1's prose rule directly, but the Decision Tree provides no explicit path to it.

**Recommendation**: Add "Planning Failure" as a 7th root cause to Step 5's taxonomy and a corresponding branch to the Decision Tree (recommendation: review how the sprint goal was translated into story selection during planning; consider requiring an explicit goal-to-story traceability check before sprint start).

## Notes

- This is the first regression run ever executed for this module (`ROADMAP.md` v0.1 exit criteria "First regression run executed and results logged" — now satisfied for this module).
- Unlike `leadership-health`, no arithmetic bugs were found — `review-sprint.md`'s logic is narrative/decision-tree-based rather than weighted-formula-based, so there's no equivalent "weights don't sum to 100%" failure mode possible.
- All 7 scenarios were computed by hand (no execution harness exists for these prompt-based skills).

---

## Trend Tracking

| Date | Skill/Feature | Scenarios | Passed | Failed | Overall |
|---|---|---|---|---|---|
| 2026-07-01 | skills/delivery/review-sprint.md | 7 | 7 | 0 | PASS (1 non-blocking finding) |

A declining pass rate over 3 consecutive runs means the OS is degrading. Escalate to a full kaizen review.
