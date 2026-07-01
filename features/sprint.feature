Feature: Sprint Health
  As an Engineering Manager
  I want to assess the health of a completed sprint
  So that I can make evidence-based decisions before the retrospective

  # Executor: subagents/delivery-manager.md
  # Skill:    skills/delivery/review-sprint.md
  # Cadence:  End of every sprint

  Background:
    Given the sprint has ended
    And sprint commitment data is available
    And the 4-sprint trailing velocity average is known

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Healthy Sprint — all signals green
    Given velocity is >= 90% of the 4-sprint average
    And blocked work is < 5% of committed story points
    And escaped bugs this sprint is < 2
    And unplanned work is < 10% of committed capacity
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Healthy"
    And recommendation is "Continue current practices"
    And confidence is "High"
    And no immediate actions are required

  @healthy @regression
  Scenario: Sprint Goal Achieved Despite Low Point Completion
    Given the sprint goal is marked "Achieved"
    And story point completion rate is 76%
    And the incomplete stories were agreed deferrals
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Healthy"
    And recommendation is "Refine estimation — story points are not the primary measure"
    And confidence is "High"
    And a retro seed is raised for "improving story sizing"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Degraded Sprint — velocity drop within acceptable range
    Given velocity is between 80% and 89% of the 4-sprint average
    And blocked work is between 5% and 15% of committed story points
    And the sprint goal is marked "Partial"
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Warning"
    And recommendation is "Monitor — investigate blocker root cause before next planning"
    And confidence is "Medium"
    And a retro seed is raised for "what caused the velocity drop"

  @warning @regression
  Scenario: Scope Creep Detected — unplanned work absorbed sprint capacity
    Given velocity is >= 85% of the 4-sprint average
    And unplanned work added mid-sprint is > 20% of original committed capacity
    And the sprint goal is marked "Partial"
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Warning"
    And root cause is "Scope Creep"
    And recommendation is "Formally reserve 20% sprint buffer for unplanned work"
    And confidence is "High"
    And a retro seed is raised for "source of unplanned work — is it recurring?"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: At-Risk Sprint — velocity below threshold
    Given velocity is between 70% and 79% of the 4-sprint average
    And the sprint goal is marked "Missed"
    When the delivery manager runs a sprint health assessment
    Then sprint status is "At Risk"
    And recommendation is "Root cause analysis required before next sprint starts"
    And confidence is "Medium"
    And an action item is created for "identify primary root cause by end of retrospective"

  @at-risk @regression
  Scenario: Blocker Not Escalated — delivery suffered without formal impediment raised
    Given velocity is < 80% of the 4-sprint average
    And no blockers were formally reported in standup or Jira
    And retrospectively a team member identifies a 2-day platform dependency delay
    When the delivery manager runs a sprint health assessment
    Then sprint status is "At Risk"
    And root cause is "Blocker-Driven — not escalated in time"
    And recommendation is "Review standup format — blockers are not being surfaced"
    And confidence is "High"
    And a retro seed is raised for "why wasn't the blocker raised — safety or format?"

  @at-risk @regression
  Scenario: Dependency Failure — external team did not deliver
    Given velocity is < 80% of the 4-sprint average
    And one or more stories were blocked by an external team dependency
    And the dependency was in the sprint plan as assumed
    When the delivery manager runs a sprint health assessment
    Then sprint status is "At Risk"
    And root cause is "Dependency Failure"
    And recommendation is "Escalate to peer EM — add dependency tracking to next planning"
    And confidence is "High"
    And the incident is logged to the dependency register

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Failed Sprint — velocity collapse
    Given velocity is < 70% of the 4-sprint average
    And the sprint goal is marked "Missed"
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Critical"
    And recommendation is "Do not start next sprint planning until root cause is confirmed"
    And confidence is "High"
    And an immediate action is created for "EM to run root cause session with team this week"
    And the engineering manager is notified

  @critical @immediate-action @regression
  Scenario: Sprint Goal Missed Despite High Completion Rate
    Given story point completion rate is >= 90%
    And the sprint goal is marked "Missed"
    When the delivery manager runs a sprint health assessment
    Then sprint status is "Critical"
    And root cause is "Planning Failure — wrong work was prioritized"
    And recommendation is "Revise sprint goal process — goal must be set before story selection"
    And confidence is "High"
    And a retro seed is raised for "how did we ship 90% of points and miss the goal?"

  # ─── Parametrized Threshold Regression ────────────────────────────────────

  @regression
  Scenario Outline: Sprint status by velocity band
    Given velocity is <velocity_pct>% of the 4-sprint average
    And the sprint goal completion matches the velocity pattern
    When the delivery manager runs a sprint health assessment
    Then sprint status is "<status>"
    And confidence is "<confidence>"

    Examples:
      | velocity_pct | status   | confidence |
      | 95           | Healthy  | High       |
      | 90           | Healthy  | High       |
      | 85           | Warning  | Medium     |
      | 80           | Warning  | Medium     |
      | 75           | At Risk  | Medium     |
      | 70           | Critical | High       |
      | 60           | Critical | High       |
