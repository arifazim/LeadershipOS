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
| — | — | — | — | — | — | — |

*First entry will be added after the first completed weekly review.*

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

At the end of each quarter, summarize the changelog into a rollup entry:

```
## Q{{N}} {{YEAR}} Rollup

Changes this quarter: {{count}}
Most common change category: {{tag}}
Principles revised: {{count — if 0, ask whether principles are being tested}}
Thresholds changed: {{count}} ({{N}} tightened, {{N}} relaxed)
Failures closed: {{count}}
Failures opened: {{count}}
Open failures at quarter end: {{count}}

Trend: {{Is the OS improving? Are failures declining? Are thresholds stabilizing? Write 2–3 sentences.}}

Most impactful change this quarter:
{{Describe the one change that most improved OS quality or manager effectiveness}}

What the OS still cannot do:
{{Capability gap that remains — what the OS consistently gets wrong or cannot cover}}
```

---

## The Log Is the Proof

When someone asks "has this OS actually improved over time?" — point them here. If this log is empty or has only a few entries, the kaizen process is not being run. The improvement is not in the vision document or the principles file. It is in this changelog.
