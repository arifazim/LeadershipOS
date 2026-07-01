# Contract: Meeting

**Flagship skill**: `skills/meetings/meeting-planner.md`
**Category**: skills that run inside or govern a meeting's structure — also applies to `skills/meetings/agenda-builder.md`, `decision-log.md`, `action-items.md`, `executive-meeting.md`, `staff-meeting.md`, `architecture-review.md`, `retrospective.md`

```
Contract
  Name:                Meeting Planner
  Owner:                subagents/engineering-manager.md
  Inputs:
    Required:          Purpose statement (one sentence), required outcome, candidate
                        attendee list
    Optional:           Prior meeting history, async alternatives already tried, decision
                        urgency
  Required Outputs:      Meeting Planning Brief — Necessity Test result (PASS/FAIL/DEFER),
                        Meeting Classification (type + decision type + format + duration),
                        Attendee Design (Driver/Approver/Contributors/Informed + cost
                        estimate), Pre-Read requirement + owner + timing
  Failure Conditions:    Purpose cannot be stated in one sentence (do not schedule) | Type 1
                        (irreversible) decision meeting with no Approver identified | Outcome
                        achievable async (necessity test FAILs — produce the async path, not
                        a meeting brief)
  Quality Checks:        Async alternative explicitly evaluated before scheduling | Attendee
                        list passes the Contributor test (every invitee materially changes
                        the outcome) | Pre-read sent 48h before for Decision-type meetings |
                        Meeting cost (attendees x time x rate) weighed against outcome value
  Version:               1.0
```

## Applies Also To

Every `skills/meetings/*.md` file inherits this contract's spirit — a meeting-governing skill must always evaluate the async alternative first and never produce a plan for a meeting that fails its own necessity test. `decision-log.md` and `action-items.md` are downstream of this contract (they fire once `meeting-planner.md`'s brief exists), not independent entry points.
