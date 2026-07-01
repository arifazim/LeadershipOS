# Skill: QA Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Per-sprint (test planning) + Weekly (sync)

---

## Purpose

Build a QA-engineering partnership that catches defects early, defines quality ownership clearly, and ensures that QA is a collaborative gate — not a bottleneck at the end of the sprint.

The most common QA partnership failure: QA is brought in at the end of the sprint to validate work that's "done." This makes QA a blocker, creates tension around completion, and produces a change failure rate that's entirely preventable.

**The quality ownership model**: Engineering owns the quality of what it builds. QA owns the quality of the quality process — test strategy, coverage, regression detection. Both teams are accountable for the shipped product working as expected.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of stories with test cases defined before engineering starts | >80% | <70% = Yellow; <60% = Red |
| **Decision latency** | Median hours to resolve a quality decision (defect severity, test coverage gap) | ≤4 hours | >24 hours = Yellow; >48 hours = Red |
| **Cross-team blockers** | Stories blocked in QA (waiting for environment, test data, or QA capacity) | 0 | >1/sprint = Yellow; >3/sprint = Red |
| **Dependency aging** | Stories in QA for >2 business days without disposition | 0 | >2 aging = Yellow |
| **Collaboration health** | QA involved in planning; defects addressed blameless; no "throw over the wall" | Green | Late involvement = Yellow |
| **Stakeholder satisfaction** | QA team's confidence that engineering supports quality goals | Green | Quarterly 1:1 |

**Change failure rate** (primary shared quality metric):
```
Change failure rate = (deployments causing incidents or rollbacks) ÷ (total deployments) × 100
Target: <3% (Elite/High DORA band)
Yellow: 3–10%
Red: >10%
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Defect data** | Bugs found in QA vs. bugs found in production — the escape rate |
| **Test coverage signal** | Are critical paths covered? Are regression tests maintained? |
| **Change failure rate** | DORA metric — % of deploys causing failures |
| **QA capacity** | How many stories QA can realistically validate per sprint |

### Optional
| Input | Description |
|---|---|
| **Regression test health** | Are automated regression tests passing and current? |
| **Test environment stability** | Is the test environment reliable, or does it cause false failures? |
| **Defect aging** | How long do bugs stay open without being fixed? |

---

## Analysis

### Step 1 — Measure Defect Escape Rate

The most important QA partnership metric that most teams don't explicitly track:

```
Defect escape rate = (defects found in production) ÷ (total defects found) × 100

Target: <10% (>90% of defects caught before production)
Yellow: 10–25%
Red: >25% (more than 1 in 4 defects reaching users)
```

A high escape rate means QA is too late in the process, coverage is insufficient, or engineering is skipping the testing gate.

### Step 2 — Assess QA Involvement Timing

| When QA gets involved | Risk | Target |
|---|---|---|
| Requirements / planning | Low — QA helps define testability | Best practice |
| Start of engineering | Low — test cases written in parallel | Good |
| End of engineering ("done, please test") | Medium — QA is now the blocker | Acceptable but suboptimal |
| Post-merge, pre-release | High — defects found late; rework expensive | Avoid |
| Post-release | Critical — defects reach users | Failure |

### Step 3 — Classify Defects by Ownership

Not all defects have the same root cause. Classify each:

| Type | Root cause | Prevention |
|---|---|---|
| **Specification defect** | Requirements were wrong or ambiguous | Better acceptance criteria; PM-QA collaboration earlier |
| **Implementation defect** | Code doesn't match specification | Code review; unit test coverage |
| **Integration defect** | Components don't work together | Integration tests; contract testing |
| **Regression defect** | Change broke something that was working | Automated regression suite |
| **Environment defect** | Works in dev; fails in production | Environment parity; staging confidence |

Knowing the type enables the right prevention investment.

---

## Decision Tree

```
What is the state of the QA partnership?

├── HIGH CHANGE FAILURE RATE (>3%)
│   └── Diagnose: What type of defects are escaping?
│       Implementation defects → improve code review, unit test coverage
│       Integration defects → add integration tests, contract testing
│       Regression defects → invest in automated regression suite
│       Environment defects → improve environment parity
│       → Invoke: skills/executive/executive-risk-report.md if rate is >10%

├── QA IS THE SPRINT BOTTLENECK (stories queue in QA at sprint end)
│   └── Root cause options:
│       1. QA is under-resourced relative to engineering output
│       2. Stories arrive in QA late (engineering-side timing problem)
│       3. Test environments are unstable (infrastructure problem)
│       Fix for (1): Surface QA capacity gap to PM and design manager
│       Fix for (2): Add mid-sprint QA review checkpoint — not just end-of-sprint
│       Fix for (3): Escalate environment stability as a reliability risk

├── LOW ALIGNMENT SCORE (<80% test cases pre-written)
│   └── Structural fix: Add "testability" to Definition of Ready
│         Stories aren't Ready until QA has written test cases
│       Conversation with PM: "Test case authoring is sprint prep work.
│                              It needs to happen before sprint start."

├── HIGH DEFECT ESCAPE RATE (>10% escaping to production)
│   └── Immediate: Treat as a reliability risk — escalate to VP
│       Root cause: Is QA coverage insufficient? Is testing being skipped?
│       Fix: Add QA sign-off gate before deployment
│       → Invoke: skills/executive/executive-risk-report.md

└── PARTNERSHIP IS HEALTHY
    └── Invest: Involve QA in architecture discussions when quality will be affected
        Share: DORA metrics with QA — they are co-owners of change failure rate
        Recognize: Quality wins publicly — when QA catches something critical before release
```

---

## Output

### QA Partnership Health Report

```
QA PARTNERSHIP HEALTH — Sprint {{N}} / Week of {{date}}

METRICS
Alignment score:      {{N}}% stories with test cases pre-written | {{🟢/🟡/🔴}}
Decision latency:     {{N}} hrs median for quality decisions | {{🟢/🟡/🔴}}
Cross-team blockers:  {{N}} stories blocked in QA | {{🟢/🟡/🔴}}
Dependency aging:     {{N}} stories in QA >2d without disposition | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Change failure rate:  {{N}}% (DORA) | {{🟢/🟡/🔴}}
Defect escape rate:   {{N}}% | {{🟢/🟡/🔴}}
Stakeholder satisfaction: {{QA team's last signal + date}}

DEFECT SUMMARY
Caught in QA this sprint: {{N}}
Escaped to production: {{N}} | Escape rate: {{N}}%
Defect type breakdown: Spec: {{N}} | Implementation: {{N}} | Regression: {{N}}

QA PIPELINE STATE
Ready for QA: {{N}} stories
In QA (>2d): {{list}} — action: {{plan}}
Blocked: {{list}} — blocker type: {{environment/data/capacity}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Change failure rate tracked (DORA) | Base: 65% |
| Defect escape rate tracked | +10% |
| Defect type classification maintained | +10% |
| QA involvement timing assessed | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| No defect escape rate tracked | −20% |
| QA involvement consistently end-of-sprint | −15% |
| Change failure rate not linked to QA partnership | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **End-of-sprint bottleneck** | QA queue builds up in sprint week 2 | Add mid-sprint QA review checkpoints. Stories go to QA when done, not at sprint end. |
| **No escape rate measurement** | Team doesn't know how many bugs reach production | Instrument the measurement. Production bugs vs. QA bugs is the signal. |
| **Defect blame** | "That engineer shipped a bug" | Classify defects by type. The system produced the bug. Fix the system. |
| **QA excluded from planning** | QA first sees requirements in sprint | QA should attend or review every sprint planning session. |
| **Environment instability** | False failures make QA unreliable | Treat test environment stability as an engineering reliability responsibility. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `docs/engineering-playbook.md` → DORA Metrics section
- `skills/delivery/review-sprint.md` — Change failure rate is a DORA sprint signal

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/dependency-management.md` | Dependency tracking for QA pipeline |
| `skills/cross-functional/product-partnership.md` | Specification defects trace back to product clarity |
| `skills/cross-functional/security-partnership.md` | Security is a quality concern often shared with QA |
| `skills/delivery/review-sprint.md` | Change failure rate reported in sprint review |
