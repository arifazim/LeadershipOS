# Loop: EM Growth

**Cadence**: Monthly (first Friday of each month, or the Friday closest to the 1st)
**Reusable by**: `engineering-manager` (primary and only owner — this loop is inward-facing)
**Command entry point**: `commands/em-growth.md`

## Purpose

Develop the EM's own leadership capability through deliberate monthly reflection — using the OS's accumulated context (decision history, failure log, kaizen outputs, leadership health scores) to surface patterns in the EM's own behavior that would not be visible in the day-to-day.

Unlike all other loops in this OS, the output of this loop is not a team artifact. It is a private record that feeds `memory/em-self-development/` and drives the EM's own growth edge for the next month.

**Why this loop exists**: Every loop in this OS helps the EM develop their team. None of them, until v0.7, helped develop the EM. An OS that improves the team but not the person running it has a fundamental blind spot. This loop closes it.

## Trigger Conditions

- Monthly cadence (first Friday of the month, after the weekly kaizen review)
- After any significant leadership event: difficult message delivered, pressure decision made, skip-level conducted, political signal surfaced, executive trust score shift
- After a failure log entry where EM behavior is identified as an execution fault

## Steps

1. **Gather inputs** (15 minutes)
   - Read `kaizen/weekly-review.md` Q9 ("what would I do differently") entries from the last 4 weeks
   - Read `kaizen/failures.md` — all entries from the last 90 days where EM behavior was the execution fault or a contributing factor
   - Pull the most recent `skills/leadership-health/leadership-health-engine.md` score — note dimensions below 60/100
   - Pull the last 3 decisions from `decision-memory/` — if no formal records, use mental inventory
   - Read prior `memory/em-self-development/` entry (if exists) — specifically: was last month's growth edge applied?

2. **Invoke skills**
   - `skills/mentoring/em-self-coaching.md` — core analysis: dominant default identification, situation weakness, prior growth edge loop close, this month's growth edge
   - (optional, if skip-level occurred this month) `skills/mentoring/skip-level-facilitation.md` synthesis — any EM-as-subject signals feed directly into self-coaching Step 3
   - (optional, if pressure decision occurred) `skills/executive/pressure-decision-framework.md` log review — pattern flag entries feed into self-coaching Step 3

3. **Route to subagent(s)**
   - `engineering-manager` (self — this loop is not delegated to a specialist)
   - No external routing; the EM is both the subject and the practitioner of this loop

4. **Produce output**
   - Monthly self-coaching report (from `skills/mentoring/em-self-coaching.md` output template)
   - One growth edge for the coming month — specific, executable, tied to identified pattern
   - Prior growth edge loop close — graduated / continue / rewrite assessment

5. **Log outcome**
   - Write entry to `memory/em-self-development/` using the schema below
   - If a graduated growth edge closes (behavior changed consistently): also log to `memory/mentoring/` as a durable leadership capability note
   - If a failure pattern closes (root cause that was repeating no longer appears in Q9): add a closure note to `kaizen/failures.md`'s relevant entry (Status: Fixed)

## Memory Entry Schema (em-self-development/)

```
ID: EMG-YYYY-MM
Date: {{date}}
Domain: em-self-development
Month: {{month name}}

Dominant default identified: {{default name}}
Evidence: {{sources — failure log / kaizen Q9 / decision history / leadership health}}
Situation weakness: {{situation type 1–7}}

Prior growth edge:
  Edge: {{description or "first month"}}
  Applied: {{N of trigger situations}} / {{total trigger situations}}
  Assessment: {{Graduated / Continue / Rewrite}}
  Key instance: {{specific}}

This month's growth edge:
  "When [trigger], I will [behavior] instead of [default]."
  Confidence: {{High / Medium / Low}}
  Review date: {{first Friday next month}}

Patterns closing this month: {{list or "none"}}
Linked failures closed: {{FAIL-NNN list or "none"}}
```

## Feature Reference

`features/em-growth.feature` — monthly self-coaching, prior-edge close, mock-metrics caveat, cadence overdue. Crisis application: `features/crisis-management.feature`.

## Failure Modes

- **Self-congratulatory loop**: EM reads the inputs and concludes everything is going well. Signal: no growth edge set, or growth edge targets an area where the EM already performs well. Fix: require the growth edge to connect to the lowest leadership-health dimension or the most common kaizen Q9 theme — whichever is less comfortable.

- **Vague growth edge**: "I will communicate more proactively." This cannot be assessed. Fix: apply the three-question test from em-self-coaching.md Step 4. If "Can I do this tomorrow?" is not a clear yes, rewrite.

- **No loop close**: Each month a new growth edge is set without assessing the prior one. Fix: prior growth edge assessment is a mandatory gate before a new edge is set. `skills/mentoring/em-self-coaching.md` Step 5 is non-skippable.

- **Data absence**: No decision history, no failure log entries, no kaizen Q9 answers. Fix: the loop runs even with minimal data — but confidence is reduced and the growth edge is tagged as low-confidence. The answer to "I don't have enough data" is not to skip the loop — it is to run it with lower confidence and invest in building the data source.

- **Private but invisible**: The growth edge is set and logged but never referenced again until next month. Fix: the growth edge must appear in the EM's weekly kaizen review Q10 ("what am I practicing this week") for at least 3 of the 4 intervening weeks.

## Related Loops

- **career-loop**: career-loop develops the EM's direct reports; em-growth-loop develops the EM. Both are monthly in cadence but serve opposite directions.
- **retrospective-loop**: team retrospectives surface system problems; em-growth-loop surfaces EM behavior problems. Both produce action items with owners and dates.
- **prediction-loop**: prediction-loop improves the OS's forecasting calibration; em-growth-loop improves the EM's leadership calibration. Both are learning loops, not delivery loops.
