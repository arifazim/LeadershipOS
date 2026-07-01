# Skill: Change Resistance

**Domain**: Organizational
**Owner**: `subagents/engineering-manager.md`
**Cadence**: On-demand (any significant change initiative) + Monthly (change health check during rollout)

---

## Purpose

Identify, classify, and address resistance to organizational or technical change — distinguishing legitimate concern from friction from fear — so that change succeeds because people understand and believe in it, not because opposition was overcome or suppressed.

**What the EM does automatically**: When leading change, the EM:
1. Detects resistance signals early (before they become coalitions or sabotage)
2. Classifies resistance type — is it legitimate concern, fear of loss, or friction from poor communication?
3. Engages resistors directly and transparently to understand their concerns
4. Separates concerns that should modify the change from concerns that should be addressed but not used to stop the change
5. Builds commitment through genuine participation, not managed compliance

**Ethical principle**: Resistance is information. The EM who treats resistance as an obstacle to overcome will produce surface compliance and hidden non-adoption. The EM who treats resistance as signal will produce a better change and genuine commitment. Legitimate resistance that identifies a real problem with the change should change the change. No technique for "managing" or "neutralizing" resistance is ethically acceptable if it involves deceiving or manipulating the resistor.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Change description** | What is being changed and why |
| **Affected stakeholders** | Who is impacted and how significantly |
| **Observed resistance signals** | Behavior suggesting opposition, hesitation, or non-adoption |

### Optional
| Input | Description |
|---|---|
| **Prior change history** | What similar changes succeeded or failed and why |
| **Resistor's role and influence** | Whether the resistor has formal or informal authority to affect the change |
| **Organizational stress context** | Is the team already experiencing high change load or uncertainty? |

---

## Analysis

### Step 1 — Classify Resistance Type

Before responding to resistance, understand what type it is. The response differs completely:

```
Type 1 — Legitimate concern (the change has a real problem)
  Signal: Resistor identifies a specific flaw, risk, or unintended consequence
  Example: "If we move to this new deployment process, the QA team will have no
  visibility into what's being released and our compliance posture will suffer."
  Response: LISTEN. Investigate the concern. Modify the change if the concern is valid.
  This is resistance doing its job.

Type 2 — Loss resistance (the change involves genuine loss for this person)
  Signal: Resistor's concern is about what they will lose — autonomy, status,
  influence, certainty, familiar workflow
  Example: "This new architecture means my team no longer owns the data layer."
  Response: Acknowledge the loss honestly. Do not minimize it.
  Find whether the loss can be addressed while the change proceeds.
  If the loss is real and unavoidable: name that directly.

Type 3 — Fear resistance (uncertainty and ambiguity, not specific concern)
  Signal: Vague objections; "this won't work"; resistance without specific reasoning
  Example: "I just don't think this is the right direction."
  Response: Surface the underlying uncertainty. Ask: "What specifically worries you?
  What would need to be true for this to feel safer?"
  Provide information; involve them in design; reduce uncertainty.

Type 4 — Friction (the communication or process is the problem, not the change itself)
  Signal: Resistance correlates with how the change was announced, not what it is
  Example: Resistance spiked after a top-down announcement without consultation
  Response: Reset the process. Bring resistors into the design. Their objection is to
  the process, not necessarily the outcome.
  This is the EM's most preventable resistance type.

Type 5 — Systemic resistance (change conflicts with existing incentives or culture)
  Signal: Multiple independent resistors raising similar concerns about the same thing
  Example: "This process improves quality but slows deployment, and we're measured on velocity."
  Response: The resistance is structural. Modifying individual behavior won't address it.
  Surface the systemic conflict. Address incentives, not individuals.
```

### Step 2 — Detect the Five Organizational Signals in Change Context

```
Signal 1 — Frequent decision reversals
  Change signal: A change is announced, then quietly walked back under pressure
  Root cause: Change was announced before sufficient alignment was built
  Early signal: Watch for the reversal — who reversed it? What was their concern?
  Response: Build alignment before announcement; treat pre-announcement concerns seriously

Signal 2 — Exclusion from key meetings
  Change signal: Change design happened without including people affected by it
  Root cause: Change was designed by a small group; affected parties weren't consulted
  Early signal: Complaints arrive through informal channels ("I heard we're doing X")
  Response: Pause; open a consultation process; incorporate feedback before forcing adoption

Signal 3 — Ownership ambiguity
  Change signal: It's unclear who owns the change and its outcomes
  Root cause: Change announced without clear accountability; multiple parties making decisions
  Early signal: Contradictory communications from different leaders about the same change
  Response: Name a single change owner; create a clear escalation path

Signal 4 — Escalation patterns
  Change signal: Resistance to the change is being escalated above the EM
  Root cause: Resistor's concern was not addressed at the team level
  Early signal: Change resistor stops engaging at team level; goes above the EM
  Response: Re-engage directly before the escalation lands; understand what wasn't resolved

Signal 5 — Misaligned incentives
  Change signal: Resistance is consistent across everyone whose metrics are affected similarly
  Root cause: Change improves one metric while harming another that the team is evaluated on
  Early signal: "This is great, but our performance review penalizes us for this change"
  Response: Surface the incentive conflict to leadership; do not ask people to absorb it silently
```

### Step 3 — Measure Change Health

```
Change health indicators (track weekly during rollout):

Adoption rate: What % of affected people are using the new process/system/behavior?
  Target trajectory: 20% (week 2) → 50% (week 4) → 80% (week 8) → 95% (week 12)
  Below target: Resistance is active; investigate type before accelerating

Concern volume: Are concerns increasing or decreasing over time?
  Decreasing: Change is landing; address remaining concerns and close them
  Stable: Change not landing; intervention needed
  Increasing: Active resistance building; identify coalition and address root cause

Resistor engagement: Are resistors participating in the change or working around it?
  Participating: Type 3 or 4 resistance; information and process fixes will work
  Working around: Type 2 or 5 resistance; structural engagement required

Leadership alignment: Are leaders above the EM consistently supporting the change?
  Inconsistency at leadership level is the most damaging change signal; it undermines
  all team-level efforts and must be resolved before proceeding
```

---

## Decision Tree

```
What does the resistance analysis reveal?

├── TYPE 1 (LEGITIMATE CONCERN) — CHANGE HAS A REAL PROBLEM
│   └── Stop. Investigate the concern.
│       If valid: modify the change before proceeding; publicly acknowledge the correction
│       Frame: "{{Person}} raised a concern about {{issue}}. After reviewing it,
│       we're making this adjustment: {{change to the change}}."
│       Acknowledgment of legitimate concern builds trust for future changes.
│       Do NOT: Proceed with a change known to have a real flaw

├── TYPE 2 (LOSS RESISTANCE) — GENUINE LOSS INVOLVED
│   └── Acknowledge the loss honestly; do not minimize
│       Investigate: Can the loss be mitigated while the change proceeds?
│       If yes: build the mitigation into the change plan
│       If no: name it directly: "I know this change means {{loss}} for you.
│       I want to acknowledge that honestly. Here's why the change is still necessary."
│       Do NOT: Pretend the loss doesn't exist; it creates resentment

├── TYPE 3 (FEAR/UNCERTAINTY) — VAGUE CONCERN WITHOUT SPECIFIC OBJECTION
│   └── Surface the specific fear: "What specifically worries you most about this?"
│       Provide information; bring them into the design
│       Frame: "Let me show you how we've thought about {{their concern}}.
│       I'd also like your input on {{specific design decision}}"
│       Fear resistance converts to support faster with genuine participation than with persuasion

├── TYPE 4 (FRICTION — PROCESS PROBLEM, NOT CHANGE PROBLEM)
│   └── This is often the EM's fault — it's preventable
│       Reset the process: "I think we moved too fast on the announcement.
│       I want to open this up for input before we finalize direction."
│       Redesign the communication: from announcement to co-creation

├── TYPE 5 (SYSTEMIC — INCENTIVE CONFLICT)
│   └── Do NOT ask individuals to absorb what is a structural problem
│       Document the incentive conflict with data
│       Escalate: "This change will fail sustainably until the incentive conflict is resolved.
│       Here is the data. Here is what I recommend."
│       → Invoke: skills/organizational/political-risk.md for escalation framing

└── ADOPTION RATE BELOW TRAJECTORY AND CONCERN VOLUME INCREASING
    └── Active resistance is building — do not wait
        Hold an open retrospective on the change: "What's working? What isn't? What do you need?"
        Be willing to hear that the change needs modification
        Outcome: Either modify the change, or commit with a clear explanation of why
```

---

## Output

### Change Resistance Assessment

```
CHANGE RESISTANCE ASSESSMENT — {{Change name}} — {{date}}

CHANGE OVERVIEW
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Change: {{description}}
Owner: {{name}} | Rollout stage: {{Designed | Announced | Implementing | Stabilizing}}
Affected: {{N}} people / {{teams}}

RESISTANCE REGISTER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Resistor / Group | Resistance Type | Concern Stated    | Validity   | Response
{{name/group}}   | Type 1 (Legit)  | {{specific issue}} | Valid      | Modify the change
{{name/group}}   | Type 2 (Loss)   | {{loss named}}     | Real       | Acknowledge + mitigate
{{name/group}}   | Type 3 (Fear)   | {{vague concern}}  | Uncertain  | Surface + inform
{{name/group}}   | Type 4 (Friction)| "Too fast"        | Process gap| Reopen consultation
{{name/group}}   | Type 5 (Systemic)| Incentive conflict| Structural | Escalate

SIGNALS DETECTED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⚠️ {{Signal type}}: {{Observation}} — Response: {{transparent action}}

CHANGE HEALTH METRICS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Adoption rate: {{N}}% (target at this stage: {{N}}%) | {{On track 🟢 | Behind 🟡 | At risk 🔴}}
Concern volume trend: {{Decreasing 🟢 | Stable 🟡 | Increasing 🔴}}
Resistor engagement: {{Participating | Working around}}
Leadership alignment: {{Consistent 🟢 | Inconsistent 🔴}}

RECOMMENDED ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Specific action for highest-risk resistance type}} by {{date}}
2. {{Modification to the change (if Type 1 concern is valid)}}
3. {{Systemic escalation (if Type 5 detected)}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Resistance classified by type (not just noted) | Base: 65% |
| Legitimate concern separated from friction | +15% |
| Adoption rate tracked with target trajectory | +10% |
| Five signals assessed in change context | +10% |
| Response is engagement-based (not suppression) | +5% |
| Resistance treated as obstacle to overcome | −50% (disqualifying) |
| No resistance type classification | −20% |
| No adoption tracking | −15% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Resistance as obstacle** | EM treats all resistance as the same and tries to overcome it | Classify first. Legitimate concern should change the change. Fear needs information. Friction needs process reset. |
| **Type 1 ignored** | Valid concern raised; change proceeds unchanged | A change that proceeds with a known flaw will fail. Address Type 1 before anything else. |
| **Type 5 personalized** | Systemic incentive conflict treated as individual difficult behavior | When multiple people resist the same thing, the structure is the resistor. Escalate structurally. |
| **Managed compliance** | Adoption rate achieved through authority or pressure | Compliance is not commitment. Compliant non-adoption will reverse the moment pressure eases. |
| **Top-down without consultation** | Change announced before input; Type 4 resistance erupts | Consult before announcing. The cost of consultation is days. The cost of Type 4 resistance is weeks of recovery. |

---

## References

- `skills/organizational/conflict-prediction.md` — Change resistance escalates into organizational conflict
- `skills/organizational/alignment-health.md` — Change health is a component of alignment health
- `skills/organizational/political-risk.md` — Mismanaged resistance creates political risk

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/organizational/conflict-prediction.md` | Unchecked resistance predicts organizational conflict |
| `skills/organizational/stakeholder-analysis.md` | Resistors appear in the stakeholder map |
| `skills/organizational/alignment-health.md` | Change adoption rate feeds alignment health score |
| `skills/organizational/political-risk.md` | Systemic resistance and escalation create political risk |
