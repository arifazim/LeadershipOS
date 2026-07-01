Feature: Confidence Engine Assessment
  As an Engineering Manager
  I want to assess my team's confidence across 6 dimensions
  So that I can answer the executive question: "Can I trust this team?"

  # Executor: subagents/engineering-manager.md
  # Skill:    confidence-engine/executive_confidence.md
  # Cadence:  Monthly or quarterly

  Background:
    Given the confidence assessment period has ended
    And dimension score data is available
    And evidence from GitHub, Jira, Incidents, and Customer Bugs is collected

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Healthy Confidence — all 6 dimensions green
    Given prediction_confidence is 88
    And data_quality is 92
    And risk_confidence is 85
    And delivery_confidence is 90
    And roadmap_confidence is 87
    And architecture_confidence is 91
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "Healthy"
    And recommendation is "Leadership can rely on this team's commitments and data"
    And confidence is "High"

  @healthy @regression
  Scenario: Strong Delivery with Developing Roadmap Clarity
    Given prediction_confidence is 85
    And data_quality is 90
    And risk_confidence is 88
    And delivery_confidence is 92
    And roadmap_confidence is 72
    And architecture_confidence is 90
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "Healthy"
    And recommendation is "Continue current practices; improve roadmap scope definition process"
    And confidence is "High"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Warning Confidence — data quality lag impacting reliability
    Given prediction_confidence is 75
    And data_quality is 68
    And risk_confidence is 78
    And delivery_confidence is 72
    And roadmap_confidence is 75
    And architecture_confidence is 70
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "Warning"
    And recommendation is "Investigate data pipeline reliability before next executive cycle"
    And confidence is "Medium"

  @warning @regression
  Scenario: Warning Confidence — roadmap scope drift and delivery variance
    Given prediction_confidence is 80
    And data_quality is 85
    And risk_confidence is 75
    And delivery_confidence is 65
    And roadmap_confidence is 62
    And architecture_confidence is 78
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "Warning"
    And root cause is "Roadmap Scope Drift and Delivery Reliability Gap"
    And recommendation is "Implement roadmap change control and delivery risk register"
    And confidence is "Medium"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: At-Risk Confidence — architecture instability and risk blindness
    Given prediction_confidence is 62
    And data_quality is 58
    And risk_confidence is 55
    And delivery_confidence is 65
    And roadmap_confidence is 58
    And architecture_confidence is 48
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "At Risk"
    And recommendation is "Root cause analysis required — technical stability and risk management concerns"
    And confidence is "Medium"

  @at-risk @regression
  Scenario: At-Risk Confidence — delivery failure cascade with data gaps
    Given prediction_confidence is 58
    And data_quality is 45
    And risk_confidence is 60
    And delivery_confidence is 42
    And roadmap_confidence is 52
    And architecture_confidence is 45
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "At Risk"
    And root cause is "Delivery Reliability Collapse and Data Integrity Failure"
    And recommendation is "Pause roadmap commitments and stabilize delivery pipeline"
    And confidence is "High"

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Critical Confidence — systemic failure across multiple dimensions
    Given prediction_confidence is 35
    And data_quality is 30
    And risk_confidence is 40
    And delivery_confidence is 38
    And roadmap_confidence is 28
    And architecture_confidence is 32
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "Critical"
    And recommendation is "Immediate intervention required — trust breakdown across all dimensions"
    And confidence is "High"

  # ─── Parametrized Threshold Regression ────────────────────────────────────

  @regression
  Scenario Outline: Confidence status by dimension score band
    Given all 6 dimensions have scores within the "<score_range>" band
    When the engineering manager runs a confidence engine assessment
    Then confidence status is "<status>"
    And confidence is "<confidence>"

    Examples:
      | score_range | status   | confidence |
      | 90-100      | Healthy  | High       |
      | 80-89       | Healthy  | High       |
      | 70-79       | Warning  | Medium     |
      | 60-69       | At Risk  | Medium     |
      | 0-59        | Critical | High       |