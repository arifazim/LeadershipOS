# Skill: Decision Network

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (audit) + On-demand (initiative blocked, decision stalled, ownership dispute)

---

## Purpose

Map how decisions are actually made — who has authority, who must be consulted, who must be informed, and where decisions stall — so that engineering initiatives move through the organization with clarity rather than getting blocked by invisible gatekeepers or ambiguous accountability.

**What the EM does automatically**: When navigating a decision or diagnosing a stall, the EM:
1. Classifies the decision type and maps it to the appropriate authority level
2. Identifies who is currently being included and who is missing
3. Detects when a decision has stalled and names the structural reason
4. Distinguishes decisions engineering should own from those it should influence vs. inform
5. Recommends transparent process fixes — not routing around slow decision-makers

**Ethical principle**: Decision mapping is used to make processes clearer and more inclusive — not to identify how to push decisions through faster by limiting who has input. If a decision is legitimately stalling because a key voice hasn't been heard, the response is to hear that voice, not to accelerate past it.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Decision in question** | What needs to be decided; what has stalled or been reversed |
| **Organizational context** | Who owns the relevant domains; what approval processes exist |
| **Current state** | Who has been consulted; what positions have been expressed |

### Optional
| Input | Description |
|---|---|
| **Decision history** | How similar decisions have been made in the past |
| **Explicit approval processes** | Documented RACI, decision frameworks, or governance processes |
| **Known ownership disputes** | Areas where multiple parties believe they own the decision |

---

## Analysis

### Step 1 — Classify the Decision

Not all decisions require the same process. Over-including slows decisions. Under-including creates reversals.

```
Decision classification:

Type A — Engineering-owned technical decision
  Definition: Implementation approach, architecture choice, tooling selection
  Authority: Engineering (EM + lead); others consulted, not approvers
  Risk of misclassification: Asking for approval on decisions engineering should own
  Signal: If this is stalling in approval, it may be incorrectly escalated

Type B — Cross-functional decision requiring alignment
  Definition: Feature scope, launch timing, API contract, data ownership
  Authority: Joint — Engineering + Product (or relevant partner)
  Risk of misclassification: Engineering or partner acting unilaterally
  Signal: If one party is acting without the other's input, ownership is ambiguous

Type C — Organizational or investment decision
  Definition: Headcount, budget, roadmap priority, team structure
  Authority: EM + manager above EM; often requires VP+ sign-off
  Risk of misclassification: EM trying to resolve what requires escalation

Type D — Strategic decision with engineering input
  Definition: Company direction, product strategy, market entry
  Authority: Executive team; engineering provides technical possibility assessment
  Risk of misclassification: Engineering trying to own vs. inform a strategic decision
```

### Step 2 — Map the DACI for Each Decision

For every significant decision, map clearly:

```
DACI framework:
  Driver (D): The person responsible for moving the decision to completion
              One person only — shared drivers produce no driver
  Approver (A): The person with final authority to decide
                One person only — shared approvers produce deadlock
  Consulted (C): People whose input is sought before the decision
                 Multiple people allowed — but each adds time; be intentional
  Informed (I): People notified after the decision is made
                Do not confuse Informed with Consulted

Common failure modes in DACI:
  Multiple Approvers → Deadlock or inconsistent direction
  Driver = Approver → Unchecked unilateral decision
  Consulted list too long → Decision slows to lowest common denominator
  Informed people who should be Consulted → Reversals after announcement
```

### Step 3 — Detect Decision Stalls

A decision that isn't moving is blocked by something. Name it:

```
Stall type and root cause:

Missing Approver availability:
  Symptom: Decision waiting on a single person's calendar
  Root cause: Process not designed for the approver's bandwidth
  Response: Break decision into components; decide what can be decided now

Consulted party not responding:
  Symptom: Waiting for input that doesn't come
  Root cause: They don't know they're being consulted, or they're deprioritizing
  Response: Make the ask explicit with a deadline; offer to schedule a conversation

Ownership dispute (two Approvers):
  Symptom: Two parties each believe they approve this decision
  Root cause: Authority boundaries not defined; overlapping domains
  Response: Escalate to the shared authority above both — not to resolve the conflict,
  but to clarify which party owns it (see Signal: Ownership ambiguity)

Risk aversion (Approver won't decide):
  Symptom: Decision is complete; Approver continues to delay
  Root cause: Approver perceives risk and wants more certainty before committing
  Response: Reframe the options; present the cost of not deciding alongside decision options

Informal veto (non-Approver blocking):
  Symptom: Someone in the Consulted list is behaving as an Approver
  Root cause: Informal influence or unclear authority
  Response: Clarify authority transparently; do not escalate without first having a direct
  conversation with the person about their role in the decision
```

### Step 4 — Assess the Five Organizational Signals in Decision Context

```
Signal 1 — Frequent decision reversals
  Decision network cause: Informed party who should have been Consulted
  Diagnosis: After the reversal, ask "Who learned about this after it was decided?"
  Structural fix: Move that person from Informed to Consulted before the next decision

Signal 2 — Exclusion from key meetings
  Decision network cause: Engineering not in the Consulted or Driver role for technical decisions
  Diagnosis: Engineering receives pre-framed asks without having shaped the options
  Structural fix: Request role in decision process — Driver for Type A, Consulted for Type B

Signal 3 — Ownership ambiguity
  Decision network cause: DACI has multiple Approvers or no named Driver
  Diagnosis: Two people or teams each believe they own the same decision
  Structural fix: Convene both parties; assign one Approver; document

Signal 4 — Escalation patterns
  Decision network cause: Decision is stuck at a level that can't resolve it; reaching above
  Diagnosis: Repeated escalation on the same topic
  Structural fix: Identify the structural reason the lower level can't resolve it;
  fix the process, not just the individual escalation

Signal 5 — Misaligned incentives
  Decision network cause: Consulted party consistently blocks or delays because the decision
  adversely affects their metrics
  Diagnosis: Opposition is structural (incentive-based) not substantive
  Structural fix: Escalate the incentive misalignment, not the individual decision
```

---

## Decision Tree

```
What does the decision network analysis reveal?

├── DECISION STALLED IN APPROVER QUEUE
│   └── Diagnose before acting: Why isn't it moving?
│       Ask Approver directly: "What would help you feel confident deciding this?"
│       If waiting on information: provide it
│       If risk aversion: present cost of delay alongside options
│       If bandwidth: propose asynchronous decision process
│       Do NOT: Route around the Approver

├── TWO PARTIES EACH CLAIMING APPROVER ROLE
│   └── This is an organizational design problem, not a people problem
│       Do NOT: Try to mediate between two approvers
│       Do: Escalate with specific framing — "I'm getting conflicting direction from
│       {{A}} and {{B}} on who approves {{decision}}. I need one decision-maker."
│       Escalate to the lowest shared authority who can resolve it
│       → Invoke: skills/organizational/conflict-prediction.md

├── ENGINEERING IN INFORMED ROLE FOR TYPE A DECISIONS
│   └── Engineering should own technical decisions; being Informed is a demotion
│       Raise transparently: "I believe this is a Type A engineering decision.
│       Can we discuss what would need to be true for engineering to own this?"
│       If overridden: document the concern; proceed under direction; flag the risk

├── CONSULTED PARTY NOT RESPONDING (DECISION BLOCKED)
│   └── Send one explicit message with a deadline:
│       "I need your input on {{decision}} by {{date}} to keep the timeline.
│       If I don't hear back, I'll proceed with {{default option}}."
│       This is not a workaround — it's a process clarification with transparency

└── DACI IS CLEAR AND DECISIONS ARE MOVING
    └── Audit quarterly for any decisions that took >2 weeks and identify if DACI was the cause
        Document recurring decision patterns to reduce future friction
        → Invoke: skills/organizational/alignment-health.md for broader health check
```

---

## Output

### Decision Network Map

```
DECISION NETWORK — {{Initiative / Domain}} — {{date}}

DECISION REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision                 | Type | Driver  | Approver | Consulted        | Informed        | Status
{{decision}}             | A    | {{name}}| {{name}} | {{names}}        | {{names}}        | ✅ Clear
{{decision}}             | B    | UNCLEAR | {{A + B}}| {{names}}        | {{names}}        | ⚠️ Dual approver
{{decision}}             | C    | {{name}}| {{VP}}   | {{names}}        | {{names}}        | 🔴 Stalled (30 days)

STALLED DECISIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision: {{decision}}
Stall type: {{Missing approver | Ownership dispute | Consulted not responding | Risk aversion}}
Days stalled: {{N}}
Root cause: {{explanation}}
Recommended action: {{specific transparent step}}
Owner: {{who takes the action}}

SIGNALS DETECTED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Signal type}} — {{Decision context}} — Structural fix: {{action}}

PATTERN FLAGS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ Engineering in Informed role for {{N}} Type A decisions — should be Driver
⚠️ {{N}} decisions reversed in last quarter — Consulted list audit needed
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Decision type classified (A/B/C/D) | Base: 65% |
| DACI mapped per decision | +15% |
| Stall type diagnosed with root cause | +10% |
| Five signals assessed in decision context | +10% |
| Structural fixes recommended (not workarounds) | +5% |
| No DACI mapping | −25% |
| Routing-around recommended for stalled decisions | −30% (disqualifying) |
| No root cause analysis for stalls | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Multiple Approvers tolerated** | "Both {{A}} and {{B}} need to approve" | One Approver. Multiple Approvers produce deadlock or inconsistent direction. Escalate to assign one. |
| **Routing around slow Approvers** | Deciding without the named Approver to avoid delay | The cost of routing around is a reversal. Address the stall directly. |
| **Engineering misclassified** | Engineering in Informed role for architecture decisions | Classify before proceeding. Engineering's role in its own decisions is Driver or Approver, not Informed. |
| **Escalation as solution** | Every stall escalated up rather than diagnosed | Escalation solves the immediate instance; structural fixes prevent recurrence. Do both. |
| **DACI implicit** | Everyone assumes they know who approves what | Document DACI for decisions affecting more than one team. Assumptions create surprises. |

---

## References

- `skills/organizational/stakeholder-analysis.md` — Stakeholder roles translate to DACI roles
- `skills/organizational/influence-map.md` — Informal influences affect who is actually consulted
- `skills/organizational/conflict-prediction.md` — Ownership ambiguity in decision network predicts conflict

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/stakeholder-analysis.md` | Stakeholder map provides the people; decision network provides their roles |
| `skills/organizational/conflict-prediction.md` | Dual Approver and ownership ambiguity are conflict precursors |
| `skills/organizational/alignment-health.md` | Decision quality is a component of alignment health |
| `skills/organizational/political-risk.md` | Stalled decisions and routing-around create political risk |
