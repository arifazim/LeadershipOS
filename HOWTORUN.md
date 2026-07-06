# How to Run the Engineering Manager OS

This guide explains how to use this repository day-to-day. There is no compiled application, server, or CLI. The OS runs inside your AI assistant (Cursor, Claude Code, ChatGPT, etc.) by loading Markdown files as context and executing the workflows they define.

For instance configuration (team size, integrations, thresholds), see [BUILD.md](BUILD.md). For philosophy and principles, start with [docs/vision.md](docs/vision.md) and [docs/principles.md](docs/principles.md).

---

## Executive Summary

| Question | Answer |
|---|---|
| How do I "run" it? | Load a **subagent** + **command or loop** into your AI tool, provide real inputs, get output from **templates/**, then **log** to **memory/** or **kaizen/** |
| What is the execution path? | **Command → Loop → Skills → Subagent → Template → Memory/Kaizen** |
| How many actors? | **8 subagents**, **11 loops**, **5 commands**, **7 contracts** (2 universal + 5 domain), **10 memory domains**, **10 kaizen files** across weekly/monthly/quarterly/event-triggered cadences |
| What blocks good output? | Missing integration data, unconfigured thresholds, skipping the logging step |

---

## Proof This Works — What the First Regression Run Found

Anyone can claim a system "improves itself." Here's what actually happened when this one was tested for real, on 2026-07-01 — the first time any of these modules had ever been run against their own reference outputs, a gap `ROADMAP.md` had flagged as open since v0.1:

| Module | Bug found | Would have produced |
|---|---|---|
| `leadership-health/master-leadership-health.md` | Its own dimension-weight table summed to **157%**, not 100% | Every holistic leadership score it ever computed was mathematically wrong |
| `confidence-engine/executive_confidence.md` | A formula capped every dimension's score at 30 *before* weighting | The maximum possible "Can I trust this team?" score was 30 — regardless of how healthy the team actually was |
| `leadership-health`, `confidence-engine`, `political-signals` (3 modules) | Each was silently missing an entire severity band ("At Risk") | Moderate-risk situations misclassified as either falsely healthy or falsely critical |
| `skills/delivery/review-sprint.md` | No root-cause category existed for "goal missed despite high completion" | A real, distinct sprint-failure pattern with no diagnosis path |

All 5 bugs were found, fixed, and **verified by reproducing the actual golden reference scores** — not just asserted fixed. 34 of 35 test scenarios pass cleanly today; 2 in `confidence-engine` are still flagged as an open follow-up rather than force-fit. Full evidence trail: `evaluations/regression/*.md` and `kaizen/failures.md` (FAIL-002).

**Why this matters for demonstrating value**: this is the difference between "an AI that sounds confident" and a system with an actual quality gate. The bugs were invisible from the *outputs alone* — they only surfaced because golden references existed and someone finally ran them. That's the argument for keeping `evaluations/` current as you extend this OS, not a nice-to-have.

---

## What This Is (and Is Not)

**This is:**
- A structured management practice encoded as Markdown
- An AI-augmented workflow system with personas, orchestration, and quality gates
- A living system that improves via kaizen reviews

**This is not:**
- A Node/Python app (`npm start` does not exist)
- A task tracker or Jira replacement
- Self-executing — you trigger each workflow and supply data

---

## Architecture

```
You (EM)
  │
  ▼
commands/*.md          ← thin triggers (5 files)
  │
  ▼
loops/*.md             ← orchestration: gather → skills → route → output → log (11 files)
  │
  ├── skills/*.md      ← unit of analysis
  ├── contracts/*.md   ← input/output quality gates
  ├── subagents/*.md   ← who acts (8 personas)
  ├── templates/*.md   ← artifacts produced
  │
  └── log to:
        memory/        ← leadership/relational patterns (10 domains)
        kaizen/        ← OS failures, predictions, continuous improvement
        decision-memory/ ← formal institutional decisions
```

Every loop follows the same five steps:

1. **Gather inputs** — from integrations or manual paste
2. **Invoke skills** — domain-specific analysis
3. **Route to subagent(s)** — specialist or orchestrator synthesis
4. **Produce output** — using a template
5. **Log outcome** — memory, kaizen, or decision-memory per loop rules

---

## One-Time Setup (~30 minutes)

Follow [BUILD.md](BUILD.md). Minimum viable setup:

1. **Add team context** to the top of `subagents/engineering-manager.md`:
   ```
   Team size: 8
   Tech stack: TypeScript, Postgres, AWS
   Sprint cadence: 2 weeks
   ...
   ```

2. **Configure integrations** in `integrations/` (GitHub, Jira, Slack, Datadog, PagerDuty).

3. **Adjust loop thresholds** — e.g. recurring-blocker escalation days in `loops/daily-leadership-loop.md`.

4. **Dry-run one command** with yesterday's real data (see [First Dry Run](#first-dry-run) below).

5. **Schedule kaizen** — weekly Friday review, monthly rollup.

In **Cursor**, add `CLAUDE.md` to project rules (or @-mention it). In **Claude Code**, it is picked up automatically as project guidance.

---

## How to Invoke a Workflow

### Cursor

Use `@` to attach files, then describe the situation:

```
@subagents/engineering-manager.md
@commands/daily.md

Run the daily leadership loop. Here is today's data:
[paste Jira blockers, PR status]
```

### Claude Code / ChatGPT

Paste or upload the subagent file and command/loop file, then provide inputs in the same message.

### Prompt skeleton (all tools)

```
ROLE:     @subagents/{subagent}.md
WORKFLOW: @commands/{command}.md  OR  @loops/{loop}.md
CONTRACT: @contracts/{contract}.md   (optional — enforces quality gates)
TEMPLATE: @templates/{template}.md   (optional — shapes output)
RECALL:   @memory/{domain}/          (optional — before repeating a pattern)

SITUATION: [what is happening]
INPUTS:    [real data — board state, metrics, notes]
AUDIENCE:  [EM only / team / stakeholders / executives]
URGENCY:   [yes/no/deadline]
```

Add this line to enforce contracts:

```
Before returning output, verify all Failure Conditions in the contract are false.
If any Failure Condition is true, stop and list what is missing.
Apply all Quality Checks before delivering the final answer.
```

---

## Reference: 8 Subagents

Load the subagent that matches the domain. When unsure, start with `engineering-manager` — it routes to specialists.

| Subagent | File | Owns | Load when… |
|---|---|---|---|
| **Engineering Manager** | `subagents/engineering-manager.md` | Orchestration, cross-domain synthesis | Ambiguous ask, multiple domains, final decision needed |
| **Delivery Manager** | `subagents/delivery-manager.md` | Sprint health, DORA, velocity, releases | "Are we on track?" / sprint review / capacity |
| **Incident Manager** | `subagents/incident-manager.md` | P1/P2, on-call, post-mortems | Active incident or post-mortem follow-up |
| **Tech Lead** | `subagents/tech-lead.md` | Technical quality, architecture risk | Design review, tech debt blocking delivery |
| **Architecture Reviewer** | `subagents/architecture-reviewer.md` | Deep ADR review | Significant architectural decision (via tech-lead) |
| **Engineering Coach** | `subagents/engineering-coach.md` | 1:1s, career, burnout, promotion prep | People development, performance, wellbeing |
| **Product Partner** | `subagents/product-partner.md` | Roadmap, prioritization, stakeholders | Scope negotiation, stakeholder alignment |
| **Executive Summary** | `subagents/executive-summary.md` | VP/board communication | Status updates, QBR, skip-level prep |

### Orchestrator routing examples

| You ask… | Routes to… |
|---|---|
| "Missing sprint and team seems burned out" | `delivery-manager` + `engineering-coach` → synthesize |
| "Should we take this new initiative from product?" | `product-partner` + `tech-lead` → synthesize |
| "What do I tell the VP about Q3?" | `delivery-manager` → `executive-summary` |
| "Decisions keep getting reversed, I'm excluded from meetings" | `political-signals/political-signals.md` |
| "We made a similar decision 8 months ago and it failed" | `decision-memory/decision-memory.md` |

---

## Reference: 11 Loops

| Loop | File | Cadence | Command | Primary subagent |
|---|---|---|---|---|
| Daily Leadership | `loops/daily-leadership-loop.md` | Daily | `commands/daily.md` | engineering-manager |
| Sprint | `loops/sprint-loop.md` | Sprint boundary | `commands/weekly.md` | delivery-manager |
| Delivery (trend) | `loops/delivery-loop.md` | Weekly rolling | *(direct invoke)* | delivery-manager |
| Executive | `loops/executive-loop.md` | Weekly/monthly | `commands/executive.md` | executive-summary |
| Incident | `loops/incident-loop.md` | On P1/P2 | `commands/incident.md` | incident-manager |
| Retrospective | `loops/retrospective-loop.md` | Sprint end / post-incident | `commands/retrospective.md` | delivery-manager / incident-manager |
| Career | `loops/career-loop.md` | Quarterly 1:1 | *(direct invoke)* | engineering-coach |
| Promotion | `loops/promotion-loop.md` | Promotion cycle | *(direct invoke)* | engineering-coach |
| Architecture | `loops/architecture-loop.md` | Per ADR | *(direct invoke)* | tech-lead |
| Stakeholder | `loops/stakeholder-loop.md` | Per initiative | *(direct invoke)* | product-partner |
| Prediction | `loops/prediction-loop.md` | Before forecasts | *(direct invoke)* | executive-summary |

### Loop pairs — do not confuse

| Pair | Distinction |
|---|---|
| **sprint-loop** vs **delivery-loop** | Sprint = one ceremony (plan → execute → review). Delivery = rolling DORA/trend across sprints. |
| **career-loop** vs **promotion-loop** | Career = multi-year direction conversation. Promotion = one bounded calibration cycle. |
| **executive-loop** vs **stakeholder-loop** | Executive = upward reporting shape. Stakeholder = lateral alignment and influence mapping. |

---

## Reference: 5 Commands

Commands are thin pointers into loops. Always read the loop for full orchestration logic.

| Command | File | Trigger | Owning subagent | Loop |
|---|---|---|---|---|
| Daily | `commands/daily.md` | Daily standup time | engineering-manager | `daily-leadership-loop` |
| Weekly | `commands/weekly.md` | Sprint planning / review | delivery-manager | `sprint-loop` |
| Executive | `commands/executive.md` | Status cadence or before board/skip-level | executive-summary | `executive-loop` |
| Incident | `commands/incident.md` | P1/P2 declared | incident-manager | `incident-loop` |
| Retrospective | `commands/retrospective.md` | Sprint end or post-incident | delivery-manager / incident-manager | `retrospective-loop` |

---

## Reference: Contracts

Contracts define **Failure Conditions** (cannot run) and **Quality Checks** (validate output). See [contracts/README.md](contracts/README.md).

| Contract | File | Governs |
|---|---|---|
| Skill (universal) | `contracts/skill.contract.md` | All files under `skills/` — including dimension skills at `skills/leadership-health/` and `skills/confidence-engine/` |
| Subagent (universal) | `contracts/subagent.contract.md` | All files under `subagents/` |
| Executive | `contracts/executive.contract.md` | `skills/executive/*.md` (except `board-level-summary.md`, governed by Presentation below) |
| Presentation | `contracts/presentation.contract.md` | `skills/presentation/*.md` plus `skills/executive/board-level-summary.md` (its memo and deck output variants both live here) |
| Meeting | `contracts/meeting.contract.md` | `skills/meetings/*.md` |
| Prediction | `contracts/prediction.contract.md` | `prediction-loop`, `skills/confidence-engine/prediction_confidence.md` |
| Dashboard | `contracts/dashboard.contract.md` | `skills/leadership-health/generate-dashboard.md`, `analytics/*.md` |

**When to attach a contract:** Any output that goes to executives, board, or calibration — or whenever missing data would produce a falsely confident answer.

---

## Reference: Memory (10 Domains)

Leadership recall — relational and organizational patterns. **Not** for operational incident tracking (use `kaizen/failures.md`).

| Domain | Directory | Prefix | Record when… |
|---|---|---|---|
| Executive | `memory/executive/` | EXE | VP/executive reacted to a proposal, framing worked/failed |
| Stakeholders | `memory/stakeholders/` | STK | Stakeholder alignment, influence shifts |
| Career | `memory/career/` | CAR | Durable growth direction or aspiration change |
| Conflicts | `memory/conflicts/` | CON | Cross-team friction patterns |
| Mentoring | `memory/mentoring/` | MEN | Coaching effectiveness over time |
| Promotions | `memory/promotions/` | PRO | Promotion evidence, calibration outcomes |
| Architecture | `memory/architecture/` | ARC | Repeated risk underestimation |
| Roadmaps | `memory/roadmaps/` | RMP | Estimation failures, delivery-risk trends |
| Customer feedback | `memory/customer-feedback/` | CUS | Customer signal that proved accurate |
| Decision history | `memory/decision-history/` | DEC | Trade-offs and outcomes worth recalling |

Entry format: [memory/schema.md](memory/schema.md). Cross-domain routing: [memory/memory.md](memory/memory.md).

Formal decisions with alternatives → also use [decision-memory/](decision-memory/).

---

## Reference: Kaizen

| File | Cadence | Purpose |
|---|---|---|
| `kaizen/weekly-review.md` | Every Friday | 10 questions → update cascade → archive |
| `kaizen/monthly-review.md` | Last day of month | Roll up weekly findings |
| `kaizen/quarterly-review.md` | End of quarter | Rolls up 3 monthly reviews, revisits `docs/principles.md` |
| `kaizen/prediction-review.md` | Weekly (via Q1) + monthly calibration | Forecast accuracy tracking — standalone home for what used to be buried in Q1 |
| `kaizen/playbook-review.md` | Weekly (via Q7) | Tracks where `docs/engineering-playbook.md` proved wrong or incomplete |
| `kaizen/skill-review.md` | Weekly (via Q8) + monthly usage audit | Tracks which skill sections produced bad output, and which skills go unused |
| `kaizen/failure-analysis.md` | Monthly | Reads `failures.md`'s raw log and finds recurring root-cause patterns (3+ = a pattern, not a one-off) |
| `kaizen/root-cause.md` | Referenced, not cadenced | Canonical root-cause taxonomy — every failure/prompt/prediction entry picks one category from here instead of inventing its own |
| `kaizen/failures.md` | Within 48h of failure | Raw failure log — OS/process/subagent failures |
| `kaizen/continuous-improvement.md` | After every review | Changelog of OS changes, tagged by category |

**Rule:** When the OS gives advice you would not actually follow, update the **source file** — not just the output.

---

## Where to Log Outcomes

| Situation | Log to | Not to |
|---|---|---|
| Recurring standup blocker (ops) | `kaizen/failures.md` | `memory/` |
| Same incident root cause twice | `kaizen/failures.md` | `memory/` (unless leadership-level arch pattern) |
| VP responded unexpectedly to proposal | `memory/executive/` | — |
| Engineer career direction shifted | `memory/career/` | — |
| Promotion case built / denied | `memory/promotions/` + cross-link `memory/career/` | — |
| Architectural decision committed | `decision-memory/` + `memory/architecture/` | — |
| OS produced wrong recommendation | `kaizen/failures.md` → fix source file | — |
| OS file updated | `kaizen/continuous-improvement.md` | — |
| Delivery trend contradicts forecast | `kaizen/prediction-review.md` + `memory/roadmaps/` | — |

---

## First Dry Run

```
@subagents/engineering-manager.md
@commands/daily.md
@loops/daily-leadership-loop.md

Dry run using yesterday's real data. Do not invent metrics.

Jira blockers: [paste]
GitHub PR status: [paste]

For each blocker:
1. Classify (delivery / incident / systemic / people)
2. Name the subagent or loop to route to
3. Say whether to log to memory/ or kaizen/failures.md and why

Compare your output to what I would have said in standup. Flag gaps.
```

Note gaps in `kaizen/failures.md` if the OS missed something you would have caught.

---

## Use Cases and Copy-Paste Commands

### 1. Daily standup triage

**When:** Every morning at standup time.

```
@subagents/engineering-manager.md
@commands/daily.md

Jira blockers:
- Alice: waiting on API team (day 4)
- Bob: no blockers (3rd consecutive day)
- Team: everyone blocked on staging environment

GitHub: 3 PRs waiting review >48h

Route each blocker. Flag systemic risks. Tell me what to log.
```

**Expected:** Alice → `engineering-coach` (recurring). Staging → systemic flag to EM. Ops recurrence → `kaizen/failures.md`.

---

### 2. Sprint review (end of sprint)

**When:** Last day of sprint.

```
@subagents/delivery-manager.md
@commands/weekly.md
@loops/sprint-loop.md
@skills/delivery/review-sprint.md

Sprint goal: [goal]
Committed: 22 pts | Completed: 18 pts
Stories: 14 committed, 11 done, 3 carried
Blockers: [list]
Unplanned work added: 5 pts
PR cycle time P50: 2.1 days
Deployment frequency: 3/week
Change failure rate: 8%

Produce sprint review. Confidence level required.
Log scope trade-offs to memory/decision-history/ if any.
```

---

### 3. Rolling delivery health (cross-sprint trend)

**When:** Weekly, or before executive review.

```
@subagents/delivery-manager.md
@loops/delivery-loop.md

Last 6 sprints:
[paste velocity, completion %, CFR, lead time per sprint]

Is the trend improving, flat, or degrading?
If CFR rising 3+ weeks, flag threshold breach and say where to log.
```

**Use instead of** sprint-loop when the question is trend, not one sprint ceremony.

---

### 4. Executive status for VP

**When:** Weekly status or before skip-level.

```
@subagents/executive-summary.md
@commands/executive.md
@loops/executive-loop.md
@contracts/executive.contract.md

Period: Week of [date]
Audience: VP Engineering

Delivery: 18/22 pts, 2 stories carried
Incidents: 1 P2 (47min MTTR)
Team: 1 PTO, 1 burnout signal
Top risk: [describe]

Validate against contract Failure Conditions before output.
Status signal + summary first, details after.
Explicit ask or "no action needed" at end.
```

**After sending to VP:** Log response to `memory/executive/executive-memory.md`.

---

### 5. Board-level summary

**When:** Before board or QBR.

```
@subagents/executive-summary.md
@loops/executive-loop.md
@contracts/presentation.contract.md
@skills/executive/board-level-summary.md

Audience: Board
Period: Q2
[paste delivery trend, incidents, roadmap status, team health]

Deck-ready narrative. No jargon without definition.
```

---

### 6. Active P1/P2 incident

**When:** Incident declared. **Takes priority** over all other work per routing logic.

```
@subagents/incident-manager.md
@commands/incident.md
@loops/incident-loop.md

Severity: P1
Service: Payment API
Duration so far: 23 minutes
Symptoms: [paste]
On-call: [name]

Check @kaizen/failures.md for prior similar root causes.
Produce incident review outline. Name post-mortem action owners.
```

**Log:** Recurrence → `kaizen/failures.md`. Architecture leadership pattern → `memory/architecture/`.

---

### 7. Post-incident retrospective

**When:** After incident-loop post-mortem, for severe incidents.

```
@subagents/incident-manager.md
@commands/retrospective.md
@loops/retrospective-loop.md
@skills/conflict/blameless-retrospectives.md

Incident summary: [paste from incident-loop output]
Post-mortem action items: [list with owners]

Run blameless retro. Action items must have named owners and due dates.
Escalate unresolved items per kaizen/weekly-review.md Q6.
```

---

### 8. Sprint retrospective

**When:** After sprint-loop review step.

```
@subagents/delivery-manager.md
@commands/retrospective.md
@loops/retrospective-loop.md

Sprint review output: [paste]
Team feedback themes: [paste]

Max 3 action items. Each: owner, due date, how we'll know it's done.
No venting-only items.
```

---

### 9. Quarterly career check-in

**When:** Quarterly 1:1 — no command file; invoke loop directly.

```
@subagents/engineering-coach.md
@loops/career-loop.md
@skills/people/career-development.md

Engineer: Jordan
Level: Senior
Stated goal: Staff IC track in 18 months
Gap: system design at scale
Recent 1:1 notes: [paste]

Prepare career conversation guide. Do NOT run promotion-loop — direction first.
Log durable patterns to memory/career/.
```

---

### 10. Promotion cycle

**When:** Calibration window opens.

```
@subagents/engineering-coach.md
@loops/promotion-loop.md
@skills/career/promotion/promotion-readiness.md
@skills/performance/promotion-readiness-tracking.md

Candidate: Jordan
Target level: Staff
Impact evidence: [paste]
Prior career-loop notes: [paste from memory/career/]

Assess readiness. Build promotion case. Flag hidden-candidate risk.
Log to memory/promotions/ regardless of outcome.
```

---

### 11. Architecture / ADR review

**When:** Significant technical decision before commitment.

```
@subagents/tech-lead.md
@loops/architecture-loop.md

Decision: Migrate from monolith to event-driven services
Constraints: 6-month deadline, no new headcount
Prior ADRs: [paste or link]
Datadog CFR trend: [paste]

Surface technical risks. Route to architecture-reviewer if ADR-level depth needed.
Log to decision-memory/ AND memory/architecture/ with cross-links.
```

---

### 12. Stakeholder mapping for new initiative

**When:** New initiative starts or relationship strain detected.

```
@subagents/product-partner.md
@loops/stakeholder-loop.md
@skills/organizational/stakeholder-analysis.md

Initiative: Real-time analytics dashboard
Stakeholders: [list roles]
Known tensions: Product wants Q3; Platform wants Q4

Map influence/interest. Engagement plan. Check political-signals/ if exclusion or reversal patterns present.
Log to memory/stakeholders/.
```

---

### 13. Mid-sprint scope change

**When:** Large scope change requires re-plan.

```
@subagents/engineering-manager.md
@loops/sprint-loop.md

Mid-sprint change: Product added 8 pts unplanned work
Current burn: [paste]
Team capacity: [paste]

Route: product-partner (scope) + delivery-manager (capacity) + synthesize.
Recommend: defer, swap, or escalate — with confidence level.
```

---

### 14. Forecast before roadmap commit

**When:** Before committing to a date executives will hold you to.

```
@subagents/executive-summary.md
@loops/prediction-loop.md
@contracts/prediction.contract.md
@kaizen/prediction-review.md

Proposed commit: Feature X GA by Sept 15
Historical estimate accuracy: [paste from delivery-loop]
Last 4 sprint goal hit rate: [paste]

Check prediction-review for prior wrong forecasts on similar work.
Score forecast confidence. Recommend commit / hedge / defer.
```

---

### 15. 1:1 preparation

**When:** Before any 1:1.

```
@subagents/engineering-coach.md
@contracts/meeting.contract.md
@templates/one-on-one.md

Direct report: Sam
Last 1:1 notes: [paste]
Recent signals: quiet in standup, PR cycle time up 40%
Recall: @memory/mentoring/ @memory/career/ for Sam if entries exist

Prepare 1:1 agenda: 2 coaching questions, 1 feedback item, 1 career thread.
Burnout check required.
```

---

### 16. Difficult performance conversation

**When:** Corrective feedback needed.

```
@subagents/engineering-coach.md
@subagents/engineering-manager.md

Situation: Engineer missed commitments 3 sprints running
Evidence: [specific examples]
Prior coaching: [paste from memory/mentoring/]

Coach: prepare conversation script (SBI format).
EM: confirm this is individual vs systemic before the conversation.
Log outcome to memory/mentoring/ after the 1:1.
```

---

### 17. "Can I trust this team?" (executive confidence)

**When:** Before board prep or skip-level where trust is the question.

```
@subagents/engineering-manager.md
@confidence-engine/executive_confidence.md

Question: Can I trust this team to deliver the H2 roadmap?
Evidence: [paste delivery-loop trend, incident history, prediction accuracy]

Run six-dimension assessment. Lead with overall confidence level.
Route gaps to specific loops/skills for remediation.
```

---

### 18. Leadership health before 360

**When:** Before performance review or 360 feedback cycle.

```
@subagents/engineering-manager.md
@leadership-health/master-leadership-health.md

Context: Preparing for my annual 360
Recent situations: [paste 3-5 examples across delegation, coaching, trust]

Assess 13 dimensions. Flag systemic risks. Confidence per dimension.
```

---

### 19. Organizational risk signals

**When:** Decisions reversed, meetings missed, ownership unclear.

```
@subagents/engineering-manager.md
@political-signals/political-signals.md

Signals observed:
- Roadmap decision reversed twice in 6 weeks
- Excluded from architecture review for payment service
- Two teams both think they own onboarding

Score five dimensions. Recommend ethical, transparent responses only.
Log to memory/stakeholders/ and memory/conflicts/ as appropriate.
```

---

### 20. Recall past decisions

**When:** Before repeating a major decision.

```
@subagents/engineering-manager.md
@decision-memory/decision-memory.md

Question: We are considering microservices migration again.
Search decision history and memory/decision-history/ for:
- Prior similar decisions
- Actual vs expected outcomes
- Repeated failure patterns

Recommend proceed / modify / abort with evidence.
```

---

### 21. Cross-domain: new initiative + capacity + reliability

**When:** Product push mid-quarter with team already strained.

```
@subagents/engineering-manager.md

Product wants new initiative mid-sprint. Team at 110% capacity.
P2 incident last week. Two engineers showing burnout signals.

Route to the right specialists in parallel. Synthesize:
1. Recommendation (yes/no/conditional)
2. Confidence level
3. What to tell PM
4. What to tell VP (draft via executive-summary if needed)
5. Where to log outcomes
```

---

### 22. Weekly kaizen review

**When:** Every Friday, 30–45 minutes.

```
@subagents/engineering-manager.md
@kaizen/weekly-review.md

Week of: 2026-06-24
My notes:
- Wrong prediction: [describe]
- Surprise blocker: [describe]
- Command that produced bad output: [describe]
- Template I edited before sending: [which one]

Answer all 10 questions with specific examples.
For each "OS UPDATE NEEDED = Yes", name the exact file and section to change.
Execute update cascade order. Archive summary to kaizen/continuous-improvement.md.
```

---

### 23. Memory recall before executive proposal

**When:** Before a high-stakes ask to an executive.

```
@memory/executive/executive-memory.md
@memory/schema.md
@memory/memory.md

I am proposing: 2 additional engineers for platform reliability
Executive: VP Engineering

Query memory for prior proposal patterns, framing that landed, skepticism triggers.
Recommend opening structure and anticipated questions.
```

---

### 24. Customer feedback → roadmap

**When:** Customer signal should influence prioritization.

```
@subagents/product-partner.md
@memory/customer-feedback/customer-memory.md

Customer feedback: [paste]
Current roadmap: [paste]

Does this feedback match prior accurate signals in customer-memory?
Recommend prioritization change with evidence. Log if durable.
```

---

## Suggested Weekly Cadence

| Day | Workflow | Files |
|---|---|---|
| Mon–Thu | Daily standup | `commands/daily.md` |
| Mon | Delivery trend check (optional) | `loops/delivery-loop.md` |
| Tue/Wed | 1:1 prep as needed | `engineering-coach` + `career-loop` |
| Thu | Forecast check before commitments | `loops/prediction-loop.md` |
| Fri | Kaizen weekly review | `kaizen/weekly-review.md` |
| Sprint start | Sprint planning | `commands/weekly.md` (planning phase) |
| Sprint end | Sprint review + retro | `commands/weekly.md` then `commands/retrospective.md` |
| Monthly | Executive status | `commands/executive.md` |
| Quarterly | Career check-ins | `loops/career-loop.md` |
| On P1/P2 | Incident (pauses other work) | `commands/incident.md` |

---

## Troubleshooting

| Symptom | Likely cause | Fix |
|---|---|---|
| Output too generic | No real inputs pasted | Paste Jira/GitHub/metrics; configure `integrations/` |
| False "Green" status | Contract not attached | Add `@contracts/executive.contract.md` and Failure Condition check |
| Wrong specialist invoked | Loaded wrong subagent | Start with `engineering-manager` for routing |
| Same blocker never escalates | Threshold not configured | Edit loop Step 3 in your instance ([BUILD.md](BUILD.md)) |
| Advice conflicts with your org | OS not customized | Update subagent context + `kaizen/failures.md` → source file |
| Memory never surfaces | Under-tagging entries | Follow four-category tags in `memory/schema.md` |
| Retro produces no change | Skipped Step 5 logging | Track action items in kaizen Q6/Q7 |

---

## Advanced Modules (Direct Invoke)

These modules are not loops but are routed by `engineering-manager`:

| Module | Path | Use when… |
|---|---|---|
| Leadership Health | `leadership-health/master-leadership-health.md` | 360 prep, delegation/coaching assessment |
| Executive Confidence | `confidence-engine/executive_confidence.md` | "Can I trust this team?" |
| Political Signals | `political-signals/political-signals.md` | Organizational dysfunction patterns |
| Decision Memory | `decision-memory/decision-memory.md` | Institutional learning, pattern detection |
| Analytics dashboards | `analytics/*.md` | Aggregated views for specific audiences |

---

## File Index (Quick Links)

| Layer | Location |
|---|---|
| Setup | [BUILD.md](BUILD.md) |
| Philosophy | [docs/](docs/) |
| Subagents | [subagents/](subagents/) |
| Commands | [commands/](commands/) |
| Loops | [loops/README.md](loops/README.md) |
| Contracts | [contracts/README.md](contracts/README.md) |
| Memory schema | [memory/schema.md](memory/schema.md) |
| Memory routing | [memory/memory.md](memory/memory.md) |
| Kaizen | [kaizen/](kaizen/) |
| Integrations | [integrations/](integrations/) |
| Skills | [skills/](skills/) |
| Behavior specs | [features/](features/) |
| Visual agent-architecture diagram | [docs/diagrams/agent-architecture.html](docs/diagrams/agent-architecture.html) — open directly in a browser |

---

## Minimum Viable Week (New User)

1. **Day 1:** Read `docs/vision.md`, configure context in `engineering-manager.md`, run [First Dry Run](#first-dry-run).
2. **Day 2–4:** Run daily command each morning with real data.
3. **Day 5:** Run weekly kaizen; log one failure or gap if any.
4. **Sprint boundary:** Run weekly + retrospective commands.
5. **Before next exec sync:** Run executive command with contract validation.
6. **After any significant interaction:** Write one memory entry using `memory/schema.md`.

The OS compounds in value only when logging and kaizen run consistently. Skipping Step 5 of every loop is the most common reason the system feels static after the first week.
