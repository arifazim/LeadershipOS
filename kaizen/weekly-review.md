# Weekly Kaizen Review

**Cadence**: Every Friday — run before end of business day
**Owner**: Engineering Manager (or `subagents/engineering-manager.md` with EM review)
**Duration**: 30–45 minutes
**Output**: Completed review entry → update decisions → cascade execution → evaluation run

This is the mechanism by which the OS improves. Skip it and the OS decays. Run it honestly and the OS becomes a competitive advantage.

---

## How to Run This Review

1. Open this file on Friday afternoon
2. Answer each of the 10 questions with specific examples — not generalities
3. For each answer, decide: does this require an OS update?
4. Execute the update cascade in order
5. Run affected evaluations
6. Archive this review in `kaizen/continuous-improvement.md`

---

## The 10 Questions

Copy this block each Friday. Fill in each field. Empty fields are not acceptable — write "None this week" if truly nothing applies.

```
WEEKLY KAIZEN — Week of: {{YYYY-MM-DD}}
Completed by: {{name}}
Time spent: {{minutes}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q1. WHAT PREDICTION WAS WRONG?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Log this in kaizen/prediction-review.md's Weekly Log Entry instead of here — that file
holds the full prediction-tracking process (root-cause categorization against
kaizen/root-cause.md, calibration rollup). Paste its one-line summary below:

Summary: {{one line from kaizen/prediction-review.md's weekly entry}}

OS UPDATE NEEDED? {{Yes / No}}
If yes, what changes: {{which file, which section, what specifically}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q2. WHAT BLOCKER SURPRISED US?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Blocker that emerged: {{describe it}}
Was any signal available earlier? {{Yes / No — if yes, what was the signal}}
Why wasn't it caught? {{OS gap / missed input / new type of blocker}}
Could a feature scenario have predicted this? {{Yes / No}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: {{add to risk register / update feature threshold / add new scenario}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q3. WHICH RECOMMENDATION WORKED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recommendation: {{what the OS or EM recommended}}
Outcome: {{what happened as a result}}
Why it worked: {{was it the right model, the right timing, the right framing}}
Should this be reinforced in the OS? {{Yes / No}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: {{strengthen this pattern in the relevant skill or playbook section}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q4. WHICH RECOMMENDATION FAILED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Recommendation: {{what was recommended}}
What happened instead: {{the actual outcome}}
Why it failed: {{wrong model / wrong timing / missing context / correct advice ignored}}
Was the failure the OS's fault or execution's fault? {{OS / Execution / Both}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → log in kaizen/failures.md with full entry

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q5. WHICH ENGINEERS GREW?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Engineer(s): {{name or role, anonymized if shared}}
What growth was observed: {{specific behavior, decision, or output at a higher level}}
What enabled the growth: {{coaching, opportunity, autonomy, challenge}}
Should this pattern be captured in the OS? {{Yes / No}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → log in memory/career/ or memory/mentoring/ (whichever fits: the person's trajectory vs. the coaching approach that worked) with the pattern that produced growth

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q6. WHICH INCIDENTS REPEATED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Incident: {{description or ID}}
Prior occurrence: {{date of last occurrence}}
Root cause: {{was it the same root cause as before?}}
Were post-mortem action items completed? {{Yes / No / Partial}}
If No: why not? {{never prioritized / owner left / complexity}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update incidents.feature with @critical @recurring scenario
         → log the pattern in kaizen/failures.md, not memory/ (incident recurrence is ops
           tracking, not a leadership/relational pattern — see memory/schema.md's "What This
           Module Is Not")
         → escalate open action items to next sprint as P0

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q7. WHAT SHOULD THE PLAYBOOK CHANGE?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Log this in kaizen/playbook-review.md's Weekly Log Entry instead of here. Paste its
one-line summary below:

Summary: {{one line from kaizen/playbook-review.md's weekly entry}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update docs/engineering-playbook.md directly if High confidence
         → flag as candidate if Medium or Low — revisit next month

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q8. SHOULD ANY SKILL BE UPDATED?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Log this in kaizen/skill-review.md's Weekly Log Entry instead of here. Paste its
one-line summary below:

Summary: {{one line from kaizen/skill-review.md's weekly entry}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update the specific section of the skill file
         → update the corresponding golden output in evaluations/golden/
         → re-run the regression scenarios for that skill

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q9. SHOULD THRESHOLDS CHANGE?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Threshold that fired too early (false positive): {{which scenario, which threshold}}
Threshold that fired too late (false negative): {{which scenario, which threshold}}
Evidence for recalibration: {{data points that suggest the threshold is wrong}}
Proposed new threshold: {{new value}}
Confidence in proposed change: {{High / Medium / Low — do not change with Low}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update the Examples table in the relevant .feature file
         → update the skill's Analysis section if the threshold appears there
         → run regression suite to verify no golden scenarios break

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Q10. SHOULD PROMPTS IMPROVE?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Prompt or subagent that produced output that needed significant editing: {{which subagent}}
What was wrong with the output: {{too vague / wrong format / missed key point / wrong confidence}}
Root cause: {{instruction gap / missing context / ambiguous directive}}
Proposed prompt change: {{specific addition, removal, or rewrite}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → log in kaizen/prompt-review.md with full diagnosis
         → update the relevant subagent file
         → verify the Constraints section reflects the new guidance
```

---

## Update Cascade

Execute updates in this order. Do not skip steps. Do not reverse the order.

Reordered from the original Memory-first sequence: memory now records the outcome of the other updates rather than preceding them — a lesson is only worth recording once the playbook/prompt/skill layer it applies to has actually been fixed.

```
STEP 1 — PLAYBOOKS (highest impact — affects the reference standard)
├── Update docs/engineering-playbook.md for High-confidence changes only (see kaizen/playbook-review.md)
├── Update docs/principles.md only if a principle proved wrong in practice (quarterly decision — see kaizen/quarterly-review.md Part 3)
└── Log the change in kaizen/continuous-improvement.md with the week's reference

STEP 2 — PROMPTS (affects agent behavior)
├── Update subagent Constraints section for new Never/Always rules
├── Update subagent Output Contract if format was wrong — and bump contracts/subagent.contract.md's Version if the Output Contract itself changed shape
└── Log all prompt changes in kaizen/prompt-review.md

STEP 3 — SKILLS (affects agent outputs)
├── Update the specific section identified in kaizen/skill-review.md
├── Update the Failure Modes section if a new failure mode was discovered
├── Bump the skill's contracts/*.md Version if Required Outputs or Failure Conditions changed
└── Preserve the skill's golden output file — update it only if the new output is clearly better

STEP 4 — MEMORY (records the outcome of the above)
├── Add a MEMORY ENTRY (per memory/schema.md) to the relevant domain — executive/, stakeholders/,
│   career/, conflicts/, mentoring/, promotions/, architecture/, roadmaps/, customer-feedback/,
│   decision-history/, retrospectives/, or em-self-development/ — not a generic "lessons" file;
│   every entry belongs to exactly one domain
├── Incident recurrence goes in kaizen/failures.md, not memory/ (memory/ is leadership/relational
│   patterns only — see memory/schema.md's "What This Module Is Not")
├── Engineer growth observed → memory/career/ or memory/mentoring/ depending on whether the
│   entry is about the person's trajectory or the coaching approach that worked
├── Decision outcome tracked → memory/decision-history/ (leadership-lesson angle) and/or
│   decision-memory/ (formal record) — cross-link both if the decision was significant enough
│   for a full decision-memory/ record
├── Retrospective themes, action item completion, or sentiment shift → memory/retrospectives/
│   (use the domain-specific fields in retrospective-memory.md; set Recurring theme flag if
│   the same theme appeared in the prior 90 days)
├── EM's own growth edge, pressure default, or skip-level-as-subject signal → memory/em-self-development/
│   (if Q9 named EM behavior as the thing to change, also trigger commands/em-growth.md this month)
└── DECAY MAINTENANCE (run once per week, takes < 5 minutes)
    ├── Scan any domain file you added an entry to this week
    ├── Are there entries now 90–180 days old with no confirmation? → add [WATCH] tag
    ├── Are there entries now > 180 days old with no confirmation? → add [STALE] note
    │   with archive deadline (entry date + 270 days)
    └── Did a context shift occur this week (reorg, role change, person left/joined)?
        → Add [CONTEXT-EXPIRED] note to all affected entries immediately; do not wait
           for monthly review

STEP 5 — EVALUATIONS (validation — confirm changes didn't break anything)
├── Run regression scenarios for every skill that was updated
├── Compare outputs against evaluations/golden/ reference outputs
├── Flag any golden output that is now outdated
└── Log evaluation results in evaluations/regression/{{YYYY-MM-DD}}-results.md
```

---

## Archive Entry

After completing the review, add one line to `kaizen/continuous-improvement.md`:

```
| {{YYYY-MM-DD}} | {{changes made}} | {{Q numbers that drove changes}} | {{evaluation result}} |
```

---

## Calibration Check

Once per month, answer these about the weekly review itself:

- Are the 10 questions surfacing real insights or becoming checkbox exercises?
- Is the update cascade being executed or just planned?
- Are evaluation results improving week-over-week?
- Is the OS being used to run the review, or is it being bypassed?

If three or more answers are negative, the weekly review process itself needs kaizen.
