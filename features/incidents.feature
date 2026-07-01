Feature: Incident Response
  As an Engineering Manager
  I want to manage incidents with consistent process and clear escalation
  So that customer impact is minimized and every failure produces a system improvement

  # Executor: subagents/incident-manager.md
  # Skill:    skills/operations/postmortem.md
  # Cadence:  On-demand (incident) + Weekly (on-call health)
  # Priority: P1/P2 incidents pre-empt all other agent activity

  Background:
    Given PagerDuty and Datadog are connected
    And an incident response Slack channel exists

  # ─── Active Incident Declaration ──────────────────────────────────────────

  @immediate-action @regression
  Scenario: P1 Declared — complete customer-facing outage
    Given a customer-facing service is completely unavailable
    And more than 0% of users are unable to complete their primary workflow
    When a P1 incident is declared
    Then an Incident Commander is assigned within 5 minutes
    And a dedicated Slack thread is opened immediately
    And a stakeholder update is sent within 30 minutes
    And the engineering manager is paged
    And the executive summary agent is invoked for stakeholder communication
    And root cause investigation is deferred until service is restored

  @immediate-action @regression
  Scenario: P2 Declared — significant partial degradation
    Given a customer-facing service is degraded
    And more than 10% of users are experiencing failures or significant slowness
    When a P2 incident is declared
    Then an Incident Commander is assigned within 15 minutes
    And a dedicated Slack thread is opened
    And a stakeholder update is sent within 60 minutes
    And the engineering manager is notified (not paged)
    And root cause investigation is deferred until service is restored

  @regression
  Scenario: Severity Escalation — P2 becomes P1
    Given a P2 incident is active
    And the impact scope expands to affect > 50% of users
    When the Incident Commander re-assesses severity
    Then severity is escalated to P1
    And a new stakeholder update is sent within 15 minutes of escalation
    And the engineering manager is paged immediately

  # ─── MTTR Thresholds ──────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: MTTR Breached — P1 unresolved beyond threshold
    Given a P1 incident has been active for > 4 hours
    And service has not been restored
    When the incident manager assesses MTTR status
    Then MTTR status is "Breached"
    And the engineering manager escalates to their manager immediately
    And a war-room is convened with all available senior engineers
    And stakeholder updates shift to every 15 minutes
    And confidence in ETA is "Speculative" until a new mitigation path is identified

  @at-risk @regression
  Scenario: MTTR Approaching Threshold — P1 active 2–3 hours
    Given a P1 incident has been active for between 2 and 4 hours
    And current mitigation path has not yet restored service
    When the incident manager assesses MTTR status
    Then MTTR status is "At Risk"
    And the engineering manager is notified to stand by for escalation
    And the incident commander is asked for a confidence level on the current approach

  @at-risk @regression
  Scenario: MTTR Breached — P2 unresolved after 8 hours
    Given a P2 incident has been active for > 8 hours
    And service has not been restored
    When the incident manager assesses MTTR status
    Then MTTR status is "Breached"
    And the engineering manager evaluates whether to escalate to P1
    And a customer-facing status page update is issued

  # ─── Post-Mortem Lifecycle ────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Post-Mortem Overdue — P1 exceeds 5 business days without completion
    Given a P1 incident was resolved > 5 business days ago
    And no post-mortem document has been completed
    When the incident manager audits post-mortem status
    Then post-mortem status is "Overdue"
    And the engineering manager is notified
    And a post-mortem session is scheduled within the next 2 business days
    And the action is logged in kaizen/failures.md

  @regression
  Scenario: Blameless Post-Mortem Completed — systemic action items produced
    Given a P1 or P2 incident has been resolved
    And the post-mortem has been completed within 5 business days
    And all action items name a system or process as the root cause (not an individual)
    And each action item has a named owner and a due date
    When the incident manager reviews the post-mortem
    Then post-mortem quality is "Acceptable"
    And action items are added to the team backlog
    And the incident is logged in kaizen/failures.md with the "What we learned" field completed

  @critical @regression
  Scenario: Individual Blamed in Post-Mortem — blameless standard violated
    Given a post-mortem document exists for a resolved incident
    And one or more action items name an individual as the root cause
    When the incident manager reviews the post-mortem
    Then post-mortem quality is "Rejected"
    And recommendation is "Rewrite root cause as a system condition, not a person"
    And the engineering manager facilitates a re-run of the root cause analysis

  # ─── Recurring Incident Pattern ───────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Repeated P1 — same root cause twice in 30 days
    Given a P1 has occurred
    And a prior P1 with the same root cause occurred within the last 30 days
    And the action items from the first post-mortem are not yet completed
    When the incident manager identifies the recurrence
    Then pattern status is "Critical — Recurring Failure"
    And recommendation is "Halt feature work — address reliability root cause this sprint"
    And the engineering manager escalates to senior leadership
    And confidence is "High"
    And the recurrence is logged in kaizen/failures.md as a systemic signal

  # ─── On-Call Health ───────────────────────────────────────────────────────

  @warning @regression
  Scenario: Alert Noise Above Threshold — more noise than signal
    Given more than 5 alerts per week do not require human action
    And the actionable-to-noise ratio is < 50%
    When the incident manager runs a weekly on-call health assessment
    Then on-call health is "Warning"
    And recommendation is "Alert audit required — tune or suppress noisy alerts within 2 sprints"
    And confidence is "High"

  @critical @regression
  Scenario: On-Call Burden Unsustainable — off-hours pages exceeding safe threshold
    Given more than 3 pages per week require engineer action outside business hours
    And this pattern has persisted for > 2 consecutive weeks
    When the incident manager runs a weekly on-call health assessment
    Then on-call health is "Critical"
    And recommendation is "Reliability investment required — propose a debt sprint immediately"
    And the engineering coach is notified to assess burnout risk
    And confidence is "High"

  # ─── Parametrized MTTR Regression ────────────────────────────────────────

  @regression
  Scenario Outline: MTTR health classification by severity and duration
    Given a <severity> incident has been active for <duration>
    When the incident manager assesses MTTR status
    Then MTTR status is "<mttr_status>"
    And escalation action is "<escalation>"

    Examples:
      | severity | duration  | mttr_status | escalation                      |
      | P1       | 1 hour    | On Track    | None — continue current path    |
      | P1       | 2 hours   | At Risk     | Notify EM to stand by           |
      | P1       | 4 hours   | Breached    | Escalate to EM's manager        |
      | P2       | 2 hours   | On Track    | None                            |
      | P2       | 4 hours   | At Risk     | Notify EM                       |
      | P2       | 8 hours   | Breached    | Re-evaluate severity — may be P1|
