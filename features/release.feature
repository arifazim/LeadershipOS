Feature: Release Readiness
  As an Engineering Manager
  I want to assess whether a release is safe to proceed
  So that we ship with confidence and respond quickly when releases degrade

  # Executor: subagents/delivery-manager.md → subagents/incident-manager.md (if rollback)
  # Skill:    skills/delivery/assess-release.md (planned — not yet built)
  # Cadence:  Before every production release

  Background:
    Given a release candidate has been prepared
    And CI/CD pipeline results are available
    And the incident log for the last 14 days is available

  # ─── Release Ready ────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Release Ready — all quality gates pass
    Given all CI/CD tests pass on the release candidate
    And no open P1 or P2 incidents are active
    And the change failure rate for the last 4 weeks is < 5%
    And stakeholders have been informed of the release window
    And a rollback plan exists and has been reviewed
    When the delivery manager assesses release readiness
    Then release status is "Ready to Ship"
    And recommendation is "Proceed with release"
    And confidence is "High"

  @healthy @regression
  Scenario: Canary Release Healthy — gradual rollout within error baseline
    Given a canary release has been deployed to < 10% of traffic
    And the error rate for canary traffic is within 20% of the baseline error rate
    And no P1 or P2 signals have been triggered
    And the canary has been running for > 30 minutes
    When the delivery manager assesses canary health
    Then canary status is "Healthy"
    And recommendation is "Proceed to full rollout"
    And confidence is "High"

  # ─── Quality Gate Failures ────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Release Blocked by Failing Tests
    Given one or more CI/CD tests are failing on the release candidate
    And the failing tests are not flaky tests with a known exemption
    When the delivery manager assesses release readiness
    Then release status is "Blocked"
    And recommendation is "Do not ship — fix failing tests before proceeding"
    And confidence is "High"
    And an action item is created for "engineer to investigate failing tests immediately"

  @at-risk @regression
  Scenario: Release Blocked by Unreviewed PRs
    Given the release candidate includes changes from PRs that have not received a required review
    When the delivery manager assesses release readiness
    Then release status is "Blocked"
    And recommendation is "Do not ship — all changes require at least one approving review"
    And confidence is "High"

  # ─── Active Incident Block ─────────────────────────────────────────────────

  @immediate-action @regression
  Scenario: Active P1 or P2 Blocks Release
    Given a P1 or P2 incident is currently active
    And the release was scheduled to proceed
    When the delivery manager assesses release readiness
    Then release status is "Blocked — Active Incident"
    And recommendation is "Do not ship during an active incident — defer release until service is stable"
    And confidence is "High"
    And the release is rescheduled after incident resolution and MTTR confirmation

  # ─── Post-Release Monitoring ──────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Post-Release Degradation Detected — error rate spike within 1 hour
    Given a release was deployed to production
    And within 60 minutes of deployment the error rate has increased by >= 50% above baseline
    When the delivery manager monitors post-release health
    Then post-release status is "Degrading"
    And recommendation is "Assess rollback immediately — do not wait for MTTR to breach"
    And the incident manager is invoked to declare a P2
    And confidence is "High"

  @critical @immediate-action @regression
  Scenario: Rollback Required — error rate exceeds rollback threshold
    Given a release was deployed to production
    And the error rate exceeds 3x the pre-release baseline
    And more than 30 minutes have passed without mitigation progress
    When the delivery manager assesses rollback criteria
    Then release decision is "Rollback Required"
    And recommendation is "Execute rollback to the last stable version immediately"
    And the incident manager takes ownership of the rollback as an incident
    And a post-mortem is scheduled within 5 business days
    And confidence is "High"

  @healthy @regression
  Scenario: Rollback Executed Successfully — service restored
    Given a rollback has been executed
    And service metrics have returned to pre-release baseline
    And no customer data was lost
    When the incident manager confirms service restoration
    Then rollback status is "Successful"
    And recommendation is "Run post-mortem on release failure — identify why the change degraded in production"
    And confidence is "High"
    And the failed release is logged in kaizen/failures.md

  # ─── Schedule Slippage ────────────────────────────────────────────────────

  @warning @regression
  Scenario: Release Behind Schedule — past planned release date
    Given the planned release date has passed
    And the release has not occurred
    And no new release date has been communicated to stakeholders
    When the delivery manager assesses release status
    Then release status is "Delayed"
    And recommendation is "Communicate revised date to stakeholders today — do not wait until asked"
    And the executive summary agent is invoked if stakeholders are director-level or above
    And confidence is "High"

  # ─── Change Failure Rate Trend ────────────────────────────────────────────

  @at-risk @regression
  Scenario: Elevated Change Failure Rate — pattern before a planned release
    Given the change failure rate in the last 4 weeks is > 10%
    And the team is planning a major release in the next 7 days
    When the delivery manager assesses release risk
    Then release risk is "Elevated"
    And recommendation is "Run additional pre-release testing — current CFR indicates releases are causing incidents"
    And confidence is "High"

  # ─── Parametrized Regression ──────────────────────────────────────────────

  @regression
  Scenario Outline: Post-release health classification by error rate increase
    Given a release was deployed
    And the post-release error rate increased by <error_pct>% above baseline
    And <minutes_elapsed> minutes have elapsed since deployment
    When the delivery manager assesses post-release health
    Then post-release status is "<status>"
    And recommended action is "<action>"

    Examples:
      | error_pct | minutes_elapsed | status     | action                                    |
      | 5         | 30              | Healthy    | Continue monitoring                       |
      | 20        | 30              | Monitoring | Watch for 30 more minutes before deciding |
      | 50        | 30              | Degrading  | Assess rollback immediately               |
      | 50        | 60              | Degrading  | Rollback required                         |
      | 200       | 15              | Critical   | Rollback immediately — invoke incident    |
      | 300       | 5               | Critical   | Rollback immediately — invoke incident    |
