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

### H. Remove empty/vestigial directories

Delete:
- `evaluations/benchmarks/`
- `skills/architecture/`
- `skills/communication/`
- `skills/confidence-engine/` (empty today — note this is a *different* empty dir than the one Sub-project B creates and populates; B creates it fresh with 6 files, so no conflict, just sequencing: H's deletion (if it still applies) must happen before or independently of B's creation)
- `skills/operations/`
- `skills/quality/`

**Sequencing note:** verify `skills/confidence-engine/` is still empty at execution time (Sub-project B populates it) — if B has already run, this item no longer applies to that specific path.

## Execution order

A → B → C → D → E → F → G → H, with a git commit after each sub-project so any single step can be reverted independently. A comes first because it's pure deletion with no downstream dependents. B comes early because C/D/E/F touch files that may end up at new paths after B moves them (dimension files aren't directly involved in C–F, but keeping B early avoids path-reference churn happening twice).

## Verification

After each sub-project, grep the full repo for the old path/filename being removed or moved, to catch any cross-reference the audits missed. After all sub-projects, re-run a lightweight version of the original audit (Glob comparison of before/after directory listings) to confirm no unintended file loss.

## Risks

- **No automated tests exist for this repo** (it's a prompt/skill library, not executable code) — verification is manual grep + read, not a test suite. Confidence in "nothing broke" will be based on reference-check completeness, not automated proof.
- **Merges (C1, C2) require judgment calls** about which content from the deleted file is worth folding in — there's a small risk of losing a nuance the audit agents didn't flag. Mitigated by the git checkpoint after each sub-project.
