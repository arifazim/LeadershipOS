# Political Signals Module

**Domain**: Organizational Risk Detection & Ethical Response
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly, quarterly, or when signals emerge

---

## Purpose

The Political Signals module detects subtle organizational risk patterns and provides ethical, transparent response strategies. Unlike traditional political navigation frameworks that teach manipulation, this module is grounded in the platform's first principles: transparency, data-driven assessment, and organizational systems thinking.

The Political Signals module answers three questions:
1. What organizational risk patterns are present, and how severe are they?
2. What is the root cause of each signal in system terms (not individual blame)?
3. What ethical, transparent responses will de-escalate risk without manipulation?

**Invoke this skill when**: You sense organizational tension, receive unexpected pushback, notice information asymmetries, or want to assess team health before a promotion or role change.

**Do not invoke this skill for**: Individual performance issues (use `skills/people/performance-review.md`), sprint delivery reviews (use `skills/delivery/review-sprint.md`), or incident post-mortems (use `skills/operations/postmortem.md`).

---

## The Five Signals

```
┌─────────────────────────────────────────────────────────────┐
│                  POLITICAL SIGNALS ENGINE                     │
│                                                               │
│  ┌─────────────────────┐  ┌─────────────────────┐           │
│  │  Decision Reversals │  │   Meeting Exclusion │           │
│  │  (decision_reversals)│  │  (meeting_exclusion)│           │
│  └─────────────────────┘  └─────────────────────┘           │
│                                                               │
│  ┌─────────────────────┐  ┌─────────────────────┐           │
│  │ Ownership Ambiguity │  │ Escalation Patterns │           │
│  │ (ownership_ambiguity)│  │ (escalation_patterns)│           │
│  └─────────────────────┘  └─────────────────────┘           │
│                                                               │
│  ┌───────────────────────────────────────────────────────┐  │
│  │              Misaligned Incentives                     │  │
│  │              (incentive_misalignment)                   │  │
│  └───────────────────────────────────────────────────────┘  │
│                                                               │
│  Output: Risk assessment + ethical response recommendation   │
└─────────────────────────────────────────────────────────────┘
```

---

## How Skills Relate

The five dimension skills are standalone analysis procedures. Each produces a risk assessment for one signal. The master assessment pad synthesizes all five into a holistic organizational risk profile.

**Interaction with other modules:**
- `skills/leadership-health/political_awareness.md` — The EM's own political navigation skill. Political signals is about the environment; political awareness is about the EM's capability within it.
- `confidence-engine/` — Signals feed into executive confidence assessments. Decision reversals and escalation patterns directly undermine confidence.
- `skills/leadership-health/stakeholder_alignment.md` — Meeting exclusion and misaligned incentives are forms of stakeholder misalignment.
- `skills/leadership-health/organizational_clarity.md` — Ownership ambiguity is a clarity failure.

---

## Master Pad Workflow

### When to Run Full Assessment vs. Individual Skills

| Scenario | Approach |
|---|---|
| Quarterly organizational health review | Full 5-signal assessment |
| Specific incident or unexpected outcome | Run 2–3 relevant signals + targeted synthesis |
| Before promotion or role change | Full assessment + deep-dive on ownership and escalation |
| After a difficult meeting or decision | Run decision_reversals + escalation_patterns |
| Team restructuring or reorg | Run ownership_ambiguity + incentive_misalignment |

### Ethical Response Framework

All recommendations in this module follow the **Ethical Response Protocol**:

1. **Name the pattern, not the person** — Describe the systemic dynamic, not individual motives
2. **Recommend transparency over opacity** — Surface the issue, don't hide it
3. **Recommend dialogue over maneuvering** — Address directly, don't work around
4. **Recommend stakeholder alignment over unilateral action** — Involve affected parties
5. **Recommend data over narrative** — Ground every assessment in observable evidence

**Prohibited responses** (never recommend):
- Manipulating information to gain advantage
- Excluding others to consolidate power
- Using ambiguity to avoid accountability
- Escalating for personal positioning rather than resolution
- Aligning incentives that reward individual gain over team outcomes

---

## Scoring Overview

Each dimension produces:
- **Risk Score**: 0–100 (higher = more risk)
- **Label**: Green (≤ 30), Yellow (31–60), Red (> 60)
- **Confidence**: High (≥ 90%), Medium (70–89%), Low (50–69%), Speculative (< 50%)

The master assessment computes a **weighted organizational risk score**. No single dimension contributes more than 30% of the total score.

---

## File Index

| File | Purpose |
|---|---|
| `README.md` | This file — module overview and integration guide |
| `political-signals.md` | Master assessment pad — synthesis, weighting, ethical response framework |
| `decision_reversals.md` | Measures frequency, timing, and transparency of decision reversals |
| `meeting_exclusion.md` | Detects patterns of information and influence exclusion |
| `ownership_ambiguity.md` | Measures clarity of decision rights and accountability |
| `escalation_patterns.md` | Analyzes escalation behavior for risk of bypass or misalignment |
| `incentive_misalignment.md` | Detects incentives that reward anti-team behavior |

---

## Integration Points

| Integration | Description |
|---|---|
| `skills/leadership-health/political_awareness.md` | EM's political navigation capability interacts with organizational signal environment |
| `confidence-engine/executive_confidence.md` | Political signals directly impact executive confidence in the team |
| `skills/leadership-health/organizational_clarity.md` | Ownership ambiguity is a clarity dimension |
| `skills/leadership-health/stakeholder_alignment.md` | Meeting exclusion and incentive misalignment are misalignment forms |
| `skills/executive/executive-communication.md` | Ethical responses to political signals inform executive communication |
| `docs/principles.md` | All responses governed by platform principles (Transparency, People First, Think in Systems) |
