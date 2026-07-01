# Skill: Stakeholder Resolution

**Domain**: Conflict Resolution
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — invoked when conflict crosses organizational boundaries (cross-team, cross-function, or cross-level)

---

## Purpose

Resolve conflict involving stakeholders across organizational boundaries — where the parties are not peers, not within the same team, or where the EM is one of the parties — by using structured escalation, transparent facilitation, and shared leadership involvement to reach decisions that both sides can execute on.

**What the EM does automatically**: When stakeholder conflict is detected, the EM:
1. Assesses whether engineering is a party, a facilitator, or a bystander in the conflict
2. Identifies the power dynamic and who has authority to resolve it
3. Determines whether the conflict requires peer-level engagement or must be escalated
4. Prepares a structured resolution proposal that names the decision to be made and who can make it
5. Produces: Root cause, conversation strategy, risks, desired outcome, and follow-up actions

**Ethical principle**: When engineering is a party to a cross-functional conflict, the EM cannot be neutral. This is not a failure — it is honest acknowledgment of the situation. The ethical path is to name the engineering perspective clearly, escalate the conflict to shared leadership transparently, and accept the decision. Using organizational dynamics to win a cross-functional conflict without surfacing it to leadership is manipulation, not resolution.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Conflict description** | What is in dispute between which parties and functions |
| **Engineering's position** | What engineering wants or needs in this conflict |
| **Power map** | Who has decision authority over the contested territory |

### Optional
| Input | Description |
|---|---|
| **Conflict diagnosis** | Output from `skills/conflict/conflict-diagnosis.md` — type, root cause, severity |
| **Prior escalation attempts** | What has been tried; how it was received |
| **Business stakes** | Whether this conflict is actively blocking delivery or threatening a relationship |

---

## Analysis

### Step 1 — Assess Engineering's Role in the Conflict

```
Three positions engineering can occupy in stakeholder conflict:

Position A — Engineering as Party
  Definition: Engineering wants something that another function resists,
  or another function wants something engineering resists
  Examples: Product wants features shipped on a timeline engineering can't meet;
            Infra team wants engineering to migrate to a new platform by Q3;
            Legal requires changes to architecture engineering believes are unnecessary
  EM role: Advocate for engineering's position — NOT neutral mediator
  Required: Make the engineering case clearly; escalate if not resolved at peer level
  Do NOT: Pretend to mediate a conflict in which you are a party

Position B — Engineering as Facilitator
  Definition: Two other functions are in conflict and engineering is caught between them
  Examples: Product and Design disagree on scope; two product teams compete for
            engineering capacity; legal and product conflict over compliance requirements
  EM role: Facilitate a resolution that both parties can live with; surface the conflict
           to shared leadership if it can't be resolved at peer level
  Constraint: The EM must be genuinely neutral and must name it if they aren't

Position C — Engineering as Bystander
  Definition: Conflict is between other parties; engineering is affected but not a primary party
  Examples: Two executive sponsors in conflict creates conflicting direction for engineering;
            an organizational restructure creates ambiguity about which business unit engineering serves
  EM role: Name the impact on engineering; request resolution without taking a side;
           escalate the dependency if the conflict is blocking engineering's work
```

### Step 2 — Map the Power Dynamic

```
Before any cross-functional conversation, understand the power structure:

Power source mapping:
  Formal authority: Who has organizational authority over the contested decision?
  Budget authority: Who controls the resources being contested?
  Executive sponsorship: Whose work is backed by senior leadership?
  Deadline authority: Does one party have an external deadline that creates urgency the other doesn't?
  Information advantage: Does one party have information the other lacks?

Power dynamic types and their implications:

Type 1: Engineering negotiates with peer function (same level, no formal authority over each other)
  Approach: Peer conversation → if unresolved, escalate to shared leader
  Resolution authority: Shared manager or cross-functional leader
  Timeline: Peer conversation first (1 week); shared leader involvement within 2 weeks if unresolved

Type 2: Engineering negotiates with a function that has formal authority over the decision
  Examples: Legal requiring compliance changes; Finance constraining budget
  Approach: Engineering makes its position and constraints clear; accepts the authority's decision
  If decision creates unacceptable risk: Escalate the risk, not the disagreement
  "Legal has authority to require this change. Here is the technical risk of implementing it
  this way. I want this risk documented before we proceed."

Type 3: Engineering conflict involving multiple executives in different chains
  Signal: EM receives conflicting direction from two sources of authority
  Approach: Name the conflict immediately; do not choose between them
  Required: Escalate to the shared executive who can resolve it
  Frame: "I'm receiving direction from {{A}} and {{B}} that I cannot simultaneously fulfill.
  I need one direction before I can make commitments. Here's the specific tension: {{conflict}}"

Type 4: Engineering in conflict with a party that has more organizational power
  Risk: Engineering absorbs the outcome without surfacing the cost
  Required: Make the cost of the outcome visible before accepting it
  "I understand this decision is being made at a level above mine. I want to document
  engineering's constraints and the risks of proceeding as planned. If the decision stands
  after that's visible, engineering will execute."
```

### Step 3 — Design the Stakeholder Resolution Conversation

```
Cross-functional resolution conversation structure:

Phase 1 — Establish the dispute clearly
  Name the specific decision in conflict: "We disagree about {{decision X}}"
  Name each party's position: "Engineering's position is {{A}}. {{Other function}}'s position is {{B}}"
  Name what happens if this isn't resolved: "Without a decision, {{specific impact}}"

Phase 2 — Surface the interests (not just the positions)
  "What does your function need to be true for this to work?"
  "What are you trying to protect or achieve?"
  Often: Engineering's interest is reliability/maintainability;
         Product's interest is speed-to-market; Legal's interest is risk reduction
  Interests are often compatible; positions often are not.

Phase 3 — Identify the decision owner
  "Who has authority to resolve this?"
  If the authority is in the room: ask for the decision now
  If the authority is not in the room: agree to bring this to them within {{N days}}
  Do NOT leave without naming the escalation path and timeline

Phase 4 — Propose a resolution or escalation
  Option A (resolution): "Based on what we've discussed, here is a proposal: {{specific compromise}}.
  Does this work for both parties?"
  Option B (escalation): "We're unable to resolve this at peer level. I'm going to bring this
  to {{shared leader}} with a summary of both positions. Is there anything I should add to
  represent your side accurately?"

Phase 5 — Confirm next steps
  If resolved: Write it down. Send to all parties within 24 hours.
  If escalated: Name the escalation date, who is escalating, what they will present.
  If ongoing: Name the dependency this creates on engineering's commitments.
```

### Step 4 — Prepare the Escalation Package

```
When stakeholder conflict requires escalation above the EM level, prepare:

Escalation package format:
  Context: "{{Two parties}} have been in conflict about {{decision}} since {{date}}"
  Both positions: "{{Party A}} wants {{position and interest}}. {{Party B}} wants {{position and interest}}"
  What was tried: "We met on {{date}}. Here's what was discussed and why we couldn't resolve it."
  The specific decision needed: "The unresolved question is: {{one specific question}}"
  Engineering's constraint: "Regardless of outcome, here's what engineering needs: {{constraint}}"
  Impact of delay: "If this isn't resolved by {{date}}, {{specific impact on delivery}}"
  Recommended resolution: "Our recommendation is {{option}} because {{reason}}"

Escalation frame to shared leader:
  "I'm bringing this to you because it requires authority beyond what the parties involved have.
  I'm not asking you to take a side — I'm asking you to make a decision so we can execute.
  Here is the specific question: {{one specific question}}."
  
  Do NOT: Present the escalation as a complaint about the other party
  Do NOT: Use the escalation to win — present both sides accurately
  DO: Name the decision, not the dispute
```

---

## Decision Tree

```
What does the stakeholder conflict assessment reveal?

├── ENGINEERING IS THE PARTY (POSITION A)
│   └── Do not attempt to mediate — advocate clearly and professionally
│       Prepare the engineering position with evidence and constraints
│       If peer conversation fails within 1 week: escalate with full package
│       "I've made the engineering case clearly. We haven't reached agreement.
│       I'm escalating to our shared leader because this decision is at that level."

├── EM HAS A CONFLICT OF INTEREST AS FACILITATOR
│   └── Name it: "I'm not neutral here. Let me find someone who is."
│       Ask: peer EM, skip-level, or HR to facilitate
│       Brief the facilitator: both positions, history, what was tried

├── LEVEL 3 SEVERITY (MULTIPLE FUNCTIONS, DELIVERY AT RISK)
│   └── Invoke immediately: bring in manager or cross-functional leader within 48 hours
│       Prepare the escalation package before the meeting
│       Frame: "This conflict is affecting delivery. It requires a decision at a level above mine."

├── POWER IMBALANCE — ENGINEERING HAS LESS AUTHORITY
│   └── Make the cost of the outcome visible before accepting it
│       Document the risk in writing before proceeding
│       Do not absorb the risk silently — name it
│       "I'll execute the decision. For the record, here is the technical risk of this approach.
│       I want this documented so we can make an informed decision together."

├── CONFLICTING EXECUTIVE DIRECTION (TYPE 3 POWER)
│   └── Do not choose between the executives
│       Escalate to shared leadership immediately
│       "I'm receiving direction from {{A}} and {{B}} simultaneously that I cannot execute.
│       I need one direction. Here is the conflict: {{specific}}."

└── PEER-LEVEL RESOLUTION REACHED
    └── Document in writing within 24 hours
        Send to all parties + their managers as confirmation
        Track: If this conflict recurs, the resolution didn't address root cause
        → Invoke: skills/organizational/decision-network.md for structural fix if needed
```

---

## Output

### Stakeholder Resolution Plan

```
STAKEHOLDER RESOLUTION — {{Conflict context}} — {{date}}

THE FIVE RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROOT CAUSE:
  Conflict type: {{1–5}} | Severity: {{Level 1–4}} | Root cause: {{Structural | Incentive | Communication | Historical}}
  Engineering's role: {{Party | Facilitator | Bystander}}
  Specific cause: {{1–2 sentences naming what is actually in dispute and why}}
  "This conflict exists because {{structural or incentive condition}} — not primarily because
  of the individuals involved."

CONVERSATION STRATEGY:
  Engineering's position: {{What engineering needs — stated as interest, not demand}}
  Other party's position: {{What was understood about their interest}}
  Decision owner: {{Who has authority to resolve this}}
  Escalation path: {{If peer resolution fails — who, when, with what package}}
  Resolution conversation format: {{Peer meeting | Shared leader mediation | Written exchange}}

RISKS:
  If unresolved: {{Specific delivery, relationship, or org impact}}
  If engineering wins without addressing other party's interest: {{Relational cost and recurrence risk}}
  Power imbalance: {{Y/N — and if yes, how it's being managed}}

DESIRED OUTCOME:
  Minimum acceptable: {{Specific decision made; engineering knows what to execute}}
  Ideal: {{Both parties' interests addressed; relationship preserved; structural root cause fixed}}
  Not achievable through this process: {{What requires organizational change above this conflict}}

FOLLOW-UP ACTIONS:
  Immediate: {{Specific action — peer conversation, documentation, escalation prep}}
  Escalation deadline: {{Date by which shared leader is involved if unresolved}}
  Structural fix: {{What must change organizationally to prevent recurrence}}
  Written resolution: {{Sent to all parties within 24 hours of any agreement}}

CONFLICT RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Parties: {{Engineering EM}} ↔ {{Other function/EM}}
Power dynamic type: {{1–4}} | Shared leader: {{Name}}
Peer conversation date: {{date}} | Outcome: {{Resolved | Unresolved — escalating}}
Escalation date (if needed): {{date}} | Escalation target: {{Name/role}}
Resolution text: {{Specific language of the agreement}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Engineering's role classified (Party/Facilitator/Bystander) | Base: 65% |
| Power dynamic mapped | +15% |
| Escalation package prepared if peer resolution fails | +10% |
| Both parties' interests (not just positions) surfaced | +10% |
| Written resolution sent within 24 hours | +5% |
| EM mediating while being a party | −50% (disqualifying) |
| No escalation path identified | −20% |
| Conflict absorbed silently (no decision, no escalation) | −30% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Party pretending to mediate** | EM is clearly on engineering's side but frames themselves as neutral | Name the position: "I'm advocating for engineering here. That's appropriate — I'm a party." Neutrality theater is not neutrality. |
| **Silent absorption** | Engineering loses the cross-functional conflict but doesn't document the cost or risk | Make the cost visible before accepting the outcome. "I'll execute this decision. Here is the risk I want on record." |
| **Escalation as complaint** | EM brings the conflict to shared leadership as "they're being unreasonable" | Escalation package presents both positions accurately. The ask is a decision, not a verdict. |
| **Resolution without decision owner** | Conflict discussed; no decision made; both parties leave with different understandings | Name the decision owner before the conversation ends. "Who is making this decision? By when?" |
| **Recurrent conflict** | Same cross-functional conflict resolved the same way repeatedly | If a conflict recurs, the resolution was surface-level. The structural root cause was not fixed. → Invoke decision-network.md |

---

## References

- `skills/conflict/conflict-diagnosis.md` — Entry point for all conflict; routes Level 3+ and cross-functional conflicts here
- `skills/conflict/mediation.md` — Used when EM is a neutral facilitator between two peer parties
- `skills/organizational/decision-network.md` — Structural root causes of stakeholder conflict resolved here
- `skills/organizational/political-risk.md` — Unresolved stakeholder conflict creates organizational political risk
- `skills/organizational/executive-priorities.md` — Executive-level conflicts require understanding of revealed priorities

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/conflict/conflict-diagnosis.md` | Must precede this skill — routes Level 3+ and cross-functional conflicts here |
| `skills/conflict/mediation.md` | When EM can be neutral; invoked for peer-level facilitation |
| `skills/organizational/decision-network.md` | Ownership and DACI used to clarify who has authority to resolve the conflict |
| `skills/organizational/political-risk.md` | Cross-functional conflict that goes unresolved accumulates as political risk |
