# Skill Review

**Cadence**: Weekly (quick log) + monthly usage audit
**Extracted from**: `weekly-review.md` Q8 + `monthly-review.md` Part 6

---

## Weekly Log Entry

```
SKILL REVIEW — Week of {{YYYY-MM-DD}}

Skill that produced incorrect, incomplete, or poorly calibrated output: {{skill path}}
Input provided: {{what data was given to the skill}}
Output produced: {{what the skill returned}}
Correct output should have been: {{what it should have returned}}
Which section of the skill was wrong: {{Purpose / Inputs / Analysis / Decision Tree / Output / Confidence Score / Failure Modes}}
Root cause: {{one category from kaizen/root-cause.md}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update the specific section of the skill file
         → update the corresponding golden output in evaluations/golden/
         → re-run the regression scenarios for that skill
```

## Monthly Usage Audit

```
Skills invoked this month: {{list}}
Skills NOT invoked in > 4 weeks: {{list}}
```

For each skill not used in > 4 weeks:
- Is it because the situation hasn't arisen? (Acceptable — keep, note in log)
- Is it because the team doesn't know it exists? (Fix: add to relevant loop or command)
- Is it because it was tried and abandoned? (Fix: investigate, update or archive)

A skill that nobody invokes is a liability, not an asset — it creates maintenance overhead without value.

## Contract Drift Check

If a skill has an entry in `contracts/`, check whether this month's corrections mean the contract itself needs a version bump — not just the skill's prose. A skill correction that changes its Required Outputs or Failure Conditions is a contract change, not just a skill change; update both files together.

## Update Cascade

Skill updates sit third in the reordered cascade (Playbook → Prompt → Skill → Memory) — by the time a skill fix is needed, the playbook and prompt layers have usually already been checked for whether the skill was even given correct guidance to begin with.

## Archive

Log applied changes to `kaizen/continuous-improvement.md` tagged `skill-corrected` or `skill-extended`.
