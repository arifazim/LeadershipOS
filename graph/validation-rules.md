# Graph Validation Rules

**Domain**: Graph Engineering
**Owner**: `core/graph_engine.py` (planned)
**Version**: 1.0
**Enforcement**: Manual (Phase -1/0) → Automated (Phase 1+)

---

## Purpose

Structural invariants the leadership graph must satisfy at all times. These rules become the **test specification** for Phase 1's runtime enforcement layer. Until then, they are checked manually after each migration or structural change.

---

## Rules

### V1: Skill Ownership

**Every `Skill` node must have exactly one `owns` edge from a `Subagent`.**

- Rationale: Orphan skills have no routing path. Dual-owned skills create ambiguous routing.
- Check: For each file in `skills/*/`, verify it appears in at least one `subagents/*.md` routing table or scope section.
- Violation response: Add the skill to the appropriate subagent's scope, or document it as a utility skill invoked only via `derived_from` edges (explicitly exempt from this rule).

### V2: Redirect Completeness

**Every `supersedes` edge must have a redirect stub at the `to` path.**

- Rationale: A `supersedes` edge without a redirect means the old path is a dead end — anyone following it gets a missing file instead of a pointer to the canonical location.
- Check: For each `supersedes` edge in `graph/migrations/*.json`, verify the `to` file exists and contains the redirect stub format (see `graph/schema.md`'s redirect format or the existing stubs in `leadership-health/master-leadership-health.md`).
- Exception: Edges where the `to` file was explicitly deleted (Sub-project A's legacy eval files) — these are `delete_node` operations, not redirects.

### V3: Role Gate Consistency

**No `Skill` may have a `gates_by_role` edge to a `RoleLevel` lower than its owner subagent's minimum operating level.**

- Rationale: If a subagent operates at M2+ and one of its skills is gated to M1, the gating is effectively meaningless — the subagent already filters for M2+ before the skill is reachable.
- Check: Compare each skill's `gates_by_role` target against its owning subagent's minimum `operates_at` level.
- Note: This rule becomes enforceable in Phase 1 when `gates_by_role` edges are formally written. During Phase -1/0, it's a design constraint, not a runtime check.

### V4: Assessment Artifact Completeness

**Every `AssessmentRun` must produce at least one `Artifact` with a typed contract from `graph/artifact-contracts.md`.**

- Rationale: An assessment run without a typed artifact is an unstructured output — it can't be consumed by downstream agents or dashboards.
- Check: For each `AssessmentRun` node in `graph/runs/`, verify it references at least one `artifact_id` that matches a contract type in `graph/artifact-contracts.md`.
- Violation response: Either add the missing artifact or downgrade the run to a plain `Run` node (it wasn't a scored diagnostic).

### V5: Provenance Chain

**Every `Artifact` must have at least one `derived_from` edge to a `Source` or another `Artifact`.**

- Rationale: Artifacts without provenance are unverifiable claims. The OS's trust model requires that every output traces back to an input.
- Check: For each artifact in `graph/runs/` or `graph/leadership-graph.json`, verify at least one `derived_from` edge exists.
- Exception: Migration artifacts (redirect stubs, consolidation logs) — these are structural, not analytical.

### V6: No Circular Supersedes

**The `supersedes` edge set must form a DAG (directed acyclic graph) — no circular chains.**

- Rationale: A circular supersedes chain means File A says "go to File B" and File B says "go to File A" — an infinite redirect loop.
- Check: Topological sort of all `supersedes` edges in `graph/migrations/*.json`. If the sort fails, there's a cycle.
- Automated check (shell):
  ```bash
  # Extract all supersedes from→to pairs and check for cycles
  jq -r '.edges[] | select(.type == "supersedes") | "\(.from) \(.to)"' graph/migrations/*.json | \
    tsort 2>&1 | grep -c "cycle"
  # Expected output: 0
  ```

### V7: Run Completeness

**Every `Run` node must link to at least one skill or subagent via `invokes` edges.**

- Rationale: A run that invokes nothing is an empty execution — it produces no value and clutters the audit log.
- Check: For each run record in `graph/runs/`, verify the `Agents invoked` or `Skills invoked` field is non-empty.
- Exception: Migration runs (type `migration`) — these modify the graph structure, not the leadership state.

---

## Validation Cadence

| When | What | How |
|---|---|---|
| After each migration sub-project | V2, V6 | Manual grep + `jq` |
| After each schema change | V1, V3 | Manual cross-reference |
| After each assessment run | V4, V5 | Manual check of run record |
| Weekly (kaizen review) | V7 | Spot-check of `graph/runs/` |
| Phase 1+ | All rules | Automated by `core/graph_engine.py` |

---

## Related Files

| File | Purpose |
|---|---|
| `graph/schema.md` | Node and edge type definitions |
| `graph/artifact-contracts.md` | Typed handoff schemas |
| `graph/migrations/*.json` | Migration edge sets to validate |
| `graph/runs/README.md` | Run node format |
