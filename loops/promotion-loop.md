# Loop: Promotion

**Cadence**: Promotion cycle (typically semi-annual, per company calibration schedule)
**Reusable by**: `engineering-coach` (primary), `engineering-manager`
**Command entry point**: none — invoked directly when a promotion cycle opens

## Purpose

Execute one specific promotion cycle for a candidate: assess readiness, build the case, navigate calibration, deliver the outcome. This is execution of a bounded cycle, not the ongoing development conversation that precedes it (see `career-loop` for that).

## Trigger Conditions

- A promotion cycle window opens for a candidate
- A candidate's readiness score crosses the threshold in `skills/career/promotion/promotion-readiness.md` or the EM-side tracking in `skills/performance/promotion-readiness-tracking.md`

## Steps

1. **Gather inputs** — Prior 1:1 and performance history; impact evidence
2. **Invoke skills** — `skills/career/promotion/promotion-readiness.md` (self/IC-side score), `skills/performance/promotion-readiness-tracking.md` (EM-side monitoring signals), `skills/career/promotion/promotion-evidence.md`, `skills/career/promotion/impact-tracker.md`, `skills/people/promotion.md` (packet-building and calibration navigation)
3. **Route to subagent(s)** — `engineering-coach`; escalate to `engineering-manager` for calibration advocacy
4. **Produce output** — `templates/promotion.md` (currently an empty stub — see the deferred completion-debt project; until populated, use `subagents/engineering-coach.md`'s Promotion Case output contract directly)
5. **Log outcome** — `memory/promotions/` (primary domain, per its own Query Routing Table: "What evidence do I have for [engineer]'s promotion?") regardless of outcome, cross-linked to `memory/career/`; if the case was denied, log the specific gap to inform the next cycle

## Feature Reference

No dedicated feature file exists for this loop yet. Closest coverage: none directly — flagged as a gap for a future `features/promotion.feature`.

## Failure Modes

- **Hidden candidate**: a ready candidate never submitted because the EM didn't initiate — see `skills/performance/promotion-readiness-tracking.md`'s "hidden candidate" signal
- **Self/EM disagreement unresolved**: proceeding to calibration without reconciling a gap between self-assessment and EM assessment

## Related Loops

- **career-loop**: promotion-loop executes one cycle; career-loop is the ongoing conversation that determines whether and when a cycle should open
