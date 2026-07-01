# Changelog

All notable changes to the Engineering Manager OS are documented here.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) adapted for a knowledge system. Versions correspond to the milestones in `ROADMAP.md`.

Changes are grouped as:
- **Added** — New files, skills, agents, scenarios, or capabilities
- **Changed** — Updates to existing content that modify behavior or output
- **Fixed** — Corrections to incorrect thresholds, wrong recommendations, or bad prompt behavior
- **Calibrated** — Threshold adjustments based on real-world data (neither a bug fix nor a new feature)
- **Deprecated** — Content that will be removed in a future version
- **Removed** — Content removed from the OS

---

## [Unreleased] — v0.5 Memory

### Added (not previously logged here — see ROADMAP.md staleness note under v0.5)
- **Leadership Memory Module** (`memory/`) — 10-domain relational/organizational pattern capture, superseding the simpler structure originally planned below
  - Master pad: `memory/memory.md` — cross-domain pattern detection, query routing table, monthly review protocol
  - Schema: `memory/schema.md` — universal entry format, domain prefixes, four-category tagging taxonomy, confidence levels (Single instance/Emerging/Established/Refuted)
  - Domains: `executive/`, `stakeholders/`, `career/`, `conflicts/`, `mentoring/`, `promotions/`, `architecture/`, `roadmaps/`, `customer-feedback/`, `decision-history/`
  - Explicitly distinct from and cross-linked with `decision-memory/` (formal decision records), `analytics/`, and `skills/performance/`

### Planned
- `memory/retrospectives/` — Retro output summaries (directory reserved, not yet in schema)
- Memory retrieval protocol enforced at the subagent level (schema defines the protocol; not yet enforced)
- Memory decay and archival rules

### Added
- **Leadership Health Module** (`leadership-health/`) — 13-dimension leadership diagnostics system
  - Dimension skills: `executive_trust_score.md`, `stakeholder_alignment.md`, `organizational_clarity.md`, `communication_effectiveness.md`, `delegation_score.md`, `coaching_score.md`, `decision_quality.md`, `ownership_index.md`, `team_autonomy.md`, `influence_score.md`, `political_awareness.md`, `meeting_quality.md`, `execution_clarity.md`
  - Master synthesis pad: `master-leadership-health.md` — weighted scoring, cross-dimensional pattern recognition, development priority ranking
  - BDD feature suite: 8 scenarios across 4 health tiers + parametrized threshold outline
  - Evaluation artifacts: 2 golden outputs, 7 dataset scenarios, regression results template
  - Updated `CLAUDE.md` and `subagents/engineering-manager.md` to route to leadership-health
- **Executive Confidence Engine** (`confidence-engine/`) — 6-dimension trust assessment answering "Can I trust this team?"
  - Dimension skills: `prediction_confidence.md`, `data_quality.md`, `risk_confidence.md`, `delivery_confidence.md`, `roadmap_confidence.md`, `architecture_confidence.md`
  - Master synthesis pad: `executive_confidence.md` — weighted scoring, cross-dimensional pattern detection, evidence-based recommendations
  - Evidence format: every recommendation includes Recommendation + Confidence % + Supporting Evidence (GitHub, Jira, Incidents, Customer Bugs, Historical Releases)
  - BDD feature suite: 7 scenarios across 4 confidence tiers + parametrized threshold outline
  - Evaluation artifacts: 2 golden outputs, 7 dataset scenarios, regression results template
  - Updated `CLAUDE.md`, `README.md`, and `subagents/engineering-manager.md` to route to confidence-engine
- **Political Signals Module** (`political-signals/`) — 5-dimension organizational risk detection with ethical response framework
  - Dimension skills: `decision_reversals.md`, `meeting_exclusion.md`, `ownership_ambiguity.md`, `escalation_patterns.md`, `incentive_misalignment.md` (in `skills/political-signals/`)
  - Master synthesis pad: `political-signals/political-signals.md` — weighted risk scoring, cross-dimensional pattern detection, ethical response protocol
  - Ethical Response Protocol: every recommendation follows transparency, dialogue, stakeholder alignment, data over narrative — explicitly prohibits manipulation
  - Cross-dimensional patterns: targeted erasure, power vacuum, accountability shield, silence amplification
  - BDD feature suite: 7 scenarios across 4 risk tiers + parametrized threshold outline
  - Evaluation artifacts: 2 golden outputs, 7 dataset scenarios, regression results template
  - Updated `CLAUDE.md`, `README.md`, and `subagents/engineering-manager.md` to route to political-signals
- **Decision Memory Module** (`decision-memory/`) — Institutional learning and decision recall system
  - Decision record schema: `schema.md` — 8 core fields (decision, alternatives, why, who, expected outcome, actual outcome, lessons learned, repeated patterns) + 7 supplementary fields
  - Sub-skills in `skills/decision-memory/`:
    - `record-decision.md` — Captures decisions with full context, assigns IDs, assesses quality via rubric
    - `recall-decisions.md` — Retrieves relevant past decisions by domain, context, and outcome relevance
    - `detect-patterns.md` — Quarterly pattern detection for repeated failures, optimism bias, underestimated complexity
  - Master pad: `decision-memory/decision-memory.md` — Orchestrates record, recall, and pattern detection
  - Pattern types: Similar failure, Optimism bias, Underestimated complexity, Stakeholder neglect, Reversibility trap, Success blindness
  - BDD feature suite: 7 scenarios (record, recall, pattern detection, quality assessment)
  - Evaluation artifacts: 2 golden outputs, 7 dataset scenarios, regression results template
  - Updated `CLAUDE.md`, `README.md`, and `subagents/engineering-manager.md` to route to decision-memory

---

## [0.4.0] — Prediction Engine — 2026-06-30

The OS can now make falsifiable predictions with stated confidence levels. Every leadership scenario has at least one Gherkin regression scenario. The Kaizen loop is fully designed.

### Added
- **Gherkin Feature Suite** — 81 scenarios across 9 feature files
  - `features/sprint.feature` — 9 scenarios + velocity band outline
  - `features/delivery.feature` — 8 scenarios + DORA band outline
  - `features/incidents.feature` — 11 scenarios + MTTR classification outline
  - `features/burnout.feature` — 8 scenarios + signal combination outline
  - `features/hiring.feature` — 8 scenarios + pipeline health outline
  - `features/roadmap.feature` — 8 scenarios + milestone health outline
  - `features/architecture.feature` — 10 scenarios
  - `features/one-on-one.feature` — 10 scenarios + engagement matrix outline
  - `features/release.feature` — 10 scenarios + post-release health outline
- **Kaizen System** — Full weekly improvement loop
  - `kaizen/weekly-review.md` — 10-question Friday review with 5-step update cascade
  - `kaizen/failures.md` — Diagnostic failure log with 6-type taxonomy
  - `kaizen/continuous-improvement.md` — OS changelog with 14 change category tags
  - `kaizen/prompt-review.md` — Prompt calibration log with root cause taxonomy
  - `kaizen/monthly-review.md` — 8-part monthly review including prediction accuracy and OS health score
- **Evaluation System** — Regression and golden output infrastructure
  - `evaluations/golden/sprint-review-healthy.md` — Canonical healthy sprint output with tolerance rules
  - `evaluations/golden/sprint-review-critical.md` — Canonical critical sprint output with hard/soft failure rules
  - `evaluations/datasets/sprint-scenarios.md` — 7 labeled test scenarios for sprint review regression
  - `evaluations/regression/README.md` — Regression runner format and pass/fail rules

### Design Decisions
- Every `Then` block in Gherkin includes a confidence assertion — making the confidence system testable
- `@immediate-action` tag identifies scenarios where latency matters, not just correctness
- `Scenario Outline` + `Examples` tables encode thresholds as data, not code — one row to add a new band
- Golden outputs use Hard Failure / Soft Failure distinction to make pass/fail unambiguous

---

## [0.3.0] — Subagents — 2026-06-30

The OS has a composable AI specialist hierarchy. No single agent does everything. Work routes to the correct specialist automatically.

### Added
- **Agent Hierarchy** — 8 specialized agents with defined output contracts
  - `subagents/engineering-manager.md` — Orchestrator with routing decision tree
  - `subagents/delivery-manager.md` — Delivery specialist (DORA, sprint, velocity)
  - `subagents/incident-manager.md` — Incident lifecycle owner (P1/P2 → post-mortem)
  - `subagents/executive-summary.md` — Output formatter (leaf node, 3 audience templates)
  - `subagents/tech-lead.md` — Technical quality and architecture guidance
  - `subagents/engineering-coach.md` — Individual development and wellbeing signals
  - `subagents/product-partner.md` — Roadmap, prioritization, stakeholder alignment
  - `subagents/architecture-reviewer.md` — ADR review and risk surface analysis

### Design Decisions
- `executive-summary.md` is a leaf node — it calls nothing, formats everything. This prevents analysis hallucination in the communication layer.
- `architecture-reviewer.md` is only reachable through `tech-lead.md` — ensuring architectural review always has technical context first
- Incident priority rule: Engineering Manager invokes `incident-manager` before all other specialists when P1/P2 is active
- Output contracts are field-level (not prose) — enabling programmatic validation in v0.4+

---

## [0.2.0-alpha] — Skills (Partial) — 2026-06-30

The first skill is complete and establishes the template for all 19 remaining skills.

### Added
- `skills/delivery/review-sprint.md` — Reference implementation of the 10-section skill template
  - Sections: Purpose / Inputs / Analysis / Decision Tree / Output / Examples / Confidence Score / Failure Modes / References / Related Skills
  - 6-cause root cause taxonomy
  - Confidence scoring: 70% base + named positive/negative modifiers
  - Two complete examples: healthy sprint (A) and struggling sprint (B)
  - 7 related skills mapped as stubs

### In Progress (v0.2 not yet complete)
- 19 remaining skills across delivery, operations, people, architecture, communication, and product domains

---

## [0.1.0] — Foundation — 2026-06-30

Initial release. The OS has beliefs, structure, and a vocabulary. It cannot yet act autonomously, but it can guide a manager who reads it.

### Added
- **AI Operating Manual** (`CLAUDE.md`) — 15 directives governing mindset, reasoning, risk assessment, and output format. Includes DORA, SPACE, and Accelerate metric integration. Four-tier confidence scale (High / Medium / Low / Speculative).
- **Project Documentation**
  - `README.md` — System overview, architecture map, three use modes
  - `BUILD.md` — 6-step instance configuration guide
- **Core Docs** (`docs/`)
  - `vision.md` — Why the OS exists, mission statement, 3-phase roadmap (Foundation → Intelligence → Institutional Memory), expected outcomes table
  - `principles.md` — 13 principles with tensions named between People First / Business First / Customer First. Each principle has an Implication tied to a concrete artifact.
  - `engineering-playbook.md` — Leadership bible: 18 sections covering every major EM scenario from sprint ceremonies to AI adoption
- **Repository Structure** — Seven-layer architecture established:
  - `subagents/` — Agent definitions (empty)
  - `features/` — Gherkin scenarios (empty)
  - `commands/` — Command procedures (empty)
  - `templates/` — Document templates (empty)
  - `skills/` — Skill library with 9 domain subdirectories
  - `integrations/` — Tool integration guides (empty)
  - `kaizen/` — Improvement processes (empty)
  - `evaluations/` — Test infrastructure (empty)
  - `memory/` — Cross-session learning (empty)

### Design Decisions
- `CLAUDE.md` leads with the AI operating manual before the repo architecture — directives evaluated first, structure second
- Principles are ordered by priority: when two conflict, the earlier one wins. People First (1) > Business First (2) > Customer First (3)
- Playbook is called a "leadership bible" because each section is opinionated enough to be useful in a hard moment — generic advice was explicitly excluded

---

## Version Numbering

`MAJOR.MINOR.PATCH`

- **MAJOR** (0 → 1): Trust milestone. The OS has been validated in production and is self-sustaining.
- **MINOR** (0.1 → 0.2 etc.): New capability tier as defined in `ROADMAP.md`. Each minor version adds a distinct capability class.
- **PATCH** (0.1.0 → 0.1.1): Bug fixes, threshold calibrations, prompt corrections, and golden output updates within an existing capability tier.

Patch releases are generated by the kaizen system automatically — every `Fixed` or `Calibrated` entry in this changelog from a weekly review is a patch release candidate.
