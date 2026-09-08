# Loop: Crisis

**Cadence**: On-demand — activates when a management crisis (not a technical incident) is unfolding
**Reusable by**: `engineering-manager` (primary), `engineering-coach` (people crises), `delivery-manager` (delivery crises)
**Command entry point**: none — invoked directly; technical incidents use `incident-loop` instead

## Purpose

Navigate management crises — org shocks, team fractures, key-person departures, executive trust failures, or cross-team blowups — with the same discipline that technical incidents receive, but adapted for the human and organizational dynamics that technical incident runbooks do not address.

**The critical distinction from incident-loop**: `incident-loop` handles technical system failures: pages, outages, degradations. `crisis-loop` handles organizational and human system failures: the sudden resignation of a key engineer, an executive losing confidence in the team, a cross-team conflict that escalates past the EM's authority, a team member's mental health crisis, a reorg surprise that blindsides the team.

These events are management P1s. They deserve the same response discipline: immediate triage, clear role ownership, stakeholder communication, and a structured post-event review. Most EMs handle them by feel. This loop makes the response deliberate.

## Trigger Conditions

- **People crisis**: Key person departure (announced or suspected), team member in acute distress, flight risk materialized, performance situation escalated to HR
- **Executive trust crisis**: Skip-level surfaced serious EM concerns, confidence-engine score drops sharply, executive begins bypassing EM to access team directly
- **Cross-team crisis**: Interpersonal conflict has escalated past EM resolution authority, another team's leadership is taking action that affects your team without consultation
- **Org shock**: Reorg announcement, leadership change, layoff round announced, product cancellation
- **Delivery crisis**: A missed commitment has damaged stakeholder trust to the point where the business relationship — not the delivery itself — is at risk

**What this loop does NOT cover**:
- Technical incidents → use `incident-loop`
- Routine conflict → use `skills/conflict/`
- Standard reorg navigation → use `skills/organizational/reorg-navigation.md` (those are handled proactively; this loop activates when the event has already landed without warning)

## Steps

1. **Triage** (first 30 minutes — before any communication)
   - Classify the crisis type (people / executive trust / cross-team / org shock / delivery)
   - Identify who is directly affected and what they know right now
   - Identify who else needs to know and in what order (EM's manager, HR, peer EMs, team)
   - Assess: is this recoverable within the EM's authority, or does it require escalation?
   - **Do not communicate before this step is complete.** An uninformed communication in a crisis is worse than a short delay.

2. **Invoke skills** (concurrent with triage where possible)
   - **People crisis**: `skills/people/difficult-message-delivery.md` (if a hard message must be delivered), `skills/people/flight-risk-model.md` (to assess who else may be destabilized), `skills/people/trust-recovery-playbook.md`
   - **Executive trust crisis**: `skills/executive/executive-anxiety-detector.md` (to understand what the executive is actually worried about), `skills/executive/trust-building-cadence.md`
   - **Cross-team crisis**: `skills/conflict/stakeholder-resolution.md`, `skills/organizational/political-intelligence.md`
   - **Org shock**: `skills/organizational/reorg-navigation.md`, `skills/people/difficult-message-delivery.md` (for individual conversations within the team)
   - **Delivery crisis**: `skills/executive/pressure-decision-framework.md` (for commitments that must be made), `skills/executive/executive-communication.md`

3. **Route to subagent(s)**
   - **People crisis** → `engineering-coach` + `engineering-manager`
   - **Executive trust crisis** → `engineering-manager` (personal; not delegated)
   - **Cross-team crisis** → `engineering-manager` (initiate); `delivery-manager` if delivery commitments are at stake
   - **Org shock** → `engineering-manager` + `executive-summary` for upward communication
   - **Delivery crisis** → `delivery-manager` + `engineering-manager` for stakeholder communication

4. **Produce output** — three artifacts, in order:
   a. **Immediate communication plan**: who gets told what, in what order, by when — before any message is sent
   b. **Stabilization actions**: the 1–3 actions that reduce the blast radius in the next 24–48 hours (not a full fix — stabilization)
   c. **Recovery timeline**: a realistic timeline for when this crisis will be resolved, what "resolved" means, and the key milestones to get there

5. **Log outcome**
   - `memory/conflicts/` for people or cross-team crises
   - `memory/executive/` for executive trust crises
   - `decision-memory/` for any significant decision made during the crisis response
   - `kaizen/failures.md` if the crisis was avoidable and the OS or EM behavior contributed
   - `memory/em-self-development/` if EM behavior under pressure produced learning

## Crisis Communication Principles

```
These apply across all crisis types. Reference them before any communication goes out.

PRINCIPLE 1 — SEQUENCE BEFORE SPEED
  Communicate in the right order, not as fast as possible.
  Your manager hears from you before they hear from someone else.
  Affected individuals hear from you before the team does.
  Your team hears from you before they find out through another channel.
  Wrong sequence is worse than a short delay.

PRINCIPLE 2 — TRUTH BEFORE COMPLETENESS
  Communicate what you know, clearly, even if you don't know everything.
  "Here is what I know. Here is what I don't know yet. Here is when I'll know more."
  A communication that waits until you know everything is too late.

PRINCIPLE 3 — OWNERSHIP BEFORE EXPLANATION
  State what you are doing before explaining why the crisis happened.
  "Here's what I'm doing about this" comes before "here's how we got here."
  Explanation without action reads as defensive. Action reads as accountable.

PRINCIPLE 4 — CONTAIN BEFORE RESOLVE
  The first goal is reducing the blast radius, not fixing the root cause.
  A crisis that is contained is manageable. A crisis that has spread is exponentially harder.
  Define "contained" before you start: who needs to not hear about this yet,
  what channel needs to be closed, what narrative needs to be corrected.

PRINCIPLE 5 — NO SURPRISES UP
  Your manager learns about this from you, not from someone else.
  Even if you don't have answers yet: "I need to flag something.
  I'm in the middle of it. Here's what I know. I'll update you by [time]."
  A manager who learns about a crisis through a skip-level or a peer
  has a EM-trust problem on top of whatever the crisis was.
```

## Post-Crisis Review

Run a post-crisis review within 5 business days of stabilization (parallel to `retrospective-loop` after incidents).

Questions:
1. What was the earliest signal that this crisis was developing? Was it in the OS?
2. Did the response follow the sequence in this loop, or did it improvise?
3. What was the most expensive decision made during the crisis? Was it reversible?
4. What would have prevented this crisis from reaching the acute stage?
5. What one thing changes in the OS, the team's working model, or the EM's own behavior?

Output: a `kaizen/failures.md` entry if the crisis was preventable, or a `memory/` entry if it was navigated well and the pattern should be retained.

## Feature Reference

`features/crisis-management.feature` — behavioral specs for management crisis scenarios, to be created as part of v0.7 implementation (see `ROADMAP.md`).

## Failure Modes

- **Incident-loop confusion**: routing a people/org crisis to `incident-loop` because it feels like an emergency. The structures are incompatible — `incident-loop` assumes a technical system and a restoration goal; `crisis-loop` assumes a human system and a trust/relationship restoration goal.

- **Communicating before triage**: Sending a message to the team or to the executive before completing Step 1 (triage). Information vacuum + first-mover advantage for the wrong narrative is the worst outcome. Hold 30 minutes before communicating.

- **Solving before stabilizing**: Jumping to root cause and long-term fix before the immediate blast radius is contained. The first goal is always stabilization. Root cause comes after.

- **Under-communicating upward**: Not telling the manager until the crisis is resolved. This is the most common EM failure in a crisis and the most damaging to executive trust. The manager always finds out. They should find out from you, first.

- **No post-crisis review**: The crisis resolves, everyone moves on, and nothing is logged. The pattern recurs. Fix: the post-crisis review is mandatory for any crisis that consumed more than 4 hours of EM time.

## Related Loops

- **incident-loop**: handles technical system failures; crisis-loop handles human/org failures. They sometimes co-occur (a severe incident that also fractures team trust or triggers a leadership confidence crisis) — in that case, run both loops with separate owners.
- **em-growth-loop**: crisis response always surfaces EM behavior under pressure — the monthly self-coaching loop processes the pattern; crisis-loop handles the event.
- **stakeholder-loop**: during an org shock or delivery crisis, `stakeholder-loop`'s cadence accelerates and runs in parallel with `crisis-loop`.
- **retrospective-loop**: post-crisis review uses retrospective-loop's format; the crisis is the "incident" being reviewed.
