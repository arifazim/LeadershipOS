# Command: Executive

**Trigger**: Scheduled executive status cadence, or on-demand before board updates/skip-levels
**Owning Subagent**: `executive-summary`
**Loop**: `loops/executive-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above.
