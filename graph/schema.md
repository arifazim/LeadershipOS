# Leadership Graph Schema

**Domain**: Graph Engineering
**Owner**: `core/graph_engine.py` (planned), `subagents/engineering-manager.md`
**Version**: 2.0
**Migration baseline**: `graph/migrations/2026-08-consolidation.json`
**Changelog**: v1.0 → v2.0 — added UserRole, RoleLevel, AssessmentRun, LadderNode nodes; 6 new edge types; role-filtered queries; phased storage roadmap

---

## Purpose

Formalizes the implicit entity-relationship structure of the Engineering Manager OS. Every module, skill, subagent, memory entry, and assessment output is a node; every invocation, ownership, evidence link, and consolidation is an edge.

This schema follows Andrew Ng's graph-engineering progression: loops externalize revision, chains externalize order, networks externalize specialization, **graphs externalize shared state and relationships**. EM-OS operates at the Network stage today; this schema is the foundation for Graph stage persistence.

---

## Node Types

### Core Nodes

| Type | Description | Examples |
|---|---|---|
| **Entity** | Durable thing in the leadership domain | Person, Team, Decision, Skill, Subagent, Loop, Metric, OKR |
| **Claim** | Asserted fact that may be supported or contradicted | "Deployment frequency dropped 40%", "User operates at M2" |
| **Source** | Origin of a claim | GitHub ingest, 1:1 notes, 360 feedback, ADR, memory entry |
| **Artifact** | Structured output from a skill or loop (typed per `graph/artifact-contracts.md`) | Sprint review, leadership health scorecard, conflict diagnosis |
| **Run** | Single execution of a command, loop, or agent chain | CLI run, kaizen review, regression eval |

### Role & Career Nodes (v2.0)

| Type | Description | Examples |
|---|---|---|
| **UserRole** | The operator's current management level — the person running the OS | Configured in `config/team.json`; resolves to a `RoleLevel` via `operates_at` edge |
| **RoleLevel** | A position on the engineering/management career ladder | IC4, IC5, IC6 (Staff), M1 (EM), M2 (Sr EM), M3 (Dir), VP |
| **LadderNode** | A career-ladder position with required skills, expectations, and promotion criteria | "M1: owns delivery + people for 1 team", "M2: owns 2+ teams or a complex domain" |

### Assessment Nodes (v2.0)

| Type | Description | Examples |
|---|---|---|
| **AssessmentRun** | Specialization of `Run` for scored diagnostic outputs | Leadership health assessment, confidence engine run, political signals scan |

`AssessmentRun` extends `Run` with: `assessment_type` (leadership-health \| confidence-engine \| political-signals \| decision-memory), `holistic_score` (0-100), `status` (Healthy \| Warning \| At Risk \| Critical), `dimension_scores` (map of dimension → score).

---

## Edge Types

### Core Edges

| Edge | From → To | Meaning |
|---|---|---|
| `owns` | Subagent → Skill/Loop | Routing ownership |
| `invokes` | Loop → Skill/Subagent | Orchestration step |
| `routes_to` | Orchestrator keyword → Subagent | Runtime routing |
| `supersedes` | New file → Old file | Consolidation migration (old is deprecated, not deleted from graph) |
| `projects_to` | Old dashboard → View in master dashboard | Analytics consolidation |
| `supports` | Source/Metric → Claim | Evidence |
| `contradicts` | Claim → Claim | Specialist disagreement (requires resolution) |
| `resolved_by` | Contradiction → Claim/Run | Conflict resolution outcome |
| `derived_from` | Artifact → Source/Artifact | Provenance chain |

### Role & Career Edges (v2.0)

| Edge | From → To | Meaning |
|---|---|---|
| `operates_at` | UserRole → RoleLevel | What level the current operator is — gates skill visibility and output framing |
| `gates_by_role` | Skill → RoleLevel | Which skills are appropriate for which level (formalizes `requires_role` from v1.0) |
| `assessed_by` | Person/Team → AssessmentRun | Links an individual or team to a scored diagnostic run |
| `precedes` | LadderNode → LadderNode | Career ladder progression ordering (M1 → M2 → M3 → Dir) |
| `evidences` | Artifact → LadderNode | Promotion evidence chain — "this artifact demonstrates readiness for this level" |
| `conflicts_with` | Entity → Entity | Generalized disagreement — covers specialist disagreements, skill overlap, or resource contention beyond claim-vs-claim |

### Deprecated Edges (v2.0)

| Edge | Status | Replacement |
|---|---|---|
| `requires_role` | Deprecated | Use `gates_by_role` (same semantics, clearer name) |

---

## Write Protocol

All graph writes are **additive**. Never silently overwrite a Claim — create a new version and link with `supersedes`.

```
1.  Create Run node (timestamp, trigger, user_role)
    1a. If scored diagnostic: create AssessmentRun node instead (extends Run)
2.  Resolve user_role → RoleLevel via operates_at edge
3.  Agents read subgraph relevant to query entities (filtered by role — see Query Protocol)
4.  Agents write Artifact nodes with typed fields (see graph/artifact-contracts.md)
5.  Claims link to Sources via supports edges
6.  Conflicts write contradicts edges; synthesis writes resolved_by
7.  If assessment: write assessed_by edge linking Person/Team → AssessmentRun
8.  If promotion-relevant: write evidences edge linking Artifact → LadderNode
9.  Log Run completion in graph/runs/
```

---

## Query Protocol

Before any subagent produces output:

```
1.  Parse situation → extract entities (team, person, metric, decision, role)
2.  Resolve deprecated paths via graph/migrations/*.json supersedes edges
3.  Resolve user_role → RoleLevel via operates_at edge
3a. Filter available skills by gates_by_role edges (only surface skills at or below user's level)
4.  Load subgraph: matching skills, memory entries, prior artifacts (< 90 days)
5.  Check contradicts edges from prior runs on same entities
6.  If assessment query: load prior AssessmentRun nodes for trend comparison
7.  Produce output with Claim → Source provenance
```

---

## Storage

| Phase | Location | When | What's stored |
|---|---|---|---|
| **Phase -1** (current) | `graph/migrations/*.json` + redirect stubs | Path resolution, consolidation audit | `supersedes`, `projects_to` edges |
| **Phase 0** | Same + extended migration JSON | Post-consolidation | Full A–U sub-project edges |
| **Phase 1** | `graph/leadership-graph.json` | Runtime claims, artifacts, runs | All node/edge types; `gates_by_role` edges |
| **Phase 2** | Same + `graph/ladder.json` | Ladder subgraph + quarterly assessment | `LadderNode`, `precedes`, `evidences`, `assessed_by` |
| **Phase 3** | Partitioned JSON files per domain | Scale beyond single file | Domain-scoped subgraphs |
| **Phase 4+** | Graph database (Neo4j or equivalent) | Cross-session query at scale | Full graph with indexing |

---

## Role Gating Model (v2.0)

The `UserRole` → `RoleLevel` → `Skill` chain determines what the OS surfaces:

```
config/team.json
  └── defines UserRole (e.g., "M2")
        └── operates_at → RoleLevel("M2")
              └── gates_by_role ← Skill("board-level-summary")  [requires M2+]
              └── gates_by_role ← Skill("review-sprint")        [requires M1+]
```

**Gating rules:**
- M1: All delivery, people, operational skills. No board-level or org-strategy skills.
- M2: M1 + executive communication, political signals, multi-team skills.
- M3/Dir: M2 + organization-wide strategy, ladder design, portfolio-level assessment.
- Ungated (default): Skills with no `gates_by_role` edge are available at all levels.

---

## Validation Rules

See `graph/validation-rules.md` for the full set of structural invariants the graph must satisfy.

---

## Related Files

| File | Purpose |
|---|---|
| `graph/migrations/2026-08-consolidation.json` | August 2026 module consolidation — supersedes map |
| `graph/migrations/consolidation-full-map.md` | Exhaustive A–U sub-project → graph operations map |
| `graph/artifact-contracts.md` | Typed handoff schemas between subagents |
| `graph/validation-rules.md` | Structural invariants for graph integrity |
| `graph/runs/README.md` | Run node audit log format |
| `config/team.json` | UserRole configuration source |
