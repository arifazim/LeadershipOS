Feature: One-on-One Effectiveness
  As an Engineering Manager
  I want to run 1:1s that surface real signals and develop each engineer
  So that I can act on concerns early and build a team that improves over time

  # Executor: subagents/engineering-coach.md
  # Skill:    skills/people/one-on-one.md
  # Cadence:  Weekly or biweekly per engineer

  Background:
    Given a 1:1 is scheduled with an engineer
    And prior 1:1 notes are available for at least the last 3 sessions

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Productive 1:1 — real signals, growth discussed
    Given the engineer brings at least one agenda item of their own
    And at least one blocker or concern is surfaced during the session
    And the career or growth topic is discussed
    And action items from the prior session are reviewed
    When the engineering coach assesses 1:1 effectiveness
    Then 1:1 quality is "Productive"
    And recommendation is "Sustain this format — log key signals and follow up on action items"
    And confidence is "High"

  @healthy @regression
  Scenario: Promotion Signal Observed — next-level behavior emerging
    Given the engineer is consistently operating above their current level
    And they have demonstrated cross-team impact in 2 or more recent sprints
    And the trend has been visible for > 6 weeks
    When the engineering coach assesses the engineer's readiness
    Then promotion signal is "Positive"
    And recommendation is "Begin building the promotion case — gather evidence, get peer feedback"
    And a promotion case is built (skills/people/build-promotion-case.md is planned — not yet built; use skills/career/promotion/promotion-evidence.md in the meantime)
    And confidence is "Medium"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Status-Only 1:1 — meeting has become a progress report
    Given the engineer reports only on what tickets they completed
    And no blockers, concerns, or growth topics are raised
    And this pattern has occurred in 2 or more consecutive sessions
    When the engineering coach assesses 1:1 quality
    Then 1:1 quality is "Degraded"
    And recommendation is "Restructure the 1:1 — open with 'what's on your mind?' not 'what are you working on?'"
    And coaching questions are generated to reopen the conversation
    And confidence is "High"

  @warning @regression
  Scenario: Career Conversation Overdue — no growth discussion in 6 weeks
    Given no career, growth, or development topic has been discussed in the last 6 weeks
    And the engineer has not mentioned career goals recently
    When the engineering coach assesses the 1:1 history
    Then development status is "Overdue"
    And recommendation is "Dedicate the next full 1:1 to career direction — do not split time with status"
    And coaching questions are generated for a career conversation
    And confidence is "High"

  @warning @regression
  Scenario: 1:1 Cancelled Once — single cancellation by EM
    Given the engineering manager cancelled a 1:1 in the last 2 weeks
    And it was not rescheduled within 5 business days
    When the engineering coach assesses the 1:1 cadence
    Then cadence status is "Warning"
    And recommendation is "Reschedule immediately — cancelled 1:1s send a signal that the engineer is not a priority"
    And confidence is "High"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Engineer Disengaged — pattern of withdrawal across multiple sessions
    Given the engineer's responses have become increasingly brief
    And they have stopped raising issues or suggestions
    And they have not brought an agenda item in > 3 consecutive sessions
    When the engineering coach assesses engagement signals
    Then engagement status is "At Risk"
    And recommendation is "Name the pattern directly — 'I've noticed our conversations have changed. How are you doing, really?'"
    And coaching questions are generated for a direct re-engagement conversation
    And confidence is "Medium"

  @at-risk @regression
  Scenario: Performance Concern Emerging — second consecutive session with delivery gap
    Given the engineer has missed delivery expectations in 2 consecutive sprints
    And this has been discussed in 1:1s but no improvement plan exists
    When the engineering coach assesses performance signals
    Then performance status is "At Risk"
    And recommendation is "Shift from observation to action — create a written growth plan with specific expectations and a timeline"
    And confidence is "High"
    And the engineering manager is notified that a formal plan may be needed

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: 1:1 Cancelled Repeatedly — EM cancelling consistently
    Given the engineering manager has cancelled 2 or more consecutive 1:1s with the same engineer
    And they have not been rescheduled
    When the engineering coach identifies the pattern
    Then cadence status is "Critical"
    And recommendation is "Restore the 1:1 this week — no meeting sends a stronger negative signal than repeated cancellations"
    And confidence is "High"
    And the engineering manager's own manager is flagged if the pattern persists

  @critical @immediate-action @regression
  Scenario: Explicit Resignation Signal — engineer states intent to leave
    Given an engineer has explicitly stated in a 1:1 that they are considering leaving
    Or an engineer has mentioned interviewing elsewhere
    When the engineering coach assesses the situation
    Then retention status is "Critical"
    And recommendation is "Address the root concern in this session — do not defer to 'let me think about it'"
    And the engineering manager is notified immediately after the session
    And a retention plan is initiated within 24 hours
    And confidence is "High"

  # ─── Parametrized Regression ──────────────────────────────────────────────

  @regression
  Scenario Outline: 1:1 quality classification by engagement signals
    Given the engineer has brought <own_agenda_items> agenda items of their own
    And <blockers_raised> blockers or concerns were surfaced
    And career topics were discussed: <career_discussed>
    When the engineering coach assesses 1:1 quality
    Then 1:1 quality is "<quality>"

    Examples:
      | own_agenda_items | blockers_raised | career_discussed | quality     |
      | 2                | 1               | yes              | Productive  |
      | 1                | 0               | yes              | Productive  |
      | 0                | 1               | no               | Degraded    |
      | 0                | 0               | no               | Degraded    |
      | 0                | 0               | yes              | Warning     |
