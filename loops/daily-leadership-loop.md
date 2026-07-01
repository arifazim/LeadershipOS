# Loop: Daily Leadership

**Cadence**: Daily, at standup time
**Reusable by**: `engineering-manager` (primary), `delivery-manager`, `incident-manager`
**Command entry point**: `commands/daily.md`

## Purpose

Run the daily blocker-surfacing cycle described in `docs/engineering-playbook.md`'s "Running Standups" section, and route any blocker that can't be resolved on the spot to the right specialist loop instead of letting it sit until the next ceremony.

## Trigger Conditions

- Daily standup time arrives
- A blocker is raised outside of standup and needs the same triage logic applied immediately

## Steps

1. **Gather inputs** — Board state via `integrations/jira.md`; PR status via `integrations/github.md`
2. **Invoke skills** — none directly; this loop is pure triage/routing, not analysis
3. **Route to subagent(s)** —
   - Blocker is delivery-related → `delivery-manager`
   - Blocker involves an active incident → `incident-manager` (see `incident-loop.md`)
   - Same blocker flagged 3 days running by the same person → escalate to `engineering-coach` for a 1:1 follow-up, not another standup mention
   - Everyone blocked on the same thing → flag as a systemic risk to `engineering-manager`, not an individual blocker
4. **Produce output** — No formal template; this is an ephemeral ceremony. If a blocker recurs, it becomes an entry in the next step.
5. **Log outcome** — If a blocker pattern repeats, log to `memory/incidents/` (if incident-adjacent) or `memory/lessons/` (if process-adjacent)

## Feature Reference

No dedicated feature file exists for this loop yet. Closest coverage: `features/delivery.feature` (blocker-related scenarios).

## Failure Modes

- **Status theater**: standup becomes a progress report instead of blocker surfacing — see `docs/engineering-playbook.md` Failure Modes for "Running Standups"
- **Silent escalation gap**: a recurring "no blockers" answer is treated as healthy instead of triggering the 1:1 follow-up in Step 3

## Related Loops

- **sprint-loop**: daily-leadership-loop feeds it — blockers unresolved by sprint end become sprint-review input
