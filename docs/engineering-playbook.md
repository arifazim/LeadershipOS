# Engineering Playbook — Leadership Bible

The authoritative reference for how this management practice operates. When facing a hard situation, open the relevant section. When a section no longer reflects reality, update it.

Sections are organized from ceremony to strategy. Use the headers to navigate.

---

## Running Sprint Planning

**Purpose**: Produce a shared, realistic plan the team believes in — not a commitment extracted from them.

### The EM's Role
The EM is not the planner. The EM is the constraint manager and reality check. Your job during planning:
- Bring context the team doesn't have (stakeholder priorities, org-level dependencies, upcoming risks)
- Protect capacity (PTO, on-call burden, interview load, technical debt allocation)
- Challenge scope creep before it enters the sprint
- Ensure Definition of Done is shared, not assumed

### Structure
| Phase | Duration | Owner | Output |
|---|---|---|---|
| Sprint goal alignment | 15 min | EM | 1–2 sentence sprint goal, agreed |
| Backlog review | 20 min | Tech Lead | Top items groomed and understood |
| Capacity check | 10 min | EM | Available person-days this sprint |
| Story selection | 45 min | Team | Sprint backlog with story point commitment |
| Risk identification | 10 min | EM | Named blockers, dependencies, escalations |

### Rules
- Never fill 100% of capacity. Target 80% to absorb unexpected work.
- If the team cannot explain a story without the ticket open, it is not ready for the sprint.
- Stories that cannot be completed within one sprint must be split before planning ends.
- The sprint goal is agreed before stories are selected — not derived from them.

### Failure Modes
- **Commitment theater**: EM pressures team to accept more than they believe is achievable. Result: missed sprints, eroded trust.
- **Estimation theater**: Team estimates without understanding the work. Result: velocity data that means nothing.
- **Missing dependencies**: External blockers are not surfaced until mid-sprint. Result: blocked stories, scramble.

### Signal It Went Well
- The team can articulate the sprint goal without looking at the board
- Capacity is understood and respected
- At least one risk or dependency is named and owned before the sprint starts

---

## Running Standups

**Purpose**: Surface and remove blockers. Not a status report. Not a progress update. Blockers.

### The EM's Role
The EM facilitates, does not report. Your job:
- Listen for blockers that the team under-flags ("I'm working on it" when they've been stuck for 2 days)
- Remove blockers immediately or commit to a time by which you will
- Notice patterns across individuals (everyone is blocked on the same thing — that's a system problem)
- Keep the ceremony to time

### Format: Walk the Board
Preferred over round-robin. Move through in-progress items, not through people. Ask: *what does this ticket need to move forward?* This surfaces work-centered blockers rather than person-centered status.

### Rules
- Hard cap: 15 minutes. If a discussion starts, take it after standup.
- Anyone can flag a blocker. Only the EM commits to removing it.
- "No blockers" three days in a row from the same person is a signal — follow up 1:1.
- If standup consistently surfaces the same blockers, you have a process problem, not a communication problem.

### When to Kill Standup
Standup is not sacred. If the team is colocated and communicates continuously, a daily ceremony adds overhead without value. Evaluate every quarter: is standup surfacing blockers that wouldn't have been surfaced otherwise?

### Failure Modes
- **Status theater**: Everyone reads from their ticket. No blockers named. Meeting ends. Nothing changes.
- **EM domination**: EM turns standup into a progress review. Team stops speaking candidly.
- **Chronic overrun**: Meeting routinely runs 25–30 minutes. Team disengages or skips.

---

## Running Retrospectives

**Purpose**: Improve the system, not vent about it. A retro that produces no change is worse than no retro — it signals the team's feedback does not matter.

### Psychological Safety First
Retros only produce honest output in safe environments. Before format matters, ask: will people say true things here? If not, the EM's job is to create safety, not run the agenda.

Signs safety is low: everything is positive, same people speak, feedback targets individuals not systems.

### Formats

**Start / Stop / Continue** — Good for teams new to retros. Low friction, broad coverage.

**4Ls (Liked / Learned / Lacked / Longed For)** — Good for project retros. More nuanced than Start/Stop/Continue.

**DACI + Root Cause** — Good for mature teams. Group themes, vote on highest impact, assign owners, trace to root cause.

**Sailboat** — Good when morale is low. Wind (what's helping), Anchors (what's slowing), Rocks (risks ahead), Island (the goal). Visualizes direction alongside blockers.

### Structure
| Phase | Duration | Output |
|---|---|---|
| Set the context | 5 min | Sprint goal, commitment vs. actual |
| Individual reflection | 10 min | Silent sticky notes |
| Group and theme | 10 min | Clustered observations |
| Vote on priority | 5 min | Top 1–2 items to act on |
| Define actions | 15 min | Named owner, done-by date for each action |
| Close | 5 min | Restate commitments |

### Rules
- Maximum 3 action items per retro. One is better.
- Every action item has a named owner and a date — not "the team."
- Open the previous retro's actions first. Unresolved actions are the most important agenda item.
- Feedback targets systems, processes, and decisions — not individuals.

### Failure Modes
- **Catharsis without change**: Great conversation, no action items. Team feels heard, nothing improves.
- **Action item graveyard**: Items from 4 sprints ago still open. Team stops suggesting improvements.
- **EM-as-problem-solver**: EM generates all action items instead of coaching the team to own them.

---

## Managing Up

**Purpose**: Ensure your manager has what they need to support you, advocate for your team, and make good decisions about the org — without requiring them to ask.

### What Your Manager Needs From You
- **No surprises**: Bad news delivered early is a gift. Bad news delivered late (or not at all) is a trust withdrawal.
- **Problems with proposals**: Bring issues with a recommended path, not just the issue. "I don't know what to do" is fine occasionally; as a pattern it signals you're not developing judgment.
- **Signal, not noise**: A summary of the three things that matter, not a comprehensive update of everything happening.

### Operating Cadence
- **Weekly**: Written update covering delivery status, team health, risks, and one thing you need from them.
- **On-demand**: Escalate P1 incidents, unexpected attrition, and scope changes that affect org-level plans before they find out another way.

### Framing
Lead with the business impact, not the technical detail. Your manager is managing a portfolio of teams. Frame your situation within that context.

> "We're at risk of missing the Q3 milestone on the payments feature. The blocker is a dependency on the platform team that isn't in their sprint. I'd like your help escalating. Confidence: Medium — there's a workaround path we're assessing."

### The Reverse Brief
Before major decisions, brief your manager on what you're about to do and why. This is not asking for permission — it is giving them the chance to flag context you don't have. Most good managers will say "sounds right, go ahead." Occasionally they'll say "actually, hold on" — which saves you.

### Failure Modes
- **Invisible management**: EM handles everything without updating upward. Manager is blindsided by something they should have known about.
- **Over-escalation**: Every decision goes upward. Manager loses confidence in EM's judgment.
- **Complaint without ownership**: Problems surfaced without proposed solutions signal the EM is not accountable for them.

---

## Managing Down

**Purpose**: Build a team that improves without you. The measure of managing down is not what happens when you're present — it's what happens when you're not.

### The Coaching Default
Before giving an answer, ask a question. Before solving a problem, ask who on the team should solve it. Reserve direction for situations where speed is genuinely critical (incidents, hard deadlines, safety issues).

See *Coaching over Directing* in `docs/principles.md`.

### Giving Feedback
- Make it specific: behavior + impact, not character assessment.
- Make it timely: same day is better than same week.
- Make it private for corrective feedback, public for recognition.
- Make it a conversation: "what do you think happened?" before "here's what I observed."

**SBI Format**: Situation → Behavior → Impact.
> "In today's planning meeting (situation), when you pushed back on the timeline in front of the stakeholders without flagging it to me beforehand (behavior), it put us in a difficult position with the product team and made it harder to negotiate (impact). What was driving that?"

### Performance Conversations
Do not conflate performance and conduct. Performance is about capability and output relative to the role. Conduct is about behavior relative to team norms. They require different conversations and different responses.

Signs you are waiting too long: the formal review contains no surprises. If a performance concern surfaces at review time that the engineer has never heard before, you have failed them.

### Career Development
- Know the next level criteria for every person on the team.
- Have an explicit conversation about career direction at least quarterly.
- Create opportunities for growth *before* someone is ready — not after they've proven they can already do it.
- Promotions are made; they are not discovered.

### 1:1 Discipline
- 1:1s belong to the engineer, not the EM.
- Default agenda: what's on their mind, what's blocking them, how they're doing.
- Status updates in 1:1s are a failure mode — that belongs in standup or async.
- If you are canceling 1:1s under pressure, you are making the wrong trade.

### Failure Modes
- **Feedback avoidance**: EM gives only positive feedback to avoid discomfort. Engineer is surprised at calibration.
- **Micromanagement**: EM reviews every decision. Team loses initiative.
- **Absentee management**: EM is heads-down on strategy. Team drifts without guidance.

---

## Managing Across

**Purpose**: Build the peer relationships and shared agreements that allow cross-team work to flow without escalation.

### The Peer EM Relationship
Other engineering managers are not your competitors. They are the people whose teams your team depends on and who depend on your team. A bad peer relationship compounds every cross-team dependency into a negotiation.

Invest in peer relationships before you need them. Know what each peer EM is trying to accomplish this quarter. Share yours. Find overlap early.

### Shared Dependencies
When your team depends on another team's work:
1. Get it in their sprint before it becomes urgent for you.
2. Name the dependency in your planning — do not assume it will happen.
3. Escalate to peer EM (not their team) if the timeline is at risk.
4. Never go around a peer EM to their team's engineers without telling them first.

### Cross-Team Conflict
Most cross-team conflict is a mismatch in priorities, not a mismatch in people. Start there.

Resolution sequence:
1. Peer EM conversation: align on what each team needs and by when.
2. Joint prioritization: what can both teams agree to?
3. Joint escalation: if no agreement is possible, bring it up together — not as opposing positions.

Never optimize your team's delivery at the cost of another team's stability or capacity. See *Never optimize one team at the expense of another* in `CLAUDE.md`.

### Organizational Influence
EMs who only advocate within their team have limited leverage. Build credibility across the org by:
- Sharing useful information proactively (post-mortem learnings, architectural decisions)
- Volunteering your team's capacity for org-level investments occasionally
- Being the person who makes cross-team work easier, not harder

### Failure Modes
- **Silo optimization**: EM maximizes own team's velocity without regard for org-wide flow.
- **Escalation dependency**: Every cross-team issue goes to senior leadership. Peer EMs stop trying to resolve things bilaterally.
- **Passive dependency**: EM assumes shared work will happen without explicit agreements. It doesn't.

---

## Hiring

**Purpose**: Add people who make the team better — not just people who can do the job.

### Before Posting
- Define the problem you are solving with this hire. What is the team unable to do today that this person will enable?
- Define the level before writing the job description. Leveling determines scope, compensation range, and what "good" looks like in the interview.
- Identify the team's current gaps: not just skills, but working styles, communication patterns, seniority balance.

### Interview Design
Design interviews around the actual work:
- Assign work sample exercises from real (anonymized) problems the team has solved.
- Include a cross-functional scenario: how do they communicate with non-engineers?
- Include a conflict or failure scenario: how do they handle things going wrong?
- Score independently before debriefing. Group debrief without independent scores produces anchoring, not calibration.

**Structured > Unstructured**: Use the same questions with every candidate for a given role. This is the single highest-return investment in interview quality.

### Reducing Bias
- Write the scorecard criteria before the interview loop, not after.
- Separate "cultural fit" from "I liked them." Fit must be defined in terms of working style, not personality.
- If your team has low demographic diversity, examine the pipeline (sourcing), the screening (who passes), and the process (who gets offers) separately.

### The Offer
- Move fast. Top candidates have multiple options. A 2-week offer process is a competitive disadvantage.
- Be transparent about level, growth path, and team reality. Overselling creates churn at the 6-month mark.
- Reference-check at final stage, not as a formality — as a genuine signal.

### Onboarding
- Day 1 goal: the new hire ships something small.
- Week 1 goal: they understand the team's current priorities and how their work fits.
- 30/60/90 plan with explicit milestones.
- Assign a peer onboarding buddy (not the EM). The EM's relationship with a new hire should not be mediated entirely through ramp-up tasks.

### Failure Modes
- **Hiring for pedigree**: Logo-matching over demonstrated capability. Expensive and unreliable.
- **Slow process**: Strong candidates accept elsewhere while you debrief.
- **No onboarding structure**: New hire is confused for 3 months and then blamed for slow ramp.

---

## Promotions

**Purpose**: Recognize demonstrated performance at the next level — not potential, not tenure, not advocacy alone.

### The Core Rule
Promotions are made for work already being done, not for work someone might do. The job of the EM is to create the conditions for that work to happen, then make the case when it has.

### Criteria
Know the level criteria for your org cold. Write them down if they are not written. For each engineer on a growth path, map their work to the criteria quarterly — not annually.

A promotion case requires evidence in three areas:
1. **Scope**: The engineer is operating at the scope of the next level, not just doing their current job well.
2. **Impact**: The work has produced demonstrable outcomes at the next level.
3. **Consistency**: This is not a single impressive project — it is a pattern over time.

### Calibration
Most promotion decisions are made in cross-EM calibration. Prepare:
- 3–5 concrete examples of next-level behavior with outcomes
- Peer feedback (quotes, not summaries)
- Your confidence level in their readiness

Know before you enter calibration which criteria your candidate exceeds and which are borderline. Do not be surprised by pushback.

### When the Answer Is No
Be direct. Tell the engineer what the gap is, with specificity. "You're not ready" is not feedback. "Your impact is scoped to within the team, and at the next level we'd expect cross-team influence — here's what that would look like" is feedback.

Create a written growth plan together. Revisit it in 3 months. If the org has a promotion cycle, confirm when the next one is and what the candidate would need to demonstrate before then.

### Failure Modes
- **Advocacy without evidence**: EM lobbies hard but cannot name concrete examples. Promotion is denied or fails calibration.
- **Promising promotions**: EM implies a promotion is coming without confirming it with their own manager. Engineer is blindsided.
- **Recency bias**: One great project drives a promotion conversation. Pattern is not established.

---

## Technical Debt

**Purpose**: Keep debt visible, managed, and proportional — not eliminated (impossible) and not ignored (dangerous).

### Classification
Not all debt is equal. Classify before prioritizing:

| Type | Description | Urgency |
|---|---|---|
| **Critical** | Blocking delivery, causing incidents, or a security risk | Address this sprint |
| **Structural** | Slowing future development, high cognitive load | Schedule within quarter |
| **Cosmetic** | Inconsistencies, style, minor awkwardness | Backlog, address opportunistically |
| **Intentional** | Known shortcuts taken deliberately with a payoff date | Track; honor the payoff date |

### Making It Visible
Debt that is not visible will not be funded. Options:
- Maintain a debt register (labels in Jira, a section in the team wiki) — categorized and prioritized
- Include a debt section in every sprint review
- Tag debt items with a cost estimate: "this adds ~1 day/sprint of friction until resolved"

### Negotiating Time
Debt reduction competes with feature work for the same capacity. Frame it in business terms:
> "We're carrying ~15% velocity drag from the authentication service. Addressing it over two sprints would recover 1.5 engineers' worth of throughput by Q3."

Never ask for "time to clean things up." Ask for a specific investment with a projected return.

### The Debt That Kills You
Watch for debt that becomes an incident risk: unpatched dependencies, systems without observability, manual processes in critical paths, single-engineer knowledge ownership. These are not backlog items — they are organizational risks. Treat them as such.

---

## Architecture

**Purpose**: Ensure the EM understands enough architecture to manage risk, enable good decisions, and represent the team's technical reality to stakeholders.

### The EM's Role in Architecture
The EM is not the architect. The EM's responsibility:
- Ensure architectural decisions are made explicitly (not by default or accident)
- Ensure risks are named and owned
- Ensure decisions are recorded and traceable
- Represent architectural complexity accurately in roadmap and timeline conversations

### Decision Records
A decision is "significant" and requires a record if it is:
- Hard or expensive to reverse
- Cross-team or cross-service in scope
- Creating a constraint that will affect future decisions

Format for every decision record:
1. **Context**: What situation prompted this decision?
2. **Options considered**: At least two alternatives with trade-offs
3. **Decision**: What was chosen and by whom
4. **Rationale**: Why this option over the alternatives
5. **Consequences**: What becomes easier, what becomes harder, what risks are accepted

### Architecture Review Process
New significant decisions go through `subagents/architecture-reviewer.md` before implementation. The review is not a gate — it is a structured conversation to surface risks and alternatives.

The EM attends architectural reviews not to approve the technical decision but to understand the business and organizational implications.

### Risk Surface
Every architectural decision creates a risk surface. Track:
- **Scalability risk**: Does this hold at 10x current load?
- **Operational risk**: Can the team support this in production?
- **Knowledge risk**: How many engineers understand this system?
- **Dependency risk**: What breaks if this component fails?

---

## Risk

**Purpose**: Name risks before they become incidents. An unacknowledged risk is not a smaller risk — it is an unmanaged one.

### Risk Identification
Run a risk identification pass:
- After every sprint planning
- Before every major release
- After every significant team or org change

Ask: what could go wrong in the next 4 weeks? What would we be most surprised by? What are we assuming that might not be true?

### The Risk Register
Maintain a living risk register. For each risk:

| Field | Description |
|---|---|
| **Risk** | What could happen |
| **Likelihood** | High / Medium / Low |
| **Impact** | High / Medium / Low |
| **Owner** | Who is tracking this |
| **Mitigation** | What is being done to reduce likelihood or impact |
| **Trigger** | What signal would tell you this risk is materializing |
| **Escalation threshold** | When does this go to your manager or a stakeholder |

### Categories to Always Check

**Technical risks**: dependencies, system reliability, security, scalability, observability gaps

**Delivery risks**: scope creep, unclear requirements, external dependencies, capacity surprises (attrition, PTO, on-call)

**People risks**: key person dependency, low morale or burnout signals, unclear roles, performance gaps that haven't been addressed

**Organizational risks**: reorg signals, funding uncertainty, competing team priorities, stakeholder misalignment

### Escalation Thresholds
Not every risk goes up. Escalate when:
- The risk is above your authority to mitigate
- The risk affects another team or a stakeholder's plans
- The risk has materialized faster than expected
- You need organizational resources (people, budget, priority) to mitigate

---

## Stakeholders

**Purpose**: Ensure stakeholders have what they need to support your team and make good decisions — before they ask.

### Stakeholder Mapping
For each stakeholder who can affect your team's success:

| Attribute | Description |
|---|---|
| **Interest** | What do they care about most? Delivery speed? Quality? Cost? Strategic alignment? |
| **Influence** | High / Medium / Low ability to affect your team's priorities or resources |
| **Cadence** | How often do they need updates? What format? |
| **Trust level** | Current relationship quality — influences how much context you share |

### Communication Cadence
Do not wait for stakeholders to ask. Establish a push cadence:
- **Weekly**: Written summary (see `templates/executive-status.md`) — delivery status, risks, decisions made, asks
- **On delivery milestones**: Demo or written summary of what was shipped and what it delivers
- **On risk emergence**: Proactive flag as soon as a risk is identified, not after it has materialized

### Managing Expectations
Set delivery expectations conservatively. Buffer your public commitments from your internal targets. A team that consistently delivers on public commitments builds stakeholder trust even when internal targets slip.

Never overpromise to win support. The trust cost of a missed commitment exceeds the political benefit of a confident projection.

### When Things Go Wrong
Stakeholders tolerate problems. They do not tolerate surprises. When something goes wrong:
1. Tell them before they find out another way
2. State what happened, what you know, and what you are doing about it
3. Give a timeline for the next update
4. Do not speculate about causes until you have investigated

---

## Incidents

**Purpose**: Minimize customer impact, restore service, and learn from every failure — without blame, without theater, without shortcuts.

### Severity Definitions

| Severity | Definition | Response Time | EM Role |
|---|---|---|---|
| P1 | Customer-facing data loss or complete outage | < 15 min | Active — join, support IC, own stakeholder communication |
| P2 | Significant degradation, > 10% of users | < 1 hour | Monitor, available to unblock |
| P3 | Minor degradation, workaround available | Next business day | Aware, no active role required |

### During the Incident

**Assign an Incident Commander immediately.** The IC owns the technical resolution. The EM owns two things: removing obstacles and stakeholder communication. Do not conflate the roles.

Communication rules during P1/P2:
- Dedicated Slack thread for all incident communication — no side conversations
- Stakeholder update within 30 minutes of P1/P2 declaration, then every 30 minutes until resolution
- Never speculate publicly about cause during the incident

Mitigation over diagnosis. Restore service first. Understand root cause second.

### After the Incident

Post-mortem within 5 business days for all P1s, within 10 for P2s.

Post-mortem structure (see `templates/incident-review.md`):
1. **Timeline**: What happened and when
2. **Impact**: Who was affected, for how long, what was lost
3. **Root cause**: Systemic, not individual
4. **Contributing factors**: What made this possible
5. **Action items**: Named, dated, systemic — not "be more careful"
6. **What we learned**: What this tells us about the system

**Blameless means systemic.** If an action item is "engineer X should have done Y," you have written a blame document, not a post-mortem.

### On-Call Health
On-call burden is a team health signal. Track:
- Alert volume per week
- Pages requiring action vs. noise
- MTTR trend over rolling 4 weeks
- Time of day distribution (off-hours load)

If on-call is consistently disruptive, it is not an on-call problem — it is a reliability problem. Treat it as one.

---

## Roadmaps

**Purpose**: Communicate direction and sequence — not commit to a schedule you cannot honor.

### Types of Roadmaps

**Now / Next / Later** — Best for teams with fast-changing priorities. Communicates direction without false precision. "Now" = this sprint or quarter. "Next" = next 1–2 quarters. "Later" = beyond that, subject to change.

**Outcome-based roadmap** — Organizes by the business outcome being targeted, not the feature being built. More durable under changing requirements. Requires alignment on what outcomes matter.

**Timeline roadmap** — Useful for stakeholder alignment and dependency coordination. Dangerous if treated as a contract. Always attach confidence levels to milestones.

### What Belongs on a Roadmap
- Initiatives with named business outcomes and success metrics
- Dependencies that require cross-team coordination
- Capacity allocations (what % is feature work vs. debt vs. platform vs. hiring ramp)
- Risk flags: items that are planned but have open unknowns

**What does not belong**: individual tasks, story-level work, feature specifications. Those live in the backlog.

### How to Say No
Saying no to scope is a core management skill. The frame:
> "We can do X, Y, or Z in Q3. Adding W means something else moves to Q4. Which would you like to defer?"

Never say "we can't do it." Say "here is what we would need to give up."

### Keeping It Alive
A roadmap that is not updated is worse than no roadmap — it misleads. Commit to a review cadence:
- **Weekly**: Update status, flag slipping items
- **Monthly**: Reprioritize based on new information
- **Quarterly**: Full reassessment against business priorities

---

## Prioritization

**Purpose**: Direct limited capacity toward the work that creates the most value — and maintain that alignment as context changes.

### Frameworks

**RICE** (Reach × Impact × Confidence ÷ Effort): Good for product feature prioritization where you have user data.

**ICE** (Impact × Confidence × Ease): Faster, useful for lower-stakes backlog grooming.

**Value vs. Effort matrix**: Good for stakeholder conversations. Plot items on a 2x2. Focus on high-value, lower-effort items first.

**Weighted Shortest Job First (WSJF)**: Used in SAFe. Useful for cross-team prioritization where cost of delay is the key variable.

Use whichever framework produces the right conversation with your stakeholders — not the one that is most theoretically correct.

### Stakeholder Alignment
Prioritization without stakeholder alignment produces rejected plans. Run prioritization as a joint exercise when:
- Multiple stakeholders have competing claims on team capacity
- A decision will visibly affect delivery timelines
- Trade-offs need to be agreed, not just decided

### The Urgency Trap
Most requests that feel urgent are not. Before reprioritizing, ask: what is the actual cost of a 2-week delay? If the answer is "none," the urgency is organizational anxiety, not business risk.

Maintain a "now / next week / next sprint" horizon. Protect the current sprint from mid-sprint reprioritization except for genuine P1-level business needs.

### Saying No
See also: *Roadmaps → How to Say No*.

"No" to a request is not "no" to the person. Frame it as resource allocation:
> "We have capacity for two major initiatives this quarter. We've committed to A and B. To add C, we'd need to move B to Q4. Is that the right trade?"

This keeps the conversation on trade-offs, not capability.

---

## Executive Communication

**Purpose**: Give executives what they need to make decisions and maintain confidence in your team — in the least amount of their time.

### The Executive Audience
Executives manage portfolios. Your team is one line item among many. They need:
- Status (are we on track?)
- Risk (what could go wrong?)
- Asks (what do I need from them?)
- No surprises

They do not need: technical detail, full team context, or process explanation unless they ask.

### Structure: Summary First
Every executive communication leads with the summary. Details follow for those who want them.

```
STATUS: [Green / Yellow / Red]
SUMMARY: [2–3 sentences: where we are, what we're focused on, confidence level]
RISKS: [Bullets — named risk, likelihood, mitigation]
ASKS: [Specific requests — named, actionable, time-bound]
DETAILS: [For those who want more]
```

### Confidence Levels
Always include confidence in delivery estimates. Use the four-tier scale from `CLAUDE.md`:
- **High (90–100%)**: On track, no material risks
- **Medium (70–89%)**: On track with known risks being managed
- **Low (50–69%)**: At risk; mitigation in progress
- **Speculative (<50%)**: Do not commit; need to validate before communicating a timeline

### Red Status
Red status is not a failure of the EM. Red status communicated early is a trust deposit. Red status that executives discover themselves is a trust withdrawal.

When going red:
1. Name what changed
2. Name the impact (timeline, scope, quality)
3. Name the options (what can be done about it)
4. Make a recommendation

Never present a problem without a proposed path forward.

### Failure Modes
- **Burying the lead**: Status buried in paragraph 4 after 200 words of context.
- **False green**: EM reports green to manage perception. Executives find out late.
- **No asks**: EM never asks for anything. Executives cannot help. Problems compound.

---

## Delegation

**Purpose**: Extend your impact by developing the team's capacity to own work — not by offloading tasks.

### What to Delegate
Delegate work that:
- Someone on the team can do at 70–80% of your quality today (the rest is growth)
- Develops the delegatee's judgment, not just their execution
- You would otherwise do repeatedly

Keep work that:
- Requires your specific authority or org relationships
- Has asymmetric consequences if done wrong (hiring decisions, terminations, escalations to leadership)
- No one on the team is ready for yet

### How to Delegate (Not Just Assign)
Four components of effective delegation:
1. **Context**: Why this matters, what success looks like, what the stakes are
2. **Authority**: What decisions the person can make without coming back to you
3. **Resources**: What they have access to (people, budget, information, your time)
4. **Check-in cadence**: When you will reconnect, not to review progress but to unblock

The mistake is assigning without context or authority, then following up with "how's that going?" — which creates dependency without developing judgment.

### The Accountability Gap
The most common delegation failure: the work is assigned, but accountability is not transferred. The EM still feels responsible, still checks in daily, still takes the work back when it gets hard. The person learns task execution, not ownership.

Transfer accountability explicitly:
> "This is yours. I need you to own the outcome, not just the tasks. Come to me if you're blocked or if something changes materially — otherwise, I trust you to handle it."

### Follow-Through Without Micromanaging
Set milestones, not check-ins. Ask "what would tell you this is on track?" and hold them to that signal, not your preferred tracking cadence.

---

## Scaling Teams

**Purpose**: Grow the team in a way that increases collective capability — not just headcount.

### Hiring Ahead of Need
Hiring lags reality by 3–6 months. If you need the capacity now, you needed to start hiring 4 months ago. Advocate for headcount before the pain is visible.

Signals you need to start hiring:
- P50 velocity has dropped for 2+ consecutive sprints without a recoverable cause
- On-call burden is unsustainable (> 1 page/day requiring action)
- A single engineer holds critical knowledge for a production system
- New team members consistently ramp slowly because senior engineers lack time to mentor

### Team Topology
As teams scale, the org structure must match the architecture (Conway's Law operates whether you acknowledge it or not):

| Team size | Topology consideration |
|---|---|
| ≤ 6 | Single team, direct communication, minimal process |
| 7–12 | Consider sub-teams by domain; explicit interface agreements |
| > 12 | Split is usually right; the cost of coordination exceeds the cost of the boundary |

When splitting a team: split along product/domain lines (not technology layers). Each resulting team should be able to deploy independently.

### Senior vs. Junior Balance
A team that is all senior engineers is expensive and often under-challenged. A team that is all junior engineers is fragile and slow to grow.

Target ratio: 1 senior/staff per 3–4 engineers for stable product teams. Adjust for product maturity and operational complexity.

### Onboarding at Scale
The ramp time of each new hire is a tax on the existing team. As teams grow:
- Invest in documentation before you need it (architecture diagrams, runbooks, decision records)
- Assign onboarding buddies formally, not informally
- Measure time-to-first-commit and time-to-first-meaningful-contribution

If average ramp time is increasing as the team grows, you have a knowledge distribution problem.

### Failure Modes
- **Additive scaling**: Adding people without changing process. Output does not grow linearly; coordination cost does.
- **Key person dependency at scale**: One engineer is the bottleneck for knowledge or decisions. Creates fragility and burnout risk.
- **Premature splitting**: Team split before domain boundaries are stable. Results in cross-team friction that is worse than the coordination overhead of staying together.

---

## AI Adoption

**Purpose**: Leverage AI tools to accelerate engineering throughput and quality — with eyes open to the risks.

### The EM's Role
The EM does not need to be an AI expert. The EM needs to:
- Create space for the team to experiment with AI tooling safely
- Set expectations for what AI can and cannot be responsible for
- Monitor for over-reliance, quality drift, and security exposure
- Advocate for AI investment with executives using business-outcome framing

### Evaluating AI Tools
Before adopting a new AI tool team-wide:

| Criterion | Questions to ask |
|---|---|
| **Quality** | What is the error rate on the work type we'll use this for? |
| **Security** | What data is sent to the model? Where is it stored? |
| **Dependency** | What happens if this tool is unavailable or changes its pricing? |
| **Cognitive load** | Does this reduce cognitive load or just shift it? |
| **Auditability** | Can we trace which outputs were AI-assisted? |

### Where AI Adds Clear Value
- First-draft generation (code, docs, tests, status updates)
- Pattern detection in large datasets (logs, metrics, code bases)
- Summarization and synthesis (meeting notes, PR descriptions, incident timelines)
- Accelerating repetitive-but-correct tasks (boilerplate, test scaffolding, migration scripts)

### Where AI Is Risky
- Security-sensitive code without expert review
- Architecture decisions (AI will not understand your org's constraints)
- Performance-critical paths (requires measurement, not intuition)
- Any output that goes to external stakeholders without human review

### Adoption Pattern
1. **Experiment phase** (1–2 weeks): Individual engineers try tools on low-stakes tasks. Collect observations.
2. **Evaluate phase** (1 sprint): Measure actual impact — velocity, quality signal, reported cognitive load.
3. **Standardize phase**: For tools that show clear value, define team norms: when to use, what to review, what not to delegate.
4. **Monitor phase**: Track ongoing — are we catching AI-introduced errors? Is dependency growing unhealthily?

### Metrics for AI Adoption
- Deployment frequency and change failure rate (does AI tooling help or hurt quality?)
- PR cycle time (does it accelerate review or introduce new review burden?)
- Developer-reported cognitive load (SPACE: Satisfaction and Efficiency dimensions)

### Failure Modes
- **Uncritical adoption**: Team treats AI output as ground truth. Quality degrades invisibly.
- **Security blind spot**: Proprietary code or customer data sent to third-party models without review.
- **Productivity theater**: Tools generate output volume but not outcome value.
- **Two-tier team**: Some engineers use AI heavily, others not at all. Capability gap and resentment grows.
