Feature: Delivery Health
  As an Engineering Manager
  I want to assess team delivery performance using DORA metrics
  So that I can identify systemic improvements and accurately report to stakeholders

  # Executor: subagents/delivery-manager.md
  # Skill:    skills/delivery/review-quarter.md (planned — not yet built; skills/delivery/review-sprint.md is the per-sprint equivalent)
  # Cadence:  Weekly (DORA snapshot) + Quarterly (full review)
  # Reference: Forsgren, Humble & Kim — Accelerate (2018)

  Background:
    Given DORA metric data is available for the trailing 4 weeks
    And a baseline from the prior quarter exists for comparison

  # ─── DORA Performance Bands ───────────────────────────────────────────────

  @elite @healthy @regression
  Scenario: Elite Performer — all four DORA metrics in top band
    Given deployment frequency is multiple times per day
    And lead time for changes is < 1 hour
    And change failure rate is < 5%
    And mean time to recovery is < 1 hour
    When the delivery manager assesses DORA performance
    Then delivery band is "Elite"
    And delivery status is "Healthy"
    And recommendation is "Sustain — protect practices that enable this performance"
    And confidence is "High"

  @healthy @regression
  Scenario: High Performer — consistent daily delivery with fast recovery
    Given deployment frequency is at least once per day
    And lead time for changes is between 1 hour and 1 day
    And change failure rate is < 5%
    And mean time to recovery is < 1 day
    When the delivery manager assesses DORA performance
    Then delivery band is "High"
    And delivery status is "Healthy"
    And recommendation is "Identify the single bottleneck preventing Elite performance"
    And confidence is "High"

  @warning @regression
  Scenario: Medium Performer — weekly delivery cycle, recoverable failures
    Given deployment frequency is between once per week and once per month
    And lead time for changes is between 1 week and 1 month
    And change failure rate is <= 15%
    And mean time to recovery is < 1 day
    When the delivery manager assesses DORA performance
    Then delivery band is "Medium"
    And delivery status is "Warning"
    And recommendation is "Focus on reducing batch size — deploy more frequently in smaller increments"
    And confidence is "High"

  @critical @regression
  Scenario: Low Performer — infrequent deployment, high failure rate
    Given deployment frequency is less than once per month
    And lead time for changes is > 1 month
    And change failure rate is > 15%
    And mean time to recovery is > 1 day
    When the delivery manager assesses DORA performance
    Then delivery band is "Low"
    And delivery status is "Critical"
    And recommendation is "Structural intervention required — assess CI/CD pipeline and release process"
    And confidence is "High"
    And the engineering manager is escalated to immediately

  # ─── Individual Metric Failures ───────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Deployment Frozen — no production releases in a sprint
    Given no deployments have reached production in 14 days
    And the team has code ready to ship
    When the delivery manager assesses DORA performance
    Then delivery status is "Critical"
    And root cause category is "Deployment Blocker"
    And recommendation is "Identify and remove the deployment blocker before next sprint"
    And confidence is "High"
    And an immediate action is created for "EM to unblock release pipeline today"

  @critical @regression
  Scenario: Change Failure Rate Spiking — releases are causing incidents
    Given change failure rate is > 15% in the trailing 2 weeks
    And at least 2 deployments have caused P1 or P2 incidents
    When the delivery manager assesses DORA performance
    Then delivery status is "Critical"
    And root cause category is "Quality Gate Failure"
    And recommendation is "Pause feature releases — fix CI/CD quality gates and add rollback automation"
    And confidence is "High"
    And the incident manager is notified of the pattern

  @at-risk @regression
  Scenario: PR Cycle Time Degrading — reviews creating delivery drag
    Given P50 PR cycle time is > 2 business days
    And PR cycle time has increased for 2 consecutive weeks
    And deployment frequency has not changed
    When the delivery manager assesses DORA performance
    Then delivery status is "At Risk"
    And root cause category is "Review Bottleneck"
    And recommendation is "Audit PR review load — identify who is the bottleneck and redistribute"
    And confidence is "Medium"

  @at-risk @regression
  Scenario: Lead Time Increasing — changes taking longer to reach production
    Given lead time for changes has increased > 50% compared to prior quarter
    And deployment frequency is unchanged
    When the delivery manager assesses DORA performance
    Then delivery status is "At Risk"
    And recommendation is "Investigate build pipeline — look for new manual steps or approvals added"
    And confidence is "Medium"

  # ─── Parametrized DORA Band Regression ───────────────────────────────────

  @regression
  Scenario Outline: DORA band classification by deployment frequency
    Given deployment frequency is <frequency>
    And change failure rate is within band norms
    And MTTR is within band norms
    When the delivery manager classifies the DORA band
    Then delivery band is "<band>"
    And delivery status is "<status>"

    Examples:
      | frequency              | band   | status   |
      | multiple times per day | Elite  | Healthy  |
      | once per day           | High   | Healthy  |
      | once per week          | Medium | Warning  |
      | once per month         | Low    | Critical |
      | less than once monthly | Low    | Critical |
