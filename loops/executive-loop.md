# Loop: Executive

**Cadence**: Weekly/monthly status, or on-demand before board updates and skip-levels
**Reusable by**: `executive-summary` (primary), `engineering-manager`, `delivery-manager` (feeds data)
**Command entry point**: `commands/executive.md`

## Purpose

Produce executive-ready communication that leads with the recommendation and confidence level, per `CLAUDE.md`'s Output Format directives — not a status dump.

## Trigger Conditions

- Scheduled executive status cadence
- Leadership has raised a question requiring an evidence-backed answer
- Before a board update, skip-level, or QBR

## Steps

1. **Gather inputs** — Output of `delivery-loop` (trend), `incident-loop` (recent incidents), `confidence-engine/executive_confidence.md` (trust assessment)
2. **Invoke skills** — `skills/executive/executive-status-report.md`; `skills/executive/executive-risk-report.md` if risk framing is the ask; `skills/executive/board-level-summary.md` if the audience is the board
3. **Route to subagent(s)** — `executive-summary`; pulls synthesized input from `delivery-manager`/`engineering-manager` if multiple domains are in scope
4. **Produce output** — `templates/executive-status.md`
5. **Log outcome** — Log to `memory/executive/` (primary domain for "how did [executive] respond to X?" per its own Query Routing Table), cross-linked to `memory/decision-history/` if the ask resulted in a commitment or trade-off; otherwise no memory write needed

## Feature Reference

No dedicated feature file exists for this loop yet. Closest coverage: `features/roadmap.feature` for roadmap-facing executive asks.

## Failure Modes

- **Burying the lede**: details before the summary — the single most common failure mode this loop exists to prevent
- **Confidence omission**: a recommendation without a stated confidence level is not a valid output of this loop

## Related Loops

- **delivery-loop**, **incident-loop**, **prediction-loop**: primary evidence sources for this loop's output
- **stakeholder-loop**: if the executive ask is really a stakeholder-alignment question, route there instead of forcing it through executive-loop's reporting shape
