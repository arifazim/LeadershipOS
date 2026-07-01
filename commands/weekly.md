# Command: Weekly

**Trigger**: Sprint boundary (planning at start, review at end)
**Owning Subagent**: `delivery-manager`
**Loop**: `loops/sprint-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above. For rolling cross-sprint trend rather than a single sprint, see `loops/delivery-loop.md` instead.
