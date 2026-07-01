# Feature: Political Signals Assessment
  As an Engineering Manager
  I want to detect organizational risk patterns and respond ethically
  So that I can protect the team and organization without manipulation

  # Executor: subagents/engineering-manager.md
  # Skill:    political-signals/political-signals.md
  # Cadence:  Monthly, quarterly, or on-demand

  Background:
    Given the organizational assessment period has begun
    And signal observation data is available
    And team feedback and meeting records are collected

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Healthy Organization — no significant political signals
    Given decision_reversals score is 20
    And meeting_exclusion score is 15
    And ownership_ambiguity score is 18
    And escalation_patterns score is 22
    And incentive_misalignment score is 25
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "Healthy"
    And recommendation is "Continue transparent practices; monitor for drift"
    And confidence is "High"
    And no cross-dimensional patterns are detected

  @healthy @regression
  Scenario: Low-Risk with One Minor Signal
    Given decision_reversals score is 25
    And meeting_exclusion score is 42
    And ownership_ambiguity score is 20
    And escalation_patterns score is 18
    And incentive_misalignment score is 22
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "Healthy"
    And the primary signal is "meeting_exclusion"
    And recommendation is "Review meeting inclusion rationale with stakeholders"
    And confidence is "High"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Warning — ownership ambiguity emerging
    Given decision_reversals score is 35
    And meeting_exclusion score is 28
    And ownership_ambiguity score is 55
    And escalation_patterns score is 30
    And incentive_misalignment score is 32
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "Warning"
    And the primary signal is "ownership_ambiguity"
    And recommendation is "Publish RACI update and clarify decision rights"
    And confidence is "Medium"
    And one ethical response is recommended

  @warning @regression
  Scenario: Warning — incentive misalignment emerging
    Given decision_reversals score is 30
    And meeting_exclusion score is 25
    And ownership_ambiguity score is 28
    And escalation_patterns score is 35
    And incentive_misalignment score is 58
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "Warning"
    And the primary signal is "incentive_misalignment"
    And recommendation is "Align recognition and promotion criteria with team outcomes"
    And confidence is "Medium"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: At-Risk — decision reversals pattern detected
    Given decision_reversals score is 68
    And meeting_exclusion score is 30
    And ownership_ambiguity score is 45
    And escalation_patterns score is 38
    And incentive_misalignment score is 35
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "At Risk"
    And cross-dimensional pattern "accountability_shield" is detected
    And recommendation is "Publish decision log and require rationale for reversals"
    And confidence is "High"
    And an ethical response protocol is triggered

  @at-risk @regression
  Scenario: At-Risk — escalation bypass pattern
    Given decision_reversals score is 40
    And meeting_exclusion score is 55
    And ownership_ambiguity score is 60
    And escalation_patterns score is 72
    And incentive_misalignment score is 48
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "At Risk"
    And cross-dimensional pattern "power_vacuum" is detected
    And recommendation is "Clarify escalation paths and require prior conversation before executive escalation"
    And confidence is "High"

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Critical — targeted erasure pattern
    Given decision_reversals score is 80
    And meeting_exclusion score is 75
    And ownership_ambiguity score is 70
    And escalation_patterns score is 65
    And incentive_misalignment score is 60
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "Red"
    And cross-dimensional pattern "targeted_erasure" is detected
    And recommendation is "Escalate to HR and skip-level; document all instances; protect affected team members"
    And confidence is "High"
    And an immediate action is created

  # ─── Parametrized Threshold Regression ────────────────────────────────────

  @regression
  Scenario Outline: Risk status by decision reversals band
    Given decision_reversals score is <reversals_score>
    And all other signals are <= 40
    When the engineering manager runs a political signals assessment
    Then organizational risk status is "<status>"
    And confidence is "<confidence>"

    Examples:
      | reversals_score | status   | confidence |
      | 15              | Healthy  | High       |
      | 35              | Warning  | Medium     |
      | 55              | At Risk  | High       |
      | 75              | Critical | High       |
