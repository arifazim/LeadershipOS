# Command: Crisis

**Trigger**: A management crisis is unfolding (people, executive trust, cross-team, org shock, or delivery-trust). Not a technical P1/P2 — those use `commands/incident.md`.
**Owning Subagent**: `engineering-manager`
**Loop**: `loops/crisis-loop.md`

This command is a thin entry point. All orchestration logic — trigger conditions, steps, routing, failure modes — lives in the loop file above.

Per `subagents/engineering-manager.md`: an active **technical** incident still pre-empts this command. If both are true, run `incident` first, then `crisis` for the human/org blast radius.

```
./bin/em-os run crisis
./bin/em-os run "A senior engineer just resigned and the team does not know yet"
```
