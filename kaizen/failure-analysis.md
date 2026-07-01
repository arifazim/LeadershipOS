# Failure Analysis

**Cadence**: Monthly
**Extracted from**: `failures.md`'s former "Patterns" section + `monthly-review.md` Part 2
**Reads from**: `kaizen/failures.md` (the raw `FAIL-NNN` entry log — this file does not duplicate those entries, it analyzes them)

`failures.md` stays the raw log where individual failures get recorded as they happen. This file is the dedicated monthly pass that reads across that log and looks for what no single entry can show on its own: recurrence.

---

## Monthly Analysis

```
Failures opened this month: {{count}}
Failures closed this month: {{count}}
Failures open > 30 days: {{count}} — these require a decision: fix now or accept as known limitation

Failure types this month (per kaizen/root-cause.md taxonomy):
- {{category}}: {{count}}
- {{category}}: {{count}}

Most common root-cause category: {{category}}
Is this a new pattern or a continuation of a prior month's pattern? {{New / Continuation}}
Systemic fix required: {{Yes / No — if Yes, what}}
```

## Pattern Table

Carried forward month to month — this is the authoritative pattern record (moved here from `failures.md`, which previously held this table alongside its raw entries).

| Pattern | Root Cause Category | Occurrences | First Seen | Status |
|---|---|---|---|---|
| — | — | — | — | — |

**How to identify a pattern**: If the same root-cause category (from `kaizen/root-cause.md`) appears in 3 or more `failures.md` entries, it is a pattern. Patterns require a systemic fix, not a one-off update — log the fix and mark Status as `Fixed` once verified; otherwise `Monitoring`.

## Escalation Rule

A pattern that reaches **3 consecutive months without a systemic fix** is escalated: raise it in the next monthly review's "Next Month Priorities" (`monthly-review.md` Part 8) as a forced Priority 1, not an optional item.

## Update Cascade

Failure-pattern fixes typically land at the Skill or Prompt step of the reordered cascade (Playbook → Prompt → Skill → Memory), depending on whether the root cause was a prompt/instruction problem or an analysis-logic problem — check `kaizen/root-cause.md`'s "Primary Fix Target" column to route correctly.

## Archive

Log to `kaizen/continuous-improvement.md` tagged `failure-closed` when a pattern's systemic fix is verified.
