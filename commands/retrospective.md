# Command: Retrospective

**Trigger**: Sprint end, or post-incident for high-severity incidents
**Owning Subagent**: `delivery-manager` (sprint) or `incident-manager` (incident)
**Loop**: `loops/retrospective-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above.
