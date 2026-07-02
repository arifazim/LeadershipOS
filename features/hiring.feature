Feature: Hiring Pipeline Health
  As an Engineering Manager
  I want to monitor the health of open requisitions from sourcing through ramp-up
  So that I can hire effectively without losing strong candidates to a slow process

  # Executor: subagents/engineering-manager.md
  # Skill:    skills/people/assess-hiring-pipeline.md (planned — not yet built)
  # Cadence:  Weekly (open reqs) + Per event (offer, start, 30-day check)

  Background:
    Given at least one engineering requisition is open
    And ATS or hiring tracker data is available

  # ─── Pipeline Health ──────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Pipeline Healthy — candidates advancing at pace
    Given the requisition has been open for < 60 days
    And at least 3 candidates are actively progressing through the interview loop
    And no candidate has been waiting > 5 business days for a next step
    When the engineering manager assesses the hiring pipeline
    Then pipeline status is "Healthy"
    And recommendation is "Maintain pace — ensure offer speed matches assessment quality"
    And confidence is "High"

  @warning @regression
  Scenario: Pipeline Stalled — no new candidates advancing
    Given the requisition has been open for > 30 days
    And no new candidates have entered the interview loop in the last 14 days
    And the current slate of active candidates is < 2
    When the engineering manager assesses the hiring pipeline
    Then pipeline status is "Warning"
    And recommendation is "Expand sourcing immediately — review job description and sourcing channels"
    And confidence is "High"
    And an action item is created for "sourcing review within 5 business days"

  @at-risk @regression
  Scenario: Time-to-Fill Breached — requisition open beyond threshold
    Given the requisition has been open for > 90 days
    And no offer has been extended
    When the engineering manager assesses the hiring pipeline
    Then pipeline status is "At Risk"
    And recommendation is "Escalate — assess whether role definition, compensation, or process is the blocker"
    And confidence is "Medium"
    And the engineering manager notifies their manager of the delay

  # ─── Offer Events ─────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Offer Declined — strong candidate chose elsewhere
    Given an offer was extended to a candidate
    And the candidate has declined the offer
    When the engineering manager conducts an offer debrief
    Then pipeline status is "Warning"
    And the engineering manager identifies the decline reason (compensation / process speed / competing offer / role fit)
    And if reason is "process speed" then recommendation is "Reduce time-from-screen-to-offer to < 10 business days"
    And if reason is "compensation" then recommendation is "Review comp bands with leadership before next offer"
    And confidence is "Medium"

  @at-risk @regression
  Scenario: Multiple Offer Declines — pattern of candidates choosing elsewhere
    Given 2 or more offers have been declined in the last 90 days
    And decline reasons include process speed or compensation in > 1 case
    When the engineering manager assesses the offer pattern
    Then pipeline status is "At Risk"
    And recommendation is "Hiring process review required — speed and comp must be investigated"
    And confidence is "High"
    And the engineering manager escalates comp review to their manager

  # ─── Process Speed ────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Interview Loop Too Slow — candidates waiting between stages
    Given the median time from first screen to offer is > 14 business days
    And at least one candidate has been in the loop for > 21 days
    When the engineering manager assesses interview loop speed
    Then process status is "At Risk"
    And recommendation is "Consolidate interview stages — target < 10 business days screen-to-offer"
    And confidence is "High"

  # ─── Onboarding Health ────────────────────────────────────────────────────

  @warning @regression
  Scenario: Onboarding Delayed — new hire has not shipped in 30 days
    Given a new engineer started > 30 days ago
    And they have not made a production contribution or completed a defined onboarding milestone
    When the engineering manager assesses new hire progress
    Then onboarding status is "Warning"
    And recommendation is "Review onboarding plan with the engineer — identify and remove blocker"
    And confidence is "Medium"

  @healthy @regression
  Scenario: Onboarding On Track — new hire shipping within 30 days
    Given a new engineer started <= 30 days ago
    And they have merged at least one change to the main branch
    And their 30-day onboarding milestones are on track
    When the engineering manager assesses new hire progress
    Then onboarding status is "Healthy"
    And recommendation is "Proceed to 60-day milestone check"
    And confidence is "High"

  # ─── Capacity Risk ────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Multiple Departures — team losing engineers faster than hiring
    Given 2 or more engineers have left the team in the last 90 days
    And open requisitions do not cover the capacity gap
    When the engineering manager assesses team capacity
    Then capacity status is "Critical"
    And recommendation is "Escalate headcount urgently — delivery commitments are at risk"
    And the engineering manager notifies stakeholders of timeline impact
    And confidence is "High"
    And an immediate action is created for "capacity impact conversation with manager this week"

  # ─── Parametrized Regression ──────────────────────────────────────────────

  @regression
  Scenario Outline: Pipeline status by days open and active candidates
    Given the requisition has been open for <days_open> days
    And there are <active_candidates> candidates in the active loop
    When the engineering manager assesses the pipeline
    Then pipeline status is "<status>"

    Examples:
      | days_open | active_candidates | status   |
      | 30        | 4                 | Healthy  |
      | 45        | 2                 | Healthy  |
      | 60        | 1                 | Warning  |
      | 75        | 0                 | At Risk  |
      | 90        | 0                 | At Risk  |
      | 100       | 1                 | Critical |
