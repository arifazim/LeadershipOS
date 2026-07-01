# Playbook Review

**Cadence**: Weekly (quick log) + reviewed for cumulative patterns monthly
**Extracted from**: `weekly-review.md` Q7
**Scope**: `docs/engineering-playbook.md` accuracy — distinct from the Principle Audit in `monthly-review.md` Part 5, which reviews `docs/principles.md`. The playbook is the operational "how"; principles are the foundational "why." Both are reviewed on a similar cadence but are conceptually separate documents and stay in separate files.

---

## Weekly Log Entry

```
PLAYBOOK REVIEW — Week of {{YYYY-MM-DD}}

Section of docs/engineering-playbook.md that proved wrong or incomplete: {{section name}}
What happened that the playbook didn't account for: {{situation}}
Proposed change: {{what should be added, removed, or reworded}}
Confidence that this change is correct: {{High / Medium / Low}}

OS UPDATE NEEDED? {{Yes / No}}
If yes: → update docs/engineering-playbook.md directly if High confidence
         → flag as candidate if Medium or Low — revisit next month
```

## Monthly Rollup

Review all playbook-review entries from the month:

```
Entries this month: {{count}}
Sections touched: {{list}}
High-confidence changes applied: {{count}}
Candidates still pending (Medium/Low confidence): {{count}} — carry forward or decide
```

A section of the playbook that gets flagged 2+ times in a quarter without being updated is a signal the playbook itself is stale in that area — escalate to a full section rewrite rather than another incremental patch.

## Update Cascade

Playbook updates happen early in the reordered cascade (Playbook → Prompt → Skill → Memory) — a wrong playbook section is usually the reason a prompt or skill produced bad guidance downstream, so fix it first.

## Archive

Log applied changes to `kaizen/continuous-improvement.md` tagged `playbook-updated`.
