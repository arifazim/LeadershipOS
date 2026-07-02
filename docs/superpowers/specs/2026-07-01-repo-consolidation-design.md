# Repository Consolidation — Design Spec

**Date**: 2026-07-01
**Status**: Approved by user, pending implementation plan
**Baseline**: git commit `85f0a4b` ("Checkpoint before file consolidation pass")

## Problem

A four-agent audit of the repo (240 files across `subagents/`, `features/`, `commands/`, `templates/`, `integrations/`, `leadership-health/`, `confidence-engine/`, `political-signals/`, `decision-memory/`, `docs/`, `kaizen/`, `evaluations/`, and `skills/`) found:

1. Divergent legacy duplicate files in `evaluations/` for the leadership-health module only.
2. A structural split between two competing module-layout conventions (dimension files at module top level vs. under `skills/<module>/`).
3. Two genuine near-identical file pairs in `skills/` that should be merged.
4. Two filename collisions between distinct-purpose files that invite mis-invocation.
5. A taxonomy (five organizational risk signals) and a scoring formula (probability × impact) each restated near-verbatim across multiple files instead of defined once and referenced.
6. An unclear ownership boundary between two decision-capture skills.
7. Inconsistent format between regression result-log files.
8. Vestigial empty directories.
9. (Out of scope for this pass, tracked separately) 16 completely empty files in `commands/`, `integrations/`, `templates/`, `docs/` — completion debt, not duplication, per user decision.

## Addendum (same day) — Full-Project Audit Findings

A second, broader audit ("review the full project, check all missing, duplicates, messy, inorganized patterns") was run after items A-H above were designed but before execution, triggered by a real mistake: a `memory/` directory was built assuming no prior implementation existed, when a richer 10-domain module already did (fixed in commit `d54304d`). The follow-up audit confirmed that mistake was isolated — `loops/`, `contracts/`, and the `kaizen/` extraction were all verified as genuinely novel, correctly extracted from real prior locations — but surfaced a different, related problem: **documentation drift**. Seven structural commits landed without the kaizen changelog, root README/BUILD, or most subagent files ever being updated to reflect them.

New findings (I–S), to be executed alongside A–H:

10. **Dead scaffolding**: `prompts/{daily,monthly,quarterly,retrospectives,weekly}/` and `tests/{gherkins,prompts,scenarios}/` are empty, referenced nowhere in the repo, and duplicate namespaces already covered by `commands/`, `kaizen/`, and `features/`. Delete alongside item 8's empty-dir cleanup.
11. **Dangling references**: `decision-memory/schema.md` references `decision-memory/records/`, `decision-memory/examples/`, and an example path under `records/` — none exist. `confidence-engine/prediction_confidence.md` references `skills/delivery/track-sprint.md` (doesn't exist). `leadership-health/master-leadership-health.md` references `skills/communication/write-executive-update.md` (the entire `skills/communication/` directory doesn't exist).
12. **Zero Gherkin coverage** for `loops/`, `contracts/`, and the `kaizen/` extraction — breaks this repo's own convention that every module gets a `.feature` file.
13. **`README.md`/`BUILD.md` staleness**: neither mentions `loops/`, `contracts/`, `memory/`, or `analytics/`. `README.md` has its own separate "eleven layers" table (distinct from `CLAUDE.md`'s Repository Architecture) that risks drifting out of sync with it going forward.
14. **`ROADMAP.md` v0.2 metrics are wrong**: claims "1 of 20 skills complete"; reality is 100+ skill files across 13+ subdirectories. Unlike v0.5's Memory section (which self-flagged its own staleness), this was never disclosed.
15. **`kaizen/continuous-improvement.md` changelog never updated**: 7 structural commits this session (loops/memory/contracts/kaizen-extraction/the memory-fix) with zero changelog rows, violating this repo's own Content Conventions ("After significant changes, update kaizen/continuous-improvement.md").
16. **Subagent routing gap**: 7 of 8 `subagents/*.md` files never reference `commands/`, `loops/`, `contracts/`, or `memory/` at all — even `engineering-manager.md` never cites `loops/` despite loops being the actual orchestration mechanism now.
17. **`analytics/` is undocumented**: 6 real, non-duplicative dashboard files with no README/master-pad and no entry in `CLAUDE.md`'s Repository Architecture.
18. **Restated scoring rubric**: `skills/product/product-risk.md` and `skills/strategy/risk-planning.md` restate an identical probability×impact rubric verbatim. Extract to a shared reference; do not merge (the risk taxonomies above the rubric are genuinely distinct).
19. **Missing cross-references**: `skills/mentoring/growth-tracking.md` and `skills/people/growth-plans.md` are complementary but never reference each other; `skills/mentoring/mentor-plan.md` independently restates growth-tracking's effectiveness-rate formula (optional light trim). Two additional files (`mentor-plan.md`, `growth-tracking.md`) reference the not-yet-renamed `skills/performance/promotion-readiness.md` path — added to item 4's blast radius.
20. **Boundary clarification**: `skills/cross-functional/support-escalation.md` and `customer-success.md` independently derive similar SLA/severity tables for the same escalation-lifecycle problem entering via different channels. Add explicit boundary statements to both; do not merge.

## Addendum 2 (same day) — Gherkin/features review, before task breakdown

A targeted review of all 12 `.feature` files (never read in full before this pass) found the single biggest issue of the entire consolidation effort:

21. **7 of 12 feature files have broken `# Skill:` references.** The features were authored against an older verb-first skill-naming convention (`assess-X.md`, `prepare-X.md`, `build-X.md`) that was abandoned when `skills/` was actually built with topic-based names — and the feature file comments were never updated. Three are simple wrong-path fixes (real content exists under a different name); the rest point at skills that were never built at all.
22. **This directly contradicts Sub-project H**: `skills/architecture/` and `skills/operations/` are each the expected home of a referenced-but-missing skill (`assess-decision.md`, `postmortem.md`) — not vestigial. **Revise H**: remove these two from the deletion list; keep them as reserved placeholders (same treatment as `memory/retrospectives/`). `skills/communication/` (from Sub-project I's dangling-reference list) has a viable existing substitute (`skills/executive/executive-communication.md`) — redirect rather than treat as a gap.
23. **Gherkin syntax bug**: `decision-memory.feature` and `political-signals.feature` both open with `# Feature: ...` (leading `#`), which makes the declaration a comment rather than valid Gherkin. `sprint.feature`, `delivery.feature`, `confidence-engine.feature` are correctly formatted as `Feature: ...`.
24. **Status vocabulary split repo-wide**: `sprint.feature`, `delivery.feature`, `hiring.feature`, `release.feature`, `one-on-one.feature` use Healthy/Warning/At Risk/Critical; `burnout.feature` uses Green/Yellow/At Risk/Red throughout; `political-signals.feature` mixes both (Healthy/Warning/At Risk labels, then "Red" instead of "Critical" for its own critical scenario). **Decision**: standardize on Healthy/Warning/At Risk/Critical (majority convention).

### S. Fix Gherkin syntax bug

Remove the leading `#` from `Feature:` in `decision-memory/features/decision-memory.feature` and `political-signals/features/political-signals.feature`.

### T. Reconcile feature-to-skill references

Comment-path fixes (real content exists, just pointed at the wrong name):
- `one-on-one.feature`: `skills/people/prepare-one-on-one.md` → `skills/people/one-on-one.md`
- `burnout.feature`: `skills/people/assess-burnout.md` → `skills/people/burnout.md`
- `leadership-health.feature`: `skills/leadership/master-leadership-health.md` → `leadership-health/master-leadership-health.md`
- `leadership-health/master-leadership-health.md`'s own reference to `skills/communication/write-executive-update.md` → `skills/executive/executive-communication.md`

Document-as-gap (no real content exists — change the comment to state the skill is planned, not built, rather than pointing at a nonexistent path):
- `delivery.feature` → `skills/delivery/review-quarter.md`
- `incidents.feature` → `skills/operations/postmortem.md`
- `architecture.feature` → `skills/architecture/assess-decision.md`
- `hiring.feature` → `skills/people/assess-hiring-pipeline.md`
- `release.feature` → `skills/delivery/assess-release.md`
- `one-on-one.feature`'s second reference → `skills/people/build-promotion-case.md`
- Also fix `confidence-engine/prediction_confidence.md`'s reference to `skills/delivery/track-sprint.md` (from Addendum 1, item 11) the same way — real content doesn't exist; document as gap or repoint to `review-sprint.md` if close enough on inspection.

### U. Standardize status vocabulary

Migrate `burnout.feature`'s Green/Yellow/At Risk/Red scenarios to Healthy/Warning/At Risk/Critical (5 scenarios + the Scenario Outline's Examples table). Fix `political-signals.feature`'s single stray "Red" → "Critical". Leave `evaluations/`'s existing Green/Yellow/Red vocabulary in the leadership-health subfolder golden files alone for now unless Sub-project A's execution reveals it should migrate too — flag for a decision at that point rather than pre-deciding here.

This spec covers items 1–8. Item 9 is explicitly deferred to a future project.

## Out of scope

- Populating empty files in `commands/`, `integrations/`, `templates/`, `docs/` (16 files) — separate future project.
- Any change to `subagents/`, `features/`, `kaizen/` — audited, no issues found.
- Any change to file *content quality* beyond what's needed to execute the merges/moves below.

## Sub-projects

### A. Retire leadership-health legacy eval files

**Delete:**
- `evaluations/golden/leadership-health-healthy.md`
- `evaluations/golden/leadership-health-critical.md`
- `evaluations/datasets/leadership-health-scenarios.md`

**Rationale:** These are not byte-duplicates of their subfolder counterparts (`evaluations/golden/leadership-health/*.md`, `evaluations/datasets/leadership-health/leadership-health-scenarios.md`) — they're an older, divergent generation of the same eval suite (different status vocabulary, no weighted-pillar breakdown, no Trend column, different scenario numbering). The subfolder versions match the convention already used by confidence-engine, political-signals, and decision-memory, and have a richer scoring model. Keep subfolder versions as canonical.

**Update:** `evaluations/regression/leadership-health-results.md` currently references the legacy flat dataset path (`evaluations/datasets/leadership-health-scenarios.md`) — repoint it to `evaluations/datasets/leadership-health/leadership-health-scenarios.md`.

**Verify before deleting:** grep the repo for any other reference to the three flat file paths (e.g. from `leadership-health/master-leadership-health.md` or `skills/leadership-health/generate-dashboard.md`) and update or confirm none exist.

### B. Standardize module layout on `skills/<module>/`

**Move:**
- `leadership-health/{executive_trust_score,stakeholder_alignment,organizational_clarity,communication_effectiveness,delegation_score,coaching_score,decision_quality,ownership_index,team_autonomy,influence_score,political_awareness,meeting_quality,execution_clarity}.md` → `skills/leadership-health/` (13 files)
- `confidence-engine/{prediction_confidence,data_quality,risk_confidence,delivery_confidence,roadmap_confidence,architecture_confidence}.md` → `skills/confidence-engine/` (6 files)

**Leave in place:** each module's `README.md`, master synthesis pad (`master-leadership-health.md` / `executive_confidence.md`), and `features/` — these stay at the module's top level, matching political-signals/decision-memory's existing pattern.

**Update:**
- `leadership-health/README.md` and `confidence-engine/README.md` — File Index tables to reflect new paths.
- Any cross-references to the old paths inside `master-leadership-health.md`, `executive_confidence.md`, and the dimension files themselves (they may reference sibling dimension files by relative path).
- `CLAUDE.md` — Repository Architecture section, to describe the now-uniform `skills/<module>/` convention for all four diagnostic modules instead of narrating four modules with silently differing layouts.

**Rationale:** Fixes leadership-health already being split across two locations (it has `skills/leadership-health/generate-dashboard.md` today), and matches the repo-wide pattern where `skills/` houses all invocable skill files.

### C. Merge two real duplicate pairs

**C1. Stakeholder mapping**
- Canonical: `skills/organizational/stakeholder-analysis.md`
- Fold in from `skills/executive/stakeholder-map.md`: the relationship-health axis and any pre-announcement decision-tree content not already present.
- Delete `skills/executive/stakeholder-map.md`.
- Update cross-references in `influence-map.md`, `decision-network.md`, `political-risk.md`, `executive-decision-framework.md`, `executive-priorities.md` (all currently point at one or both files).

**C2. Board communication**
- Canonical: `skills/executive/board-level-summary.md`
- Add the deck-formatting guidance from `skills/presentation/board-deck.md` as an output-variant section ("memo" vs. "deck") in the canonical file.
- Delete `skills/presentation/board-deck.md`.
- Update any cross-references.

### D. Disambiguate naming collisions

- Rename `skills/performance/promotion-readiness.md` → `skills/performance/promotion-readiness-tracking.md`. Update its own "Related Skills" cross-reference and any file that links to it by the old name.
- Add a one-line disambiguation note at the top of `skills/strategy/annual-planning.md` and `skills/executive/annual-planning.md`, each pointing to the other ("this is the capacity/sequencing model; see executive/annual-planning.md for the board-facing ask" and vice versa). No rename — both names are contextually fine once cross-referenced.

### E. Extract repeated taxonomies

**E1. Five-signal taxonomy** (decision reversals, meeting exclusion, ownership ambiguity, escalation patterns, incentive misalignment): canonical definition lives in `political-signals/political-signals.md`. Replace the restated blocks in `skills/organizational/{stakeholder-analysis,influence-map,decision-network,political-risk}.md` with a short summary + link to the canonical definition.

**E2. Risk-scoring formula** (probability × impact): lower priority. Replace restated formula blocks in `skills/product/product-risk.md` and `skills/strategy/risk-planning.md` with a reference to `skills/organizational/political-risk.md`, which already positions itself as the integration layer.

### F. Clarify decision-capture ownership

Add a short disambiguation note to `skills/decision-memory/record-decision.md` and `skills/meetings/decision-log.md`: decision-log.md is the front-door capture that fires live in a meeting; record-decision.md is invoked to promote an already-logged decision into long-term institutional pattern memory. No merge, no rename — just make the trigger boundary explicit in both files.

### G. Fix regression-file inconsistency

Trim `evaluations/regression/political-signals-results.md` and `evaluations/regression/decision-memory-results.md` so they stop restating the pass/fail rules and file-naming convention boilerplate already in `evaluations/regression/README.md`. Keep only what's genuinely module-specific (decision-memory's "Pattern Detection Check" table, political-signals' "Ethical Response Protocol Check" table), matching the leaner format used by `leadership-health-results.md` and `confidence-engine-results.md`.

### H. Remove empty/vestigial directories (revised per Addendum 2)

Delete:
- `evaluations/benchmarks/`
- `skills/confidence-engine/` (empty today — note this is a *different* empty dir than the one Sub-project B creates and populates; B creates it fresh with 6 files, so no conflict, just sequencing: H's deletion (if it still applies) must happen before or independently of B's creation)
- `skills/quality/` (no reference found anywhere in the repo — genuinely vestigial)

**Do NOT delete** (revised after the Gherkin review found these are referenced, not vestigial):
- `skills/architecture/` — expected home of `assess-decision.md`, referenced by `features/architecture.feature`. Keep as a reserved placeholder.
- `skills/operations/` — expected home of `postmortem.md`, referenced by `features/incidents.feature`, `decision-memory/decision-memory.md`, and `loops/incident-loop.md`. Keep as a reserved placeholder.
- `skills/communication/` — has a viable redirect instead (see Sub-project T), so nothing is lost by not deleting it either way, but leave it out of this deletion pass since Sub-project T handles the actual reference fix.

**Sequencing note:** verify `skills/confidence-engine/` is still empty at execution time (Sub-project B populates it) — if B has already run, this item no longer applies to that specific path. Also delete `prompts/{daily,monthly,quarterly,retrospectives,weekly}/` and `tests/{gherkins,prompts,scenarios}/` in this same step (confirmed dead scaffolding, referenced nowhere).

### I. Fix dangling references

- `decision-memory/schema.md`: either create `decision-memory/records/` and `decision-memory/examples/` with real content, or rewrite the Storage Conventions section to describe how decisions are actually stored today (as `.md` files directly under a to-be-decided location) — decide which based on whether `decision-memory/` records are expected to exist as individual files soon or not.
- `confidence-engine/prediction_confidence.md`: fix or remove the reference to `skills/delivery/track-sprint.md` (doesn't exist) — either point to `skills/delivery/review-sprint.md` instead, or note the file is a planned-but-undelivered skill.
- `leadership-health/master-leadership-health.md`: fix or remove the reference to `skills/communication/write-executive-update.md` — likely should point to `skills/executive/executive-status-report.md` or `skills/executive/executive-communication.md` instead.

### J. Add Gherkin coverage for loops/contracts

Add `loops/features/loops.feature` and `contracts/features/contracts.feature` covering, at minimum: a loop correctly routing to its primary subagent, a loop's Related Loops disambiguation holding (e.g. sprint-loop vs. delivery-loop don't both fire for the same request), and a contract's Failure Conditions correctly blocking invalid input. `kaizen/` stays the one exception (meta-process-improvement, not user-facing behavior) unless a future review decides otherwise.

### K. Fix README.md/BUILD.md staleness

Add `loops/`, `contracts/`, `memory/`, and `analytics/` to `README.md`'s layer table and to `BUILD.md`'s relevant setup steps. Cross-check `README.md`'s table against `CLAUDE.md`'s Repository Architecture section for consistency — consider whether one should simply reference the other instead of maintaining two independent architecture descriptions long-term (flag as a question, don't resolve unilaterally).

### L. Fix ROADMAP.md v0.2 metrics

Update the v0.2 "Skills" section's metrics table to reflect the real skill count (100+ files across 13+ subdirectories, not "1 of 20"), following the same disclosure pattern already used in v0.5's staleness note.

### M. Backfill kaizen changelog

Add changelog rows to `kaizen/continuous-improvement.md` for this session's structural commits (loop engineering + memory/, specification contracts, kaizen extraction, the memory/ mistake fix), tagged appropriately per the existing Change Categories table (`skill-extended`, `memory-added`, `prompt-clarified`, `failure-closed` as applicable). This is retroactive backfill, not a substitute for updating it going forward.

### N. Close the subagent routing gap

Add a reference to the matching `loops/*.md` file in each specialist subagent's Scope or Trigger Conditions section: `delivery-manager.md` → `sprint-loop.md`/`delivery-loop.md`; `incident-manager.md` → `incident-loop.md`; `engineering-coach.md` → `career-loop.md`/`promotion-loop.md`; `product-partner.md` → `stakeholder-loop.md`; `tech-lead.md`/`architecture-reviewer.md` → `architecture-loop.md`; `executive-summary.md` → `executive-loop.md`/`prediction-loop.md`. Add `loops/` and `commands/` mentions to `engineering-manager.md`'s routing table too.

### O. Document analytics/

Add `analytics/README.md` (or `analytics/analytics.md` master pad, matching the `memory.md`/`political-signals.md` naming convention) documenting the six dashboards' relationships and shared metrics (Cross-Functional Alignment Score, Delivery Confidence, Customer Impact Score). Add an `### analytics/` entry to `CLAUDE.md`'s Repository Architecture section.

### P. Extract restated risk-scoring rubric (expands E2)

`skills/product/product-risk.md` and `skills/strategy/risk-planning.md` restate an identical probability×impact rubric verbatim (same 5 probability labels, same severity bands). Extract to one shared reference (`docs/glossary.md` or a small shared file); both skills point to it instead of restating.

### Q. Add missing cross-references in the growth cluster

`skills/mentoring/growth-tracking.md` and `skills/people/growth-plans.md`: add each to the other's Related Skills table. `skills/mentoring/mentor-plan.md`: optionally trim its independently-restated effectiveness-rate formula to a pointer at `growth-tracking.md` (low priority). Update the 2 additional promotion-readiness path references found in `mentor-plan.md`/`growth-tracking.md` at the same time Sub-project D executes its rename.

### R. Clarify support-escalation/customer-success boundary

Add an explicit boundary statement to both files' Purpose sections (support-escalation covers support-originated tickets; customer-success covers account-level churn-risk escalations) and have `support-escalation.md`'s triage table reference `customer-success.md` as the downstream path once severity exceeds support's resolution authority. No merge.

## Execution order

A → S → T → U → B → I → H → C → D → Q → E → P → F → R → G → J → K → L → M → N → O, with a git commit after each sub-project so any single step can be reverted independently.

Rationale: A is pure deletion with no dependents, goes first. S/T/U (Gherkin syntax, reference reconciliation, vocabulary standardization) come early and before H specifically because T's decisions (which directories are genuine gaps vs. vestigial) determine what H is allowed to delete — running H before T would have deleted `skills/architecture/` and `skills/operations/` incorrectly, which is exactly the mistake this review caught. B comes after because C/D/E/F/P/Q touch files that may end up at new paths once B moves them. J (new Gherkin coverage for loops/contracts) comes after the structural sub-projects it would otherwise need to immediately re-validate. K/L/M/N/O (documentation fixes) come last since they describe the *result* of everything above.

## Verification

After each sub-project, grep the full repo for the old path/filename being removed or moved, to catch any cross-reference the audits missed. After all sub-projects, re-run a lightweight version of the original audit (Glob comparison of before/after directory listings) to confirm no unintended file loss. Specifically re-run the exact grep used to catch the `memory/` mistake (`grep -rn "path-being-removed"`) after every deletion/rename sub-project, not just at the end.

## Risks

- **No automated tests exist for this repo** (it's a prompt/skill library, not executable code) — verification is manual grep + read, not a test suite. Confidence in "nothing broke" will be based on reference-check completeness, not automated proof.
- **Merges (C1, C2) require judgment calls** about which content from the deleted file is worth folding in — there's a small risk of losing a nuance the audit agents didn't flag. Mitigated by the git checkpoint after each sub-project.
- **Documentation sub-projects (K, L, M, N, O) risk becoming stale again** the moment the next structural change lands, exactly as happened this session. No process fix in this plan actually prevents recurrence — that would require a hook or habit change outside the scope of a one-time consolidation pass. Flagging this explicitly rather than implying the plan "solves" documentation drift permanently.
