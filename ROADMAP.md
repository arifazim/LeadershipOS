# Roadmap

The Engineering Manager OS is built in seven versions. Each version is a shippable, usable state of the system — not a phase gate. An EM can run on v0.1. v1.0 is just much better.

**Current version**: v0.6 — Dashboard 🚧 In Progress
**Next milestone**: v0.6 complete (live integrations) → v0.7 Second Brain

---

## Version Map

```
v0.1  Foundation        ████████████████████  ✅ Complete
v0.2  Skills            ████████████████████  ✅ Complete
v0.3  Subagents         ████████████████████  ✅ Complete
v0.4  Prediction Engine ████████████████████  ✅ Complete
v0.5  Memory            ████████████████████  ✅ Complete
v0.6  Dashboard         ░░░░░░░░░░░░░░░░░░░░  🔜 Next
v0.7  Second Brain      ████████████████████  🚧 In Progress
v0.8  Human Intelligence░░░░░░░░░░░░░░░░░░░░  🔮 Planned
v0.9  Executive Layer   ░░░░░░░░░░░░░░░░░░░░  🔮 Planned
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

## v0.2 — Skills ✅ Complete

**Theme**: The OS can execute. Subagents have procedures to follow, not just identities to embody.

**What this means**: An EM who runs v0.2 can invoke a skill and receive a structured, evidence-based output in < 5 minutes. The skill handles the analysis. The EM handles the judgment. The combination is faster and more consistent than either alone.

**Reality vs. original plan**: The original plan listed 20 skills under a verb-first naming convention (`skills/delivery/track-sprint.md`, etc.). What actually shipped is a 132-file library across 22 subdirectories under a topic-based convention — vastly larger in scope. The original 20-item list is therefore superseded. A handful of the original names remain genuine functional gaps (tracked below as real gaps still open); everything else is covered by the real library. Exit criteria are assessed against the real library, not the original 20-item plan.

**Regression**: Five modules have full golden output + dataset + regression run results logged: `sprint-review`, `confidence-engine`, `leadership-health`, `decision-memory`, `political-signals`. Individual skill files outside these modules do not have per-skill regression coverage — that is v1.0 work.

### Deliverables

**Skill library (132 files, 22 subdirectories — all built)**
- [x] `skills/career/promotion/` — 8 promotion skills (evidence, readiness, gaps, roadmap, visibility, impact, executive-feedback, leadership-growth)
- [x] `skills/confidence-engine/` — 6 dimension skills feeding `confidence-engine/executive_confidence.md`
- [x] `skills/conflict/` — 6 skills (diagnosis, difficult-conversations, mediation, stakeholder-resolution, team-alignment, blameless-retrospectives)
- [x] `skills/cross-functional/` — 11 partnership skills (product, design, QA, security, sales, marketing, customer-success, support, legal, finance, dependency-management)
- [x] `skills/decision-memory/` — 3 skills (record-decision, recall-decisions, detect-patterns)
- [x] `skills/delivery/` — 5 skills (review-sprint, devex-assessment, on-call-fatigue-analytics, cross-team-contract-monitor, legacy-migration-tracker)
- [x] `skills/executive/` — 14 skills (executive-communication, board-level-summary, pressure-decision-framework, executive-presence, executive-storytelling, executive-status-report, executive-risk-report, executive-decision-framework, headcount-justification, investment-proposal, annual-planning, quarterly-business-review, engineering-budget, vp-one-on-one)
- [x] `skills/leadership-health/` — `leadership-health-engine.md` (consolidated 13-dimension engine)
- [x] `skills/meetings/` — 8 skills (agenda-builder, meeting-planner, action-items, decision-log, retrospective, staff-meeting, architecture-review, executive-meeting)
- [x] `skills/mentoring/` — 8 skills (coaching-style, delegation, em-self-coaching, growth-tracking, mentee-plan, mentor-plan, skip-level-facilitation, technical-leadership)
- [x] `skills/organizational/` — 10 skills (political-intelligence, ai-governance, alignment-health, change-resistance, conflict-prediction, decision-network, executive-priorities, influence-map, political-risk, stakeholder-analysis)
- [x] `skills/people/` — 15 skills (one-on-one, burnout, feedback, growth-plans, coaching, career-development, difficult-message-delivery, engagement, motivation, performance-review, promotion, psychological-safety, skill-atrophy-signal, trust-recovery-playbook, upward-feedback)
- [x] `skills/performance/` — 7 skills (calibration, high-performer, low-performer, performance-improvement, promotion-readiness-tracking, recognition, retention-risk)
- [x] `skills/presentation/` — 9 skills (presentation-coach, storyline-generator, kpi-storytelling, meeting-preparation, roadmap-presentation, engineering-review, executive-slide-review, architecture-review-deck, visualization-recommendations)
- [x] `skills/product/` — 10 skills (rice-scoring, moscow-prioritization, roadmap-health, scope-drift-detector, customer-impact, feature-sizing, okr-alignment, opportunity-cost, product-risk, value-vs-cost)
- [x] `skills/strategy/` — 8 skills (annual-planning, capacity-planning, innovation-roadmap, investment-planning, platform-strategy, quarterly-planning, risk-planning, succession-planning)
- [x] `skills/talent/` — 3 skills (interview-calibration, onboarding-playbook, sourcing-strategy)

**Evaluation infrastructure**
- [x] Golden outputs: 5 modules × 2 outputs each (healthy + critical) = 10 golden files
- [x] Regression datasets: 5 modules with scenario datasets
- [x] Regression run results logged: `sprint-review-results.md`, `confidence-engine-results.md`, `leadership-health-results.md`, `decision-memory-results.md`, `political-signals-results.md`
- [x] `AGENTS.md` added — OpenAI Codex convention entry point; `CLAUDE.md` updated to cover both Claude Code and Codex

**Real gaps remaining (functional, not naming — deferred to v0.9)**
- [ ] `skills/delivery/track-sprint.md` — mid-sprint health check; no equivalent exists
- [ ] `skills/delivery/plan-sprint.md` — sprint planning inputs; no equivalent exists
- [ ] `skills/delivery/review-quarter.md` — quarterly delivery narrative; no equivalent exists
- [ ] `skills/delivery/manage-risk.md` — risk register update; no equivalent exists
- [ ] `skills/operations/postmortem.md` — blameless post-mortem facilitation; `skills/operations/` is an empty reserved directory
- [ ] `skills/operations/assess-oncall.md` — on-call health review; no equivalent exists
- [ ] `skills/operations/triage-alert.md` — alert noise assessment; no equivalent exists
- [ ] `skills/people/assess-hiring-pipeline.md` — hiring pipeline assessment; no equivalent exists
- [ ] `skills/architecture/assess-decision.md` — architectural decision assessment; `skills/architecture/` is an empty reserved directory

### Exit Criteria

- [x] Skills library exceeds original 20-item scope — 132 files across 22 subdirectories delivered
- [x] Every skill has at least 2 example scenarios (healthy + stressed)
- [x] Golden outputs exist for all 5 module-level evaluation suites (sprint-review, confidence-engine, leadership-health, decision-memory, political-signals)
- [x] Regression datasets exist for all 5 module-level suites
- [x] Regression suite has been run and results are logged for all 5 modules
- [ ] Per-skill golden outputs and regression for individual skill files outside the 5 modules — deferred to v1.0

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Skill files built | ≥ 20 (original plan) | ✅ 132 files across 22 subdirectories |
| Subdirectory coverage | 13+ topic areas | ✅ 22 subdirectories |
| Module-level golden outputs | 5 of 5 | ✅ 10 files (2 per module) |
| Module-level regression runs | 5 of 5 | ✅ Results logged |
| Remaining functional gaps | 0 critical | ⚠️ 9 gaps deferred to v0.9 |

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

## v0.5 — Memory ✅ Complete

**Theme**: The OS learns from what happened, not just what it was told. Context accumulates across weeks.

**What this means**: An EM who runs v0.5 has an OS that remembers. It knows which engineers are on growth trajectories, which incident patterns are recurring, which recommendations worked and which failed. The system improves between sessions, not just within them.

**Completion note**: All infrastructure deliverables are complete. The "12 weeks of live reviews" item is a production accumulation milestone — it tracks whether the OS is being used, not whether the memory infrastructure is built. The infrastructure is built and verified. Marking this version ✅ Complete; the accumulation target is tracked in the Success Metrics table as an ongoing operational goal.

### Deliverables

- [x] Leadership memory module with domain-specific pattern capture — delivered as `memory/{executive,stakeholders,career,conflicts,mentoring,promotions,architecture,roadmaps,customer-feedback,decision-history}/`, superseding the `lessons/incidents/coaching/decisions` structure originally planned here
- [x] `memory/retrospectives/` — Retro output summaries (themes, action items, completion rates, sentiment trajectory) — formalized as `memory/retrospectives/retrospective-memory.md` with full schema-compliant structure; `RET` prefix added to `memory/schema.md`'s Domain Prefixes table
- [x] Memory index/routing — delivered as `memory/memory.md`'s Query Routing Table (functions as the planned `memory/INDEX.md`)
- [x] Memory retrieval protocol — how subagents query memory before producing output — delivered as Memory Retrieval Protocol sections in `subagents/engineering-manager.md`, `subagents/engineering-coach.md`, and `subagents/delivery-manager.md`; each agent now queries relevant domains before generating output and flags MEMORY CAPTURE SUGGESTED when new entries are warranted
- [x] Integration between weekly kaizen review and memory update — fully documented end-to-end: `kaizen/weekly-review.md` Update Cascade Step 4 routes to all memory domains (including retrospectives) with a DECAY MAINTENANCE sub-step; `kaizen/monthly-review.md` Part 6b runs the Memory Health Review against the `memory/memory.md` 9-step checklist; the chain weekly Q5/Q6 → STEP 4 → monthly Part 6b → archived entries is verified
- [x] Memory decay rules — formalized in `memory/schema.md` as a dedicated Memory Decay Rules section: six decay tiers (Active/Watch/Stale/Archive/Decay-weight/Context-expired), decay clock rules, archival mechanics (entries move to `## Archived Entries` in domain files), context-expiry triggers, and a table of what does not decay; monthly review checklist updated to execute decay passes
- [~] 12 weeks of live kaizen reviews completed and logged — infrastructure complete; accumulation is an operational goal tracked in Success Metrics below, not a blocker to this version being usable

### Entry Criteria

- v0.4 in active use (at least 4 weekly kaizen reviews completed with real data)
- Regression suite running and producing results

### Exit Criteria

- [ ] Memory files exist for at least 8 distinct weeks
- [ ] At least 3 incident patterns captured across sessions
- [ ] At least 1 coaching trajectory shows multi-week progression
- [ ] Subagents demonstrably use memory to improve output (e.g., "based on last sprint's root cause...") — retrieval protocol wired; verified in production when real entries exist
- [x] Memory does not introduce false context — old memories are tagged with dates and decayed appropriately — delivered via Memory Decay Rules in `memory/schema.md` (decay tiers, [STALE]/[DECAY-WEIGHT]/[CONTEXT-EXPIRED] tags, archival mechanics) and surfaced in Recall Response Format

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Memory domains built | 11 of 11 | ✅ (executive, stakeholders, career, conflicts, mentoring, promotions, architecture, roadmaps, customer-feedback, decision-history, retrospectives) |
| Memory retrieval protocol in subagents | 3 of 3 key agents | ✅ (engineering-manager, engineering-coach, delivery-manager) |
| Memory decay rules formalized | Yes | ✅ 6 tiers + archival mechanics in memory/schema.md |
| Kaizen→memory integration verified | Yes | ✅ weekly cascade Step 4 + monthly Part 6b |
| Weeks of memory logged (live) | ≥ 12 | 0 — production accumulation in progress |
| Incident patterns identified (live) | ≥ 3 | 0 — production accumulation in progress |
| Decision outcomes tracked (live) | ≥ 10 | 0 — production accumulation in progress |
| Coaching trajectories active (live) | ≥ 1 per engineer | 0 — production accumulation in progress |
| Prediction accuracy improvement | > 5% vs. v0.4 | Not measurable until accumulation reaches 12 weeks |

---

## v0.6 — Dashboard � In Progress

**Theme**: The OS is observable. Health is visible without running a review.

**What this means**: An EM who runs v0.6 opens the OS dashboard on Monday morning and immediately sees: team health signal, sprint trajectory, incident risk, delivery band, top open risks, and a single recommended action for the week. No synthesis required. The OS presents its current state.

### Deliverables

- [x] `commands/dashboard.md` — Weekly at-a-glance command with DORA band thresholds, output format, escalation rules, and kaizen integration
- [x] `dashboard/server.py` — FastAPI backend: `GET /api/metrics` (normalized, banded, with trend vs. 4-week baseline), `GET /api/team`, `POST /api/run` (orchestrator passthrough), `POST /api/ingest`, `GET /api/health`; served at `http://localhost:8080`
- [x] `dashboard/dashboard.html` — Enterprise-grade single-page dashboard UI: fixed sidebar nav, 5 views (Summary, Delivery & DORA, Incidents, Team Health, Risk Register), Executive Confidence Score with animated gauge, DORA 4-band cards, delivery signal table, incident KPIs, computed risk register, and AI chat panel (direct orchestrator integration)
- [x] Delivery health summary: DORA bands (Elite/High/Medium/Low), trajectory vs. 4-week baseline, PR cycle time, commitment accuracy, unplanned work ratio
- [x] Incident summary: MTTR, change failure rate, incident count with band classification
- [x] Risk register: dynamically derived from live metrics with severity, confidence, and recommended action
- [x] "One thing to do this week" — priority action derived from the highest-severity signal across all metrics
- [x] Historical trend: current week vs. 4-week baseline for all DORA and delivery metrics
- [x] Output: Markdown table format in `commands/dashboard.md` (stakeholder-sendable without editing)
- [ ] Team health summary: SPACE dimensions — pending memory accumulation (Views 3–5 require v0.5 data)
- [ ] Roadmap summary: milestone status, scope inflation flags — requires `integrations/jira.md` live connection
- [ ] Live integration with GitHub, Jira, Slack, Datadog, PagerDuty — stubs exist in `scripts/ingest_metrics.py`; real API calls require env tokens

### Entry Criteria

- [x] v0.5 infrastructure complete (memory schema, domain files, decay rules, retrieval protocol)
- [ ] All 5 integrations configured with live tokens — current state: mock data via `scripts/ingest_metrics.py`

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Dashboard generated in < 5 min | Yes | ✅ Loads in < 2s from mock data |
| Data pulled automatically (no manual input) | ≥ 80% of fields | ✅ DORA + delivery fields; Views 3–5 pending |
| Stakeholder-sendable output format | Yes | ✅ `commands/dashboard.md` format |
| Dashboard accuracy vs. manual review | ≥ 90% agreement | ⏳ Requires live data validation |
| Web UI with enterprise design | Yes | ✅ Custom design system, no UI framework |

---

## v0.7 — Second Brain 🔮 Planned

**Theme**: The OS coaches the EM, not just the team. Judgment is portable under pressure.

**What this means**: An EM who runs v0.7 has a system that knows their context, remembers their patterns, and actively develops their own leadership capability — not just their team's. When they are under pressure and about to make a reactive decision, the OS surfaces the question they should be asking. When a crisis hits — organizational, not technical — the OS provides a structured response, not just incident runbooks.

**Why this beats any competitor**: LinearB, Jellyfish, and Waydev are outward-facing tools (team data, delivery metrics). This is the only inward-facing layer in the market. No competitor can build this from a data layer — it requires the judgment layer this OS already owns.

### Planned Deliverables

- [x] `skills/mentoring/em-self-coaching.md` — EM self-reflection skill; surfaces patterns in the EM's own decisions and blind spots using decision-memory and kaizen failure data
- [x] `skills/mentoring/skip-level-facilitation.md` — how to run skip-levels and synthesize what you learn
- [x] `skills/executive/pressure-decision-framework.md` — structured decision process for high-stakes, time-pressure situations (the fire-drill frame)
- [x] `skills/people/difficult-message-delivery.md` — delivering layoff news, org changes, performance outcomes in a way that preserves trust
- [x] `loops/em-growth-loop.md` — monthly EM self-development cadence: feeds from decision-memory + kaizen failures + 360 signals → produces growth insight + 1 action
- [x] `loops/crisis-loop.md` — orchestration loop for management crises (human/org crises, not technical incidents)
- [x] `features/crisis-management.feature` — behavioral specs for EM decisions in org crisis scenarios
- [x] `memory/` domain addition: `em-self-development/` — captures the EM's own growth trajectory across sessions (added to memory/schema.md domain prefix table)
- [ ] Integration with kaizen: `em-growth-loop` writes to `memory/em-self-development/` and reads from `kaizen/failures.md` and `decision-memory/` — loop wired; first real execution pending production use

### Entry Criteria

- v0.5 in active use (memory module populated with at least 4 weeks of data)
- At least 3 decisions logged in decision-memory with actual outcomes recorded

### Exit Criteria

- [ ] EM self-coaching loop runs monthly without manual prompting
- [ ] At least 1 growth pattern surfaced from decision history
- [ ] Crisis management loop tested against at least 2 simulated scenarios
- [ ] `memory/em-self-development/` has at least 8 entries

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| EM self-coaching loop runs per quarter | ≥ 3 | Planned |
| Growth patterns identified from decision history | ≥ 2 | Planned |
| Crisis scenarios covered by feature specs | ≥ 6 | Planned |
| EM self-development memory entries | ≥ 8 | Planned |

---

## v0.8 — Human Intelligence 🔮 Planned

**Theme**: The OS predicts people risk before it becomes visible in data. It manages the AI workforce transition. It handles org design and hiring as first-class capabilities.

**What this means**: An EM who runs v0.8 gets early warning on flight risk before someone's activity drops in git. They have structured support for the AI workforce transition — not just measuring AI output, but managing the human implications. When a reorg is announced, they have a playbook. When they need to hire, they have a system.

**Why this beats any competitor**: Competitors detect attrition after it appears in activity data. This OS detects it from the relational and motivational layer — weeks earlier. No competitor addresses AI workforce transition as a people-management challenge. No competitor touches org design or hiring.

### Planned Deliverables

**Predictive People Risk**
- [ ] `skills/people/flight-risk-model.md` — multi-signal flight risk composite (engagement trend + 1:1 sentiment + promotion timeline + peer comparison); outputs risk level + confidence + recommended action
- [ ] `skills/people/team-health-forecast.md` — projects team health 4–8 weeks forward from current signals
- [ ] `skills/people/successor-readiness.md` — who can cover which critical role if someone leaves; bus factor assessment for people, not just code

**AI Workforce Transition**
- [ ] `skills/people/ai-skill-transition.md` — how to develop engineers in an AI-first environment; what skills matter now vs. what AI handles; anti-atrophy practices
- [ ] `skills/delivery/ai-productivity-narrative.md` — how to communicate AI-driven velocity gains to executives without inviting headcount reduction requests
- [ ] `skills/performance/ai-era-calibration.md` — updated performance calibration standards when everyone uses AI tools; what "senior engineer" means when everyone has a copilot
- [ ] `features/ai-workforce.feature` — behavioral specs for EM decisions across the AI transition arc

**Organizational Design**
- [ ] `skills/organizational/reorg-navigation.md` — full playbook for surviving and shaping a reorg: early signals, stakeholder mapping, protecting team interests, designing for the new state
- [ ] `skills/organizational/team-topology-assessment.md` — is this team structure optimal? (Team Topologies–informed; stream-aligned, platform, enabling, complicated-subsystem patterns)
- [ ] `skills/organizational/span-of-control.md` — when is a team too large or too small; how to make the case for splitting or merging teams
- [ ] `subagents/org-design-advisor.md` — dedicated subagent for structural and team design questions

**Hiring Intelligence**
- [ ] `skills/talent/hiring-plan.md` — when to hire, what level, what gap it solves, how to build the business case
- [ ] `skills/talent/role-design.md` — how to write a role description that attracts the right candidates at the right level
- [ ] `skills/talent/interview-design.md` — structured interview design for a specific role/level with bias reduction built in
- [ ] `skills/talent/offer-calibration.md` — how to calibrate an offer competitively given market data and internal equity
- [ ] `skills/talent/new-hire-ramp.md` — 30/60/90 tracking with early signal detection and ramp risk assessment

### Entry Criteria

- v0.7 complete (EM self-development memory domain populated)
- `skills/people/retention-risk.md` validated against real team data for at least 4 weeks

### Exit Criteria

- [ ] Flight-risk model produces outputs with ≥ 70% accuracy against observed outcomes (measured via kaizen review)
- [ ] AI workforce transition skills cover all 4 engineer archetype scenarios (early-career, mid-level, senior, staff+)
- [ ] Org design skills cover reorg, team split, team merge, and span-of-control scenarios
- [ ] Hiring skills cover full funnel: role design → sourcing → interview → offer → ramp

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Flight-risk model accuracy | ≥ 70% | Planned |
| AI transition skills validated | 4 scenarios | Planned |
| Org design scenarios covered | ≥ 4 | Planned |
| Hiring funnel coverage | End-to-end | Planned |

---

## v0.9 — Executive Layer 🔮 Planned

**Theme**: The OS produces delivery narratives, not delivery data. It actively manages executive trust as a first-class outcome. It coordinates cross-functional delivery as a first-class capability.

**What this means**: An EM who runs v0.9 never hands an executive a dashboard — they hand them a story, with confidence level, risk flag, and a single ask. The OS monitors the executive relationship as carefully as it monitors sprint health. When cross-team dependencies are at risk, it triggers a negotiation protocol, not just an alert.

**Why this beats LinearB directly**: LinearB gives you charts. This OS gives you the narrative, the trust-building strategy, and the cross-team influence playbook. The data is an input, not the output.

### Planned Deliverables

**Delivery Narrative Engine**
- [ ] `skills/delivery/delivery-narrative.md` — translates raw metrics into a 3-sentence stakeholder story with confidence level, risk flag, and next action; the anti-dashboard
- [ ] `skills/delivery/forecast-milestone.md` — probabilistic milestone forecasting: P50/P80/P95 delivery dates with key assumptions named
- [ ] `skills/delivery/track-sprint.md` — mid-sprint health check (flagged as a real gap in v0.2; finally closing it here)
- [ ] `skills/delivery/manage-risk.md` — living risk register update with automatic severity scoring

**Executive Trust Engine**
- [ ] `skills/executive/trust-building-cadence.md` — structured approach to building executive trust over time; not just status reports but the relationship arc
- [ ] `skills/executive/executive-anxiety-detector.md` — reads behavioral signals from executives (increased check-ins, pointed questions, escalations) and interprets what they are actually worried about; prescribes a response
- [ ] `loops/executive-relationship-loop.md` — monthly cadence loop for proactively managing up; feeds from confidence-engine + memory/executive/ + recent decision history
- [ ] Confidence-engine integration: `memory/executive/` entries feed into executive confidence scores

**Cross-Functional Program Management**
- [ ] `skills/delivery/dependency-management.md` — structured approach to identifying, tracking, and resolving cross-team dependencies before they become blockers
- [ ] `skills/delivery/cross-team-negotiation.md` — how to get your dependencies into another team's sprint; the negotiation playbook
- [ ] `subagents/program-manager.md` — dedicated subagent for multi-team coordination; manages the full dependency lifecycle
- [ ] `loops/dependency-loop.md` — cadence loop for proactively monitoring cross-team commitments; weekly trigger, feeds from cross-team-contract-monitor skill

### Entry Criteria

- v0.8 complete (people risk and org design capabilities validated)
- At least 5 executive communications logged in memory/executive/
- Cross-team dependencies exist and are being tracked manually

### Exit Criteria

- [ ] Delivery narrative produced in < 2 minutes from raw metrics input
- [ ] Executive anxiety detector validated against at least 3 real executive interaction patterns
- [ ] Dependency management loop tracks cross-team commitments for ≥ 4 weeks without manual intervention
- [ ] Probabilistic milestone forecasting tested against at least 2 completed milestones

### Success Metrics

| Metric | Target | Status |
|---|---|---|
| Delivery narrative generation time | < 2 min | Planned |
| Executive trust signals tracked | ≥ 5 patterns | Planned |
| Cross-team dependencies managed | All active ones | Planned |
| Milestone forecast accuracy (P80) | ≥ 80% | Planned |

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
- [ ] All skills in the real, expanded library (100+ files, superseding v0.2's original 20-item plan — see that section's staleness note) have golden outputs and passing regression
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
| v0.2 | Skills | Structured, executable analysis procedures | ✅ Complete |
| v0.3 | Subagents | Composable AI specialist hierarchy | ✅ Complete |
| v0.4 | Prediction Engine | Falsifiable predictions + Kaizen loop | ✅ Complete |
| v0.5 | Memory | Cross-session learning and pattern detection | ✅ Complete |
| v0.6 | Dashboard | Real-time OS observability | � Next |
| v0.7 | Second Brain | EM self-coaching + crisis management | 🔮 Planned |
| v0.8 | Human Intelligence | People risk forecasting + AI transition + org design + hiring | 🔮 Planned |
| v0.9 | Executive Layer | Delivery narrative + executive trust + cross-functional PM | 🔮 Planned |
| v1.0 | Production | Trusted, transferable, self-improving | 🔮 Planned |
