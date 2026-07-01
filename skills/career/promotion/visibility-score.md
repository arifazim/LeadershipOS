# Skill: Visibility Score

**Domain**: Career / Promotion
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Monthly (check-in) + Quarterly (audit) + On-demand (before review cycle, after key project)

---

## Purpose

Measure organizational visibility — who knows about your work, at what level, and whether the right decision-makers can advocate for you when it matters — and surface the gap between work quality and work visibility before it costs a promotion.

**What the EM does automatically**: When assessing visibility, the EM:
1. Scores visibility across three audiences (peers, cross-functional partners, leadership)
2. Identifies promotion decision-makers and assesses their awareness of your impact
3. Detects visibility gaps: strong work that no one above your manager knows about
4. Recommends specific visibility actions calibrated to the target level
5. Distinguishes earned visibility (from impact) from performed visibility (self-promotion) — both necessary, distinct in character

Promotion is a social process, not just a performance process. A calibration committee cannot advocate for impact they haven't seen. The engineer who does excellent work invisibly will be passed over by the engineer who does good work visibly. Visibility is not vanity — it is a professional responsibility.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Target level** | Determines which audience tier matters most |
| **Current projects and impact** | What has been accomplished in the past 12 months |
| **Organizational chart** | Who makes or influences promotion decisions |

### Optional
| Input | Description |
|---|---|
| **Past presentation or communication touchpoints** | When did you present to leadership? What was the context? |
| **Cross-functional collaboration history** | Who in other functions knows your work? |
| **Feedback from leadership** | Any direct feedback or recognition from VP+ level |

---

## Analysis

### Step 1 — Map the Visibility Audiences

Three audiences matter for promotion. The weight shifts with target level:

| Audience | Relevance by target level | What they need to know |
|---|---|---|
| **Manager** | Critical at all levels | Everything — your manager is your primary advocate |
| **Skip-level (manager's manager)** | High for L4→L5, M1→M2+ | 2–3 signature impacts; your trajectory; why you're ready |
| **Cross-functional partners** | Medium-high for L5+, M2+ | That you make their teams better; that you operate at org scope |
| **Peers at target level** | Medium — signals org-level recognition | That colleagues at the level above respect your work |
| **Senior leadership (VP+)** | Required for L6, M3+ | Your strategic contribution; business impact; point of view |

### Step 2 — Score Visibility Per Audience

```
Visibility score per audience (0–10):

Manager visibility (weight: 3×):
  Knows your top 3 impacts this quarter: 3 pts
  Has heard specific positive feedback about you from others: 2 pts
  Has told you explicitly what they'll say in calibration: 2 pts
  Knows your development goals and target level: 2 pts
  Would rate your performance ≥ "Exceeds" without prompting: 1 pt

Skip-level visibility (weight: 2×):
  Knows your name and role: 1 pt
  Has seen your work directly (presentation, document, decision): 2 pts
  Can name one specific impact you had: 3 pts
  Views you as operating at target level: 3 pts
  Has given you direct feedback or praise: 1 pt

Cross-functional visibility (weight: 1.5×):
  2+ cross-functional partners can describe your work: 2 pts
  At least one partner has praised you to your manager: 3 pts
  Cross-functional partners seek your involvement proactively: 3 pts
  You are the named technical/EM contact for cross-functional partners: 2 pts

Peer visibility at target level (weight: 1×):
  Peers at target level respect your judgment: 3 pts
  You are included in conversations normally reserved for target level: 3 pts
  Others describe you at target level without prompting: 4 pts

Weighted visibility score = Σ (audience score × weight) ÷ max possible × 100

Visibility interpretation:
  80–100: High visibility — right people know about your work at the right depth
  60–79:  Medium — manager advocacy strong; skip-level gaps
  40–59:  Low — your manager knows; few others do
  < 40:   Invisible — impact exists; audience doesn't
```

### Step 3 — Detect Critical Visibility Gaps

| Gap type | Symptom | Risk |
|---|---|---|
| **Skip-level blind spot** | Your manager's manager doesn't know who you are | Calibration rooms: your manager advocates; no one else validates |
| **Cross-functional void** | No one in partner functions can describe your work | Impact is perceived as team-local; org scope not credible |
| **Recency gap** | Last visible moment was >6 months ago | Calibration weights recent visibility; old wins fade |
| **Depth without breadth** | Manager knows everything; no one else knows anything | Single point of failure for advocacy — risky in calibration |
| **Activity visible, impact invisible** | People know you work hard; no one knows what changed | "I know they're busy" is not a promotion recommendation |

### Step 4 — Visibility Action Ladder

Actions calibrated by target level and gap type:

| Action | Effort | Visibility gain | Best for gap type |
|---|---|---|---|
| Share impact summary in 1:1 with manager | Low | Manager depth | Manager gaps |
| Send a project retrospective to skip-level | Low | Skip-level awareness | Skip-level blind spot |
| Present at team meeting or all-hands | Medium | Peer + skip-level breadth | Recency gap |
| Write a design doc or post-mortem visible to org | Medium | Cross-functional + peers | Cross-functional void |
| Lead a cross-team technical decision | High | Cross-functional + skip-level | Org scope credibility |
| Present to VP or senior leadership | High | Senior leadership visibility | L5+/M2+ requirements |
| Get an executive sponsor for a project | High | Senior sponsorship | L6/M3 requirements |

---

## Decision Tree

```
What does the visibility audit reveal?

├── SKIP-LEVEL DOESN'T KNOW YOUR WORK
│   └── This is the most common promotion blocker that people don't see coming
│       Action: Request a skip-level 1:1 this quarter
│       Framing: "I'd love 20 minutes to share what I've been working on
│       and get your perspective on my development."
│       Bring: One concrete impact story with business outcome
│       Goal: They can name one thing you did when asked in calibration
│       → Invoke: skills/career/promotion/executive-feedback.md

├── WORK IS INVISIBLE OUTSIDE YOUR TEAM
│   └── Impact exists; audience doesn't
│       Action: Write one design doc or impact retrospective this month
│       Circulate to: PM, cross-functional leads, skip-level
│       Subject line: "{{Project}} — what we learned / what changed"
│       Do NOT: Send without substance; visibility for its own sake erodes credibility

├── RECENCY GAP (last visible moment > 6 months ago)
│   └── Past impact exists but has faded
│       Action: Create a new visibility moment within 60 days
│       Options: Present at next all-hands / write cross-team doc / lead tech review
│       Do NOT: Reference old wins in conversations as your primary credential

├── MANAGER VISIBILITY STRONG, NO ONE ELSE
│   └── Advocacy is fragile — calibration works best with multiple voices
│       Action: Identify 2 cross-functional partners; ensure they can describe your work
│       Have the direct conversation: "I'd love your feedback on {{project}}.
│       Would you be willing to share it with {{manager's manager}} if asked?"
│       → Invoke: skills/career/promotion/executive-feedback.md for senior feedback structure

└── VISIBILITY IS HIGH ACROSS ALL AUDIENCES
    └── Quarterly maintenance: one new visibility moment per quarter
        Pre-calibration: confirm manager's talking points align with your evidence
        → Invoke: skills/career/promotion/promotion-gaps.md for final readiness check
```

---

## Output

### Visibility Score Report

```
VISIBILITY SCORE — {{Name}} — {{Current Level}} → {{Target Level}} — {{date}}

OVERALL VISIBILITY SCORE: {{N}}/100 | {{High 🟢 | Medium 🟡 | Low 🟠 | Invisible 🔴}}

AUDIENCE BREAKDOWN
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Audience              | Score  | Weight | Weighted | Critical gap?
Manager               | {{N}}/10 | 3×   | {{N}}    | {{Yes/No — detail}}
Skip-level            | {{N}}/10 | 2×   | {{N}}    | {{Yes/No — detail}}
Cross-functional      | {{N}}/10 | 1.5× | {{N}}    | {{Yes/No — detail}}
Peers at target level | {{N}}/10 | 1×   | {{N}}    | {{Yes/No — detail}}

PROMOTION DECISION-MAKER MAP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision-maker    | Role          | Visibility level | Last touchpoint  | Action needed
{{name}}          | Your manager  | {{N}}/10         | This week        | Share top 3 impacts
{{name}}          | Skip-level    | {{N}}/10         | {{N}} months ago | Request 1:1 by {{date}}
{{name}}          | VP/Director   | {{N}}/10         | Never            | Need visibility moment

VISIBILITY GAPS (priority order)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
1. {{Gap type}} — {{specific action}} by {{target date}}
2. {{Gap type}} — {{specific action}} by {{target date}}

VISIBILITY ACTIONS (next 90 days)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Month 1: {{action — specific, not "be more visible"}}
Month 2: {{action}}
Month 3: {{action — pre-calibration visibility checkpoint}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| All four audience tiers assessed | Base: 65% |
| Named decision-makers in map | +15% |
| Last touchpoint dated for each audience | +10% |
| Specific actions with deadlines produced | +10% |
| Visibility distinguished from self-promotion | +5% |
| Only manager visibility assessed | −25% |
| No action plan produced | −15% |
| Visibility score without audience breakdown | −10% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Manager only** | Only manager knows your work; calibration has one voice | Develop visibility with at least skip-level and one cross-functional partner. |
| **Activity visibility** | People know you're busy; no one knows your impact | Visibility of busyness is not visibility of value. Surface outcomes, not hours. |
| **Recency neglect** | Strong past visibility; no recent moments | Calibration weights last 6–12 months. Maintain a cadence of one visibility moment per quarter. |
| **Over-correction to self-promotion** | Frequent announcements without substance | Visibility must be earned through substance. Frequency without quality damages credibility. |
| **Visibility without advocacy** | Decision-makers know you but don't know what to say | Visibility is not enough — advocates need specific, memorable impact to repeat in calibration. |

---

## References

- `skills/career/promotion/impact-tracker.md` — Impact entries become visibility content
- `skills/career/promotion/executive-feedback.md` — Skip-level and senior leader engagement
- `skills/career/promotion/promotion-gaps.md` — Visibility gaps feed the overall gap analysis

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/career/promotion/impact-tracker.md` | Impact entries are raw material for visibility actions |
| `skills/career/promotion/executive-feedback.md` | Senior visibility requires structured feedback loops |
| `skills/career/promotion/promotion-gaps.md` | Visibility gap is one of five gap categories |
| `skills/career/promotion/career-roadmap.md` | High-visibility projects score higher in roadmap selection |
