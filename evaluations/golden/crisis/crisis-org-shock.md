# Golden Output: Crisis — Org Shock Without Warning (Critical)

**Skill / Loop**: `loops/crisis-loop.md` via `commands/crisis.md`
**Scenario**: `features/crisis-management.feature` → `@critical` — "Org Shock Without Warning — layoff affects the EM's team"
**Status**: Simulated (v0.7 leftover close)

This is the reference output when a layoff lands without EM consultation.

---

## Input

```
Crisis type: org shock
Event: Layoff round affects the EM's team; EM was not consulted on selection
Remaining team knows a layoff occurred: yes
Time since announcement: 2 hours
```

---

## Expected Output

STATUS: Red
CONFIDENCE: Medium — 70%

SUMMARY:
This is a Critical org shock. The EM was not in the selection conversation, so the remaining team will test whether the EM is a messenger or a shield. Recovery in the first 48 hours is communication quality, not process.

RECOMMENDATIONS:
- Immediate (4h): Brief remaining team. Deliver each affected person's message directly. Do not let HR be the only touchpoint.
- Immediate: Invoke `skills/people/difficult-message-delivery.md` for individual conversations
- This week: Invoke `skills/people/trust-recovery-playbook.md`; log EMG entry for EM behavior under pressure
- Systemic: After 14 days, reassess sentiment; org shocks have delayed trust impact

RISKS:
- False resolution: High | High | Do not declare "we're fine" in week one
- Executive trust: Medium | High | Surface to manager what the team actually heard, not a softened version
