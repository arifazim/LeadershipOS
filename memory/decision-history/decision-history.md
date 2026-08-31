# Leadership Memory: Decision History

**Domain**: Leadership Memory → Decision History
**Owner**: `subagents/engineering-manager.md`
**Audience**: EM (informs future leadership decisions; prevents repeated mistakes)
**Cadence**: Record immediately after significant leadership decisions; add outcome entries retroactively

---

## Purpose

Leadership decisions — who to hire, who to let go, how to allocate headcount, when to escalate, how to respond to a reorg, what risk to accept — have long consequences and are rarely fully reversible. The EM who makes a hiring mistake for the third time without recognizing the pattern is not learning from experience; they're repeating it. This domain captures leadership decisions at the moment they are made, with the context available at decision time, so that outcomes can be compared against the reasoning that produced them — and so the reasoning can be improved.

**Questions this domain answers:**
- "What reasoning led to [people/strategic/resource] decision?"
- "What was unknown at the time that proved critical?"
- "Which decision types have produced the best and worst outcomes?"
- "What patterns appear in our most costly mistakes?"
- "What would we do differently if we could revisit [decision]?"

---

## Domain-Specific Entry Fields

```
Decision type:          {{People / Strategic / Resource / Risk-acceptance / Build-buy-partner / Process}}
Decision:               {{what was decided — specific and unambiguous}}
Decision-maker:         {{who made or ratified the decision}}
Decision date:          {{when}}
Context at decision:    {{2–3 sentences: what was the situation; what pressure or opportunity prompted this?}}
What was known:         {{the available data, signals, and reasoning that informed the choice}}
What was unknown:       {{the key uncertainties that could not be resolved at decision time}}
Alternatives considered:{{what else was considered and why it was rejected}}
Why this decision:      {{the specific reasoning — not post-hoc rationalization}}
Reversibility:          {{Reversible / Partially reversible / Irreversible}}
Outcome (if known):     {{what actually happened — fill in retrospectively}}
What was right:         {{what proved true from the original reasoning}}
What was wrong:         {{what proved false or was misjudged}}
What to do differently: {{specific adjustment for next time}}
```

---

## Decision Types

**People decisions**: Hiring (who to bring in), separation (who to let go and when), restructuring (role changes, team reconfiguration), performance management (when to put someone on a plan, when to exit).

**Strategic decisions**: Technology bets, team focus pivots, make vs. buy vs. partner, when to say no to a stakeholder request, when to escalate vs. absorb.

**Resource decisions**: Headcount allocation across initiatives, how to handle competing priority demands, when to sacrifice one goal to protect another.

**Risk-acceptance decisions**: Explicitly accepting a technical risk, a delivery risk, or a relationship risk rather than resolving it.

**Build-buy-partner decisions**: Whether to build internally, buy a solution, or establish a partnership. Long-tail consequences that justify dedicated memory.

**Process decisions**: Major changes to how the team works — sprint cadence, on-call rotation design, decision-making frameworks, communication protocols.

---

## What to Record

Create an entry for any decision that:
- Is irreversible or partially reversible
- Involves a person (hiring, separation, performance management)
- Commits significant resources (headcount, budget, time)
- Has a consequence visible only in 3–12 months
- Was contentious — where reasonable people disagreed

Do not record: routine operational decisions, minor process adjustments, decisions delegated entirely to the team.

---

## Pattern Detection

After ten or more outcome entries, look for:

**Decision type accuracy**: Which decision types does this EM make well? Hiring decisions that consistently work out? Risk-acceptance decisions that consistently prove right? Build-buy-partner calls that age well? Understanding personal decision-making strengths shapes where to invest confidence.

**Systematic blind spots**: Is there a decision type where outcomes are consistently worse than expected? This is a structural reasoning gap, not random error.

**"What was unknown" patterns**: Is the same category of unknown (market conditions, regulatory change, individual performance potential) appearing repeatedly? Recurring unknowns that cause decision failures should prompt explicit intelligence-gathering strategies.

**Reversal frequency**: How often are decisions reversed? High reversal frequency signals that decisions are being made with insufficient information, under time pressure, or without adequate stakeholder alignment.

**Alternatives-not-taken regret**: How often does the retrospective entry name an alternative that would have been better? If frequently the same alternative type is "the one we should have taken," the evaluation criteria may be systematically biased.

---

## Query Patterns

```
Q: "What reasoning led to [people/strategic] decision?"
→ Filter by: Decision type + date range; retrieve Context + Why this decision fields

Q: "What was unknown that proved critical?"
→ Filter by: What was unknown field; cross-reference Outcome field for decisions where unknowns materialized

Q: "Which decision types have produced the best outcomes?"
→ Filter by: Outcome field — positive results; group by Decision type
→ Pattern: where is this EM's decision accuracy highest?

Q: "What patterns appear in our most costly mistakes?"
→ Filter by: What was wrong field populated with significant consequences
→ Pattern: common conditions under which decisions failed

Q: "What would we do differently with [type of decision]?"
→ Filter by: Decision type; retrieve What to do differently fields
→ Synthesize: recurring adjustments
```

---

## Entry Log

```
DECISION HISTORY LOG
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Example decision record entry]

ID: DEC-2026-07-01-001
Date: 2026-07-01
Domain: decision-history
Decision type: People
Decision: Promote [Engineer A] to tech lead role for the platform migration initiative
  rather than hiring an external tech lead candidate.
Decision-maker: EM (with VP Engineering input)
Decision date: 2026-07-01
Context at decision: Platform migration is a high-visibility 6-month initiative. Two options:
  promote a high-potential internal engineer (lower risk to team cohesion; higher execution risk)
  or hire an external tech lead (higher execution confidence; 3-month ramp time; team
  disruption risk). Time pressure: migration must start in 4 weeks.
What was known: [Engineer A] has a technical leadership score of 38/50 (one quarter from
  target). Strong in technical vision and risk detection; weaker in cross-functional influence.
  The migration requires significant cross-functional coordination.
What was unknown: Whether [Engineer A]'s cross-functional influence gap would be a blocker
  at the scale this initiative requires; whether the external candidate would have accepted.
Alternatives considered: External hire — rejected on ramp time and team disruption;
  hiring was estimated at 3 months, which would miss the migration start window.
Why this decision: Internal promotion preserves team cohesion; provides [Engineer A] a
  stretch opportunity; the EM can provide cross-functional cover during the growth period.
Reversibility: Partially reversible — can add EM involvement in cross-functional meetings;
  cannot un-do the opportunity signal to the team.
Outcome: TBD — assess at 90 days
What was right: TBD
What was wrong: TBD
What to do differently: TBD
Tags: situation:hiring-decision, person:[first-name], outcome:neutral
Related entries: CAR-2026-07-01-001, PRO-2026-07-01-001

---

[Example outcome entry — added retrospectively]

ID: DEC-2026-10-01-001
Date: 2026-10-01
Domain: decision-history
Entry type: Outcome (for DEC-2026-07-01-001)
Outcome: [Engineer A] executed technical aspects at or above expectations. Cross-functional
  coordination was the actual gap — two design dependencies slipped because [Engineer A]
  was not comfortable pushing back on Design's timeline. EM covered 6 of 12 cross-functional
  meetings in weeks 4–8. Initiative delivered 2.5 weeks late, primarily due to design
  dependency slips.
What was right: Team cohesion impact was correctly assessed as positive. [Engineer A]'s
  technical leadership was ready for this scope.
What was wrong: The cross-functional influence gap was not just a growth area — it was
  a structural gap for this specific initiative. "EM can provide cover" was correct but
  underestimated the time cost.
What to do differently: For high cross-functional-coordination initiatives, the tech lead's
  cross-functional influence score must be ≥7/10 (not just growing). Alternative: pair
  the internal tech lead with an explicit cross-functional coordination owner.
Tags: person:[first-name], situation:hiring-decision, pattern:underestimated-risk, outcome:negative
Related entries: DEC-2026-07-01-001
```

---

## Decision Pattern Summary

```
DECISION PATTERN PROFILE: {{EM / Period}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

DECISION TYPE ACCURACY (outcomes validated):
  People:            {{N decisions}} | {{%}} positive outcomes
  Strategic:         {{N decisions}} | {{%}} positive outcomes
  Resource:          {{N decisions}} | {{%}} positive outcomes
  Risk-acceptance:   {{N decisions}} | {{%}} positive outcomes
  Build-buy-partner: {{N decisions}} | {{%}} positive outcomes
  Process:           {{N decisions}} | {{%}} positive outcomes

  Strongest decision type: {{type}} — {{%}} accuracy
  Weakest decision type:   {{type}} — {{%}} accuracy

RECURRING UNKNOWNS THAT PROVED CRITICAL:
  {{unknown category}}: appeared in {{N}} decisions; cost {{description}}
  {{unknown category}}: appeared in {{N}} decisions; cost {{description}}

REVERSAL FREQUENCY:
  Decisions reversed in last 12 months: {{N}} / {{total}}
  Most common reversal cause: {{reason}}

WHAT TO DO DIFFERENTLY (recurring lesson across decisions):
  {{lesson}}: appears in {{N}} outcome entries — established pattern

Last updated: {{date}}
```

---

## Recall Output Format

```
DECISION HISTORY RECALL — {{query}} — {{date}}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Query: {{what was asked}}
Entries reviewed: {{N}} entries, {{date range}}

RELEVANT DECISIONS:
  {{ID}} — {{date}} — {{decision summary}} — Outcome: {{positive / negative / unknown}}

PATTERN ({{Established / Emerging}}):
  {{What the entries reveal about decision reasoning or outcomes}}

RECURRING BLIND SPOT:
  {{category of unknown that keeps appearing as critical}}

RECOMMENDATION FOR CURRENT DECISION:
  What to investigate before deciding: {{based on pattern of unknowns}}
  Alternatives to evaluate: {{based on what was right in similar past decisions}}
  Risk to explicitly name: {{based on what has materialized before}}
```

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Decision recorded; outcome never added** | Decision log is only inputs; no outcomes captured; pattern recognition impossible | Outcome entry at 90 days for people decisions; 6 months for strategic decisions — set reminders |
| **Post-hoc rationalization** | Outcome entry written to justify the original decision rather than honestly assess it | What was wrong field must be written honestly; if nothing was wrong, the decision succeeded perfectly or the assessment is incomplete |
| **Routine decisions recorded** | Log full of minor operational decisions; signal-to-noise degrades | Only record irreversible, person-involving, resource-committing, or long-consequence decisions |
| **Individual blame vs. reasoning pattern** | Bad outcome attributed to a person's failure; reasoning pattern not examined | The focus is on what was known, what was unknown, and what the reasoning was — not on who performed |

---

## References

- `memory/schema.md` — Universal entry format
- `memory/memory.md` — Cross-domain pattern detection
- `decision-memory/decision-memory.md` — Engineering/technical decisions (complementary)
- `skills/meetings/decision-log.md` — Formal decision capture for cross-functional decisions
- `analytics/master-leadership-dashboard.md` (View 2) — Strategic decision outcomes reflected in delivery metrics
