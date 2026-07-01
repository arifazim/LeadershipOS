# Skill: Mediation

**Domain**: Conflict Resolution
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand — invoked when direct conversation between parties has failed or is unlikely to succeed without a neutral facilitator

---

## Purpose

Facilitate resolution between two parties in conflict — by creating the conditions for genuine mutual understanding, not by imposing a verdict or forcing a compromise that satisfies neither party. Mediation is distinct from arbitration: the EM does not decide the outcome. The EM creates the process through which the parties reach their own resolution.

**What the EM does automatically**: Before and during mediation, the EM:
1. Confirms their own neutrality — or steps back if they have a conflict of interest
2. Conducts separate pre-mediation conversations with each party before any joint session
3. Structures the joint session so each party is heard before positions are defended
4. Distinguishes the parties' positions (what they say they want) from their interests (why they want it)
5. Produces: Root cause, conversation strategy, risks, desired outcome, and follow-up actions

**Ethical principle**: The mediating EM cannot advocate for one party, cannot use authority to impose a resolution, and cannot pretend the conflict is resolved when it isn't. A mediated agreement that both parties sign but neither believes in is worse than no agreement — it creates false resolution that collapses under pressure. The EM's job is to create the conditions for an honest outcome, not to produce an outcome quickly.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Conflict diagnosis** | Output from `skills/conflict/conflict-diagnosis.md` — type, root cause, severity |
| **Parties involved** | Who the mediating parties are; their relationship to each other and to the EM |
| **What has already been tried** | Prior direct conversations, informal interventions, or escalations |

### Optional
| Input | Description |
|---|---|
| **Each party's stated position** | What each party says they want |
| **History between parties** | Prior incidents, unresolved tension, power dynamics |
| **Organizational stakes** | Whether the mediation outcome affects delivery, team health, or other parties |

---

## Analysis

### Step 1 — Confirm EM Neutrality

```
Before accepting the mediator role, the EM must pass three neutrality tests:

Test 1: Relationship neutrality
  Do I have a closer relationship with one party than the other?
  If yes: Acknowledge it. Can I still be fair? If not, request a co-mediator.

Test 2: Outcome neutrality
  Do I have a preferred outcome that I'll be disappointed not to reach?
  If yes: I am not a neutral mediator — I am an interested party.
  Required: Step back; bring in a neutral (skip-level, HR, peer EM)

Test 3: Organizational neutrality
  Does the conflict outcome affect my team's delivery, budget, or relationships?
  If yes: I have a partial interest. Be transparent about it.
  Recommended: Co-facilitate with the other party's manager or a neutral third party

If the EM fails any test:
  "I want to be transparent: I have a relationship with {{party}} / stake in {{outcome}}
  that I don't think allows me to mediate this neutrally.
  I'm going to ask {{neutral party}} to facilitate instead."
```

### Step 2 — Pre-Mediation Separate Conversations

```
Before any joint session, the EM meets with each party separately.
The order of conversations should not be made visible to either party.

Purpose of each pre-mediation conversation:
  1. Understand their account: "Tell me what's been happening from your side"
  2. Understand what they need: "What would need to be true for this to be resolved?"
  3. Understand their theory of the other party: "What do you think is driving their behavior?"
  4. Prepare them for the joint session: "We're going to hear from both of you. The goal is
     mutual understanding, not winning. I'll ask you not to interrupt each other."
  5. Surface what they are NOT willing to say in a joint session — and decide whether
     that information needs to be part of the process

Confidentiality rule:
  Do not share Party A's account with Party B before the joint session.
  This is not information management — it is protecting the integrity of the joint process.
  Each party should hear the other's account directly, in the session, not pre-processed.

Position vs. Interest detection:
  Position: "I want their team to stop making decisions about the API without us."
  Interest: "I'm worried about the stability of our service when decisions are made
  without considering our dependencies."
  
  Positions generate standoffs. Interests generate solutions.
  The pre-mediation conversation extracts the interest behind the position.
```

### Step 3 — Design the Joint Session

```
Mediation session structure:

Phase 1 — Opening (5–10 min)
  EM states the purpose: "The goal of this session is mutual understanding and agreement.
  Not to determine who was right or wrong. Not to produce a verdict."
  EM states the ground rules:
    — Each person speaks uninterrupted
    — The other person listens without preparing their rebuttal
    — We stay with the issue; we don't relitigate the history unless it's directly relevant
  EM states the format: "I'll ask each of you to share your experience. Then we'll work
  toward what needs to change."

Phase 2 — Uninterrupted Accounts (10–20 min)
  Party A shares their account — uninterrupted
  Party B shares their account — uninterrupted
  EM does not editorialize; EM listens and takes notes
  EM summarizes what was heard: "Here's what I heard from each of you: {{summary}}"
  EM asks: "Is that accurate? Did I miss anything important?"

Phase 3 — Identify Common Ground and Core Disagreement (10–15 min)
  "Here's what you seem to agree on: {{common ground}}"
  "Here's where I'm hearing the fundamental difference: {{core disagreement}}"
  EM tests the interests: "{{Party A}}, what do you need to be true for this to work?
  Not what you want the other person to do — what outcome matters most to you?"
  Repeat for Party B.
  Often: The interests are compatible even when the positions are not.

Phase 4 — Generate Options Together (15–20 min)
  "Let's think together about what might address both of those needs."
  The EM facilitates; the parties generate.
  EM does not propose the solution — the parties must own it.
  If stuck: "What would you suggest if you were proposing something for the other person's situation?"
  Rule out options that have been tried; build only forward-looking proposals.

Phase 5 — Reach Agreement or Name the Impasse (10 min)
  If agreement reached: Summarize it specifically. Write it down in the session.
  "We've agreed that {{specific behavior/process/boundary}}. I'll send a written summary."
  
  If no agreement reached:
  "We haven't reached agreement today. That's okay — this conversation was still necessary.
  Here is what I'm going to do: {{next step — structural fix, escalation, third-party facilitation}}"
  Do NOT manufacture agreement that doesn't exist.
```

### Step 4 — Assess Whether Mediation Is the Right Intervention

```
Mediation is appropriate when:
  ✓ The conflict is interpersonal or procedural (Type 1 or Type 3 from diagnosis)
  ✓ Both parties are willing to engage
  ✓ The EM is or can be neutral
  ✓ Direct conversation has failed or is too charged to attempt without structure

Mediation is NOT appropriate when:
  ✗ The conflict involves conduct, harassment, or HR-level behavior (Level 4)
  ✗ One party refuses to participate
  ✗ The root cause is structural (fix the structure, not the people)
  ✗ The EM is a party to the conflict
  ✗ Power dynamics make genuine neutrality impossible
  ✗ The conflict is values-based (Type 4) — mediation cannot resolve genuine values differences
  
  In these cases: → escalate using conflict-diagnosis.md routing
```

---

## Decision Tree

```
What does the mediation assessment reveal?

├── EM FAILS NEUTRALITY TEST
│   └── Step back immediately; do not attempt to mediate while conflicted
│       Request neutral facilitator (skip-level, peer EM, HR)
│       "I've realized I'm too close to this to facilitate it fairly.
│       I'm asking {{neutral}} to take this instead."

├── ONE PARTY REFUSES MEDIATION
│   └── You cannot mediate without both parties willing to participate
│       Address the refusal directly: "What would need to be true for you to engage with this?"
│       If still refuses: assess severity
│         Level 1–2: Acknowledge refusal; address behaviors through management channel
│         Level 3+: Escalate — refusal to engage in conflict resolution is itself a conduct issue

├── STRUCTURAL ROOT CAUSE IDENTIFIED
│   └── Do not mediate before addressing the structure
│       Structural mediation produces temporary resolution; conflict recurs
│       Fix: Address ownership/incentive/process gap first
│       Then: Mediate any residual relational damage
│       → Invoke: skills/organizational/decision-network.md

├── JOINT SESSION REACHED GENUINE AGREEMENT
│   └── Capture in writing immediately; send to both parties within 24 hours
│       Follow up in 2 weeks: "Is the agreement holding? What's working, what isn't?"
│       If agreement breaks down: reconvene; do not let it quietly collapse

├── JOINT SESSION REACHED IMPASSE
│   └── Name the impasse honestly to both parties
│       Assess: Is this a Type 4 (values-based) conflict?
│         Yes: Escalate to leadership; structural separation may be necessary
│         No: Identify what would need to change for agreement to be possible
│       If impasse persists across two sessions: escalate with diagnosis to skip-level
│       Frame: "I've attempted mediation twice. The parties are unable to reach agreement.
│       Here's the diagnosis. Here's what I recommend."

└── MEDIATION SUCCESSFUL — AGREEMENT REACHED
    └── 2-week check-in scheduled
        Written agreement sent within 24 hours
        Structural fix (if applicable) tracked separately
```

---

## Output

### Mediation Session Plan and Record

```
MEDIATION SESSION — {{Context}} — {{date}}

THE FIVE RECOMMENDATIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ROOT CAUSE:
  Conflict type: {{1–5}} | Root cause: {{Structural | Communication | Relational | Historical}}
  Specific cause: {{1–2 sentences naming what is generating the conflict}}
  "The parties are in conflict because {{condition}} — not because of bad faith."

CONVERSATION STRATEGY:
  Pre-mediation conversations: {{Party A date}} | {{Party B date}}
  Joint session date: {{date}}
  Opening ground rules: {{Specific rules for this session}}
  Interest behind Party A's position: {{What they actually need}}
  Interest behind Party B's position: {{What they actually need}}
  Shared ground to build from: {{Where interests overlap}}

RISKS:
  If mediation fails: {{Delivery, team, or org impact}}
  If agreement is false: {{What collapse looks like and when it will occur}}
  EM neutrality risk: {{Y/N — if Y, name it and name the mitigation}}

DESIRED OUTCOME:
  Minimum acceptable: {{Specific behavioral agreement that constitutes success}}
  Ideal: {{Shared understanding + sustainable behavioral agreement + preserved relationship}}
  Not achievable through mediation: {{What this process cannot produce}}

FOLLOW-UP ACTIONS:
  Within 24 hours: Written agreement summary sent to both parties
  2-week check-in: {{Scheduled conversation format}}
  Structural fix: {{If applicable — what needs to change organizationally}}
  Escalation trigger: {{What would require escalating above the EM}}

SESSION RECORD
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Parties: {{A}} and {{B}} | EM neutral? {{Y/N | Conflict noted: description}}
Pre-mediation: Party A met {{date}} | Party B met {{date}}
Joint session held: {{date}} | Duration: {{N minutes}}
Agreement reached: {{Y/N}}
Agreement terms: {{Specific text of the agreement}}
Impasse (if no agreement): {{Specific nature of the impasse}}
Next step: {{Scheduled follow-up or escalation}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| EM neutrality confirmed | Base: 65% |
| Pre-mediation separate conversations completed | +15% |
| Position vs. interest distinction applied | +10% |
| Joint session structured with five phases | +10% |
| Written agreement produced | +5% |
| EM attempted mediation with conflict of interest | −50% (disqualifying) |
| No pre-mediation conversations | −25% |
| Agreement manufactured without genuine buy-in | −30% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Mediating own conflict** | EM has a stake in the outcome but proceeds as mediator | Name the conflict of interest; request neutral third party. Authority cannot substitute for neutrality. |
| **Skipping pre-mediation** | EM goes straight to joint session; parties air grievances without preparation | Pre-mediation conversations reduce the charge of the joint session. Skip them and the joint session becomes a shouting match. |
| **Manufactured agreement** | Both parties say "fine" to end the session; EM reports it resolved | A resolution that isn't genuine will collapse. Impasse is a better outcome than a false agreement. Name it honestly. |
| **Position-level resolution** | EM resolves the stated positions without surfacing the underlying interests | Position-level agreements break down because the underlying need wasn't addressed. Extract the interest before proposing solutions. |
| **Structural conflict mediated as interpersonal** | Conflict between teams with overlapping ownership treated as a relationship problem | If different people in the same roles would have the same conflict, fix the structure. Mediation is irrelevant. |

---

## References

- `skills/conflict/conflict-diagnosis.md` — Confirms conflict type and routes to mediation for interpersonal Level 1–2
- `skills/conflict/difficult-conversations.md` — Used in pre-mediation conversations to prepare each party
- `skills/conflict/stakeholder-resolution.md` — When mediation reaches impasse; escalation with cross-functional parties
- `skills/organizational/decision-network.md` — Structural conflicts that require ownership clarification before mediation

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/conflict/conflict-diagnosis.md` | Must be invoked before mediation — confirms type and neutrality requirements |
| `skills/conflict/difficult-conversations.md` | Preparation framework used in pre-mediation individual sessions |
| `skills/conflict/stakeholder-resolution.md` | Cross-functional or escalated mediation when parties span org boundaries |
