# Skill: Architecture Review Deck

**Domain**: Presentation
**Owner**: `subagents/tech-lead.md`
**Cadence**: On-demand (significant architectural decisions)

---

## Purpose

Build and present an architecture review — communicating a technical decision to a mixed audience of engineers and executives in a single deck that works for both, with executive-facing framing on top and technical depth available below.

Architecture decisions are high-stakes, low-frequency, and often irreversible. The architecture review deck is the artifact that makes the decision transparent, documented, and defensible — both in the meeting and for the engineers who join the team in 18 months.

**The dual-audience challenge:**
- Engineers need to see the technical trade-offs, the threat vectors, and the implementation path.
- Executives need to see the business impact, the cost, the risk, and the recommendation.
- The same deck must serve both.

**The 15-minute VP rule for architecture:**
> "I have 15 minutes with the VP. What are the three slides that matter most?"
>
> - **Slide 1**: The Decision — what architectural choice is being made and why it matters
> - **Slide 2**: The Trade-off — what we gain and what we give up, in business terms
> - **Slide 3**: The Ask — approval, awareness, or resource (specific)
>
> Everything technical goes in the appendix. Present it only if asked.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **The decision** | What architectural choice is being made |
| **Options considered** | At minimum 2 options evaluated (including status quo) |
| **Recommendation** | Which option is recommended and why |
| **Business impact** | How this decision affects delivery, reliability, or cost |
| **Technical risk assessment** | What can go wrong with each option |

### Optional
| Input | Description |
|---|---|
| **ADR (Architecture Decision Record)** | Formal ADR if one has been written |
| **Prototype or proof of concept results** | Evidence that the recommendation is viable |
| **Team input** | How the engineering team assessed the options |
| **Migration plan** | How to move from current to recommended state |
| **Reversibility** | How hard it is to undo this decision |

---

## Analysis

### Step 1 — Frame the Architecture Decision in Business Terms

Every architectural choice has a business implication. Name it before naming the technical solution.

| Technical decision | Business frame |
|---|---|
| Monolith to microservices | "Enables independent team delivery — reduces coordination cost as we scale" |
| Moving to managed database | "Reduces operational burden; trading control for reliability and vendor dependency" |
| Replacing vendor X with Y | "Reduces cost $X annually; requires N weeks migration risk window" |
| Adding caching layer | "Reduces latency by N ms; enables N× more concurrent users before infrastructure scales" |
| Rebuilding vs. buying | "Build: full control, N months, $X. Buy: deployed in N weeks, $Y/year, vendor lock-in" |

### Step 2 — Structure for Dual Audience

```
EXECUTIVE LAYER (slides 1–3): Business decision
  Slide 1: What we're deciding and why it matters
  Slide 2: Options compared in business terms (cost, risk, speed)
  Slide 3: Recommendation + ask

ENGINEERING LAYER (slides 4+): Technical decision
  Slide 4: Technical options compared (architecture diagrams, trade-offs)
  Slide 5: Risk analysis and failure modes
  Slide 6: Implementation plan and migration path
  Slide 7+: Supporting evidence, benchmarks, proof of concept results
```

The executive layer is what gets presented. The engineering layer is what gets reviewed in the room (if time permits) or async before the meeting.

### Step 3 — Build the Options Comparison

Every architecture review needs a structured options comparison:

| Dimension | Option A | Option B | Status Quo |
|---|---|---|---|
| Business impact | {{outcome}} | {{outcome}} | {{ongoing cost}} |
| Time to implement | {{weeks}} | {{weeks}} | N/A |
| Cost | {{$X + eng-weeks}} | {{$X + eng-weeks}} | {{ongoing cost}} |
| Scalability | {{assessment}} | {{assessment}} | {{ceiling}} |
| Reversibility | {{easy/hard/impossible}} | {{easy/hard/impossible}} | N/A |
| Team readiness | {{High/Med/Low}} | {{High/Med/Low}} | N/A |

### Step 4 — Name the Irreversibility

Architecture decisions vary enormously in reversibility. Name it explicitly — it changes how the decision should be made.

| Reversibility | What it means | How to present |
|---|---|---|
| **Fully reversible** | Can undo in < 2 weeks with minimal cost | Lower urgency — can decide and revisit |
| **Partially reversible** | Can undo but at significant cost (N weeks, migration risk) | Flag the cost of reversal |
| **Irreversible** | Undoing requires a complete rebuild or years of work | Treat as a multi-year commitment — get the decision right |

---

## Decision Tree

```
Who is the primary audience for this review?

├── ENGINEERING TEAM ONLY
│   └── Format: Skip executive layer — go directly to technical depth
│       Include: Architecture diagrams, trade-off analysis, failure modes
│       Time: 45–60 minutes; this is a working session, not a presentation
│       Output: Decision + written ADR

├── MIXED AUDIENCE (engineers + VP or director)
│   └── Format: 3-slide executive layer + full engineering appendix
│       Present: Slides 1–3 to the room
│       Use appendix: When engineers ask technical follow-up questions
│       Time: 30 minutes presenting + 15 minutes Q&A
│       Output: Decision + ask + written ADR

├── EXECUTIVE ONLY (VP approval needed)
│   └── Format: 3-slide executive layer only
│       Appendix: Available if asked — do not volunteer technical detail
│       Time: 15 minutes
│       → Invoke: skills/presentation/executive-slide-review.md before presenting

└── BOARD LEVEL (rare — only for strategic architectural bets)
    └── Format: One slide. "We are making a major architectural decision.
               Here is what it enables. Here is the cost. Here is the risk.
               Here is our recommendation."
        → Invoke: skills/presentation/board-deck.md for board-level framing
```

---

## Output Template

```
ARCHITECTURE REVIEW — {{Decision Title}}
Presented by: {{EM / Tech Lead}} | Date: {{date}}
Decision type: {{New capability / Migration / Platform change / Vendor decision}}
Reversibility: {{Fully / Partially / Irreversible}}
Decision needed by: {{date}} | Decision owner: {{name / role}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[EXECUTIVE LAYER]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

SLIDE 1: THE DECISION
{{What is being decided — in business terms, no jargon}}
Why now: {{What has changed that makes this decision necessary or time-sensitive}}

SLIDE 2: OPTIONS
| Option | Business benefit | Cost | Risk | Reversible |
|---|---|---|---|---|
| {{A}} | {{outcome}} | {{$X, N weeks}} | {{primary risk}} | {{Yes/No}} |
| {{B}} | {{outcome}} | {{$X, N weeks}} | {{primary risk}} | {{Yes/No}} |
| Status quo | {{none new}} | {{ongoing: $X}} | {{what degrades}} | N/A |

SLIDE 3: RECOMMENDATION + ASK
Recommendation: {{Option A or B — one sentence rationale in business terms}}
Ask: {{Specific — approval / awareness / resource}}
Decision window: {{When options close}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ENGINEERING LAYER — Appendix]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

TECHNICAL OPTIONS DETAIL
Option A: {{Architecture description, diagrams, dependencies}}
Option B: {{Architecture description, diagrams, dependencies}}

RISK ANALYSIS
{{Technical risks, failure modes, mitigation for recommended option}}

IMPLEMENTATION PLAN
Phase 1: {{what, who, N weeks}}
Phase 2: {{what, who, N weeks}}
Migration path: {{how we get from current state to target state}}

ADR REFERENCE: {{Link or document reference}}
```

---

## Example (Executive Layer)

```
ARCHITECTURE REVIEW — Authentication Service Rebuild
Presented by: Arif & Lena (Tech Lead) | Date: July 7, 2025
Reversibility: Partially reversible (rollback costs 3 weeks)
Decision needed by: July 14

THE DECISION
Our authentication service handles 100% of user logins. It has had 2 service
disruptions in 30 days due to an architectural defect in the session handling
layer. We are deciding whether to patch the defect or rebuild the service.

OPTIONS
| Option | Benefit | Cost | Risk | Reversible |
|---|---|---|---|---|
| A: Rebuild | 85% reliability improvement; scalable to 10× users | 6 weeks, ~$120K eng cost | 3-week feature delay | Partially |
| B: Patch | Immediate 40% risk reduction | 1.5 weeks, ~$30K eng cost | Doesn't address root cause; recurrence likely in 6 months | Yes |
| Status quo | None | Ongoing P1 risk | Next P1 costs $120K + 2-week response | N/A |

RECOMMENDATION: Option A (Rebuild)
The patch extends our risk window 6 months and doesn't fix the root cause. The
rebuild costs the equivalent of one P1 incident in engineering time and permanently
removes the risk. At our current growth rate, a patch also becomes insufficient
within 12 months regardless.
Ask: Approval to schedule the rebuild sprint starting July 21. Feature delivery
paused for 6 weeks; Q3 milestone adjusted (Enterprise API moves to September 30).
Decision by July 14 — sprint planning is July 15.
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Options comparison includes status quo | Base: 65% |
| Reversibility explicitly named | +10% |
| Business framing in executive layer (no jargon) | +10% |
| Recommendation is specific (not conditional) | +10% |
| Decision window named | +10% |
| Only one option presented | −25% |
| Technical jargon in executive layer | −15% |
| No business impact framing | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **One option presented** | "We need to rebuild X" without alternatives | Always present at minimum 2 options + status quo |
| **Technical jargon in exec slides** | Microservices, API, latency in the executive layer | Translate completely for slides 1–3. Technical detail belongs in appendix. |
| **No reversibility signal** | Decision presented without noting how hard it is to undo | Name it. Executives calibrate confidence differently for reversible vs. irreversible. |
| **No business frame** | Options compared only on technical dimensions | Every option comparison row must have a business benefit and business risk column. |
| **ADR skipped** | Decision made in meeting, not documented | Architecture decisions without ADRs create institutional amnesia. Write the ADR. |

---

## References

- `subagents/tech-lead.md` — Technical analysis that feeds this deck
- `subagents/architecture-reviewer.md` — Deep specialist for complex architecture assessments
- `docs/engineering-playbook.md` → Architecture section

## Related Skills

| Skill | Relationship |
|---|---|
| `subagents/architecture-reviewer.md` | Generates the technical analysis that feeds slides 4+ |
| `skills/executive/executive-decision-framework.md` | Decision framing for the executive layer |
| `skills/presentation/executive-slide-review.md` | Review executive layer before presenting |
| `skills/presentation/engineering-review.md` | Engineering-team version of the review session |
