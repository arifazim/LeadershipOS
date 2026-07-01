# Loop: Career

**Cadence**: Ongoing, quarterly check-in
**Reusable by**: `engineering-coach` (primary), `engineering-manager`
**Command entry point**: none — invoked directly during 1:1 cadence

## Purpose

Run the multi-year career-direction conversation — what the person wants (IC/management/specialist/founder/pivot track), on what horizon, and what sponsorship or exposure they need — independent of whether a promotion cycle is currently open.

## Trigger Conditions

- Quarterly career check-in during 1:1 cadence
- A person's stated direction changes
- Career-development conversation surfaces a gap that should feed a future promotion-loop cycle

## Steps

1. **Gather inputs** — 1:1 history via `templates/one-on-one.md`; prior career-development notes
2. **Invoke skills** — `skills/people/career-development.md` (direction/horizon conversation); `skills/career/promotion/career-roadmap.md` (tactical gap-driven project sequencing, once a direction is set)
3. **Route to subagent(s)** — `engineering-coach`
4. **Produce output** — Updated career-development notes feeding the next `templates/one-on-one.md` cycle
5. **Log outcome** — `memory/coaching/` if a durable growth pattern emerged

## Feature Reference

`features/one-on-one.feature` (career-direction scenarios)

## Failure Modes

- **Altitude confusion**: running a promotion-cycle conversation (packet, calibration, timeline) when the person actually needs the broader direction conversation — check `Related Loops` before defaulting to promotion-loop
- **Direction without sponsorship**: identifying what someone wants without naming who needs to advocate for it

## Related Loops

- **promotion-loop**: career-loop is the ongoing conversation; promotion-loop is the bounded execution of one specific cycle once career-loop has established readiness and direction
