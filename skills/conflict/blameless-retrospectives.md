# Skill: Blameless Retrospectives

**Domain**: Conflict Resolution
**Owner**: `subagents/engineering-manager.md`
**Cadence**: After every significant incident, sprint failure, or delivery miss — and whenever post-mortem culture is producing blame rather than learning

---

## Purpose

Run retrospectives that find system failures and improve the system — without assigning individual blame, manufacturing false consensus, or producing action items that are never implemented. The blameless retrospective is the primary organizational mechanism for turning failures into capability.

**What the EM does automatically**: When facilitating a retrospective, the EM:
1. Establishes the blameless frame before the session begins — not as a nicety, but as a structural constraint
2. Applies the Five Whys to find system causes, not person causes
3. Uses the counterfactual test to distinguish person-specific failure from system failure
4. Separates problem-finding from solution-generating — they cannot happen simultaneously
5. Produces: Root cause, conversation strategy, risks, desired outcome, and follow-up actions

**Ethical principle**: "Blameless" does not mean "accountable to nothing." It means the unit of accountability is the system, not the individual. An engineer who caused an outage by following a process that didn't work is not to blame — the process is. An engineer who ignored a known procedure and caused an outage is accountable to the behavior, not the outage itself. Blameless retrospectives distinguish these. They are not tools for avoiding accountability — they are tools for directing accountability to what can actually be fixed.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Incident or failure description** | What happened, when, how it was detected, how it was resolved |
| **Timeline** | Sequence of events from first signal to resolution |
| **Participants** | Who was involved in the incident; who should be in the retrospective |

### Optional
| Input | Description |
|---|---|
| **Monitoring and alerting data** | What signals existed; which were acted on; which were missed |
| **Prior incidents** | Whether this is a first occurrence or a recurrence |
| **Contributing factors already identified** | What the team has already discussed informally |

---

## Analysis

### Step 1 — Establish the Blameless Frame

```
Before the session begins, the EM states the frame explicitly:

"The purpose of this retrospective is to understand how our systems and processes
produced this outcome — so we can change them. We are not here to determine who
made the wrong decision. We are here to understand why the decisions that were made
made sense to the people who made them at the time with the information they had.

If you find yourself thinking 'so-and-so should have known better,' that's a signal
to go one level deeper. What would have needed to be true for them to 'know better'?
That's the system failure."

Why this frame must be stated, not assumed:
  Without explicit framing, the default human behavior is attribution — assigning
  the failure to a person. The blameless frame doesn't come naturally; it must be
  installed at the start of every session.

Warning signs that the frame has broken down:
  ✗ Sentences starting with "{{Person}} should have..."
  ✗ Phrases like "mistake" or "error" attached to a person's name
  ✗ Agreement from everyone except the person being implicitly blamed
  ✗ Retrospective producing action items that are "don't do X" aimed at one person
```

### Step 2 — Build the Incident Timeline

```
The timeline is the foundation of a blameless retrospective.
It is not a narrative — it is a factual sequence of events.

Timeline format:
  {{Time}} | {{Event}} | {{Who observed or acted}} | {{What information was available}}

Example:
  14:02 | Deploy initiated | Release pipeline | No failures detected at trigger
  14:08 | Error rate spike in Checkout service | Monitoring | Below alerting threshold (5%)
  14:11 | Customer reports begin in support channel | Support team | Not yet visible to on-call
  14:19 | P1 incident declared | On-call engineer | First monitoring alert fires (15% error rate)
  14:47 | Rollback completed | Deployment team | Error rate returning to baseline
  15:03 | Checkout service at normal error rate | Monitoring | Incident resolved

Timeline rules:
  1. No judgments in the timeline — only facts and timestamps
  2. Every "should have known" must be answered by: "What information existed at {{time}}?"
  3. If the information existed and wasn't surfaced: system failure (alerting, dashboards, observability)
  4. If the information didn't exist: system failure (monitoring gap, knowledge gap in runbook)
```

### Step 3 — Apply the Five Whys for System Root Cause

```
Five Whys protocol:
  Start with the observed failure. Ask "Why?" five times.
  Each "Why?" must point to a system condition, not a person attribute.

Example:
  Incident: Checkout service had a 45-minute outage affecting 12% of transactions
  
  Why 1: The deployment included a breaking database schema change
  → Why did the deployment include a breaking schema change?
  
  Why 2: The schema migration was not tested against production data volume
  → Why wasn't it tested against production data volume?
  
  Why 3: Our staging environment uses a 1% sample of production data
  → Why does staging use only 1% of production data?
  
  Why 4: Full-scale staging was deemed too expensive when the environment was built 3 years ago
  → Why hasn't this been revisited?
  
  Why 5: There is no defined process for reviewing environment assumptions as the system scales
  ROOT CAUSE: No process for revisiting infrastructure assumptions as scale changes

System fix: Implement a quarterly environment assumption review
            (not "require engineers to test at production scale" — which they cannot, with existing infra)

When to stop before five:
  Stop when: "Why?" produces an answer that is the actual system condition to fix
  Do not force five iterations artificially — the goal is depth, not the number
```

### Step 4 — Apply the Counterfactual Test

```
The counterfactual test distinguishes person-specific failure from system failure:

Test: "Would a different engineer, with the same training, same information,
      and same process, have made the same decision?"

If yes: System failure. The engineer made a reasonable decision given the system they were in.
If no: The failure is person-specific. The behavior, knowledge, or process adherence
       is a gap in that individual. Address separately, outside the retrospective.

Example (system failure):
  "The engineer merged the PR without a test covering this path."
  Counterfactual: "Would another engineer have caught this?"
  Test: "Is there a required test gate in our CI pipeline for this path?"
  If no: System failure — the CI pipeline doesn't enforce what we expect
  Action: Add the gate; do not add "engineer must remember to write tests"

Example (person-specific):
  "The engineer ignored the runbook step that says 'verify rollback target before deploying'"
  Counterfactual: "Would another engineer following the runbook have caught this?"
  Test: Yes — the runbook step existed and was documented
  This is a process adherence failure specific to this individual
  Action: Address in a private conversation, not in the retrospective; not a system fix

Critical rule:
  Person-specific failures are addressed by the EM privately.
  They are NEVER addressed in the retrospective session.
  The retrospective is for system failures only.
```

### Step 5 — Generate Action Items That Fix Systems

```
Action item quality rubric:

Strong action (system fix):
  "Add a CI check that fails the build if a migration changes a non-nullable column
  without a corresponding default value"
  Why strong: The system enforces the constraint; human vigilance is not required

Weak action (behavior instruction):
  "Engineers should carefully review migration scripts before merging"
  Why weak: This existed implicitly before the incident; it didn't prevent the incident;
  it won't prevent the next one

Diagnostic question for every action item:
  "If we do this, will the next engineer who makes this mistake be caught by the system
  before it reaches production?" 
  If yes: Strong action
  If no: The action is behavioral instruction masquerading as a fix

Action item format:
  What: {{Specific change to system, process, or tool}}
  Why: {{Which root cause this addresses}}
  Owner: {{Single named person}}
  Due: {{Specific date}}
  Success signal: {{How we'll know this is done and working}}
  
  Every action item must have a single owner and a specific date.
  Action items without owners are intentions, not commitments.
```

---

## Decision Tree

```
What does the retrospective analysis reveal?

├── RECURRENCE — THIS HAS HAPPENED BEFORE
│   └── Prior retrospective produced action items; they were not implemented
│       Or: Prior retrospective identified root cause; root cause was not fixed
│       Do not run another retrospective on the same incident type without first asking:
│       "Why didn't our last fix hold?"
│       Frame: "We've had this type of incident before. Our post-mortem from {{date}}
│       produced these action items. Here's what happened to each one."
│       Root cause: The retrospective process itself may be broken

├── BLAME DYNAMIC DETECTED IN THE SESSION
│   └── The blameless frame has collapsed
│       EM intervenes immediately: "I want to pause. I'm hearing us move toward
│       attributing this to {{person}}. Let's apply the counterfactual test.
│       Would a different engineer in the same system have made the same choice?"
│       Redirect: From the person to the system condition that put them in that position

├── ACTION ITEMS ARE ALL BEHAVIORAL ("ENGINEERS SHOULD...")
│   └── The retrospective has not reached system root causes
│       Behavioral action items are a symptom of stopping Five Whys too early
│       Re-run the Five Whys from the behavioral action item:
│       "We said 'engineers should verify rollback target.' Why wasn't this verified?
│       What would need to be true for verification to happen without relying on memory?"

├── PERSON-SPECIFIC FAILURE DETECTED
│   └── Counterfactual test reveals: this failure is not reproducible with other engineers
│       Remove this thread from the retrospective — it is not a system issue
│       EM addresses it privately with the individual
│       "I want to separate two things: the system failures we're fixing together,
│       and a behavior I want to discuss with you separately."

├── ROOT CAUSE IS ABOVE TEAM AUTHORITY TO FIX
│   └── The system condition that caused the incident requires investment, tooling,
│       or cross-team change that the team cannot make alone
│       Document the root cause clearly; escalate with the retrospective output
│       Frame to leadership: "We've identified the root cause: {{condition}}.
│       The fix requires {{investment/authority/cross-team action}}. Here's the risk
│       if we don't address it."

└── RETROSPECTIVE COMPLETE — ACTION ITEMS ASSIGNED
    └── Each action item has: what, why, owner, due date, success signal
        Send written summary within 24 hours
        Review action item completion at next retrospective
        Track recurrence: if same incident type recurs, root cause was not fixed
```

---

## Output

### Retrospective Report

```
BLAMELESS RETROSPECTIVE — {{Incident/failure name}} — {{date}}

THE FIVE RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROOT CAUSE:
  Incident type: {{Outage | Delivery miss | Sprint failure | Process failure}}
  Root cause: {{System condition, not person attribute}}
  Five Whys conclusion: "The failure happened because {{system condition}}
  — not because of individual error. A different engineer in the same system
  would have faced the same failure conditions."

CONVERSATION STRATEGY:
  Blameless frame: {{Opening language used}} | Frame breakdown? {{Y/N}}
  Counterfactual test applied: {{Y/N}} | Result: {{System failure | Person-specific — handled separately}}
  Five Whys depth reached: {{N iterations}} | Root cause category: {{monitoring | process | tooling | knowledge | environment}}
  Person-specific issues detected and separated: {{Y/N}}

RISKS:
  Recurrence risk: {{High/Medium/Low}} — based on whether root cause has been fixed before
  Action item failure risk: {{Number of items without named owners or dates}}
  Blameless culture risk: {{Whether the session maintained the frame or drifted to blame}}

DESIRED OUTCOME:
  Minimum acceptable: {{At least one strong system fix with named owner and date}}
  Ideal: {{All root causes addressed with system-level fixes; team leaves with learning, not guilt}}
  Not achievable through retrospective: {{Person-specific behaviors; investment decisions above EM authority}}

FOLLOW-UP ACTIONS:
  Written summary sent: Within 24 hours
  Action item review: {{Date — at next retrospective or sprint}}
  Escalation: {{If root cause requires authority above EM — what and to whom}}
  Recurrence check: {{Date to verify fix is holding}}

INCIDENT TIMELINE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Time}} | {{Event}} | {{Actor/System}} | {{Information available}}

ROOT CAUSE ANALYSIS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Why 1: {{...}} | Why 2: {{...}} | Why 3: {{...}} | Why 4: {{...}} | Why 5: {{...}}
Root cause: {{System condition}}

ACTION ITEMS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Item | What | Why (root cause) | Owner | Due | Success signal | Type: Strong/Weak
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Blameless frame established at session start | Base: 65% |
| Five Whys applied to system root cause | +15% |
| Counterfactual test applied | +10% |
| Action items are system fixes (not behavioral instructions) | +10% |
| Person-specific issues separated and handled privately | +5% |
| Blame dynamic allowed in the session | −40% |
| Action items are behavioral instructions only | −25% |
| No counterfactual test applied | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Blame disguised as blameless** | Session names no individuals but the implicit target is clear; "the on-call engineer" treated as a category of one | Apply the counterfactual test explicitly. If the failure is reproducible with a different engineer, it's systemic. |
| **Behavioral action items** | Every action item says "engineers should..." | Rerun Five Whys from each item. System-level fix: what change to tools/process/structure produces the behavior automatically? |
| **Action items without owners** | Team agrees on ten action items; none has a named individual responsible | Unowned action items are not commitments. Name the owner before leaving the room. |
| **Five Whys stopped too early** | Why 1: "The engineer deployed without testing" → Action: "Add more testing" | Why didn't the system catch it? Why does the system allow untested deploys? Why is the CI gate optional? |
| **Retrospective with no follow-up** | Report written; action items logged; no review at next retrospective | Review completion at every subsequent retrospective until each item is confirmed closed. |

---

## References

- `skills/conflict/conflict-diagnosis.md` — Post-incident team tension often surfaces as conflict; diagnose before intervening
- `skills/conflict/team-alignment.md` — After a retrospective, team alignment may be needed to rebuild working agreements
- `skills/organizational/change-resistance.md` — Resistance to blameless process itself is a change resistance problem
- `kaizen/failures.md` — Retrospective learnings feed the OS improvement process

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/conflict/team-alignment.md` | Shared discovery-before-judgment structure; often invoked together after significant incidents |
| `skills/conflict/conflict-diagnosis.md` | Entry point for post-incident blame dynamics that have become interpersonal conflicts |
| `skills/organizational/alignment-health.md` | Execution alignment dimension is informed by retrospective health |
