# Golden Output: Crisis — Key Person Departure (Healthy)

**Skill / Loop**: `loops/crisis-loop.md` via `commands/crisis.md`
**Scenario**: `features/crisis-management.feature` → `@healthy` — "Key Person Departure — handled with dignity and speed"
**Status**: Simulated (v0.7 leftover close)

This is the reference output when the crisis loop is run against a resignation that was communicated in the correct order.

---

## Input

```
Crisis type: people
Event: Senior engineer announced resignation to the EM today
Manager informed first: yes
Team members told by EM within 24h: yes
Transition plan within 48h: yes
```

---

## Expected Output

STATUS: Green
CONFIDENCE: High — 90%

SUMMARY:
A key-person departure was handled in the correct communication sequence. Manager knew before the grapevine. Affected teammates heard it from the EM. A 48-hour transition plan exists. The remaining risk is bus-factor, not trust.

RECOMMENDATIONS:
- Immediate: Log succession gap; name backup owner for the departed engineer's systems
- This week: Update bus-factor assessment; brief the team on coverage, not gossip
- Systemic: Feed this event into next `em-growth-loop` if the EM delayed the manager conversation

RISKS:
- Knowledge concentration: Medium | High | Pair the backup owner on remaining work this sprint
