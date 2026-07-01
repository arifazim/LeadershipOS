# Skill: Architecture Review

**Domain**: Meeting Intelligence
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Triggered by specific design decisions; not on a fixed schedule

---

## Purpose

Design and facilitate architecture review meetings that surface risks before they are built, produce documented decisions with clear rationale, and result in an Architecture Decision Record (ADR) that future engineers can use to understand why the system is the way it is.

**What the EM does automatically**: In architecture reviews, the EM:
1. Determines when an architecture review is required — not every technical decision warrants a review; the trigger criteria are specific
2. Ensures the RFC (Request for Comment) document is written and distributed 48 hours before the review session
3. Facilitates the review as a risk-surfacing session, not an approval ceremony — the goal is to find problems, not to ratify a decision already made
4. Captures the Architecture Decision Record (ADR) during or immediately after the session
5. Tracks decisions and the conditions under which they should be revisited

**Ethical principle**: An architecture review that functions as an approval ceremony produces a false sense of safety without the benefits of real scrutiny. Engineers who believe their proposal will be approved regardless of concerns raised in review will present optimistic cases rather than honest ones. The EM who facilitates rubber-stamp reviews creates a culture where problems are surfaced after they're built into the system — which is the most expensive place to find them. The architecture review earns its value only when it is genuinely possible that the proposal will be rejected or significantly modified.

---

## Inputs

### Required
| Input | Description |
|---|---|
| **RFC document** | The proposal document written by the engineer(s) proposing the design — sent 48h before the review |
| **Problem statement** | What problem is being solved; why the current state is insufficient |
| **Proposed solution** | The design being reviewed, with enough detail to evaluate trade-offs |

### Optional
| Input | Description |
|---|---|
| **Alternatives considered** | Other approaches evaluated and why they were not chosen |
| **Prior ADRs** | Relevant past decisions that constrain or inform the current proposal |
| **Cross-team dependencies** | Other teams affected by the proposed design |

---

## Analysis

### Step 1 — Determine When an Architecture Review Is Required

```
Architecture reviews are not required for every technical decision.
Over-reviewing creates bottlenecks; under-reviewing creates avoidable technical debt.

ARCHITECTURE REVIEW REQUIRED — trigger any of the following:

TRIGGER 1 — NEW SERVICE OR SYSTEM
  Any decision to introduce a new service, system, or significant capability that other
  teams or systems will depend on
  Why: Dependency architecture is hard to change after the fact

TRIGGER 2 — SIGNIFICANT CROSS-TEAM DEPENDENCY
  A design that another team must consume, integrate with, or build on
  Why: API contracts, data contracts, and integration points constrain future decisions across orgs

TRIGGER 3 — IRREVERSIBLE OR HIGH-MIGRATION-COST DECISION
  Any decision that would require significant effort to reverse (database choice, messaging system,
  auth architecture, encryption approach, compliance-affecting design)
  Why: Type 1 decisions (skills/meetings/decision-log.md) in the technical domain

TRIGGER 4 — SECURITY, COMPLIANCE, OR PRIVACY IMPACT
  Any change that stores, transmits, or processes PII, payment data, or security credentials
  Why: Regulatory and security risks require expert review before implementation

TRIGGER 5 — SIGNIFICANT SCALABILITY RISK
  A design that is estimated to approach capacity limits at 2–3× current load
  Why: Scaling problems are expensive to fix and visible to customers

TRIGGER 6 — DEPRECATION OR DECOMMISSIONING
  Removing a system, API, or capability that other teams rely on
  Why: Breaking changes with hidden consumers are an organizational risk

ARCHITECTURE REVIEW NOT REQUIRED for:
  Implementation details within an established architecture (which library to use within the stack)
  Changes that affect only one team's internal systems
  Minor performance optimizations within existing patterns
  Bug fixes to existing well-understood designs

When in doubt — apply the reversibility test:
  "If this decision is wrong, how hard is it to fix in 6 months?"
  Very hard → architecture review
  Moderate → lightweight ADR without full review session
  Easy → engineer's judgment; no review needed
```

### Step 2 — Prepare the RFC Document

```
The RFC (Request for Comment) is the pre-read for the architecture review.
Without an RFC, the review session becomes a real-time discovery session — which produces
worse outcomes than a document-based async review followed by a short sync session.

RFC REQUIRED SECTIONS:

SECTION 1 — PROBLEM STATEMENT
  "The current system cannot [capability]. This manifests as [specific symptom] at [scale/frequency].
   The cost of not solving it is [business/technical impact]."
   Must include: what the problem is / why now / what happens if unaddressed

SECTION 2 — PROPOSED SOLUTION
  "We propose [design]. The key components are [list]. The interaction model is [description]."
  Level of detail: enough to evaluate trade-offs and identify risks; not a full implementation spec
  Include: architecture diagram (even rough); key data flows; API boundaries; storage choices

SECTION 3 — ALTERNATIVES CONSIDERED
  "We considered [Option A] and rejected it because [specific reason]."
  "We considered [Option B] and rejected it because [specific reason]."
  Minimum: 2 alternatives; if only one option was considered, the RFC is not ready
  This section prevents the review session from spending time on alternatives the author already rejected

SECTION 4 — TRADE-OFFS AND RISKS
  "This design introduces the following risks: [list with severity and likelihood]."
  "This design makes the following trade-offs: [what is gained vs. what is sacrificed]."
  Author is expected to identify risks honestly; the review session surfaces what was missed

SECTION 5 — DECISION REQUEST
  "We are asking the review session to: [specific decision required]."
  Examples: "Approve this design to proceed to implementation"
            "Decide between Option A and Option B"
            "Identify whether there are security risks we have not addressed"
  Without a specific decision request: the review has no outcome to produce

SECTION 6 — OPEN QUESTIONS
  "We have not resolved the following and want the review group's input: [list]."
  Authors who include open questions get more useful feedback than those who present a
  polished proposal that conceals uncertainty

RFC quality gate (before sending):
  Has every section been filled?
  Is there an architecture diagram?
  Are at least 2 alternatives documented?
  Is the decision request specific?
  If any section is missing: the RFC is not ready; do not schedule the review

RFC distribution: 48 hours before the review session; to all reviewers plus key stakeholders
```

### Step 3 — Design the Review Session

```
REVIEW SESSION STRUCTURE (75–90 minutes)

OPENING (5 minutes)
  "The goal of this session is to [decision request from RFC]. We are looking for risks and
   concerns we haven't identified — not a ratification of a decision already made."
  State the norm explicitly: "If you see a problem, say so. The most valuable thing anyone
  can do in this room is surface a risk before it's built."

PROBLEM STATEMENT WALK-THROUGH (10 minutes)
  Author presents: the problem being solved and why the current state is insufficient
  No design yet — confirm the group agrees on the problem before evaluating the solution
  Questions at this stage: Is this the right problem? Is the framing accurate?

PROPOSED SOLUTION WALK-THROUGH (15 minutes)
  Author walks through the design: components, data flows, API boundaries, key decisions
  Reviewers listen; do not interrupt with questions yet
  Purpose: ensure all reviewers have the same understanding before critique begins

STRUCTURED CRITIQUE (25–30 minutes)
  EM facilitates; reviewers raise concerns, questions, and risks
  Critique domains (EM prompts if coverage is thin):
    — Scalability: "What breaks at 10× current load?"
    — Reliability: "What happens when [component] fails? Is there a single point of failure?"
    — Security: "What is the threat model? What data could be exposed?"
    — Operability: "How would we debug this in production at 3am? What observability exists?"
    — Migration: "What is the path from current state to this design? What could go wrong in migration?"
    — Compliance: "Does this design handle [PII / payment data / audit requirements] correctly?"
    — Dependencies: "Who depends on this? Have we told them? Does this create new dependencies?"

  Facilitation notes:
    Every concern raised must be acknowledged by the author (not dismissed)
    EM captures concerns in real-time: the concern + the severity + whether it is a blocker
    A blocker is a concern that, if true, would require the design to change before proceeding
    A non-blocker is a concern to be tracked but does not prevent implementation

OPEN QUESTIONS DISCUSSION (10 minutes)
  Address the author's open questions from the RFC
  Often the most valuable part of the session: the questions the author is actually uncertain about

DECISION AND CLOSE (10 minutes)
  EM synthesizes: "Here are the blockers we identified: [list]. Here are the non-blockers to track: [list]."
  Decision: "Given what we've discussed, the decision is [specific]: [Approve / Approve with conditions / Reject / Needs revision]."
  ADR will be written by: [Name] within [48 hours]
  Revisit trigger: "We'll revisit this decision if [specific condition]."

DECISION TYPES FROM ARCHITECTURE REVIEWS:
  APPROVE: Design proceeds as proposed
  APPROVE WITH CONDITIONS: Design proceeds after [specific changes]; conditions documented in ADR
  NEEDS REVISION: Blockers identified; RFC requires revision; reschedule review after revision
  REJECT: Fundamental problems; alternative approach required; specific concerns documented

The EM must prevent: "We'll figure it out in implementation" as a resolution for a blocker.
If a concern cannot be resolved in the session: it is either a blocker (revision required) or
an open risk (documented and tracked; not a blocker to proceeding).
```

### Step 4 — Write the Architecture Decision Record (ADR)

```
The ADR is the permanent record of what was decided and why.
Without it, the architecture review produced conversation but not organizational memory.

ADR REQUIRED SECTIONS:

TITLE: ADR-[sequential number] — [Short description of the decision]
DATE: [ISO 8601]
STATUS: [Proposed / Accepted / Deprecated / Superseded by ADR-N]
AUTHORS: [Names] | REVIEWERS: [Names who participated in the review]

CONTEXT:
  "We needed to [decision space] because [problem statement]. The constraints were [constraints]."

DECISION:
  "We decided to [specific decision]. The core reasoning was [1–3 reasons]."

ALTERNATIVES CONSIDERED:
  "[Option A]: [description] — not chosen because [specific reason]."
  "[Option B]: [description] — not chosen because [specific reason]."

CONSEQUENCES:
  Positive: "[What this enables or improves]"
  Negative: "[What this costs, sacrifices, or complicates]"
  Risks: "[What could go wrong and at what severity]"

CONDITIONS FOR CONDITIONS (if Approve With Conditions):
  "This decision is accepted with the following conditions: [list]. These must be met before [milestone]."
  Owner for each condition: [Name]

REVISIT TRIGGER:
  "This decision should be revisited if [specific condition]."

ADR INDEX:
  ADRs are stored in the repository or team wiki under `/docs/decisions/`
  Named: `ADR-[number]-[short-slug].md`
  Indexed in a table of contents with: number / title / date / status
  New engineers are expected to read relevant ADRs during onboarding
  An ADR that is never read by the engineers who must implement within it has no value

DEPRECATION AND SUPERSESSION:
  When a design decision changes: mark the old ADR "Superseded by ADR-N"
  Write a new ADR explaining the change and why the previous decision was reversed
  Never delete ADRs — the history of decisions, including wrong ones, is organizational learning
```

---

## Decision Tree

```
What does the architecture review assessment reveal?

├── RFC NOT WRITTEN (or missing required sections)
│   └── Do not schedule the review session
│       An RFC-free review is a real-time discovery session; it produces worse outcomes
│       Return to the author with the specific missing sections; set a new RFC deadline
│       Required sections: problem / solution / alternatives / tradeoffs / decision request

├── REVIEW SESSION FUNCTIONING AS APPROVAL CEREMONY
│   └── Restate the norm at opening: "We are looking for what we missed — not ratifying a decision."
│       Ask the critique questions explicitly if the room is silent: scalability / reliability / security /
│       operability / migration / compliance / dependencies
│       Signal: if no concerns are raised in 25 minutes, either the design is excellent or the room is not safe

├── BLOCKER IDENTIFIED IN REVIEW
│   └── Do not attempt to resolve in the session (unless genuinely resolvable in 5 minutes)
│       Capture: the concern + why it is a blocker + what resolution requires
│       Decision: Needs Revision — RFC revised and re-reviewed before proceeding
│       Owner for revision: [Author] by [date]; reschedule review

├── CONCERNS RAISED BUT DISMISSED ("WE'LL FIGURE IT OUT IN IMPLEMENTATION")
│   └── EM intervenes: "I want to make sure we capture that concern before we move on.
│       Is this a blocker, or a risk we'll track and accept?"
│       Blocker: document; revision required
│       Accepted risk: document in ADR consequences section with mitigation plan

├── ADR NOT WRITTEN WITHIN 48 HOURS OF REVIEW
│   └── Escalate: the decision exists only in the memory of review participants
│       Assign the ADR to a specific person; deadline is 48 hours from session close
│       If not written by then: schedule 30 minutes with the author and write it together

├── CROSS-TEAM STAKEHOLDERS NOT IN THE REVIEW
│   └── Two paths:
│       Reschedule with the missing stakeholder present (preferred for blocking dependencies)
│       Circulate the RFC + draft ADR to the stakeholder for async comment before finalizing
│       Do not finalize a design that significantly constrains another team without their input

└── REVISIT TRIGGER MET (condition in ADR has been reached)
    → Schedule a new review session within 2 weeks
    → Present: the original decision / the trigger condition / proposed change
    → Produce a new ADR; supersede the original
```

---

## Output

### Architecture Review Brief and ADR Template

```
ARCHITECTURE REVIEW BRIEF — {{System/Design Name}} — {{Date}}

RFC STATUS: {{Ready / Missing sections: [list]}}
RFC author: {{Name}} | Distributed: {{date}} ({{N}} hours before review)

AGENDA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Opening (5 min): Goal statement; critique norm; session structure
Problem walk-through (10 min): {{What's being solved; why now}}
Solution walk-through (15 min): {{Key components; data flows; API boundaries}}
Structured critique (25 min): Scalability / Reliability / Security / Operability / Migration / Compliance / Dependencies
Open questions (10 min): {{Questions from RFC Section 6}}
Decision and close (10 min): Blockers / Non-blockers / Decision type / ADR owner

TALKING POINTS (EM)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Opening: "This session's goal is {{decision request}}. We are looking for risks — not ratifying.
          If you see a problem, the best thing you can do is name it here."
Critique prompt: "Let's make sure we've covered: scalability at 10× / single points of failure /
                 threat model / 3am debuggability / migration path / cross-team impact."
Decision prompt: "Given what we've discussed, here are the blockers: [list]. Non-blockers: [list].
                 The decision is [approve / approve with conditions / needs revision / reject]."

RISKS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Risk 1: Approval ceremony dynamic — critique questions prepared; will prompt if silence persists
Risk 2: Missing cross-team stakeholder: {{Name/team}} — async circulation plan if reschedule not possible
Risk 3: Known open question from RFC: {{specific question}} — designated time in agenda

DECISIONS NEEDED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Decision: {{From RFC Section 5: the specific decision request}}
Blockers identified: {{list — each blocker that changes the decision}}
Review outcome: {{Approve / Approve with conditions / Needs revision / Reject}}
Conditions (if applicable): {{specific conditions + owner + deadline}}

FOLLOW-UP ACTIONS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ADR written by: {{Name}} by {{date — within 48 hours}}
ADR location: /docs/decisions/ADR-{{N}}-{{slug}}.md
Conditions resolved by: {{Name}} by {{date}}
Revisit trigger: {{Specific condition that would reopen this decision}}
Cross-team notification: {{Owner sends to {{teams}} by {{date}}}}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
ADR TEMPLATE

# ADR-{{N}} — {{Title}}
**Date**: {{date}} | **Status**: {{Proposed / Accepted / Deprecated / Superseded by ADR-N}}
**Authors**: {{Names}} | **Reviewers**: {{Names}}

## Context
{{Problem being solved; constraints; why now}}

## Decision
"We decided to {{specific decision}}. The core reasoning: {{1–3 reasons}}."

## Alternatives Considered
- {{Option A}}: not chosen because {{reason}}
- {{Option B}}: not chosen because {{reason}}

## Consequences
**Positive**: {{what this enables}}
**Negative**: {{what this costs or complicates}}
**Risks**: {{what could go wrong; severity}}

## Conditions (if Approve With Conditions)
{{List of conditions}} | Owner: {{Name}} | Due: {{date}}

## Revisit Trigger
"Revisit this decision if {{specific condition}}."
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| RFC distributed 48h before review with all required sections | Base: 60% |
| Session opened with explicit critique norm ("find what we missed") | +15% |
| Critique covers all 7 domains (scalability / reliability / security / etc.) | +15% |
| Blockers explicitly classified and distinguished from non-blockers | +10% |
| ADR written and stored within 48 hours of review | +10% |
| No RFC; session is real-time discovery | −40% |
| Session functions as approval ceremony; no concerns raised | −25% |
| ADR not written; decision exists only in memory | −30% |
| Blockers not explicitly classified; "we'll figure it out" accepted | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **No RFC** | Review session becomes real-time discovery; author presents from memory; review is rushed and incomplete | RFC is a prerequisite. No RFC = no review session. Set RFC deadline and send 48h before. |
| **Approval ceremony** | No concerns raised; session ends in 30 minutes with unanimous approval | State the critique norm at open. Ask the seven critique questions explicitly. The best value is the problem found before it is built. |
| **Unclassified concerns** | "We'll figure it out later" resolves real risks without capturing them | Every concern is either a blocker (revision required) or an accepted risk (documented in ADR). No third category. |
| **No ADR** | Decision made; documented nowhere; new engineers inherit system with no context | ADR is assigned in the meeting with a specific owner and 48-hour deadline. |
| **Missing stakeholder** | Design constrains another team; that team finds out at implementation | Architecture reviews for cross-team designs require the affected team's input. Reschedule or circulate async. |

---

## References

- `skills/meetings/meeting-planner.md` — Architecture reviews are Type 1 decision meetings; all planning requirements apply
- `skills/meetings/decision-log.md` — ADR extends the decision log format with technical fields; both maintained
- `skills/meetings/agenda-builder.md` — Review session agenda follows the full agenda-builder framework
- `skills/conflict/blameless-retrospectives.md` — Post-incident architectural failures often lead to architecture review follow-ons

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/meetings/decision-log.md` | ADR is a domain-specific extension of the Type 1 decision record |
| `skills/meetings/action-items.md` | Review conditions and revision tasks become tracked action items |
| `skills/conflict/blameless-retrospectives.md` | Incidents often reveal architectural gaps requiring follow-on architecture review |
