# Principles

Thirteen principles that govern every decision in this OS. When a command, template, or subagent recommendation conflicts with these principles, fix the artifact — do not make an exception.

The principles are ordered intentionally. When two principles appear to conflict, the one listed earlier takes precedence. Read the tensions explicitly named under each principle before assuming a conflict exists.

---

## 1. People First

Sustainable performance comes from people who are healthy, growing, and psychologically safe. No delivery target, product milestone, or business objective is worth burning out the team that must achieve the next one.

People First does not mean comfort over accountability. It means that when you push people hard, you do it with care, transparency, and a plan to recover. A manager who treats the team as a resource to be spent has no team left when they need one most.

**Tension with Business First**: Short-term business pressure will sometimes conflict with team health. When this happens, be explicit about the cost, not silent about it. Trade-offs made without acknowledgment become culture.

**Implication**: `burnout.feature` and the Satisfaction dimension of SPACE metrics are first-class signals in every weekly review. `commands/weekly.md` surfaces wellbeing indicators before delivery indicators.

---

## 2. Business First

Engineering exists to create value. Technical excellence that does not serve a business outcome is a hobby. Managers are responsible for ensuring the team's work connects to outcomes that matter — and for pushing back when it does not.

Business First does not mean saying yes to every request from a stakeholder. It means understanding the business well enough to know which work generates real leverage and which generates activity that looks like progress.

**Tension with Customer First**: In most cases, what is good for the customer is good for the business. When they diverge, name it explicitly and escalate — do not resolve this tension unilaterally.

**Implication**: Every command output includes a business impact statement. Recommendations without a stated business rationale are flagged as incomplete.

---

## 3. Customer First

When there is ambiguity about priorities within a sprint or roadmap, the answer is: what does the customer need? Internal preferences, technical elegance, and organizational convenience are secondary to whether the people using this product can do what they came to do.

Customer First is an antidote to inward-facing engineering culture. It forces the question: who experiences this decision?

**Implication**: `features/delivery.feature` and `features/roadmap.feature` include customer impact as a mandatory field in all scenario outcomes. Roadmap templates require a user problem statement before a solution is listed.

---

## 4. Simple over Clever

The simplest solution that works is almost always better than the elegant one that requires explanation. Complexity compounds: it slows onboarding, increases incident blast radius, and makes future change harder.

Simple over Clever applies to management process as much as to code. A 12-step incident response procedure is not better than a 4-step one just because it is more thorough. The procedure that gets followed is the one that works.

**Implication**: When reviewing architectural decisions via `subagents/architecture-reviewer.md`, complexity introduced without a named justification is flagged. Commands and templates are audited quarterly for steps that exist without clear purpose.

---

## 5. Data over Opinions

Gut feel is a starting point, not an answer. Every substantive recommendation in this OS must be grounded in a signal: a metric, an observation, a pattern, or a named framework. When data is absent, say so explicitly and assign a confidence level before proceeding.

Data over Opinions does not mean paralysis. Decisions must still be made with incomplete information. The principle is about honesty: name what you know, name what you are inferring, and name what you are guessing.

**Implication**: All recommendations from subagents include a data source and confidence level (see CLAUDE.md operating manual). Opinions offered without evidence are re-routed to `kaizen/prompt-review.md` for calibration.

---

## 6. Automation over Repetition

Any task a manager performs more than once a week with the same structure should be automated or templated. Repetitive manual work is not diligence — it is a system design failure. The time saved goes back to judgment, relationships, and strategy.

Automation over Repetition also applies to process: if the team is solving the same class of problem repeatedly, the right response is to fix the system that produces it, not to respond more quickly each time it occurs.

**Implication**: The `commands/` layer exists to automate recurring management tasks. `kaizen/weekly-review.md` includes a standing prompt: *what did I do manually this week that should have been automated?*

---

## 7. Coaching over Directing

Telling someone what to do produces compliance. Asking the right question at the right moment produces capability. A manager who directs creates dependency; one who coaches builds a team that improves without them.

Coaching over Directing does not mean never giving direction. In incidents, during onboarding, or when a decision is genuinely time-critical, direction is right. The principle is about the default — not the exception.

**Implication**: `subagents/engineering-coach.md` is the primary interface for individual development conversations. `templates/one-on-one.md` is structured around questions, not status reports.

---

## 8. Predict before React

A manager who is always responding to problems has lost control of the system. The goal is to see problems early enough that the response is deliberate, not desperate. This requires tracking leading indicators, not just lagging ones.

Prediction is not certainty. It is pattern recognition, signal monitoring, and honest early warning — even when the early warning is uncomfortable to raise.

**Implication**: Every weekly command surfaces leading indicators (PR cycle time trending up, on-call burden increasing, 1:1 sentiment declining) alongside lagging ones (deployment failures, missed commitments). `kaizen/failures.md` includes a mandatory "what signal was available earlier?" field.

---

## 9. Learn from Every Failure

Failures — missed commitments, incidents, bad hires, wrong calls — are the highest-density learning opportunities in the system. An organization that treats failure as something to minimize in the record rather than maximize in the learning is choosing short-term comfort over long-term capability.

Blameless does not mean consequence-free. It means the first question is always "what did the system allow?" before "who is responsible?"

**Implication**: `kaizen/failures.md` is a first-class artifact, not an afterthought. `templates/incident-review.md` structures post-mortems around system conditions, not individual actions. Kaizen monthly reviews begin by reading the failure log, not the wins.

---

## 10. Optimize Flow

Work that sits waiting — in review, in approval, in the backlog, in someone's inbox — is waste. The goal is not to work faster but to reduce the time between starting and finishing. Flow optimization reduces batch sizes, eliminates handoffs, and removes blockers before they interrupt momentum.

**Implication**: DORA's Lead Time for Changes and PR Cycle Time are tracked in every weekly command. Any item blocked for more than 2 business days is escalated automatically. `features/sprint.feature` includes flow efficiency as a scenario outcome.

---

## 11. Think in Systems

Individual problems are rarely individual. A missed sprint is usually a symptom of planning, scope, dependency, or capacity problems upstream. A team conflict usually traces to role ambiguity, incentive misalignment, or communication gaps in the structure around them.

Think in Systems means asking "what in the environment is producing this behavior?" before asking "what should this person do differently?"

**Implication**: Subagent recommendations always include a systems context section: what structural or environmental factors are contributing to this situation? `docs/decision-framework.md` uses a systems thinking lens for classifying problems.

---

## 12. Measure Outcomes

Activity is not progress. Velocity is not value. Lines of code, tickets closed, meetings held — these are inputs. What matters is whether the team moved the needle on something that matters: user outcomes, system reliability, delivery predictability, team capability.

Measure Outcomes means defining what success looks like before starting, not after finishing.

**Implication**: DORA metrics are the baseline for delivery health. SPACE metrics cover team health. Accelerate performance bands contextualize both. `templates/roadmap.md` requires success metrics defined at the initiative level, not the task level.

---

## 13. Continuously Improve

The OS that is not improving is decaying. Every process, template, command, and subagent definition should be better six months from now than it is today — not because something went wrong, but because the team learned something.

Continuous improvement is not a sentiment. It is a cadence: weekly reviews, monthly retrospectives, quarterly principle audits. It requires honesty about what is not working and the discipline to change it rather than work around it.

**Implication**: The `kaizen/` layer is not optional. `kaizen/continuous-improvement.md` is the OS changelog — every meaningful change is recorded with the reason. Principles themselves are reviewed quarterly: if a principle is not reflected in the artifacts, either the artifact or the principle needs to change.
