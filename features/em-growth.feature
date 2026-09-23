Feature: EM self-coaching (Second Brain)
  As an Engineering Manager
  I want a monthly inward-facing coaching loop that names my default, my weak situation, and one growth edge
  So that the OS develops me, not only the team

  # Executor: subagents/engineering-manager.md
  # Loop:     loops/em-growth-loop.md
  # Skill:    skills/mentoring/em-self-coaching.md
  # Memory:   memory/em-self-development/
  # Cadence:  Monthly (first Friday) or after a significant leadership event

  Background:
    Given the engineering manager is running loops/em-growth-loop.md
    And memory/em-self-development/ is the write target
    And output is private (not a stakeholder artifact)

  @healthy @regression
  Scenario: First monthly loop produces a growth edge
    Given no prior EMG entry exists for this month
    And kaizen/failures.md and config/team.json are available
    When the engineering manager runs commands/em-growth.md
    Then a private self-coaching report is produced
    And one growth edge is stated as "When [trigger], I will [behavior] instead of [default]"
    And an EMG entry is logged
    And confidence is not High if DORA inputs are mock

  @healthy @regression
  Scenario: Prior growth edge is closed the following month
    Given last month's EMG entry named a growth edge
    And this month's loop can observe whether the edge was applied
    When the engineering manager runs the growth loop
    Then Prior edge applied is Yes, Partial, or No
    And Assessment is Graduated, Continue, or Rewrite
    And a new edge is set only if the prior one Graduated or was Rewritten

  @warning @regression
  Scenario: Failure log shows an EM execution fault
    Given kaizen/failures.md contains an entry where EM behavior was an execution fault
    When the growth loop gathers inputs
    Then that failure is cited as evidence for dominant default or situation weakness
    And the month's edge is tied to that pattern

  @warning @regression
  Scenario: Mock metrics must not be treated as live delivery proof
    Given memory/current_metrics.json has _source mock on GitHub Jira and PagerDuty
    When the growth loop uses operational metrics
    Then the EMG record confidence is Medium or Low
    And the report names that DORA inputs were mock

  @at-risk @regression
  Scenario: Loop skipped for more than 45 days
    Given memory/cadence.json next_due for em-growth is more than 15 days in the past
    When scripts/cadence.py runs
    Then it exits non-zero
    And it prints the command ./bin/em-os run em-growth
