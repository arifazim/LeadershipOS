Feature: Roadmap Health
  As an Engineering Manager
  I want to track roadmap alignment, milestone progress, and scope integrity
  So that stakeholders have accurate expectations and the team works on the right things

  # Executor: subagents/product-partner.md
  # Skill:    skills/product/update-roadmap.md
  # Cadence:  Weekly (milestone check) + Monthly (full reassessment)

  Background:
    Given a roadmap exists with named initiatives and milestones
    And current sprint velocity data is available
    And stakeholder expectations are documented

  # ─── Alignment ────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Roadmap Aligned — milestones on track, stakeholders informed
    Given all milestones due this quarter are on track
    And no initiative has grown > 15% beyond original scope
    And stakeholder updates have been sent within the last 7 days
    And the roadmap was last updated within 14 days
    When the product partner assesses roadmap health
    Then roadmap status is "Healthy"
    And recommendation is "Sustain — run monthly reassessment against business priorities"
    And confidence is "High"

  @warning @regression
  Scenario: Roadmap Stale — not updated in over 4 weeks
    Given the roadmap was last updated > 28 days ago
    And 1 or more sprints have completed since the last update
    When the product partner assesses roadmap health
    Then roadmap status is "Warning"
    And recommendation is "Update roadmap now — stale roadmaps mislead stakeholders"
    And confidence is "High"
    And an action item is created for "roadmap refresh within 3 business days"

  # ─── Milestone Risk ───────────────────────────────────────────────────────

  @warning @regression
  Scenario: Milestone Approaching At Risk — work incomplete with 4 weeks remaining
    Given a milestone is due within 4 weeks
    And more than 20% of the milestone's work remains incomplete
    And current sprint velocity does not support full completion by the milestone date
    When the product partner assesses milestone health
    Then milestone status is "At Risk"
    And recommendation is "Choose: reduce scope to hit the date, or push the date with stakeholder alignment"
    And confidence is "Medium"
    And an immediate action is created for "scope negotiation conversation with stakeholder this week"

  @critical @immediate-action @regression
  Scenario: Milestone Missed — past target date with work incomplete
    Given a milestone target date has passed
    And the milestone's deliverables are not complete
    And no stakeholder was proactively informed of the delay
    When the product partner assesses milestone health
    Then milestone status is "Critical"
    And recommendation is "Send stakeholder update immediately — do not wait until asked"
    And confidence is "High"
    And the executive summary agent is invoked for stakeholder communication
    And a root cause is identified for the missed milestone

  @at-risk @regression
  Scenario: Milestone Missed But Stakeholder Informed — managed miss
    Given a milestone target date has passed
    And the milestone's deliverables are not complete
    And the stakeholder was informed of the delay proactively with a revised date
    When the product partner assesses milestone health
    Then milestone status is "Managed Miss"
    And recommendation is "Confirm revised date is achievable — do not set a second missed date"
    And confidence is "Medium"

  # ─── Scope Integrity ──────────────────────────────────────────────────────

  @warning @regression
  Scenario: Scope Inflation Detected — initiative grown beyond original estimate
    Given an initiative's estimated effort has grown > 30% since it was added to the roadmap
    And the milestone date has not been adjusted
    When the product partner assesses scope integrity
    Then scope status is "Warning"
    And recommendation is "Renegotiate: adjust timeline, reduce scope, or add capacity — do not silently absorb"
    And confidence is "High"
    And a scope negotiation session is scheduled with the stakeholder

  @critical @regression
  Scenario: Chronic Scope Inflation — multiple initiatives growing without timeline adjustment
    Given 2 or more initiatives have grown > 30% since planning
    And milestone dates have not been adjusted for any of them
    And stakeholders have not been informed
    When the product partner assesses scope integrity
    Then scope status is "Critical"
    And recommendation is "Full roadmap reset required — current commitments are fictional"
    And confidence is "High"
    And the engineering manager is notified to facilitate a stakeholder reset conversation

  # ─── Priority Conflicts ───────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Priority Conflict — two stakeholders requesting incompatible priorities
    Given stakeholder A has declared initiative X as their top priority
    And stakeholder B has declared initiative Y as their top priority
    And engineering capacity cannot support both in the current quarter
    When the product partner assesses the prioritization conflict
    Then prioritization status is "Contested"
    And recommendation is "Escalate to engineering manager — this requires authority above the product partner to resolve"
    And confidence is "High"
    And the engineering manager facilitates a joint prioritization session

  # ─── Capacity Constraints ─────────────────────────────────────────────────

  @warning @regression
  Scenario: Technical Debt Crowding Feature Work
    Given > 30% of sprint capacity is consumed by technical debt and reliability work
    And this pattern has persisted for 2 or more consecutive sprints
    And feature roadmap milestones are slipping as a result
    When the product partner assesses capacity allocation
    Then capacity status is "Warning"
    And recommendation is "Make the debt investment visible to stakeholders — propose a formal debt sprint or dedicated capacity"
    And confidence is "High"

  # ─── Parametrized Regression ──────────────────────────────────────────────

  @regression
  Scenario Outline: Milestone status by completion percentage and time remaining
    Given <pct_complete>% of milestone work is complete
    And the milestone is due in <weeks_remaining> weeks
    When the product partner assesses milestone health
    Then milestone status is "<status>"

    Examples:
      | pct_complete | weeks_remaining | status         |
      | 90           | 4               | Healthy        |
      | 70           | 4               | Healthy        |
      | 60           | 4               | Warning        |
      | 40           | 4               | At Risk        |
      | 20           | 4               | Critical       |
      | 50           | 8               | Healthy        |
      | 30           | 8               | Warning        |
      | 10           | 8               | At Risk        |
