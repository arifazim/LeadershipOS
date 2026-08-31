# Skill: Influence Map

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Semi-annually (rebuild) + On-demand (leadership change, reorg, initiative launch)

---

## Purpose

Map the informal influence network that shapes decisions — distinct from the formal org chart — so that the EM understands who actually moves opinions, who decision-makers listen to, and where engineering's voice fits in the real decision landscape.

**What the EM does automatically**: When mapping influence, the EM:
1. Identifies informal influencers whose authority exceeds their title
2. Maps the information flows that shape decisions before they are formally made
3. Detects when engineering is outside the informal networks that matter
4. Surfaces structural gaps: decisions made in rooms engineering doesn't know exist
5. Recommends transparent relationship-building to participate in decisions early

**Ethical principle**: Influence mapping is used to ensure engineering has appropriate representation in decisions that affect the team's work — not to identify manipulation vectors or route around legitimate authority. The correct response to influence gaps is transparent relationship building and process participation, not back-channel maneuvering.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Observed decision patterns** | Recent decisions: who proposed, who shaped, who approved |
| **Meeting structure** | Which recurring meetings produce which types of decisions |
| **Known informal relationships** | Trusted advisors, long-tenured relationships, cross-functional friendships |

### Optional
| Input | Description |
|---|---|
| **Prior outcome history** | Which initiatives succeeded, failed, or stalled — and why |
| **Information flow observations** | Who seems to know things before they're announced |
| **Cross-functional tenure data** | Long-tenured employees often have disproportionate informal influence |

---

## Analysis

### Step 1 — Distinguish Formal from Informal Authority

```
Formal authority: The right to decide, based on role
  → Org chart — visible, documented, official

Informal authority: The ability to shape what deciders decide
  → Not on the org chart — must be observed and mapped

Informal authority signals:
  - Decision-makers frequently ask this person's opinion before deciding
  - This person's concerns reliably cause decisions to be revisited
  - Others reference "what {{name}} thinks" in meetings
  - This person is included in small pre-meetings that set the agenda for larger ones
  - Long tenure in the organization = institutional memory = informal authority
```

### Step 2 — Map Information Flow

Information flows before decisions. Map the information network:

```
Pre-decision information chain:
  Who hears about proposals first?
  Who provides the first framing of an issue to senior leaders?
  Who summarizes options before a decision meeting?
  Who gets the "quick temperature check" before a formal ask?

The person who frames the problem shapes the answer.
If engineering is not in the pre-decision information chain for technical decisions,
engineering will be asked to execute decisions that don't reflect technical reality.
```

### Step 3 — Assess the Five Organizational Signals

The five signals are defined canonically in `skills/organizational/political-intelligence.md` — this step applies each to the informal-influence layer specifically:

```
Signal 1 — Frequent decision reversals
  Influence map cause: A decision was made without input from an informal influencer
  who then reversed it after being informed. The informal channel was bypassed.
  Detection: Track which decisions reverse. Who became aware of the decision after reversal?
  Response: Map who needs to be in the information flow, not just the formal decision meeting.

Signal 2 — Exclusion from key meetings
  Influence map cause: Engineering is absent from pre-decision meetings where
  technical feasibility and framing are established.
  Detection: Decisions arrive to engineering pre-framed without technical input.
             "We've decided to build X. How long will it take?"
  Response: Request inclusion in the upstream meeting. Frame as information quality,
  not territorial: "Earlier technical input improves the options you have to consider."

Signal 3 — Ownership ambiguity
  Influence map cause: Two informal influencers have competing framings of the same problem.
  Detection: Inconsistent direction from different leaders; both citing different "priorities."
  Response: Surface the contradiction transparently to the shared authority above both.

Signal 4 — Escalation patterns
  Influence map cause: Someone is routing around their formal chain to use informal influence.
  Detection: Issues re-emerge at higher levels after seeming resolved at lower levels.
  Response: Address the root concern directly; don't compete with the informal channel.

Signal 5 — Misaligned incentives
  Influence map cause: Informal influencers are optimizing for outcomes that conflict with
  the engineering initiative.
  Detection: Influencer's framing of the issue consistently frames engineering as the blocker.
  Response: Find common ground at the level of shared outcomes; engage directly.
```

### Step 4 — Identify Engineering's Informal Position

```
For each key decision type, assess engineering's informal position:

Decision type: {{product direction, platform investment, org structure, etc.}}
  Engineering in pre-decision chain? Yes / No / Sometimes
  Engineering's informal advocates at senior level? Names / None
  Decisions typically arrive to engineering as: Options to choose / Pre-framed asks / Directives
  
Assessment:
  In the room early (strong position): Engineering shapes options, not just estimates
  In the room late (weak position): Engineering estimates work defined without it
  Outside the room (absent): Engineering discovers decisions; rarely influences them
```

---

## Decision Tree

```
What does the influence map reveal?

├── ENGINEERING OUTSIDE PRE-DECISION CHAIN FOR TECHNICAL DECISIONS
│   └── This is the most structurally damaging position for an engineering team
│       Result: Constant "how long will it take?" after options are already chosen
│       Action: Identify which meeting or relationship sits upstream of these decisions
│       Approach: Request inclusion on the basis of information quality
│       Frame: "I've noticed we're often brought in after architecture is decided.
│       Earlier technical input gives you more realistic options. Can I join {{meeting}}?"
│       Do NOT: Complain about being excluded; that reads as territorial

├── DECISIONS REVERSING AFTER INFORMAL INFLUENCER LEARNS OF THEM
│   └── The reversal tells you who the missing voice was
│       Map: Who learned about the decision after it was made?
│       Action: Add that person to the pre-decision information flow
│       Frame: "I want to make sure I'm keeping you in the loop on {{area}}.
│       Are there decisions where you'd want to hear earlier?"

├── TWO INFORMAL INFLUENCERS IN CONFLICT
│   └── This is not engineering's problem to solve — but engineering will pay the cost
│       Do NOT: Try to navigate between them or pick a side
│       Action: Name the conflict to your manager or the shared authority above both
│       Frame: "I'm getting inconsistent direction on {{topic}} from {{A}} and {{B}}.
│       I need one voice. Can you help clarify which direction I should follow?"
│       Document: Put the conflict in writing; don't carry it silently

├── ENGINEERING'S INFORMAL ADVOCATES ARE ABSENT
│   └── At senior levels, no one is naturally surfacing engineering's perspective
│       Action: Build relationships up — not to lobby, but to inform
│       Cadence: Monthly skip-level touchpoints; share one concrete impact story
│       Frame: "I want to make sure you have an accurate picture of what engineering
│       is building and what challenges we're navigating."
│       → Invoke: skills/career/promotion/visibility-score.md — same dynamic

└── INFLUENCE MAP IS UNDERSTOOD AND ENGINEERING IS WELL-POSITIONED
    └── Refresh semi-annually — influence networks shift with org changes
        Watch for new informal authorities after leadership changes
```

---

## Output

### Influence Map

```
INFLUENCE MAP — {{Organization / Initiative}} — {{date}}

FORMAL AUTHORITY (Org Chart)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{{Standard org chart representation — title / reporting line}}

INFORMAL INFLUENCE NETWORK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Name        | Formal Role    | Informal Influence Type          | Influence Strength | Relationship to Engineering
{{name}}    | {{role}}       | Trusted advisor to CEO           | Very High          | External — no direct relationship
{{name}}    | {{role}}       | Long-tenure institutional memory | High               | Neutral — occasional interaction
{{name}}    | {{role}}       | Pre-decision information filter  | High               | Partner — regular alignment
{{name}}    | {{role}}       | Cross-functional relationship hub| Medium             | Weak — needs building

DECISION FLOW (pre-formal)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision type          | Pre-decision meeting/channel | Engineering in chain? | Gap?
Product direction      | {{meeting name / 1:1}}       | No                    | ⚠️ Yes — request inclusion
Platform investment    | {{meeting name}}             | Yes — invited monthly | None
Org structure          | Senior staff only            | No                    | ⚠️ Yes — advocate needed

SIGNALS DETECTED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Signal}}: {{Specific observation}} — Ethical response: {{transparent action}}

ENGINEERING POSITION ASSESSMENT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Overall: {{In the room early | In the room late | Outside the room}}
Priority gap: {{Decision type}} — Engineering not in pre-decision chain
Action: {{Transparent step to build inclusion — not workaround}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Informal network mapped beyond org chart | Base: 65% |
| Pre-decision information flow charted | +15% |
| All five signals assessed | +10% |
| Engineering's position assessed per decision type | +10% |
| Ethical action specified (not back-channel) | +5% |
| Only formal org chart used | −30% |
| No pre-decision flow analysis | −15% |
| Influence mapping used for manipulation | −50% (disqualifying) |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Org chart only** | Influence analysis limited to titles; informal authority invisible | Map observed behavior, not reported authority. Who shapes decisions before the meeting? |
| **Static after reorg** | Influence map not updated after leadership changes | Reorgs and leadership changes are the most significant influence disruptions. Rebuild within 30 days. |
| **Using map to route around** | Influence analysis used to identify how to bypass certain people | The correct response to influence gaps is inclusion and direct engagement, not routing around. |
| **Engineering absent and accepting it** | Team routinely receives pre-framed decisions and adapts | Structural exclusion is a risk that must be addressed transparently, not just adapted to. |
| **Conflict owned by engineering** | EM navigating between two senior influencers in conflict | Surface the conflict to the shared authority above both. Don't own what isn't yours to resolve. |

---

## References

- `skills/organizational/stakeholder-analysis.md` — Formal stakeholder map overlaid by informal influence
- `skills/organizational/decision-network.md` — How informal influence shapes the formal decision process
- `skills/organizational/political-risk.md` — Influence gaps become political risks when initiatives are at stake
- `skills/organizational/political-intelligence.md` — Canonical definitions of the five organizational signals

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/stakeholder-analysis.md` | Stakeholder map is the formal layer; influence map is the informal layer |
| `skills/organizational/decision-network.md` | Decision network shows where influence is exercised |
| `skills/organizational/executive-priorities.md` | Executive priorities are shaped by informal influence networks |
| `skills/organizational/political-risk.md` | Being outside influence networks is a political risk |
