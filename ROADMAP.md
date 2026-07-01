# Roadmap

The Engineering Manager OS is built in seven versions. Each version is a shippable, usable state of the system — not a phase gate. An EM can run on v0.1. v1.0 is just much better.

**Current version**: v0.4 — Prediction Engine
**Next milestone**: v0.5 — Memory

---

## Version Map

```
v0.1  Foundation        ████████████████████  ✅ Complete
v0.2  Skills            ████████████░░░░░░░░  🚧 In Progress
v0.3  Subagents         ████████████████████  ✅ Complete
v0.4  Prediction Engine ████████████████████  ✅ Complete
v0.5  Memory            ░░░░░░░░░░░░░░░░░░░░  🔜 Next
v0.6  Dashboard         ░░░░░░░░░░░░░░░░░░░░  🔮 Planned
v1.0  Production        ░░░░░░░░░░░░░░░░░░░░  🔮 Planned
```

---

## v0.1 — Foundation ✅ Complete

**Theme**: The OS has beliefs, structure, and a vocabulary. It cannot yet act.

**What this means**: An EM who installs v0.1 has a system that tells them *what to think* and *how to think*. No automation. No agents. No predictions. Just a structured operating model that replaces ad-hoc management with a principled approach.

### Deliverables

- [x] `CLAUDE.md` — AI operating manual with 15 directives, DORA/SPACE/Accelerate integration
- [x] `README.md` — System overview and quick start
- [x] `BUILD.md` — Instance configuration guide (6-step setup)
- [x] `docs/vision.md` — Why this OS exists, mission, 3-phase roadmap, expected outcomes
- [x] `docs/principles.md` — 13 named principles with implications and tensions
- [x] `docs/engineering-playbook.md` — Leadership bible: 18 sections from sprint planning to AI adoption
- [x] Repository structure: `subagents/`, `features/`, `commands/`, `templates/`, `skills/`, `integrations/`, `kaizen/`, `evaluations/`, `memory/`

### Exit Criteria

- [x] A new EM can read docs/ and understand the management philosophy in < 2 hours
- [x] CLAUDE.md directives are internally consistent (no contradictions)
- [x] All 13 principles have an Implication that maps to a concrete OS artifact

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Core docs complete | 5 of 5 | ✅ |
| Principles with implications | 13 of 13 | ✅ |
| Playbook sections | 18 of 18 | ✅ |
| CLAUDE.md directives | 15 of 15 | ✅ |

---

## v0.2 — Skills 🚧 In Progress

**Theme**: The OS can execute. Subagents have procedures to follow, not just identities to embody.

**What this means**: An EM who runs v0.2 can invoke a skill and receive a structured, evidence-based output in < 5 minutes. The skill handles the analysis. The EM handles the judgment. The combination is faster and more consistent than either alone.

### Deliverables

- [x] Skill template established (`skills/delivery/review-sprint.md` as reference implementation)
- [x] Skill structure: Purpose / Inputs / Analysis / Decision Tree / Output / Examples / Confidence Score / Failure Modes / References / Related Skills
- [x] Golden outputs for sprint review (healthy and critical cases)
- [x] Regression dataset: 7 sprint scenarios
- [ ] `skills/delivery/track-sprint.md` — Mid-sprint health check
- [ ] `skills/delivery/plan-sprint.md` — Sprint planning inputs
- [ ] `skills/delivery/review-quarter.md` — Quarterly delivery narrative
- [ ] `skills/delivery/manage-risk.md` — Risk register update
- [ ] `skills/operations/postmortem.md` — Blameless post-mortem facilitation
- [ ] `skills/operations/assess-oncall.md` — On-call health review
- [ ] `skills/operations/triage-alert.md` — Alert noise assessment
- [ ] `skills/people/prepare-one-on-one.md` — 1:1 preparation
- [ ] `skills/people/assess-burnout.md` — Wellbeing signal evaluation
- [ ] `skills/people/build-growth-plan.md` — Career development plan
- [ ] `skills/people/build-promotion-case.md` — Promotion evidence builder
- [ ] `skills/people/prepare-feedback.md` — SBI feedback preparation
- [ ] `skills/people/assess-hiring-pipeline.md` — Hiring funnel health
- [ ] `skills/architecture/assess-decision.md` — ADR evaluation
- [ ] `skills/quality/assess-tech-debt.md` — Debt classification and prioritization
- [ ] `skills/communication/write-executive-update.md` — Status communication
- [ ] `skills/product/prioritize-backlog.md` — RICE/ICE prioritization
- [ ] `skills/product/align-stakeholders.md` — Expectation management
- [ ] `skills/product/update-roadmap.md` — Roadmap refresh

### Exit Criteria

- [ ] All 20 skills have complete files matching the 10-section template
- [ ] Every skill has at least 2 example scenarios (healthy + stressed)
- [ ] Every skill has a golden output file in `evaluations/golden/`
- [ ] Every skill has test data in `evaluations/datasets/`
- [ ] Regression suite passes 100% for all skills against their golden outputs

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Skills complete (all sections) | 20 of 20 | 1 of 20 |
| Skills with golden outputs | 20 of 20 | 2 of 20 |
| Skills with datasets | 20 of 20 | 1 of 20 |
| Regression pass rate | 100% | Not yet run |

---

## v0.3 — Subagents ✅ Complete

**Theme**: The OS has a composable agent hierarchy. Work routes to the right specialist automatically.

**What this means**: An EM who runs v0.3 loads the Engineering Manager orchestrator and describes a situation. The system routes to the correct specialist(s), runs the appropriate skill(s), and returns a synthesized output. No manual selection of which agent to use.

### Deliverables

- [x] `subagents/engineering-manager.md` — Orchestrator with full routing logic
- [x] `subagents/delivery-manager.md` — Delivery specialist with DORA integration
- [x] `subagents/incident-manager.md` — Incident lifecycle owner
- [x] `subagents/executive-summary.md` — Output formatter (leaf node, 3 output templates)
- [x] `subagents/tech-lead.md` — Technical quality and architecture guidance
- [x] `subagents/engineering-coach.md` — Individual development and wellbeing
- [x] `subagents/product-partner.md` — Roadmap and prioritization
- [x] `subagents/architecture-reviewer.md` — ADR review and risk surface
- [x] Output contracts defined for all 8 agents
- [x] Delegation maps defined for all agents that route
- [x] Agent hierarchy: Engineering Manager → specialists → Executive Summary (leaf)
- [x] Incident priority rule: P1/P2 pre-empts all other routing

### Exit Criteria

- [x] Each subagent has a defined Output Contract (exact field structure)
- [x] No agent does specialist work outside its Scope section
- [x] Every agent has explicit Escalation conditions (when to return to caller)
- [x] The chain Engineering Manager → Delivery Manager → Incident Manager → Executive Summary is traceable end-to-end

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Subagents with output contracts | 8 of 8 | ✅ 8 of 8 |
| Subagents with delegation maps | 5 of 5 (routing agents) | ✅ 5 of 5 |
| Leaf nodes (no downstream calls) | 2 (exec-summary, arch-reviewer) | ✅ |
| Circular call prevention | Zero circular paths | ✅ Verified |

---

## v0.4 — Prediction Engine ✅ Complete

**Theme**: The OS makes falsifiable predictions. Every status has a confidence level. Every threshold is testable.

**What this means**: An EM who runs v0.4 gets outputs that state what the system expects to happen and how confident it is. When the prediction is wrong, the Kaizen process captures it, and the system recalibrates. The OS becomes measurably smarter over time.

### Deliverables

- [x] `features/sprint.feature` — 9 scenarios + 1 Scenario Outline (velocity bands)
- [x] `features/delivery.feature` — 8 scenarios + 1 Outline (DORA bands)
- [x] `features/incidents.feature` — 11 scenarios + 1 Outline (MTTR classification)
- [x] `features/burnout.feature` — 8 scenarios + 1 Outline (signal combinations)
- [x] `features/hiring.feature` — 8 scenarios + 1 Outline (pipeline health)
- [x] `features/roadmap.feature` — 8 scenarios + 1 Outline (milestone health)
- [x] `features/architecture.feature` — 10 scenarios
- [x] `features/one-on-one.feature` — 10 scenarios + 1 Outline (engagement matrix)
- [x] `features/release.feature` — 10 scenarios + 1 Outline (post-release health)
- [x] 81 total scenarios across 9 feature files
- [x] `@healthy`, `@warning`, `@at-risk`, `@critical`, `@immediate-action`, `@regression` tags
- [x] Every `Then` block includes confidence assertion
- [x] `kaizen/weekly-review.md` — 10-question Friday review with update cascade
- [x] `kaizen/failures.md` — Failure log with diagnostic taxonomy
- [x] `kaizen/continuous-improvement.md` — OS changelog
- [x] `kaizen/prompt-review.md` — Prompt calibration log
- [x] `kaizen/monthly-review.md` — Prediction accuracy + OS health score
- [x] `evaluations/golden/sprint-review-healthy.md`
- [x] `evaluations/golden/sprint-review-critical.md`
- [x] `evaluations/datasets/sprint-scenarios.md` — 7 canonical scenarios
- [x] `evaluations/regression/README.md` — Regression runner format

### Exit Criteria

- [x] All 9 feature files have scenarios covering Healthy / Warning / At-Risk / Critical states
- [x] Every scenario includes a confidence assertion in the `Then` block
- [x] Kaizen loop is designed end-to-end: question → decision → update cascade → evaluation
- [ ] First weekly kaizen review completed with real data *(requires running the OS in production)*
- [ ] First regression run executed and results logged

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Feature files with all 4 health states | 9 of 9 | ✅ 9 of 9 |
| Total scenarios | ≥ 80 | ✅ 81 |
| Scenarios with `@regression` tag | 100% | ✅ |
| Golden outputs created | 2 (sprint healthy + critical) | ✅ |
| First kaizen review run | 1 | ⏳ Pending production use |

---

## v0.5 — Memory 🔜 Next

**Theme**: The OS learns from what happened, not just what it was told. Context accumulates across weeks.

**What this means**: An EM who runs v0.5 has an OS that remembers. It knows which engineers are on growth trajectories, which incident patterns are recurring, which recommendations worked and which failed. The system improves between sessions, not just within them.

### Deliverables

- [ ] `memory/lessons/` — Weekly lessons from kaizen reviews (one file per week)
- [ ] `memory/incidents/` — Incident pattern log (recurring failures tracked by service/root-cause)
- [ ] `memory/coaching/` — Per-engineer growth trajectory (anonymized or named per EM preference)
- [ ] `memory/decisions/` — Decision outcome tracking (was the decision right? what happened?)
- [ ] `memory/retrospectives/` — Retro output summaries (themes, action items, completion rates)
- [ ] `memory/architecture/` — Architecture decision outcomes (did the ADR prove correct?)
- [ ] Memory index file (`memory/INDEX.md`) — what is stored and how to retrieve it
- [ ] Memory retrieval protocol — how subagents query memory before producing output
- [ ] Integration between weekly kaizen review and memory update
- [ ] Memory decay rules — how old memories are archived or weighted down
- [ ] 12 weeks of live kaizen reviews completed and logged

### Entry Criteria

- v0.4 in active use (at least 4 weekly kaizen reviews completed with real data)
- Regression suite running and producing results

### Exit Criteria

- [ ] Memory files exist for at least 8 distinct weeks
- [ ] At least 3 incident patterns captured across sessions
- [ ] At least 1 coaching trajectory shows multi-week progression
- [ ] Subagents demonstrably use memory to improve output (e.g., "based on last sprint's root cause...")
- [ ] Memory does not introduce false context — old memories are tagged with dates and decayed appropriately

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Weeks of memory logged | ≥ 12 | 0 |
| Incident patterns identified | ≥ 3 | 0 |
| Decision outcomes tracked | ≥ 10 | 0 |
| Coaching trajectories active | ≥ 1 per engineer | 0 |
| Prediction accuracy improvement (vs. v0.4 baseline) | > 5% | Not measurable yet |

---

## v0.6 — Dashboard 🔮 Planned

**Theme**: The OS is observable. Health is visible without running a review.

**What this means**: An EM who runs v0.6 opens the OS dashboard on Monday morning and immediately sees: team health signal, sprint trajectory, incident risk, delivery band, top open risks, and a single recommended action for the week. No synthesis required. The OS presents its current state.

### Planned Deliverables

- [ ] `commands/dashboard.md` — Weekly at-a-glance command (auto-pulls from integrations)
- [ ] Team health summary: SPACE dimensions, current week vs. prior week trend
- [ ] Delivery health summary: current DORA band, trajectory, top risk
- [ ] Incident summary: open incidents, MTTR trend, on-call burden, overdue post-mortems
- [ ] Roadmap summary: milestone status, scope inflation flags, at-risk items
- [ ] Risk register: top 3 risks this week with confidence scores
- [ ] "One thing to do this week" — the highest-priority recommendation from all subagents
- [ ] Integration with GitHub (PR cycle time), Jira (velocity, carry-over), Slack (team pulse), Datadog (DORA), PagerDuty (on-call)
- [ ] Output: structured Markdown table that can be sent as-is to stakeholders
- [ ] Historical trend: this week vs. 4-week average for each dimension

### Entry Criteria

- v0.5 in active use (memory is populated with at least 4 weeks of data)
- All 5 integrations configured (GitHub, Jira, Slack, Datadog, PagerDuty)

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Dashboard generated in < 5 min | Yes | Planned |
| Data pulled automatically (no manual input) | ≥ 80% of fields | Planned |
| Stakeholder-sendable without editing | Yes | Planned |
| Dashboard accuracy vs. manual review | ≥ 90% agreement | Planned |

---

## v1.0 — Production 🔮 Planned

**Theme**: The OS is trusted, transferable, and self-sustaining. It runs the management practice, not the other way around.

**What this means**: v1.0 is not a technical milestone. It is a trust milestone. The OS has been running for at least one quarter. Its predictions have been tested and calibrated. Its recommendations have been acted on and evaluated. A new EM could take over the team using this OS within one week. The system improves every Friday without requiring exceptional effort.

### Production Definition of Done

**Reliability**
- [ ] OS health score ≥ 4.0 / 5.0 on all 7 dimensions (from `kaizen/monthly-review.md`)
- [ ] Prediction accuracy ≥ 85% for High-confidence predictions
- [ ] Regression suite passes 100% each week before OS changes are deployed
- [ ] < 1 unresolved failure in `kaizen/failures.md` older than 30 days

**Coverage**
- [ ] All 20 skills complete with golden outputs and passing regression
- [ ] All 9 feature files with regression runs logged
- [ ] All 5 integrations active and providing real data to the dashboard
- [ ] Memory populated with ≥ 12 weeks of lessons, incidents, and coaching data

**Transferability**
- [ ] A new EM can onboard to the OS in < 4 hours using `BUILD.md`
- [ ] All team context is in the system — nothing critical is only in the EM's head
- [ ] Kaizen process runs without prompting — the Friday review is habitual

**Continuous Improvement**
- [ ] At least 8 completed weekly kaizen reviews in the last quarter
- [ ] At least 1 monthly review completed with OS health score
- [ ] `kaizen/continuous-improvement.md` has ≥ 20 changelog entries
- [ ] At least 3 thresholds have been recalibrated based on real data

### v1.0 Is Not

- v1.0 is not "all features are perfect." It is "we know where the gaps are and they are tracked."
- v1.0 is not "the OS never makes wrong recommendations." It is "when it does, we catch it within one week."
- v1.0 is not "the OS runs itself." It is "the EM runs the OS without friction."

---

## What Comes After v1.0

v1.0 is not the end. Once the OS is in production and self-improving, the next frontier is:

- **Multi-team support**: The OS runs for a portfolio of teams under a Director or VP of Engineering
- **Org-level intelligence**: Patterns detected across teams, not just within one
- **Predictive hiring**: Memory and velocity data inform headcount planning 6 months out
- **Automated signal ingestion**: The dashboard updates itself in real time, not weekly
- **AI-native evaluation**: The evaluation suite runs automatically after every kaizen update, not manually

These are v2.x concerns. Do not plan for them until v1.0 is stable.

---

## Milestones at a Glance

| Version | Name | Key Capability Added | Status |
|---|---|---|---|
| v0.1 | Foundation | Principled management philosophy | ✅ Complete |
| v0.2 | Skills | Structured, executable analysis procedures | 🚧 In Progress |
| v0.3 | Subagents | Composable AI specialist hierarchy | ✅ Complete |
| v0.4 | Prediction Engine | Falsifiable predictions + Kaizen loop | ✅ Complete |
| v0.5 | Memory | Cross-session learning and pattern detection | 🔜 Next |
| v0.6 | Dashboard | Real-time OS observability | 🔮 Planned |
| v1.0 | Production | Trusted, transferable, self-improving | 🔮 Planned |
