# Failure Log

Every meaningful failure by the OS, by the manager using the OS, or by a subagent gets an entry here. This is not a blame document. It is a diagnostic record.

A failure log that only records the obvious failures is a vanity document. A failure log that records the subtle ones — the recommendation that was technically correct but wrongly timed, the confidence level that was too high, the threshold that didn't fire — becomes the highest-value input to OS improvement.

**Rule**: Never write "we should have been more careful." Name the system condition that allowed the failure. That is what gets fixed.

---

## Entry Format

```
## FAIL-{{NNN}} — {{short title}}

Date: {{YYYY-MM-DD}}
Type: [Prediction | Recommendation | Threshold | Skill | Subagent | Process]
Severity: [High | Medium | Low]
Status: [Open | Fixed | Accepted Risk | Monitoring]
Source: Weekly Kaizen Q{{N}} — Week of {{date}}

### What Failed
{{Specific description of what the OS produced or recommended and what happened as a result}}

### What Was Available Earlier
{{What signals existed before the failure that could have predicted it}}
{{Was this signal in the OS? If yes, why wasn't it caught? If no, should it be added?}}

### OS vs. Execution
- OS fault: {{Yes / No — did the OS give wrong guidance?}}
- Execution fault: {{Yes / No — did the right guidance get ignored?}}
- Both: {{explain}}

### Root Cause
{{The system condition that produced this failure — not the person, not the event}}

### Change Required
- File to update: {{path}}
- Section: {{specific section}}
- Change: {{what needs to be added, removed, or modified}}
- Confidence in fix: {{High / Medium / Low}}

### Verification
How will we know the fix worked?
{{Specific observable outcome — a new scenario in features/, a regression test, a golden output update}}

### Linked Updates
- Skill change: {{skill file and PR/commit if applicable}}
- Feature change: {{.feature file and scenario}}
- Golden output: {{evaluations/golden/ file updated}}
```

---

## Active Failures

*Entries are added weekly from Q4 and Q6 of the weekly review. Most recent first.*

---

## Closed Failures

*Failures where the fix has been applied and verified. Move entries here when Status = Fixed.*

---

## Patterns

*Updated monthly during `kaizen/monthly-review.md`. Identifies recurring failure themes.*

| Pattern | Occurrences | Root Cause | Status |
|---|---|---|---|
| — | — | — | — |

**How to identify a pattern**: If the same root cause appears in 3 or more failure entries, it is a pattern. Patterns require a systemic fix, not a one-off update.

---

## Failure Type Taxonomy

Use these types consistently so patterns can be detected across entries:

| Type | Description | Primary Fix Target |
|---|---|---|
| **Prediction** | OS predicted an outcome that did not occur | Confidence Score section of relevant skill |
| **Recommendation** | OS recommended an action that produced a bad outcome | Decision Tree or Analysis section of relevant skill |
| **Threshold** | A scenario threshold fired too early or too late | Examples table in relevant .feature file |
| **Skill** | Skill produced structurally incorrect output | Skill file — specific section |
| **Subagent** | Subagent routed incorrectly, escalated wrongly, or overstepped scope | Subagent Routing Logic or Constraints section |
| **Process** | The OS process itself was followed incorrectly or bypassed | kaizen/weekly-review.md or command file |
