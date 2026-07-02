# Skill: Political Awareness

**Domain**: Leadership  
**Owner**: `subagents/engineering-manager.md`  
**Cadence**: Quarterly

---

## Purpose

Measure the engineering manager's understanding of organizational dynamics and ability to navigate them. Political awareness is not about manipulation — it is about understanding who decides, who influences, what the unwritten rules are, and how change actually happens in the organization.

This skill answers three questions:
1. Does the EM understand the informal power structure and unwritten rules of the organization?
2. Can the EM anticipate resistance to change and navigate it effectively?
3. Does the EM build alliances and manage stakeholders in ways that enable, rather than block, progress?

**Invoke this skill when**: Preparing for a major organizational change, before a promotion conversation, when resistance to an initiative is unexpected, or after a political misstep.

**Do not invoke this skill for**: Measuring formal stakeholder alignment (use `stakeholder_alignment.md`), measuring influence tactics (use `influence_score.md`), or measuring executive trust (use `executive_trust_score.md`).

---

## Inputs

### Required

| Input | Source | Format |
|---|---|---|
| Organizational chart changes | HR / org chart tool | Changes in the last 2 quarters: new roles, reporting changes, reorgs |
| Alliance mapping | EM self-assessment or peer feedback | 5–10 key alliances: stakeholder, strength, reciprocity |
| Resistance patterns | Incident log / EM tracking | Last 5 instances of resistance to EM initiatives |

### Supplementary (include if available)

| Input | Source | Format |
|---|---|---|
| Change readiness assessment | EM judgment or survey | Readiness of stakeholders for upcoming changes |
| Resistance early warning | Meeting notes, 1:1s | Early signals of resistance before initiatives are proposed |
| Informal power structure analysis | EM observation | Who actually makes decisions vs. who has the title |
| EM political missteps | EM log or peer feedback | Instances where EM misread the political landscape |
| Calibration data | Peer EM sessions | Relative political awareness compared to peer EMs |

---

## Analysis

Execute in sequence. Do not skip steps when inputs are available.

### Step 1 — Organizational Chart Fluency
Review the organizational chart changes in the last 2 quarters:
- **Chart accuracy** = EM's understanding of current reporting lines, decision rights, and influence nodes vs. the actual org chart

| Chart Accuracy | Interpretation |
|---|---|
| EM's map matches actual org chart | High. EM understands formal structure. |
| EM's map has 1–2 inaccuracies | Acceptable. Minor gaps in understanding. |
| EM's map has 3+ inaccuracies | At Risk. EM does not understand who reports to whom or who has authority. |
| EM's map is significantly wrong | Critical. EM is operating with incorrect organizational knowledge. |

### Step 2 — Alliance Mapping Assessment
Review alliance mapping:
- **Alliance strength** = `(Strong alliances ÷ Total alliances mapped) × 100`
- A "strong alliance" is a relationship with mutual trust, reciprocal support, and informal influence.

| Alliance Strength | Interpretation |
|---|---|
| ≥ 60% | High. EM has strong alliances across the organization. |
| 40–59% | Acceptable. EM has some strong alliances. |
| 20–39% | At Risk. EM's alliances are mostly transactional or weak. |
| < 20% | Critical. EM has no meaningful alliances outside their immediate team. |

### Step 3 — Resistance Pattern Analysis
Review resistance patterns:
- **Resistance anticipation rate** = `(Resistance events EM anticipated and prepared for ÷ Total resistance events) × 100`

| Resistance Anticipation Rate | Interpretation |
|---|---|
| ≥ 70% | High. EM anticipates resistance and prepares for it. |
| 50–69% | Acceptable. EM anticipates some resistance. |
| 30–49% | At Risk. EM is frequently surprised by resistance. |
| < 30% | Critical. EM does not anticipate resistance and is repeatedly blindsided. |

### Step 4 — Change Readiness Assessment
Review change readiness for upcoming initiatives:
- **Readiness score** = EM's assessment of stakeholder readiness vs. actual readiness (if data is available)

| Readiness Accuracy | Interpretation |
|---|---|
| EM's assessment matches actual readiness | High. EM reads the room accurately. |
| EM's assessment is 1 level off | Acceptable. Minor misreading. |
| EM's assessment is 2+ levels off | At Risk. EM significantly misreads stakeholder readiness. |
| EM's assessment is opposite of actual readiness | Critical. EM's political judgment is inverted. |

### Step 5 — Synthesize Political Awareness Signal
Combine chart accuracy, alliance strength, resistance anticipation, and readiness accuracy into an overall political awareness assessment. Weight: Chart accuracy (20%), Alliance strength (30%), Resistance anticipation (30%), Readiness accuracy (20%).

---

## Decision Tree

Use this tree to determine the political awareness classification and primary recommendation.

```
What is the resistance anticipation rate?
│
├── ≥ 70% ────────────────────────────────────────────────
│   What is the alliance strength?
│   │
│   ├── ≥ 60% ───────────────────────────────────────────
│   │   What is the chart accuracy?
│   │   │
│   │   ├── High
│   │   │   └── OUTCOME: Political awareness is strong.
│   │   │         Recommendation: Sustain.
│   │   │         Use your awareness to mentor peer EMs.
│   │   │
│   │   └── Acceptable or lower
│   │       └── OUTCOME: Political awareness is strong with structural gap.
│   │             Recommendation: Update your org chart understanding
│   │             after every reorg or leadership change.
│   │             Ask "who actually decides?" not just "who has the title?"
│   │
│   └── 40–59% ─────────────────────────────────────────
│       └── OUTCOME: Political awareness is functional with alliance gap.
│             Recommendation: Invest in 2–3 new alliances this quarter.
│             Focus on stakeholders you will need for upcoming initiatives.
│
├── 50–69% ───────────────────────────────────────────────
│   What is the primary awareness gap?
│   │
│   ├── FORMAL STRUCTURE NOT UNDERSTOOD
│   │   └── OUTCOME: Political awareness is at risk due to org chart gaps.
│   │             Recommendation: Map the formal and informal structure.
│   │             Ask a peer EM or manager to walk you through
│   │             who actually decides what.
│   │
│   ├── RESISTANCE NOT ANTICIPATED
│   │   └── OUTCOME: Political awareness is at risk due to surprise.
│   │             Recommendation: Before any initiative,
│   │             run a "who will resist and why" analysis.
│   │             Name the resistors and their motivations.
│   │
│   └── ALLIANCES ARE TRANSACTIONAL
│       └── OUTCOME: Political awareness is at risk due to weak relationships.
│             Recommendation: Shift from transactional to reciprocal.
│             Ask "what do they need?" before "what do I need?"
│
└── < 50% ─────────────────────────────────────────────────
    What is the primary awareness failure?
    │
    ├── STRUCTURAL BLINDNESS
    │   └── OUTCOME: Political awareness is broken — EM does not understand the org.
    │         Recommendation: Get a mentor or coach who knows the organization.
    │         Map every reorg and leadership change.
    │         Ask "who has informal power?" in every new situation.
    │
    ├── RESISTANCE BLINDNESS
    │   └── OUTCOME: Political awareness is broken — EM is repeatedly blindsided.
    │         Recommendation: After every initiative, conduct a political post-mortem.
    │         Who resisted? Why? Was it foreseeable?
    │         Build a resistance pattern library.
    │
    └── ISOLATION
        └── OUTCOME: Political awareness is broken — EM has no alliances.
              Recommendation: Do not attempt major initiatives until you have
              at least 2–3 strong alliances. Invest in relationships first.
              Join cross-team forums. Build reciprocity.
```

---

## Output

Produce the following artifacts in order.

### 1. Political Awareness Summary (3–5 sentences)

State: overall political awareness signal (strong / functional / at risk / broken), primary strength, primary gap, and one immediate action. Include confidence level.

> **Example**: "Political awareness is functional with an alliance gap. Chart accuracy is high — EM understands the formal org structure. Resistance anticipation is 60% — EM anticipates some resistance but is occasionally surprised. Alliance strength is 38% — EM has some relationships but most are transactional. The primary gap is alliance building: EM has not invested in reciprocal relationships outside the team. Immediate action: EM to schedule informal conversations with 2 stakeholders who will be critical for the next major initiative. Confidence: High (82%)."

### 2. Political Awareness Scorecard

| Signal | Input Value | Threshold | Status |
|---|---|---|---|
| Chart accuracy | {{accuracy}} | High = Green, Acceptable = Yellow, At Risk/Critical = Red | {{G/Y/R}} |
| Alliance strength | {{%}} | ≥ 60% = Green, 40–59% = Yellow, < 20% = Red | {{G/Y/R}} |
| Resistance anticipation rate | {{%}} | ≥ 70% = Green, 50–69% = Yellow, < 30% = Red | {{G/Y/R}} |
| Readiness accuracy | {{accuracy}} | High = Green, Acceptable = Yellow, At Risk/Critical = Red | {{G/Y/R}} |

### 3. Alliance Map

| Stakeholder | Domain | Strength | Reciprocity | Current Posture | Needed Posture |
|---|---|---|---|---|---|
| {{Name / Role}} | {{Domain}} | {{Strong / Mod / Weak}} | {{High / Med / Low}} | {{Ally / Neutral / Opposed}} | {{Ally / Neutral / Opposed}} |

### 4. Resistance Pattern Log

| Initiative | Resistor | Motivation | Anticipated? | Response | Outcome |
|---|---|---|---|---|---|
| {{Initiative}} | {{Resistor}} | {{Motivation}} | {{Y/N}} | {{Response}} | {{Outcome}} |

### 5. Root Cause (if political awareness is At Risk or Broken)

- **Primary cause**: {{Structural blindness / Resistance blindness / Isolation / Multiple failures}}
- **Evidence**: {{2–3 specific observations from alliance map or resistance log}}
- **Is this new or recurring?** {{New this quarter / Recurring — compare to last 2 quarters}}

### 6. Recommendations

- **This week**: {{1 immediate action}}
- **This quarter**: {{1 systemic change to political practice}}
- **For upcoming initiatives** (if applicable): {{Specific stakeholder to engage before proposing}}

---

## Examples

### Example A — Strong Political Awareness

**Inputs**
- Org chart changes: 2 changes in the last 2 quarters — EM updated their understanding after each
- Alliance mapping: 9 alliances — 7 are strong and reciprocal (78% strength)
- Resistance patterns: 4 resistance events — EM anticipated and prepared for 3 (75% anticipation rate)
- Change readiness: EM assessed readiness correctly in 3 of 4 initiatives
- Request frequency: 6 unsolicited requests for input from outside the team

**Output Summary**
> Political awareness is strong. Chart accuracy is high, alliance strength is 78%, resistance anticipation is 75%, and readiness accuracy is high. EM has strong alliances, anticipates resistance, and reads stakeholder readiness accurately. The one gap is that EM has less influence with GTM stakeholders — alliances are primarily within engineering and product. Confidence: High (92%).

---

### Example B — Political Awareness Broken

**Inputs**
- Org chart changes: 3 changes in the last 2 quarters — EM has not updated their understanding of who reports to whom
- Alliance mapping: 6 alliances — 1 is strong and reciprocal (17% strength); 5 are transactional
- Resistance patterns: 5 resistance events — EM anticipated and prepared for 1 (20% anticipation rate)
- Change readiness: EM assessed readiness as "high" for an initiative that was actually "low" — the initiative was blocked
- EM political missteps: 2 instances where EM publicly contradicted a VP in a meeting

**Output Summary**
> Political awareness is broken. Chart accuracy is at risk — EM has not updated their org understanding after recent changes. Alliance strength is 17% — EM has no strong reciprocal relationships. Resistance anticipation is 20% — EM is repeatedly blindsided. Readiness accuracy is inverted — EM's assessment is opposite of actual stakeholder readiness. The primary cause is a combination of structural blindness and isolation: EM does not understand the org and has no alliances to compensate. Confidence: High (84%).

**Recommendations**
- *This week*: EM to schedule a 1:1 with their manager to discuss the current org structure and informal power dynamics.
- *This quarter*: Map the formal and informal org structure. Identify 2–3 stakeholders to build strong alliances with. Focus on reciprocity.
- *Systemic*: Before any major initiative, run a "who will resist and why" analysis. Name the resistors and their motivations. Do not propose until you have addressed the key resistance.

---

## Confidence Score

The confidence score reflects how much to trust this political awareness assessment. Apply modifiers to a base of 70%.

### Base Score
- Start at **70%** (Medium confidence) for any political awareness assessment with complete required inputs.

### Positive Modifiers (add to score)

| Condition | Modifier |
|---|---|
| All required inputs available | +10% |
| Supplementary inputs available (3+ of 5) | +10% |
| Alliance mapping includes informal relationships, not just formal titles | +5% |
| Multiple data sources corroborate the signal | +5% |

### Negative Modifiers (subtract from score)

| Condition | Modifier |
|---|---|
| One or more required inputs MISSING | −15% each |
| Alliance mapping is based on EM self-assessment only | −10% |
| No resistance data available | −10% |
| EM has been in the role < 6 months | −10% |

### Interpretation

| Score | Label | Action |
|---|---|---|
| 90–100% | High | Use output directly in initiative planning |
| 70–89% | Medium | Use output; flag gaps to manager |
| 50–69% | Low | Use output as hypothesis; validate with additional data before acting |
| < 50% | Speculative | Do not use for major initiative planning; collect missing inputs first |

---

## Failure Modes

| Failure Mode | Cause | Detection | Response |
|---|---|---|---|
| **Alliance self-reporting** | EM overestimates relationship strength | Alliance density is high but request frequency is low | Use request frequency and peer feedback as primary alliance signal |
| **Structural assumption** | EM assumes the org chart is current | Chart accuracy is low but EM reports understanding | Update org chart understanding after every reorg |
| **Resistance denial** | EM interprets resistance as "they don't understand" | Resistance anticipation is low but resistance is frequent | Resistance is political, not informational — understand motivations before re-explaining |
| **Isolation comfort** | EM prefers working with their team only | Alliance strength is low but EM reports satisfaction | Isolation limits influence and creates blind spots — invest in relationships |
| **Political labeling avoidance** | EM avoids "political" analysis as manipulative | Political awareness is low because EM refuses to map power dynamics | Political awareness is about understanding, not manipulating — map first, act ethically |
| **Misstep repetition** | EM repeats the same political errors | EM has multiple political missteps with no learning | Conduct political post-mortems after every misstep |

---

## References

- `docs/principles.md` — Principle 4: *Influence Before Authority*; Principle 3: *Default to Transparency*
- `docs/engineering-playbook.md` → *Managing Up*, *Managing Across*, *Organizational Dynamics*
- `skills/delivery/review-sprint.md` — Template for structure, confidence scoring, and failure modes
- `influence_score.md` — Closely related — political awareness enables effective influence
| `stakeholder_alignment.md` — Closely related — alignment requires political navigation |
| `communication_effectiveness.md` — Closely related — communication is a political tool |
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) — Stakeholder management (complementary) |
| Pfeffer — *Power: Why Some People Have It and Others Don't* (2010): Organizational power dynamics |
| Heifetz — *Leadership on the Line* (2002): Navigating political resistance to change |

---

## Related Skills

| Skill | Relationship |
|---|---|
| `influence_score.md` | Closely related — political awareness enables effective influence |
| `stakeholder_alignment.md` | Closely related — alignment requires political navigation |
| `communication_effectiveness.md` | Closely related — communication is a primary political tool |
| `master-leadership-health.md` | This dimension feeds into the holistic leadership health score |
| `executive_trust_score.md` | Trust affects political relationships |
| `skills/stakeholder/manage-expectations.md` (planned — not yet built) | Stakeholder management (complementary) |
| `skills/strategy/align-priorities.md` (planned — not yet built) | Strategic planning requires political awareness |
| `decision_quality.md` | Organizational context affects decision options |
