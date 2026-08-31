# Skill: Skill-Atrophy Signal

**Domain**: People Leadership & Engineering Coaching
**Owner**: `subagents/engineering-coach.md`
**Cadence**: Monthly Review (Private Coaching Signal)

---

## Purpose

Detect and mitigate "Team Skill Atrophy"—the decline in foundational engineering skills (debugging, architectural intuition, system-level thinking) due to an over-reliance on AI-assisted coding (Copilots, LLM generation). This signal is designed as a *coaching* tool, not a performance scorecard, to ensure senior engineers maintain their "novel problem-solving" edge.

---

## The Atrophy Model

Skill atrophy occurs in four stages:
1. **The Generation Gap**: Engineers stop writing boilerplate and start generating logic blocks. (Low Risk)
2. **The Review Decay**: Code reviews focus on "does it work" rather than "is this the right design," because the AI generated it. (Medium Risk)
3. **The Debugging Wall**: When the AI fails, the engineer struggles to trace the root cause without an LLM hint. (High Risk)
4. **Architectural Amnesia**: The engineer can ship features but can no longer explain the underlying system architecture or invariants. (Critical Risk)

---

## Analysis & Detection Signals

### 1. The AI-to-Human Debugging Ratio
- **Signal**: Compare the volume of code generated vs. the time spent in manual debugging/profiling.
- **Metric**: If an engineer spends < 10% of their time in a debugger or log analysis without AI assistance, flag for "Manual Debugging Decay."

### 2. PR Review Quality
- **Signal**: Review the comments left by an engineer on peers' PRs.
- **Metric**: If 90% of comments are "LGTM" or focus only on syntax/formatting (which AI handles), flag for "Deep Review Atrophy."

### 3. Novel Problem Performance
- **Signal**: Observe how the engineer handles a "P0 Outage" or a "Novel Technical Debt" task where Copilot has no training data.
- **Metric**: Latency to identify root cause without external LLM queries.

---

## Coaching Interventions

### For Early Stage Atrophy (Generation Gap)
- **Action**: "White-box Coding." Challenge the engineer to explain every line of a generated block during a 1:1.
- **Goal**: Maintain mental model of the code.

### For Mid-Stage Atrophy (Review Decay)
- **Action**: "Blind Peer Review." Have the engineer review a complex piece of code with AI assistance turned *off*.
- **Goal**: Rebuild critical reading skills.

### For Late-Stage Atrophy (Debugging Wall)
- **Action**: "The Debugging Dojo." Assign a task specifically focused on a complex legacy bug that requires deep stack trace analysis.
- **Goal**: Force manual tracing and system-level thinking.

---

## Output Template (Private to EM/Coach)

```markdown
### SKILL-ATROPHY SIGNAL: [Engineer Name]
**Date**: YYYY-MM-DD
**Risk Level**: [Green | Yellow | Red]

#### OBSERVATIONS
- **AI-assisted Code Ratio**: [e.g., 85%]
- **Deep Review Signal**: [e.g., "Syntactic focus only"]
- **Debugging Performance**: [e.g., "Struggled with novel race condition"]

#### INTERPRETATION
[1-2 sentences on whether the engineer is losing their 'first-principles' edge.]

#### COACHING RECOMMENDATION
- **Immediate Action**: [e.g., Assign a 'no-AI' debugging task this sprint]
- **1:1 Topic**: [e.g., System invariants of the Auth module]
```

---

## Ethical Constraint
**NEVER** use this signal for performance reviews or PIPs. Over-reliance on AI is often a systemic pressure (e.g., "delivery at all costs"). This signal is a warning for the manager to protect the engineer's long-term career capital.
