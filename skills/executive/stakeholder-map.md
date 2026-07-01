# Skill: Stakeholder Map

**Domain**: Executive
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Quarterly (update) + On-demand (new initiative, reorg, new EM)

---

## Purpose

Build and maintain a structured map of stakeholders who affect or are affected by engineering decisions — enabling the EM to navigate organizational dynamics, secure alignment proactively, and avoid the trust-destroying surprise of a stakeholder who should have been consulted and wasn't.

The stakeholder who wasn't consulted is always the loudest objector. The stakeholder who was consulted early rarely blocks. Stakeholder mapping is the practice of finding out who those people are before the initiative is live, not after.

**What a stakeholder map enables**:
- Knowing who to brief before announcements
- Knowing whose opinion the VP actually listens to
- Knowing who will surface objections in the meeting you're not in
- Knowing who to make an ally before the decision, not during it

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Initiative or scope** | What is the engineering work or change being mapped? |
| **Your organization chart position** | Who do you report to? Who reports to you? |
| **Adjacent teams** | Who depends on your team, or whose work your team depends on? |
| **Current known relationships** | Who do you already have trust with? Where are gaps? |

### Optional
| Input | Description |
|---|---|
| **Prior initiative history** | What stakeholder dynamics played out in past initiatives? |
| **Org chart changes** | Recent reorgs that change who owns what |
| **Political context** | Known tensions, competing priorities, historical conflicts |
| **Decision-maker map** | Who has formal authority vs. informal influence on this topic? |

---

## Analysis

### Step 1 — Identify All Stakeholders

Cast wide first. For the engineering initiative or change in scope, identify:

| Category | Who to include |
|---|---|
| **Reporting chain (up)** | Your VP, their VP, anyone who will hear about this from above |
| **Peer EMs** | EMs whose teams share dependencies with yours |
| **Product partners** | PM/TPM/PD who own the product surface your team builds |
| **Downstream consumers** | Teams that use your APIs, platforms, or services |
| **Finance and operations** | If budget or headcount is involved |
| **Customer-facing teams** | Sales, CS, Support — if the work affects customers |
| **External** | Vendors, enterprise customers, partners (rare for most EM decisions) |

### Step 2 — Classify by Influence and Interest

Plot each stakeholder on two dimensions:

| Quadrant | High Influence, High Interest | High Influence, Low Interest |
|---|---|---|
| | **Partners** — involve early, keep aligned | **Gatekeepers** — inform concisely, don't burden |

| Quadrant | Low Influence, High Interest | Low Influence, Low Interest |
|---|---|---|
| | **Advocates** — valuable allies, often ignored | **Monitor** — inform at milestones only |

**Action by quadrant:**
- **Partners**: Involve in planning. Share drafts. Get explicit buy-in.
- **Gatekeepers**: Brief before public announcements. Keep updates short.
- **Advocates**: Leverage for feedback and ground-level support. Can become partners.
- **Monitor**: Inform at key milestones. No individual attention needed.

### Step 3 — Assess Relationship Health

For each Partner and Gatekeeper, rate relationship health:

| Rating | What it means | What to do |
|---|---|---|
| **Strong** | Trust established, communication is open | Maintain — don't let it atrophy |
| **Neutral** | Professional but no relationship depth | Invest in one-on-ones before the initiative |
| **Strained** | Historical tension or miscommunication | Address directly before the initiative is public |
| **Unknown** | No prior interaction | Treat as Neutral; invest in discovery |

### Step 4 — Build the Communication Plan

For each stakeholder type, define:
- What they need to know (and when)
- What format works for them (sync 1:1 / async brief / in executive meeting)
- What they need from engineering (decision, information, input, approval)

---

## Decision Tree

```
What is the stakeholder challenge?

├── NEW INITIATIVE — mapping stakeholders before launch
│   └── Action: Full stakeholder identification → classify → health assessment
│       → communication plan → brief Partners before public announcement
│       Rule: Anyone who should have been consulted and wasn't will be an obstacle.
│             Cast wide. Collapse later.

├── STAKEHOLDER IS RESISTANT / BLOCKING
│   └── Step 1: Understand their actual concern (often not what they say)
│       Step 2: Is this a legitimate concern or a political objection?
│       If legitimate: address the concern directly in the proposal
│       If political: elevate to your VP with context before the objection does
│       Rule: Never fight a stakeholder in the room. Resolve it before the room.

├── STAKEHOLDER RELATIONSHIP IS STRAINED
│   └── Action: 1:1 before any public forum. Direct acknowledgment.
│       Do not: wait for them to raise it. Do not: use email. Go face-to-face.
│       Ask: "What would it take for this to work for your team?"
│       Listen fully before responding.

├── NEW EM — building the stakeholder map from scratch
│   └── Action: 30-60-90 day stakeholder listening tour
│       Week 1–4: Meet every peer EM, PM partner, and VP in adjacent orgs
│       Document: What they care about, what engineering owes them,
│                 what history exists between teams
│       Do NOT: Make commitments in these meetings. Listen first.

└── REORG — stakeholder map has changed
    └── Action: Rebuild map. Old relationships may not transfer.
        New owners of old functions may have different priorities.
        Assume neutral until proven otherwise. Invest in discovery.
```

---

## Output Template

```
STAKEHOLDER MAP — {{Initiative / Team / Quarter}}
Prepared by: {{EM name}} | Date: {{date}}
Scope: {{What engineering work or change this covers}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
STAKEHOLDER REGISTRY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

| Name | Role | Quadrant | Relationship | Their primary concern | What they need |
|---|---|---|---|---|---|
| {{name}} | {{title}} | Partner | {{Strong/Neutral/Strained}} | {{what they care about}} | {{decision/info/input/approval}} |
| {{name}} | {{title}} | Gatekeeper | {{health}} | {{concern}} | {{need}} |
| {{name}} | {{title}} | Advocate | {{health}} | {{concern}} | {{need}} |
| {{name}} | {{title}} | Monitor | — | {{concern}} | {{milestone updates}} |

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
COMMUNICATION PLAN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Before announcement (brief these people first):
1. {{Name}} — {{what to cover}} — {{format: 1:1 / brief / demo}} — by {{date}}
2. {{Name}} — {{what to cover}} — {{format}} — by {{date}}

At launch (inform simultaneously):
• {{Name group or list}} — {{format}} — {{date}}

During execution (ongoing):
• {{Name}} — {{cadence: weekly/monthly/milestone}} — {{format}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
RISKS AND OPEN RELATIONSHIPS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}}: {{What the risk is and what action to take}}
{{Name}}: {{Strained relationship — plan to address}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ALLIES TO ACTIVATE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Name}}: {{Why they're an ally and how to activate their support}}
```

---

## Example

```
STAKEHOLDER MAP — Enterprise API Platform (Q3)
Prepared by: Arif | Date: July 1, 2025
Scope: Enterprise API Platform launch — new capabilities for B2B customer integration

STAKEHOLDER REGISTRY

| Name        | Role          | Quadrant   | Relationship | Primary Concern                      | Need         |
|-------------|---------------|------------|--------------|--------------------------------------|--------------|
| Sarah (VP)  | VP Eng        | Gatekeeper | Strong       | Q3 milestone on track                | Status only  |
| Marcus      | PM Lead       | Partner    | Neutral      | Customer commitments are accurate    | Co-planning  |
| Lena        | Sales Lead    | Partner    | Strained     | API doesn't match what Sales promised| Early preview|
| Data Eng EM | EM, Data      | Advocate   | Strong       | Shared infra isn't destabilized      | Dependency brief |
| Finance     | CFO Office    | Monitor    | Neutral      | Budget on track                      | Quarterly only|

COMMUNICATION PLAN

Before announcement:
1. Lena (Sales) — review API capability vs. customer commitments — 1:1 — by July 7
2. Marcus — joint planning session on launch scope — working session — by July 8
3. Data Eng EM — dependency brief: what changes, what doesn't — 30 min 1:1 — by July 9

At launch (July 15):
• All above + Engineering team — email brief + demo — July 15

During execution:
• Marcus — weekly sync (standing meeting)
• Sarah — weekly status report (async)

RISKS AND OPEN RELATIONSHIPS
Lena (Sales): Relationship is strained — prior miscommunication about timeline.
  Action: 1:1 before July 7. Acknowledge the gap. Ask what she needs to trust the plan.
  Do not: Send async brief first. This one needs a conversation.

ALLIES TO ACTIVATE
Data Eng EM: Strong relationship and adjacent team. Can speak positively about
  engineering coordination in cross-team forums where I'm not present.
  Activation: Keep well-informed. Give credit publicly for their collaboration.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All four stakeholder quadrants considered | Base: 60% |
| Relationship health assessed for Partners and Gatekeepers | +15% |
| Communication plan names pre-announcement briefings | +10% |
| Strained relationships have explicit action plans | +10% |
| Allies are named and activation strategy exists | +5% |
| Map only includes direct reports and manager | −30% (incomplete) |
| No pre-announcement briefing plan | −15% |
| Strained relationship with no action | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Narrow map** | Only includes reporting chain | Cast wide: peer EMs, PM partners, downstream consumers, Sales/CS |
| **No pre-briefing plan** | Stakeholders learn about initiative in the public announcement | Brief Partners and Gatekeepers before the announcement, every time |
| **Ignored strained relationships** | Known tension unaddressed | Address directly before the initiative goes public. Silent conflicts become loud ones. |
| **Static map** | Stakeholder map not updated after reorg or leadership change | Rebuild at every significant org change. Assume nothing transferred. |
| **Misclassified stakeholders** | Gatekeepers treated as Monitors | When in doubt, over-invest. Being overly inclusive costs a 30-minute meeting. Being too narrow costs a blocked initiative. |

---

## References

- `docs/engineering-playbook.md` → Stakeholders section, Managing Across section
- `skills/executive/executive-presence.md` — In-room behavior with specific stakeholders
- `skills/executive/vp-one-on-one.md` — Managing the VP gatekeeper relationship

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/executive/vp-one-on-one.md` | VP is always the most important gatekeeper to manage |
| `skills/executive/executive-decision-framework.md` | Decisions require stakeholder alignment before escalation |
| `skills/executive/investment-proposal.md` | Investment proposals require stakeholder mapping first |
| `skills/product/align-stakeholders.md` | Product-side stakeholder alignment for roadmap decisions |
