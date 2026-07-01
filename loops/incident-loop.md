# Loop: Incident

**Cadence**: On-trigger (P1/P2 declared) through post-mortem follow-up
**Reusable by**: `incident-manager` (primary), `engineering-manager`, `tech-lead`
**Command entry point**: `commands/incident.md`

## Purpose

Run the full incident lifecycle — detection through post-mortem action-item tracking — and catch repeats before they become a pattern, per `docs/engineering-playbook.md` and `kaizen/weekly-review.md` Q6.

## Trigger Conditions

- A P1 or P2 incident is declared (takes routing priority — see `subagents/engineering-manager.md` Routing Logic, which checks for active incidents first)
- A post-mortem action item's due date arrives

## Steps

1. **Gather inputs** — Alert and on-call data via `integrations/pagerduty.md`; system health via `integrations/datadog.md`
2. **Invoke skills** — incident triage and post-mortem skills under `skills/` operations (analysis depth scales with severity)
3. **Route to subagent(s)** — `incident-manager`; `tech-lead` if root cause is architectural (may hand off to `architecture-reviewer`)
4. **Produce output** — `templates/incident-review.md`
5. **Log outcome** — Incident recurrence tracking lives in `kaizen/failures.md` (check there first, not `memory/`, per `memory/schema.md`'s "What This Module Is Not" — leadership memory is not an ops-incident tracker). If the root cause matches a prior entry, escalate per `kaizen/weekly-review.md` Q6 ("escalate open action items to next sprint as P0"). Only write to `memory/architecture/` if the incident reveals an architectural risk-underestimation pattern worth leadership-level recall.

## Feature Reference

`features/incidents.feature`

## Failure Modes

- **Action item drift**: post-mortem action items logged but never tracked to completion — this loop's Step 5 exists specifically to close that gap
- **Root-cause repeat blindness**: treating a recurring incident as new because `kaizen/failures.md` wasn't checked first

## Related Loops

- **retrospective-loop**: runs after this loop's post-mortem step for incidents severe enough to warrant a blameless retrospective, not just an action-item log
- **daily-leadership-loop**: routes any blocker that's actually an active incident here
