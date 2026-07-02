# Continuous Improvement Log

The OS changelog. Every meaningful change to any file in this system is recorded here with the reason it was made. This is the institutional memory of how the OS evolved and why.

A change without a reason is noise. A reason without a change is intent. Both together is how a system learns.

---

## How to Read This Log

- Each row is one week's worth of changes
- The `Driver` column references the Q number from `kaizen/weekly-review.md` that triggered the change
- The `Evidence` column names the specific failure, observation, or data that justified the change
- `Eval Result` shows whether the regression suite passed after the change

---

## Changelog

| Week | File Changed | Section | What Changed | Driver | Evidence | Eval Result |
|---|---|---|---|---|---|---|
| 2026-07-01 | `loops/` (new), `memory/` (new) | New layer | Added 11 reusable orchestration loops and (initially, incorrectly) a competing memory/ stub structure | Manual architecture request, not weekly review | Request Lifecycle mapping had 2 unresolved gaps (Loop Engineering, Memory Update) | Not run — no regression suite covers this layer yet |
| 2026-07-01 | `contracts/` (new) | New layer | Added 2 universal + 5 filled specification contracts (Inputs/Required Outputs/Failure Conditions/Quality Checks/Version) | Manual architecture request | Request Lifecycle's Specification Contract stage had no repo counterpart | Not run |
| 2026-07-01 | `kaizen/` | Extraction | Split `prediction-review.md`, `playbook-review.md`, `skill-review.md`, `failure-analysis.md`, `quarterly-review.md`, `root-cause.md` out of `weekly-review.md`/`monthly-review.md`; reordered Update Cascade to Playbook→Prompt→Skill→Memory | Manual architecture request | These reviews were buried inline and not independently invokable | Not run |
| 2026-07-01 | `memory/` | Bug fix | Retired the incorrectly-invented `lessons/incidents/coaching/decisions/` stub structure; redirected all references to the real, pre-existing 10-domain module | Self-caught mistake — see `kaizen/failures.md`-style root cause below | `memory/` already existed with real content the initial change never checked for | Manually verified — zero remaining references to invented paths |
| 2026-07-01 | `leadership-health/`, `confidence-engine/`, `skills/leadership-health/` (new), `skills/confidence-engine/` (new) | Sub-project B | Moved 19 dimension files to `skills/<module>/`, standardizing on the convention `political-signals/`/`decision-memory/` already used | Full-project audit | Structural layout inconsistency across 4 diagnostic modules | Cross-references verified with repo-wide grep |
| 2026-07-01 | `skills/organizational/stakeholder-analysis.md`, `skills/executive/board-level-summary.md` | Sub-project C | Merged `skills/executive/stakeholder-map.md` and `skills/presentation/board-deck.md` into their canonical counterparts | Full-project audit | Confirmed near-identical duplicate content | Manually verified |
| 2026-07-01 | `skills/performance/`, `skills/strategy/`, `skills/executive/` | Sub-project D | Renamed `promotion-readiness.md` to disambiguate from its `skills/career/promotion/` namesake; cross-referenced the two `annual-planning.md` files | Full-project audit | Identical filenames in different directories risked mis-invocation | Manually verified |
| 2026-07-01 | `political-signals/political-signals.md`, `skills/organizational/*.md`, `skills/product/product-risk.md`, `skills/strategy/risk-planning.md` | Sub-projects Q+E | Extracted the restated five-signal taxonomy and probability×impact rubric to single canonical sources | Full-project audit | Same content restated near-verbatim across 4+ files | Manually verified |
| 2026-07-01 | `skills/decision-memory/record-decision.md`, `skills/meetings/decision-log.md` | Sub-project F | Added explicit ownership-boundary notes | Full-project audit | Unclear which skill owns live vs. promoted decision capture | Manually verified |
| 2026-07-01 | `skills/cross-functional/support-escalation.md`, `customer-success.md` | Sub-project R | Added explicit boundary statements | Full-project audit | Both independently derived similar SLA/severity tables | Manually verified |
| 2026-07-01 | `evaluations/regression/*-results.md` | Sub-project G | Trimmed restated boilerplate from `political-signals-results.md` and `decision-memory-results.md` | Full-project audit | Inconsistent format vs. `leadership-health`/`confidence-engine` result logs | Manually verified |
| 2026-07-01 | `evaluations/golden/`, `evaluations/datasets/` | Sub-project A | Deleted 3 legacy flat leadership-health eval files superseded by the subfolder convention | Full-project audit | Divergent (not duplicate) legacy fixtures from before the per-module convention | Manually verified |
| 2026-07-01 | `decision-memory/features/`, `political-signals/features/` | Sub-project S | Fixed `# Feature:` leading-hash Gherkin syntax bug | Gherkin/features review | Made the Feature declaration a comment instead of valid Gherkin | Manually verified |
| 2026-07-01 | 9 `features/*.feature`, `leadership-health/master-leadership-health.md`, `skills/confidence-engine/prediction_confidence.md`, `decision-memory/schema.md`, `decision-memory.md`, 5 `skills/political-signals/*.md` | Sub-projects T+I | Reconciled ~60 dangling `# Skill:` and cross-reference paths — some repointed to real content under a different name, others annotated "(planned — not yet built)"; fixed a missing `skills/` prefix bug found along the way | Gherkin/features review + full-project audit | Feature files authored against an abandoned verb-first skill-naming convention | Manually verified — zero remaining unannotated dangling refs in scope |
| 2026-07-01 | `features/burnout.feature`, `political-signals/features/political-signals.feature` | Sub-project U | Standardized status vocabulary on Healthy/Warning/At Risk/Critical | Gherkin/features review | `burnout.feature` used Green/Yellow/Red; `political-signals.feature` mixed both | Manually verified |
| 2026-07-01 | `loops/features/loops.feature` (new), `contracts/features/contracts.feature` (new) | Sub-project J | Added Gherkin coverage for routing/disambiguation and Failure-Condition/Quality-Check enforcement | Full-project audit | Zero Gherkin coverage for 2 of 3 new architectural layers | Not run — new coverage, no regression baseline yet |
| 2026-07-01 | `README.md`, `BUILD.md`, `CLAUDE.md` | Sub-project K | Added Loops/Contracts/Memory/Analytics rows to README's layer table; fixed a pre-existing off-by-one in CLAUDE.md's layer count | Full-project audit | Neither file mentioned 3 of this session's new top-level directories | Manually verified |
| 2026-07-01 | `ROADMAP.md` | Sub-project L | Corrected v0.2's stale "1 of 20 skills" metric against the real 100+ file library; added a staleness note matching v0.5's self-disclosed pattern | Full-project audit | Metric never updated as the skills library grew under a different naming convention | Manually verified |
| 2026-07-01 | `kaizen/continuous-improvement.md`, `kaizen/failures.md` | Sub-project M | Backfilled 18 changelog rows and the first real failures.md entry (FAIL-001, the memory/ mistake) | Full-project audit | 7 structural commits had landed with zero changelog rows, violating this repo's own Content Conventions | Manually verified |
| 2026-07-01 | All 8 `subagents/*.md` | Sub-project N | Added a Loops field naming each subagent's primary/participant loop(s) | Full-project audit | 7 of 8 subagents never referenced loops/ at all; even engineering-manager.md didn't | Manually verified |
| 2026-07-01 | `analytics/README.md` (new), `CLAUDE.md` | Sub-project O | Documented the 6 analytics dashboards' relationships and added analytics/ as the 15th architecture layer | Full-project audit | Only module with real content and no README | Manually verified |
| 2026-07-01 | `skills/delivery/review-sprint.md` | First regression run | Added missing "Planning Failure" root cause (Step 5 + Decision Tree) | Manual regression run (first ever, 7/7 scenarios) | S-07 required a root cause absent from the documented taxonomy | Regression: 7/7 pass |
| 2026-07-01 | `leadership-health/master-leadership-health.md` | First regression run | Fixed weight table (summed to 157%, not 100%) and added missing "At Risk" Decision Tree band | Manual regression run (first ever, 7/7 scenarios) | LH-01 golden score unreproducible under the documented formula; LH-05/06 misclassified as Red | Regression: 7/7 pass |
| 2026-07-01 | `confidence-engine/executive_confidence.md` | First regression run | Removed a `Min(score,30)` cap that made 97% of the score range unreachable; added missing "At Risk" band | Manual regression run (first ever, 5/7 clean + 2 soft-fail) | CE-01/CE-07 golden scores unreproducible under the documented formula | Regression: 5/7 pass, 2 flagged for follow-up |
| 2026-07-01 | `political-signals/political-signals.md` | First regression run | Added missing "At Risk" Decision Tree band (3rd module with this exact bug) | Manual regression run (first ever, 7/7 scenarios) | PS-05/06 misclassified as Yellow | Regression: 7/7 pass |
| 2026-07-01 | `decision-memory/decision-memory.md` | First regression run | Added explicit Status Mapping (severity + frequency -> Green/Yellow/At Risk/Red), previously undocumented | Manual regression run (first ever, 7/7 scenarios) | DM-06 unreachable as "At Risk" without an explicit frequency-based rule | Regression: 7/7 pass |

*Rows above are a same-day backfill, not real-time weekly-review entries — no weekly review has been run in production yet (see `ROADMAP.md` v0.4 Entry Criteria). Future entries should follow the normal cadence.*

---

## Change Categories

Tag each change with one of these to enable pattern analysis:

| Tag | Meaning |
|---|---|
| `threshold-tightened` | A trigger threshold was made more sensitive (lower number / earlier trigger) |
| `threshold-relaxed` | A threshold was made less sensitive (higher number / later trigger) |
| `skill-corrected` | A skill's Analysis or Decision Tree was wrong and fixed |
| `skill-extended` | A skill gained a new scenario or failure mode it didn't cover |
| `prompt-clarified` | A subagent instruction was ambiguous and was made more precise |
| `prompt-constrained` | A new Never/Always rule was added to a subagent |
| `playbook-updated` | docs/engineering-playbook.md was changed based on real outcomes |
| `principle-reaffirmed` | A principle was tested in practice and held — no change, but confidence increased |
| `principle-revised` | A principle was wrong or incomplete and was updated |
| `memory-added` | A new lesson, pattern, or coaching insight was added to memory/ |
| `scenario-added` | A new Gherkin scenario was added to a .feature file |
| `golden-updated` | An evaluation golden output was revised to reflect new expected behavior |
| `failure-closed` | A failure from kaizen/failures.md was fixed and verified |

---

## Quarterly Rollup

At the end of each quarter, run `kaizen/quarterly-review.md` — it holds the full process (monthly-review audit, pattern rollup, principle revision decision, OS health trend) and produces the archive entry format that gets appended here.

---

## The Log Is the Proof

When someone asks "has this OS actually improved over time?" — point them here. If this log is empty or has only a few entries, the kaizen process is not being run. The improvement is not in the vision document or the principles file. It is in this changelog.
