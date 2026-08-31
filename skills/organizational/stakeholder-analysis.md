# Skill: Stakeholder Analysis

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (refresh) + On-demand (new initiative, reorg, leadership change)

---

## Purpose

Map the stakeholder landscape for any engineering initiative — identifying who has influence, who has interest, what they need, and where misalignment exists — so that the EM can engage transparently and proactively rather than discovering opposition after a decision has already been made.

**What the EM does automatically**: For any significant initiative, the EM:
1. Identifies all stakeholders by role, influence level, and interest in the outcome
2. Maps what each stakeholder needs to feel informed, respected, and heard
3. Detects misalignment between stakeholder expectations and the current plan
4. Surfaces stakeholders who are being excluded but should not be
5. Recommends transparent engagement actions — not positioning or managing perception

**Ethical principle**: Stakeholder analysis is a tool for inclusion, not manipulation. The goal is to ensure the right people are informed and have a voice — not to identify how to neutralize opposition or engineer consent. If analysis reveals a stakeholder whose concerns are legitimate, the response is to engage with those concerns, not to find ways around them.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Initiative or decision** | What engineering is building, changing, or proposing |
| **Organizational chart** | Formal reporting structure and leadership hierarchy |
| **Known stakeholders** | People who have already expressed interest or concern |

### Optional
| Input | Description |
|---|---|
| **Prior project history** | Who was involved or affected by similar past work |
| **Cross-functional dependencies** | Teams that will be affected by the initiative |
| **Customer or external impact** | Whether external stakeholders (customers, regulators) are relevant |

---

## Analysis

### Step 1 — Identify All Stakeholders

Cast a wide net first. Better to include someone who turns out to be low-stakes than to exclude someone who matters.

**Stakeholder categories:**

| Category | Who to include |
|---|---|
| **Decision authority** | Who approves, vetos, or has final say |
| **Direct impact** | Teams or individuals whose work changes as a result |
| **Resource owners** | Who controls budget, headcount, or tooling involved |
| **Dependency providers** | Teams whose output the initiative depends on |
| **Users or customers** | Internal or external people who use what is being built |
| **Watchdogs** | Legal, security, compliance, finance — triggered by the initiative type |
| **Informal influencers** | People whose opinion shapes others' views, regardless of formal role |

### Step 2 — Score Influence and Interest

```
Influence score (1–5): How much can this person affect the outcome?
  5: Final decision authority
  4: Strong influence over decision-makers; can block or accelerate
  3: Meaningful input; voice is heard
  2: Can surface concerns but not determine outcomes
  1: Informed but not in the decision chain

Interest score (1–5): How much does this person care about this initiative?
  5: Central to their work or goals; outcome significantly affects them
  4: Notable impact; they'll pay attention
  3: Some stake in the outcome
  2: Peripheral; minor impact
  1: Minimal connection to this initiative
```

### Step 3 — Assess Relationship Health

For each Partner and Gatekeeper, rate relationship health separately from influence/interest — a high-influence stakeholder with a strained relationship needs different handling than one with a strong relationship, even at the same tier:

| Rating | What it means | What to do |
|---|---|---|
| **Strong** | Trust established, communication is open | Maintain — don't let it atrophy |
| **Neutral** | Professional but no relationship depth | Invest in one-on-ones before the initiative |
| **Strained** | Historical tension or miscommunication | Address directly before the initiative is public |
| **Unknown** | No prior interaction | Treat as Neutral; invest in discovery |

### Step 4 — Place in Stakeholder Matrix

```
High influence, High interest (Partners):
  → Engage deeply and continuously; keep fully informed; actively seek input
  → These people can make or break the initiative; treat as co-owners of the outcome

High influence, Low interest (Gatekeepers):
  → Keep satisfied; flag major decisions before they become surprises
  → Don't over-engage; do not let them become obstacles through inattention

Low influence, High interest (Advocates):
  → Keep informed; listen to their concerns — they often surface ground-truth signals
  → They may influence decision-makers informally

Low influence, Low interest (Monitor):
  → Inform periodically; don't invest disproportionate engagement energy
```

### Step 5 — Identify the Five Organizational Signals

For each stakeholder interaction history, check for the five signals defined in `skills/organizational/political-intelligence.md` (canonical definitions — do not restate them here). Stakeholder-specific response per signal:

| Signal | Response for this stakeholder |
|---|---|
| Frequent decision reversals | Include them earlier; make the decision process visible before it closes |
| Exclusion from key meetings | Audit who is in the room; proactively add missing voices |
| Ownership ambiguity | Name the decision owner explicitly; get alignment before proceeding |
| Escalation patterns | Address the concern at the level it was first raised before escalation recurs |
| Misaligned incentives | Name the incentive gap explicitly; seek structural alignment, not compliance |

---

## Decision Tree

```
What does the stakeholder analysis reveal?

├── PARTNER-LEVEL STAKEHOLDER NOT ENGAGED
│   └── This is an immediate risk to the initiative
│       Action: Schedule 1:1 before the next major decision
│       Frame: "I want to make sure I understand your perspective on {{initiative}}
│       before we lock in direction. Your input will shape what we build."
│       Do NOT: Inform them after decisions; present decisions as fait accompli

├── GATEKEEPER SURPRISED BY RECENT DECISION
│   └── This is the most common and most preventable cause of reversal
│       Action: Establish a "no surprises" protocol with this stakeholder
│       Before any major decision: 1 paragraph summary to them 48 hours in advance
│       Frame: "I want to flag this before it's final in case you have input."

├── OWNERSHIP AMBIGUITY DETECTED
│   └── Resolve before proceeding — ambiguity is a delay and a conflict waiting to happen
│       Convene: The two parties with overlapping ownership
│       Agenda: Name the ambiguity, not the people. "We need to clarify who owns X."
│       Output: Written, agreed accountability map
│       → Invoke: skills/organizational/decision-network.md

├── MISALIGNED INCENTIVES IDENTIFIED
│   └── Do NOT try to work around this — it will recur
│       Name it transparently: "I've noticed that {{initiative}} creates tension with
│       {{stakeholder}}'s {{metric}}. This needs a structural fix, not a workaround."
│       Escalate to shared leadership: This is a system design problem, not a people problem
│       → Invoke: skills/organizational/political-risk.md for escalation framing

├── RELATIONSHIP IS STRAINED (regardless of tier)
│   └── Action: 1:1 before any public forum. Direct acknowledgment.
│       Do not: wait for them to raise it. Do not: use email. Go face-to-face.
│       Ask: "What would it take for this to work for your team?" Listen fully before responding.

├── NEW EM — building the stakeholder map from scratch
│   └── Action: 30-60-90 day stakeholder listening tour
│       Week 1-4: Meet every peer EM, PM partner, and VP in adjacent orgs
│       Document: What they care about, what engineering owes them, what history exists between teams
│       Do NOT: Make commitments in these meetings. Listen first.

├── REORG — stakeholder map has changed
│   └── Action: Rebuild the map. Old relationships may not transfer.
│       New owners of old functions may have different priorities.
│       Assume Neutral relationship health until proven otherwise. Invest in discovery.

└── STAKEHOLDER MAP IS COMPLETE AND ENGAGED
    └── Review quarterly or when team membership changes
        Before major milestones: confirm Partner-tier stakeholders are aligned
        → Invoke: skills/organizational/alignment-health.md for ongoing monitoring
```

---

## Output

### Stakeholder Map

```
STAKEHOLDER ANALYSIS — {{Initiative}} — {{date}}

STAKEHOLDER REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Name        | Role       | Influence | Interest | Tier        | Relationship | What they need      | Signal detected?
{{name}}    | {{role}}   | 5         | 5        | Partner     | {{Strong/Neutral/Strained}} | {{need}}            | {{signal or None}}
{{name}}    | {{role}}   | 4         | 2        | Gatekeeper  | {{health}}   | {{need}}            | {{signal or None}}
{{name}}    | {{role}}   | 2         | 5        | Advocate    | {{health}}   | {{need}}            | None
{{name}}    | {{role}}   | 1         | 1        | Monitor     | —            | Periodic update     | None

SIGNALS DETECTED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Signal type}}: {{Stakeholder}} — {{specific observed pattern}} — Recommended response: {{action}}

PRE-ANNOUNCEMENT COMMUNICATION PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Before announcement (brief these people first):
1. {{Name}} — {{what to cover}} — {{format: 1:1 / brief / demo}} — by {{date}}
2. {{Name}} — {{what to cover}} — {{format}} — by {{date}}

At launch (inform simultaneously):
• {{Name group or list}} — {{format}} — {{date}}

During execution (ongoing):
Stakeholder    | Cadence         | Format         | Next touchpoint
{{name}}       | Weekly          | 1:1            | {{date}}
{{name}}       | Before decisions| Written brief  | Before {{milestone}}
{{name}}       | Monthly         | Status email   | {{date}}

OWNERSHIP GAPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Area of ambiguity: {{area}} — Currently: {{name A}} and {{name B}} both claim/assume ownership
Recommended resolution: {{specific action by date}}

ALLIES TO ACTIVATE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}}: {{Why they're an ally and how to activate their support — e.g. speaking positively
  about this work in cross-team forums where you're not present}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All stakeholder categories assessed | Base: 65% |
| Five organizational signals checked per stakeholder | +15% |
| Relationship health assessed for Partners and Gatekeepers | +10% |
| Engagement plan with cadence and format, including pre-announcement briefings | +10% |
| Ownership ambiguities identified | +10% |
| Ethical response (not positioning) specified | +5% |
| Only formal org chart used | −20% |
| No signal detection | −15% |
| No engagement plan | −10% |
| Strained relationship identified with no action plan | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Org chart only** | Analysis limited to formal reporting; informal influence ignored | Map actual influence, not just titles. The person without a VP title who brief the CEO is a Partner, not a Monitor. |
| **Analysis without engagement** | Stakeholders mapped but not contacted | Stakeholder analysis is preparation for action. Map, then act. |
| **Gatekeeper inattention** | High-influence, low-interest stakeholder surprised at key milestone | "No surprises" protocol for all gatekeepers, regardless of their stated interest level. |
| **Ethical drift** | Analysis used to identify who to avoid or neutralize | Stakeholder analysis is for inclusion. If a concern is legitimate, engage with it. |
| **Static map** | Analysis done once; not refreshed after reorg or leadership change | Refresh quarterly or on any org change. Stakeholder maps degrade within one quarter. |
| **Ignored strained relationships** | Known tension left unaddressed | Address directly before the initiative goes public. Silent conflicts become loud ones. |

---

## References

- `skills/organizational/influence-map.md` — Informal influence network overlaid on this analysis
- `skills/organizational/decision-network.md` — How decisions actually flow through the identified stakeholders
- `skills/organizational/alignment-health.md` — Ongoing health check for stakeholder alignment
- `skills/executive/vp-one-on-one.md` — Managing the VP gatekeeper relationship specifically
- `docs/engineering-playbook.md` → Stakeholders section, Managing Across section
- `skills/organizational/political-intelligence.md` — Canonical definitions of the five organizational signals

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/influence-map.md` | Stakeholder analysis maps formal roles; influence map adds informal dynamics |
| `skills/organizational/decision-network.md` | Who makes decisions among the mapped stakeholders |
| `skills/organizational/conflict-prediction.md` | Signals from stakeholder analysis feed conflict prediction |
| `skills/organizational/political-risk.md` | Misaligned incentives detected here become political risks |
| `skills/executive/vp-one-on-one.md` | VP is always the most important Gatekeeper to manage |
| `skills/executive/executive-decision-framework.md` | Decisions require stakeholder alignment before escalation |
| `skills/executive/investment-proposal.md` | Investment proposals require stakeholder mapping first |

**Note**: this skill absorbed `skills/executive/stakeholder-map.md` (relationship-health axis, pre-announcement communication timing, and the Allies to Activate concept) — that file is retired; all callers should point here.
