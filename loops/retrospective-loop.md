# Loop: Retrospective

**Cadence**: Sprint end / post-incident
**Reusable by**: `delivery-manager`, `incident-manager`, `engineering-manager`
**Command entry point**: `commands/retrospective.md`

## Purpose

Improve the system, not vent about it — per `docs/engineering-playbook.md`'s "Running Retrospectives" section. A retro that produces no change is worse than no retro.

## Trigger Conditions

- Sprint end (runs after `sprint-loop`'s review step)
- Post-incident, for incidents severe enough to warrant blameless retrospective (runs after `incident-loop`'s post-mortem step)

## Steps

1. **Gather inputs** — Sprint or incident data already produced by `sprint-loop` / `incident-loop` — this loop does not re-gather from integrations directly
2. **Invoke skills** — `skills/conflict/blameless-retrospectives.md` for incident-triggered retros; sprint-process retros use the "Running Retrospectives" structure directly
3. **Route to subagent(s)** — `delivery-manager` (sprint retro) or `incident-manager` (incident retro); `engineering-manager` if the retro surfaces a cross-team systemic issue
4. **Produce output** — Action items with named owners; no dedicated template exists yet — closest is `templates/sprint-review.md`'s structure, adapted
5. **Log outcome** — Action items tracked; if unresolved by the next cycle, escalate per `kaizen/weekly-review.md` Q6/Q7. Log any durable process lesson to `memory/lessons/`

## Feature Reference

No dedicated feature file exists for this loop yet. Closest coverage: `features/incidents.feature` for incident-triggered retros.

## Failure Modes

- **No-change retro**: action items generated but never tracked to completion — worse than skipping the retro, since it signals feedback doesn't matter
- **Blame drift**: an incident retro that assigns blame instead of following `skills/conflict/blameless-retrospectives.md`'s structure

## Related Loops

- **sprint-loop**: retrospective-loop runs immediately after, same sprint data, different lens (process improvement vs. delivery reporting)
- **incident-loop**: retrospective-loop runs after the post-mortem step for high-severity incidents
