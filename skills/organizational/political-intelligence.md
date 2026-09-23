# Skill: Political Intelligence

**Domain**: Organizational Strategy & Risk
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly detection + Quarterly holistic review

---

## Purpose

Detect and respond to organizational risk patterns by monitoring five key "political signals." This consolidated skill replaces fragmented assessments with a unified detection engine that identifies ethical responses to information asymmetry, power vacuums, and incentive friction.

This skill answers:
1. Which organizational risk signals are currently active?
2. Are these isolated incidents or a systemic pattern (Targeted Erasure, Power Vacuum, etc.)?
3. What is the overall Organizational Risk Score, and what are the priority ethical interventions?

---

## Detection Engine: The Five Signals

### 1. Decision Reversals
*A decision is made without a key party's input, then reversed after they learn of it.*
- **Detection**: Track frequency (last 6 months) and timing (rapid flip-flops < 48hrs).
- **Risk Indicator**: Contradictory reasons given to different groups or selective information sharing.

### 2. Meeting Exclusion
*Stakeholders affected by a decision are missing from the meeting where it's made.*
- **Detection**: Track invitation patterns. Are dissenting voices or specific functional groups systematically absent?
- **Risk Indicator**: Vague "right people in the room" justifications while excluded parties are directly impacted.

### 3. Ownership Ambiguity
*Unclear decision rights leading to work falling through cracks or contested claims.*
- **Detection**: Monitor response patterns—who steps up vs. who is bypassed during vacuums.
- **Risk Indicator**: Informal power consistently overriding formal RACI structures.

### 4. Escalation Patterns
*Issues bypassed to higher levels without prior resolution attempts at the local level.*
- **Detection**: Track "bypass rate"—percentage of escalations going around direct managers or process.
- **Risk Indicator**: Cluster escalations (multiple people escalating the same topic independently).

### 5. Incentive Misalignment
*Rewards (promotions, recognition) given for behaviors that conflict with stated values.*
- **Detection**: Map formal rewards vs. informal "hero culture" praise.
- **Risk Indicator**: Hero work/firefighting rewarded while collaboration or quality is penalized.

---

## Scoring & Pattern Recognition

### Holistic Risk Score Calculation
Apply weights to individual signal assessments (0-100 scale):
- **Decision Reversals**: 22%
- **Meeting Exclusion**: 20%
- **Ownership Ambiguity**: 18%
- **Escalation Patterns**: 20%
- **Incentive Misalignment**: 20%

**Score Thresholds**:
- **0–30 (Green)**: Healthy environment. Monitor quarterly.
- **31–40 (Yellow)**: Risk contained. Targeted intervention needed.
- **41–60 (At Risk)**: Multiple signals. Weekly monitoring + prioritized interventions.
- **> 60 (Red)**: Critical dysfunction. Immediate escalation and structural fix required.

### Systemic Patterns
- **Targeted Erasure**: Reversals + Exclusion. (High risk of marginalization)
- **Power Vacuum**: Ambiguity + Escalation. (Leadership gap creating bypass)
- **Accountability Shield**: Misalignment + Reversals. (Pivoting used to hide poor execution)
- **Silence Amplification**: Exclusion + Escalation. (Concerns ignored/suppressed)

---

## Ethical Response Protocol

1. **Name the Pattern**: Use objective, non-judgmental language to describe the observed signal (e.g., "I've noticed decisions are being reversed within 48 hours of stakeholder commitment").
2. **Demand Transparency**: Require clear justifications and inclusive communication protocols for all decisions and meeting invites.
3. **Clarify Accountability**: Reset RACI maps and explicitly define what behaviors lead to rewards.
4. **Restore Dialogue**: Facilitate direct conversations between parties involved in escalations or exclusions.

---

## Single-Incident Fast Path (Escalation Signal)

The five-signal engine scores **aggregates** (typically last 6 months). Do not wait for a second data point when a single escalation happens today — especially when a stakeholder raised concerns about the EM or the team to a skip-level rather than to the EM.

**When to use this path (not the monthly scan):**
- A stakeholder bypassed the EM and raised a concern to the EM's manager, skip-level, or HR
- The EM learned of the concern second-hand on the same day
- Only one incident exists so far (frequency = 1)

**Triage (same day):**
1. **Verify specifics** — what was said, to whom, about what, with what ask. Do not infer motive.
2. **Direct conversation with the source** — request a bilateral conversation before responding upward. Name the pattern, not the person.
3. **Shared-visibility protocol** — tell the manager/skip-level: "I heard this, I am talking to the source, I will close the loop by {{date}}."
4. **Do not inflate the aggregate score** from a single incident. Feed the monthly scan only if it recurs (2+ independent incidents in 90 days).
5. **Log** to `memory/conflicts/` (reputational/interpersonal strain) and `memory/stakeholders/` (relationship health). Cross-link both.

**Worked example:** PM raises delivery-quality concerns to the Director, not the EM. Same-day path: EM asks the Director for the specifics, books a 30-minute with the PM, agrees a shared status format, logs CON + STK entries. Monthly escalation score stays unchanged unless a second independent bypass occurs.

---

## Output Template

### 1. Risk Summary
- **Risk Level**: [Green/Yellow/At Risk/Red]
- **Holistic Score**: [0-100]
- **Active Patterns**: [e.g., Power Vacuum]
- **Primary Recommendation**: [1 immediate action]

### 2. Signal Scorecard
| Signal | Score | Status | Primary Observation |
|---|---|---|---|
| Decision Reversals | | | |
| Meeting Exclusion | | | |
| Ownership Ambiguity | | | |
| Escalation Patterns | | | |
| Incentive Misalignment | | | |

### 3. Intervention Plan
- **Immediate (48h)**: [Action]
- **Short-term (2w)**: [Action]
- **Systemic (Next Q)**: [Action]
