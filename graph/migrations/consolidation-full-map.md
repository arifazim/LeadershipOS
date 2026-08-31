# Consolidation Migration Map

**Domain**: Graph Engineering
**Source**: [`docs/superpowers/specs/2026-07-01-repo-consolidation-design.md`](../../docs/superpowers/specs/2026-07-01-repo-consolidation-design.md)
**Graph baseline**: [`graph/migrations/2026-08-consolidation.json`](2026-08-consolidation.json)
**Status**: Phase 0 complete (2026-08-20)

---

## Purpose

Translates the 21 approved consolidation sub-projects (A–U) into explicit graph operations. Each row is a **declarative instruction** — what edges to write, what files to touch, what must complete first. The migration JSON is updated after each batch completes.

---

## Legend

| Operation | Meaning |
|---|---|
| `supersedes(new, old)` | New file replaces old. Old gets redirect stub. Edge written to migration JSON. |
| `delete_node(path)` | File/directory removed from repo. No redirect (nothing to redirect to). |
| `derived_from(ref, canonical)` | Referencing file now points to canonical instead of restating content. |
| `invokes(subagent, loop)` | Subagent now references the loop in its scope/routing. |
| `create_node(path)` | New file created. |
| `fix_ref(file, old_ref, new_ref)` | Cross-reference updated in-place. No graph edge (metadata fix). |

---

## Batch 1: Cleanup & Gherkin Fixes

### A — Retire legacy LH eval files

| Field | Value |
|---|---|
| **Files deleted** | `evaluations/golden/leadership-health-healthy.md`, `evaluations/golden/leadership-health-critical.md`, `evaluations/datasets/leadership-health-scenarios.md` |
| **Files modified** | `evaluations/regression/leadership-health-results.md` |
| **Graph ops** | `supersedes(evaluations/golden/leadership-health/leadership-health-healthy.md, evaluations/golden/leadership-health-healthy.md)`, `supersedes(evaluations/golden/leadership-health/leadership-health-critical.md, evaluations/golden/leadership-health-critical.md)`, `supersedes(evaluations/datasets/leadership-health/leadership-health-scenarios.md, evaluations/datasets/leadership-health-scenarios.md)` |
| **Pre-check** | `grep -rn "evaluations/golden/leadership-health-healthy\|evaluations/golden/leadership-health-critical\|evaluations/datasets/leadership-health-scenarios" .` — update all hits |
| **Depends on** | None |
| **Batch** | 1 |

---

### S — Fix Gherkin syntax bug

| Field | Value |
|---|---|
| **Files modified** | `decision-memory/features/decision-memory.feature`, `political-signals/features/political-signals.feature` |
| **Change** | Remove leading `#` from `Feature:` declarations |
| **Graph ops** | None (syntax fix) |
| **Depends on** | None |
| **Batch** | 1 |

---

### T — Reconcile feature-to-skill references

| Field | Value |
|---|---|
| **Comment-path fixes (real content exists)** | |
| `one-on-one.feature` | `skills/people/prepare-one-on-one.md` → `skills/people/one-on-one.md` |
| `burnout.feature` | `skills/people/assess-burnout.md` → `skills/people/burnout.md` |
| `leadership-health.feature` | `skills/leadership/master-leadership-health.md` → `leadership-health/master-leadership-health.md` |
| `leadership-health/master-leadership-health.md` | `skills/communication/write-executive-update.md` → `skills/executive/executive-communication.md` |
| **Document-as-gap (no real content)** | |
| `delivery.feature` | `skills/delivery/review-quarter.md` — mark as planned |
| `incidents.feature` | `skills/operations/postmortem.md` — mark as planned |
| `architecture.feature` | `skills/architecture/assess-decision.md` — mark as planned |
| `hiring.feature` | `skills/people/assess-hiring-pipeline.md` — mark as planned |
| `release.feature` | `skills/delivery/assess-release.md` — mark as planned |
| `one-on-one.feature` (2nd ref) | `skills/people/build-promotion-case.md` — mark as planned |
| `prediction_confidence.md` | `skills/delivery/track-sprint.md` → document as gap or repoint to `review-sprint.md` |
| **Graph ops** | None (reference fixes) |
| **Depends on** | None |
| **Batch** | 1 |

---

### U — Standardize status vocabulary

| Field | Value |
|---|---|
| **Files modified** | `features/burnout.feature` (5 scenarios + Examples table: Green→Healthy, Yellow→Warning, Red→Critical), `political-signals/features/political-signals.feature` (1 scenario: Red→Critical) |
| **Graph ops** | None (vocabulary normalization) |
| **Depends on** | S (Gherkin syntax must be valid first) |
| **Batch** | 1 |

---

## Batch 2: Structural Moves

### B — Standardize module layout on `skills/<module>/`

| Field | Value |
|---|---|
| **Files moved (13 LH)** | `leadership-health/{executive_trust_score,stakeholder_alignment,organizational_clarity,communication_effectiveness,delegation_score,coaching_score,decision_quality,ownership_index,team_autonomy,influence_score,political_awareness,meeting_quality,execution_clarity}.md` → `skills/leadership-health/` |
| **Files moved (6 CE)** | `confidence-engine/{prediction_confidence,data_quality,risk_confidence,delivery_confidence,roadmap_confidence,architecture_confidence}.md` → `skills/confidence-engine/` |
| **Redirect stubs** | 19 stubs at old paths (same format as `leadership-health/master-leadership-health.md`) |
| **Files updated** | `leadership-health/README.md`, `confidence-engine/README.md` (File Index tables), `CLAUDE.md` (Repository Architecture — uniform `skills/<module>/` convention) |
| **Graph ops** | 19 `supersedes(skills/<module>/<file>, <module>/<file>)` edges |
| **Depends on** | A (legacy eval files gone before moving dimension files) |
| **Batch** | 2 |

**Note**: The migration JSON already has `sup-002` through `sup-014` for the 13 LH dimension files pointing from `skills/leadership-health/leadership-health-engine.md` → old individual dimension files. Sub-project B writes *different* supersedes edges: `skills/leadership-health/<dimension>.md` → `leadership-health/<dimension>.md` (move provenance). The existing engine-supersedes-dimension edges remain valid — they describe a different relationship (engine absorbs dimension logic vs. file moves to new path).

---

### I — Fix dangling references

| Field | Value |
|---|---|
| **Files modified** | `decision-memory/schema.md` (fix `records/` and `examples/` refs), `skills/confidence-engine/prediction_confidence.md` (fix `track-sprint.md` ref), `leadership-health/master-leadership-health.md` (already a redirect stub — verify `write-executive-update.md` ref is gone) |
| **Graph ops** | None (reference fixes) |
| **Depends on** | B (files at new paths before fixing refs to them) |
| **Batch** | 2 |

---

### H — Delete empty/vestigial directories

| Field | Value |
|---|---|
| **Directories deleted** | `evaluations/benchmarks/`, `skills/quality/` |
| **Directories deleted (dead scaffolding)** | `prompts/daily/`, `prompts/monthly/`, `prompts/quarterly/`, `prompts/retrospectives/`, `prompts/weekly/`, `tests/gherkins/`, `tests/prompts/`, `tests/scenarios/` |
| **Directories NOT deleted** | `skills/architecture/` (reserved — `assess-decision.md` gap), `skills/operations/` (reserved — `postmortem.md` gap), `skills/communication/` (redirect handled by T) |
| **Pre-check** | Verify directories are actually empty at execution time. `skills/confidence-engine/` is NOT empty after B populates it — skip. |
| **Graph ops** | `delete_node` entries in migration JSON for each deleted path |
| **Depends on** | B (must run before H to avoid deleting `skills/confidence-engine/` which B just populated) |
| **Batch** | 2 |

---

## Batch 3: Merges & Disambiguation

### C1 — Merge stakeholder mapping

| Field | Value |
|---|---|
| **Canonical** | `skills/organizational/stakeholder-analysis.md` |
| **Absorbed** | `skills/executive/stakeholder-map.md` (fold in relationship-health axis + pre-announcement decision tree) |
| **Redirect stub** | `skills/executive/stakeholder-map.md` → redirect to canonical |
| **Cross-refs updated** | `influence-map.md`, `decision-network.md`, `political-risk.md`, `executive-decision-framework.md`, `executive-priorities.md` |
| **Graph ops** | `supersedes(skills/organizational/stakeholder-analysis.md, skills/executive/stakeholder-map.md)` |
| **Depends on** | B |
| **Batch** | 3 |

---

### C2 — Merge board communication

| Field | Value |
|---|---|
| **Canonical** | `skills/executive/board-level-summary.md` |
| **Absorbed** | `skills/presentation/board-deck.md` (fold in deck-formatting guidance as output variant) |
| **Redirect stub** | `skills/presentation/board-deck.md` → redirect to canonical |
| **Graph ops** | `supersedes(skills/executive/board-level-summary.md, skills/presentation/board-deck.md)` |
| **Depends on** | B |
| **Batch** | 3 |

---

### D — Disambiguate naming collisions

| Field | Value |
|---|---|
| **Rename** | `skills/performance/promotion-readiness.md` → `skills/performance/promotion-readiness-tracking.md` |
| **Disambiguation notes** | Add cross-reference headers to `skills/strategy/annual-planning.md` ↔ `skills/executive/annual-planning.md` |
| **Cross-refs updated** | `mentor-plan.md`, `growth-tracking.md` (from Q's blast radius) |
| **Graph ops** | `supersedes(skills/performance/promotion-readiness-tracking.md, skills/performance/promotion-readiness.md)` |
| **Depends on** | B |
| **Batch** | 3 |

---

### Q — Add missing cross-references in growth cluster

| Field | Value |
|---|---|
| **Files modified** | `skills/mentoring/growth-tracking.md` ↔ `skills/people/growth-plans.md` (add to each other's Related Skills), `skills/mentoring/mentor-plan.md` (optional trim of restated formula) |
| **Graph ops** | None (cross-reference additions) |
| **Depends on** | D (promotion-readiness rename must complete first) |
| **Batch** | 3 |

---

### E1 — Extract 5-signal taxonomy

| Field | Value |
|---|---|
| **Canonical** | `political-signals/political-signals.md` (redirect stub) → `skills/organizational/political-intelligence.md` |
| **Files trimmed** | `skills/organizational/stakeholder-analysis.md`, `skills/organizational/influence-map.md`, `skills/organizational/decision-network.md`, `skills/organizational/political-risk.md` — replace restated blocks with summary + link |
| **Graph ops** | 4 `derived_from(<trimmed file>, skills/organizational/political-intelligence.md)` edges |
| **Depends on** | C1 (stakeholder-analysis must be merged first) |
| **Batch** | 3 |

---

### E2/P — Extract risk-scoring rubric

| Field | Value |
|---|---|
| **Canonical reference** | `skills/organizational/political-risk.md` (or `docs/glossary.md` — decide at execution) |
| **Files trimmed** | `skills/product/product-risk.md`, `skills/strategy/risk-planning.md` — replace restated formula with pointer |
| **Graph ops** | 2 `derived_from(<trimmed file>, <canonical>)` edges |
| **Depends on** | E1 |
| **Batch** | 3 |

---

### F — Clarify decision-capture ownership

| Field | Value |
|---|---|
| **Files modified** | `skills/decision-memory/record-decision.md`, `skills/meetings/decision-log.md` — add disambiguation notes |
| **Graph ops** | None (boundary clarification) |
| **Depends on** | None |
| **Batch** | 3 |

---

### R — Clarify support-escalation/customer-success boundary

| Field | Value |
|---|---|
| **Files modified** | `skills/cross-functional/support-escalation.md`, `skills/cross-functional/customer-success.md` — add boundary statements |
| **Graph ops** | None (boundary clarification) |
| **Depends on** | None |
| **Batch** | 3 |

---

## Batch 4: New Coverage & Documentation

### G — Trim regression boilerplate

| Field | Value |
|---|---|
| **Files modified** | `evaluations/regression/political-signals-results.md`, `evaluations/regression/decision-memory-results.md` — remove restated boilerplate, keep module-specific check tables |
| **Graph ops** | None |
| **Depends on** | None |
| **Batch** | 4 |

---

### J — Add Gherkin coverage for loops/contracts

| Field | Value |
|---|---|
| **Files created** | `loops/features/loops.feature`, `contracts/features/contracts.feature` |
| **Coverage** | Loop-to-subagent routing, Related Loops disambiguation, contract Failure Conditions blocking |
| **Graph ops** | 2 `create_node` entries |
| **Depends on** | All structural sub-projects (Batches 1–3) |
| **Batch** | 4 |

---

### K — Update README.md and BUILD.md

| Field | Value |
|---|---|
| **Files modified** | `README.md` (add loops/contracts/memory/analytics to layer table), `BUILD.md` (add relevant setup steps) |
| **Cross-check** | Verify `README.md` table matches `CLAUDE.md` Repository Architecture |
| **Graph ops** | None (documentation) |
| **Depends on** | B, O |
| **Batch** | 4 |

---

### L — Fix ROADMAP.md v0.2 metrics

| Field | Value |
|---|---|
| **Files modified** | `ROADMAP.md` — update v0.2 Skills section metrics to reflect 100+ real skills |
| **Graph ops** | None |
| **Depends on** | None |
| **Batch** | 4 |

---

### M — Backfill kaizen changelog

| Field | Value |
|---|---|
| **Files modified** | `kaizen/continuous-improvement.md` — add changelog rows for loops/memory/contracts/kaizen-extraction/memory-fix/graph-schema commits |
| **Graph ops** | None |
| **Depends on** | All structural sub-projects |
| **Batch** | 4 |

---

### N — Close subagent routing gap

| Field | Value |
|---|---|
| **Files modified** | `subagents/delivery-manager.md` (→ sprint-loop, delivery-loop), `subagents/incident-manager.md` (→ incident-loop), `subagents/engineering-coach.md` (→ career-loop, promotion-loop), `subagents/product-partner.md` (→ stakeholder-loop), `subagents/tech-lead.md` + `subagents/architecture-reviewer.md` (→ architecture-loop), `subagents/executive-summary.md` (→ executive-loop, prediction-loop), `subagents/engineering-manager.md` (add loops/ and commands/ to routing table) |
| **Graph ops** | 11 `invokes(subagent, loop)` edges added to migration JSON |
| **Depends on** | None |
| **Batch** | 4 |

---

### O — Document analytics/

| Field | Value |
|---|---|
| **Files created** | `analytics/README.md` (master pad documenting 6 dashboards, shared metrics, relationships) |
| **Files modified** | `CLAUDE.md` (add `### analytics/` to Repository Architecture) |
| **Graph ops** | None |
| **Depends on** | None |
| **Batch** | 4 |

---

## Execution Summary

| Batch | Sub-projects | Total graph edges | Total files touched |
|---|---|---|---|
| 1 | A, S, T, U | 3 supersedes | ~15 files |
| 2 | B, I, H | 19 supersedes + delete_nodes | ~30 files |
| 3 | C1, C2, D, Q, E1, E2/P, F, R | 4 supersedes + 6 derived_from | ~20 files |
| 4 | G, J, K, L, M, N, O | 11 invokes + 2 create_node | ~15 files |
| **Total** | **21 sub-projects** | **~45 edges** | **~80 file operations** |
