# Loop: Architecture

**Cadence**: Per ADR / architecture review cycle
**Reusable by**: `tech-lead` (primary), `architecture-reviewer`, `engineering-manager`
**Command entry point**: none — invoked directly when an architecture decision or review is needed

## Purpose

Run an architecture decision or review: surface the technical risk, produce the ADR-level output, and — if the audience is executive — hand off to a presentation-ready deck.

## Trigger Conditions

- A significant architectural decision needs review before commitment
- Scheduled architecture review cadence
- `confidence-engine/architecture_confidence.md` needs current risk evidence

## Steps

1. **Gather inputs** — System stability and change-failure data via `integrations/datadog.md`; prior ADRs
2. **Invoke skills** — architecture risk assessment (routed through `tech-lead` to `architecture-reviewer` for ADR-level review, per `subagents/engineering-manager.md`'s routing table)
3. **Route to subagent(s)** — `tech-lead` first; `architecture-reviewer` for the ADR review itself
4. **Produce output** — ADR-level review output; `skills/presentation/architecture-review-deck.md` if the result needs to go to an executive or cross-team audience
5. **Log outcome** — `memory/architecture/` (exact domain match) for the leadership/risk-pattern angle; also promote to `decision-memory/` for the formal decision record, since architectural decisions are rarely cheaply reversible — cross-link both entries per `memory/schema.md`'s cross-domain linking convention

## Feature Reference

`features/architecture.feature`

## Failure Modes

- **Irreversibility blindness**: treating an architectural decision as easily reversible when it isn't — always assess reversibility explicitly before logging the outcome
- **Review theater**: an ADR review that rubber-stamps rather than surfaces real risk

## Related Loops

- **executive-loop**: consumes this loop's output when the decision needs executive framing, via the presentation-deck skill rather than the raw ADR
