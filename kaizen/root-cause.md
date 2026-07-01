# Root Cause Taxonomy

**Referenced by**: `kaizen/failures.md`, `kaizen/prompt-review.md`, `kaizen/prediction-review.md`, `kaizen/failure-analysis.md`

This is not a review you run on a cadence — it's the canonical taxonomy that every other kaizen file's "Root Cause" field should select from, instead of each file inventing its own categories. Before this file existed, `failures.md` and `prompt-review.md` each had their own overlapping root-cause checklists; this extracts the shared taxonomy to one place.

---

## Root Cause Categories

| Category | Definition | Primary Fix Target |
|---|---|---|
| **Missing signal** | The data or context needed to predict/prevent this didn't exist in the OS | Add the input to the relevant skill's Inputs table |
| **Ignored signal** | The signal existed but wasn't weighted or acted on | Increase the signal's weight in the relevant skill's Analysis/Decision Tree |
| **Wrong model** | The analysis logic itself was flawed — not a data problem | Rewrite the skill's Analysis or Decision Tree section |
| **Missing instruction** | A prompt (subagent or skill) never covered this case | Add the case explicitly to the prompt |
| **Ambiguous instruction** | The prompt covered the case but not clearly enough to act on consistently | Clarify the wording; add a concrete example |
| **Conflicting instruction** | Two parts of a prompt gave contradictory guidance | Resolve the conflict; state which rule wins |
| **Wrong constraint** | A Never/Always rule produced the wrong behavior in this specific case | Narrow or qualify the constraint |
| **Missing failure mode** | The skill's Failure Modes section didn't anticipate this case | Add the failure mode explicitly |
| **Scope violation** | An agent did work outside its defined scope instead of routing | Tighten the Scope/Routing Logic section |
| **Threshold miscalibration** | A numeric threshold fired too early (false positive) or too late (false negative) | Adjust the Examples table in the relevant `.feature` file |
| **Process bypass** | The OS process itself was skipped or followed incorrectly | Fix in `kaizen/weekly-review.md` or the relevant command/loop file |
| **Execution fault** | The OS gave correct guidance; a human or agent didn't follow it | Not an OS fix — log as "Accepted Risk" or address via coaching, not a file change |

## How to Use This Taxonomy

1. When logging a failure (`failures.md`), a prompt correction (`prompt-review.md`), or a wrong prediction (`prediction-review.md`), pick exactly one primary category from the table above.
2. If none fit, that itself is a signal — propose a new category here rather than writing free text in the entry. Free-text root causes are how the same failure mode gets logged three different ways and never gets recognized as a pattern.
3. `failure-analysis.md` and the monthly review's pattern detection rely on this taxonomy being used consistently — a pattern is "3+ entries with the same root-cause category," which only works if entries use the same category names.

## Relationship to Failure Modes (in skill files)

A skill's own "Failure Modes" section describes symptoms specific to that skill (e.g. `skills/meetings/meeting-planner.md`'s "Attendee inflation"). This taxonomy is the cross-cutting classification layer above that — every skill-specific failure mode still maps to exactly one row in this table when it's logged as an incident.
