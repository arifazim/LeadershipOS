Feature: Leadership Health Assessment
  As an Engineering Manager
  I want to assess my leadership capability across 13 dimensions
  So that I can identify risk areas and prioritize development actions

  # Executor: subagents/engineering-manager.md
  # Skill:    skills/leadership/master-leadership-health.md
  # Cadence:  Monthly or quarterly

  Background:
    Given the leadership assessment period has ended
    And dimension score data is available
    And team feedback and 360 inputs are collected

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Healthy Leadership — all 13 dimensions green
    Given executive_trust_score is 85
    And stakeholder_alignment is 88
    And organizational_clarity is 90
    And communication_effectiveness is 87
    And delegation_score is 82
    And coaching_score is 91
    And decision_quality is 86
    And ownership_index is 89
    And team_autonomy is 84
    And influence_score is 83
    And political_awareness is 80
    And meeting_quality is 85
    And execution_clarity is 90
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Healthy"
    And recommendation is "Continue current practices and explore growth opportunities"
    And confidence is "High"

  @healthy @regression
  Scenario: Strong Core with One Developing Dimension
    Given executive_trust_score is 88
    And stakeholder_alignment is 92
    And organizational_clarity is 85
    And communication_effectiveness is 80
    And delegation_score is 87
    And coaching_score is 90
    And decision_quality is 84
    And ownership_index is 88
    And team_autonomy is 82
    And influence_score is 78
    And political_awareness is 85
    And meeting_quality is 86
    And execution_clarity is 88
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Healthy"
    And recommendation is "Continue investing in influence building with peer leaders"
    And confidence is "High"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Warning Leadership — influence gaps emerging
    Given executive_trust_score is 78
    And stakeholder_alignment is 75
    And organizational_clarity is 80
    And communication_effectiveness is 72
    And delegation_score is 76
    And coaching_score is 78
    And decision_quality is 74
    And ownership_index is 75
    And team_autonomy is 70
    And influence_score is 65
    And political_awareness is 70
    And meeting_quality is 72
    And execution_clarity is 75
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Warning"
    And recommendation is "Investigate root cause before next 1:1 cycle"
    And confidence is "Medium"

  @warning @regression
  Scenario: Warning Leadership — political awareness blind spots
    Given executive_trust_score is 82
    And stakeholder_alignment is 78
    And organizational_clarity is 80
    And communication_effectiveness is 85
    And delegation_score is 75
    And coaching_score is 80
    And decision_quality is 77
    And ownership_index is 82
    And team_autonomy is 78
    And influence_score is 72
    And political_awareness is 55
    And meeting_quality is 79
    And execution_clarity is 83
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Warning"
    And root cause is "Political Awareness Gap"
    And recommendation is "Seek mentorship on organizational dynamics and stakeholder navigation"
    And confidence is "Medium"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: At-Risk Leadership — delegation and autonomy concerns
    Given executive_trust_score is 68
    And stakeholder_alignment is 70
    And organizational_clarity is 72
    And communication_effectiveness is 65
    And delegation_score is 55
    And coaching_score is 68
    And decision_quality is 62
    And ownership_index is 65
    And team_autonomy is 58
    And influence_score is 60
    And political_awareness is 62
    And meeting_quality is 68
    And execution_clarity is 70
    When the engineering manager runs a leadership health assessment
    Then leadership status is "At Risk"
    And recommendation is "Root cause analysis required — team capability not developing"
    And confidence is "Medium"

  @at-risk @regression
  Scenario: At-Risk Leadership — decision quality breakdown
    Given executive_trust_score is 72
    And stakeholder_alignment is 68
    And organizational_clarity is 75
    And communication_effectiveness is 70
    And delegation_score is 72
    And coaching_score is 75
    And decision_quality is 45
    And ownership_index is 68
    And team_autonomy is 72
    And influence_score is 65
    And political_awareness is 70
    And meeting_quality is 73
    And execution_clarity is 68
    When the engineering manager runs a leadership health assessment
    Then leadership status is "At Risk"
    And root cause is "Decision Quality Deficit"
    And recommendation is "Review decision-making framework and escalate recurring blockers"
    And confidence is "Medium"

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Critical Leadership — trust and relationship deterioration
    Given executive_trust_score is 45
    And stakeholder_alignment is 50
    And organizational_clarity is 55
    And communication_effectiveness is 48
    And delegation_score is 52
    And coaching_score is 50
    And decision_quality is 45
    And ownership_index is 55
    And team_autonomy is 48
    And influence_score is 42
    And political_awareness is 50
    And meeting_quality is 52
    And execution_clarity is 58
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Critical"
    And recommendation is "Immediate intervention required — engage HR business partner and manager"
    And confidence is "High"

  @critical @immediate-action @regression
  Scenario: Critical Leadership — cascading team dysfunction
    Given executive_trust_score is 55
    And stakeholder_alignment is 48
    And organizational_clarity is 52
    And communication_effectiveness is 50
    And delegation_score is 45
    And coaching_score is 48
    And decision_quality is 55
    And ownership_index is 50
    And team_autonomy is 42
    And influence_score is 45
    And political_awareness is 48
    And meeting_quality is 50
    And execution_clarity is 45
    When the engineering manager runs a leadership health assessment
    Then leadership status is "Critical"
    And root cause is "Systemic Leadership Failure"
    And recommendation is "Pause sprint commitments and conduct leadership intervention workshop"
    And confidence is "High"

  # ─── Parametrized Threshold Regression ────────────────────────────────────

  @regression
  Scenario Outline: Leadership status by dimension score band
    Given all 13 dimensions have scores within the "<score_range>" band
    When the engineering manager runs a leadership health assessment
    Then leadership status is "<status>"
    And confidence is "<confidence>"

    Examples:
      | score_range | status    | confidence |
      | 80-100      | Healthy   | High       |
      | 60-79       | Warning   | Medium     |
      | 40-59       | At Risk   | Medium     |
      | 0-39        | Critical  | High       |