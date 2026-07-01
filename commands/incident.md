# Command: Incident

**Trigger**: A P1 or P2 incident is declared
**Owning Subagent**: `incident-manager`
**Loop**: `loops/incident-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above. Per `subagents/engineering-manager.md`'s Routing Logic, an active incident takes routing priority over all other in-flight work.
