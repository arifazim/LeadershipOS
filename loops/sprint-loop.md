# Loop: Sprint

**Cadence**: Sprint boundary (planning at start, review at end)
**Reusable by**: `delivery-manager` (primary), `engineering-manager`, `tech-lead`
**Command entry point**: `commands/weekly.md`

## Purpose

Run the sprint planning → execution → review cycle per `docs/engineering-playbook.md`'s "Running Sprint Planning" section, and produce a DORA/SPACE-anchored sprint review.

## Trigger Conditions

- Sprint planning day arrives
- Sprint end / review day arrives
- Mid-sprint scope change large enough to require a re-plan

## Steps

1. **Gather inputs** — Sprint backlog and story points via `integrations/jira.md`; PR cycle time and deployment frequency via `integrations/github.md`
2. **Invoke skills** — `skills/delivery/review-sprint.md`
3. **Route to subagent(s)** — `delivery-manager`; escalate to `engineering-manager` if the review surfaces a people or incident issue outside delivery's scope
4. **Produce output** — `templates/sprint-review.md`
5. **Log outcome** — Compare against `evaluations/golden/sprint-review-{healthy,critical}.md`; log any scope trade-off decision to `memory/decision-history/` (matches its own Query Routing Table: "What happened when we tried [approach] before?")

## Feature Reference

`features/sprint.feature`

## Failure Modes

- **Commitment theater** / **estimation theater** / **missing dependencies** — see `docs/engineering-playbook.md` Failure Modes for "Running Sprint Planning"

## Related Loops

- **delivery-loop**: sprint-loop is the single-sprint ceremony; delivery-loop is the rolling, cross-sprint DORA/trend read. Don't use sprint-loop to answer "is our delivery health trending up or down" — that's delivery-loop's job.
- **daily-leadership-loop**: feeds unresolved blockers into this loop's review step
- **retrospective-loop**: runs immediately after this loop's review step, using the same sprint data but focused on process improvement rather than delivery reporting
