# Loop: Delivery

**Cadence**: Weekly, rolling (trend across multiple sprints)
**Reusable by**: `delivery-manager` (primary), `engineering-manager`, `confidence-engine` assessments
**Command entry point**: none — invoked directly by subagents, not through a command trigger

## Purpose

Track delivery health as a trend, not a single-sprint snapshot: deployment frequency, lead time, change failure rate, MTTR (DORA), and whether the trend is improving, flat, or degrading over the last N sprints.

## Trigger Conditions

- Weekly delivery health check
- Before an executive review that needs a trend line, not just last sprint's number (feeds `executive-loop`)
- `confidence-engine/delivery_confidence.md` needs current trend data as evidence

## Steps

1. **Gather inputs** — Historical PR/deployment data via `integrations/github.md`; historical sprint data via `integrations/jira.md`; incident history via `integrations/pagerduty.md`
2. **Invoke skills** — `skills/delivery/review-sprint.md` outputs, aggregated across sprints (this loop does not re-run the single-sprint skill, it trends its historical outputs)
3. **Route to subagent(s)** — `delivery-manager`
4. **Produce output** — Trend summary feeding `confidence-engine/delivery_confidence.md` and, on request, `templates/executive-status.md` via `executive-loop`
5. **Log outcome** — If the trend crosses a threshold (e.g. change failure rate rising 3 weeks running), log to `memory/lessons/`

## Feature Reference

`features/delivery.feature`

## Failure Modes

- **Snapshot bias**: treating one good or bad sprint as a trend — this loop exists specifically to prevent that; always require at least 3 data points before calling a direction
- **Metric gaming**: deployment frequency rising because releases were split into smaller, lower-risk chunks looks identical to genuine improvement — cross-check against change failure rate before concluding health improved

## Related Loops

- **sprint-loop**: delivery-loop consumes sprint-loop's historical outputs; it does not replace the single-sprint ceremony
- **executive-loop**: delivery-loop's trend output is a primary input when the executive ask is about trust in delivery, not just last sprint's status
- **prediction-loop**: delivery-loop's trend accuracy feeds prediction_confidence's estimation-reliability tracking
