# Prompt Review Log

Every time a subagent or skill produces output that required significant correction, that output is diagnosed here. The diagnosis produces a specific change to the prompt or skill file.

"Significant correction" means: the output was used but needed editing before it was sent, OR it was not used at all because it missed the point. Minor style edits do not qualify.

---

## Entry Format

```
## PR-{{NNN}} — {{subagent or skill name}}: {{short description of the issue}}

Date: {{YYYY-MM-DD}}
Source: Weekly Kaizen Q{{8 or 10}} — Week of {{date}}
File: {{subagents/xxx.md or skills/xxx/yyy.md}}
Status: [Open | Fixed | Accepted]

### Input Provided
{{What was given to the subagent or skill — paste the actual input or summarize precisely}}

### Output Produced
{{What the subagent or skill returned — paste the actual output or the specific section that was wrong}}

### What Was Wrong
{{Precise diagnosis — not "it was vague" but "the Recommendation section named a process change without naming an owner or deadline, violating the Output Contract"}}

### Root Cause in the Prompt
Choose one from `kaizen/root-cause.md` (typically one of): Missing instruction | Ambiguous instruction | Conflicting instruction | Wrong constraint | Missing failure mode | Scope violation

### The Fix

**Before** (current text in file):
> {{exact current text}}

**After** (proposed replacement):
> {{exact proposed replacement}}

### Verification
Which golden output or regression scenario will confirm the fix worked?
{{evaluations/golden/xxx.md — or — features/xxx.feature Scenario: yyy}}
```

---

## Active Reviews

*Most recent first. Move to Resolved when the fix is applied and verified.*

---

## Resolved Reviews

---

## Prompt Failure Patterns

Updated monthly. Recurring failure patterns indicate structural issues with how agents are designed.

| Pattern | Occurrences | Root Cause | Resolution |
|---|---|---|---|
| Output omits confidence level | — | Constraint not prominent enough in subagent | Move confidence rule to top of Constraints section |
| Executive summary buried in output | — | No explicit ordering instruction | Add "Summary must be the first section of every output" |
| Recommendation lacks named owner | — | Output Contract doesn't require owner field | Update Output Contract to include `OWNER:` field |

---

## Prompt Quality Principles

When writing or revising prompts and skill instructions, apply these:

**Be specific, not aspirational.**
"Be concise" is not an instruction. "The Summary section must be 2–4 sentences maximum" is.

**Constraints over guidelines.**
"Try to include confidence levels" will be ignored under pressure. "Every substantive claim must include a confidence level — this is non-negotiable" will not.

**Name the failure mode explicitly.**
If a subagent tends to do X incorrectly, name X in the Failure Modes section of the skill, and add a `Never: X` to the Constraints section of the subagent. Implicit correction does not work.

**Test with adversarial inputs.**
Run the prompt against inputs where the wrong behavior is tempting — missing data, ambiguous situation, conflicting signals. If the prompt holds up, it is robust. If it doesn't, add the failure mode.

**Version your golden outputs.**
When a prompt changes, the expected output changes. Update `evaluations/golden/` in the same commit/PR as the prompt change. Otherwise you are comparing current output to a stale reference.
