# Command: EM Growth

**Trigger**: Monthly (first Friday), or after a significant leadership event (pressure decision, skip-level, difficult message, EM-as-subject feedback)
**Owning Subagent**: `engineering-manager`
**Loop**: `loops/em-growth-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above.

Output is **private**. Log to `memory/em-self-development/`. Do not send to stakeholders.

```
./bin/em-os run em-growth
```
