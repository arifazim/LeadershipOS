Feature: Architecture Decision Health
  As an Engineering Manager
  I want to ensure significant technical decisions are made explicitly and recorded
  So that the team's architecture is traceable, intentional, and low-risk

  # Executor: subagents/tech-lead.md → subagents/architecture-reviewer.md
  # Skill:    skills/architecture/assess-decision.md
  # Cadence:  On-demand (decision events) + Quarterly (risk audit)

  Background:
    Given a system exists with at least one production service
    And an architectural decision register exists or can be created

  # ─── Decision Record Requirements ─────────────────────────────────────────

  @immediate-action @regression
  Scenario: Significant Decision Proceeding Without an ADR
    Given an engineer or team is implementing a change that is hard to reverse
    And the change affects more than one service or team
    And no Architectural Decision Record exists for this choice
    When the architecture reviewer identifies the undocumented decision
    Then decision status is "Blocked"
    And recommendation is "Pause implementation — create an ADR before proceeding"
    And confidence is "High"
    And the tech lead is notified to facilitate the ADR process

  @healthy @regression
  Scenario: ADR Completed — decision documented with options and rationale
    Given a significant decision has been made
    And an ADR exists with at least 2 options considered
    And the ADR includes context, rationale, and accepted consequences
    And the ADR is marked "Accepted"
    When the architecture reviewer assesses the decision record
    Then ADR quality is "Acceptable"
    And recommendation is "Proceed with implementation"
    And confidence is "High"

  @at-risk @regression
  Scenario: ADR Incomplete — single option presented
    Given an ADR has been created for a significant decision
    And only one option is documented
    And no alternatives were considered
    When the architecture reviewer assesses the decision record
    Then ADR quality is "Incomplete"
    And recommendation is "Return to author — document at least one alternative with trade-offs before accepting"
    And confidence is "High"

  # ─── Architecture Review Outcomes ─────────────────────────────────────────

  @healthy @regression
  Scenario: Architecture Review Passed — low risk, reversible decision
    Given an architecture review has been requested
    And the proposed change is reversible within 1 sprint
    And the change affects only one team's services
    And risk surface is Low across all four dimensions (scalability, operational, knowledge, dependency)
    When the architecture reviewer completes the review
    Then review outcome is "Approved"
    And recommendation is "Proceed — low risk, easy to revisit"
    And confidence is "High"

  @at-risk @regression
  Scenario: Architecture Review Returned — high irreversibility requires more analysis
    Given an architecture review has been requested
    And the proposed change is irreversible or very expensive to reverse
    And only one option has been presented
    When the architecture reviewer completes the review
    Then review outcome is "Returned for Revision"
    And recommendation is "Provide at least one alternative option with full trade-off analysis before re-review"
    And confidence is "High"

  @critical @regression
  Scenario: Architecture Review Blocked — critical risk identified with no mitigation
    Given an architecture review has been requested
    And the proposed change introduces a critical scalability or dependency risk
    And no mitigation plan for the risk exists
    When the architecture reviewer completes the review
    Then review outcome is "Blocked"
    And recommendation is "Do not proceed — risk must be mitigated or explicitly accepted by engineering manager"
    And the engineering manager is notified to make an explicit risk acceptance decision
    And confidence is "High"

  # ─── Knowledge and Dependency Risk ────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Bus Factor Critical — one engineer owns a production system
    Given a production system exists that is understood by only 1 engineer
    And that engineer is not on a knowledge-sharing or documentation plan
    When the architecture reviewer audits knowledge distribution
    Then knowledge risk is "Critical"
    And recommendation is "Immediately assign a second engineer to pair and document this system"
    And an action item is created with a 30-day deadline for knowledge transfer
    And confidence is "High"

  @warning @regression
  Scenario: Bus Factor Elevated — critical system understood by only 2 engineers
    Given a production system is understood by only 2 engineers
    And both engineers are on the same team
    When the architecture reviewer audits knowledge distribution
    Then knowledge risk is "Warning"
    And recommendation is "Create runbooks and schedule a knowledge-sharing session within 4 weeks"
    And confidence is "High"

  @at-risk @regression
  Scenario: External Dependency Single Point of Failure
    Given the system has a critical dependency on an external service or API
    And there is no fallback or circuit-breaker if the dependency fails
    And the external service has had > 1 outage in the last 90 days
    When the architecture reviewer audits dependency risk
    Then dependency risk is "At Risk"
    And recommendation is "Implement circuit breaker or fallback within the next sprint — this is a reliability debt item"
    And confidence is "High"

  # ─── Pattern Consistency ──────────────────────────────────────────────────

  @warning @regression
  Scenario: New Pattern Inconsistent With Established Architecture
    Given a proposed change introduces a new architectural pattern
    And an existing pattern already solves the same class of problem
    And no rationale exists for introducing a second pattern
    When the architecture reviewer assesses consistency
    Then consistency status is "Warning"
    And recommendation is "Justify the new pattern or adopt the existing one — two patterns for the same problem increase cognitive load"
    And confidence is "Medium"

  @healthy @regression
  Scenario: ADR Superseded — prior decision updated with reasoning
    Given a prior ADR exists that was previously Accepted
    And new information has made the original decision suboptimal
    And a new ADR exists that references the prior one and explains the change
    And the prior ADR is marked "Superseded"
    When the architecture reviewer assesses the decision update
    Then ADR quality is "Acceptable"
    And recommendation is "Proceed — decision history is intact and traceable"
    And confidence is "High"
