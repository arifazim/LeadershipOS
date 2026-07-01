# Feature: Decision Memory
  As an Engineering Manager
  I want to record, recall, and learn from past decisions
  So that the organization does not repeat mistakes and does build on past learning

  # Executor: subagents/engineering-manager.md
  # Skill:    decision-memory/decision-memory.md
  # Cadence:  Continuous

  Background:
    Given decision memory records are stored and searchable
    And the decision schema is understood
    And historical decision data is available

  # ─── Record ──────────────────────────────────────────────────────────────

  @regression
  Scenario: Record new decision with full context
    Given the engineering manager has made a significant architecture decision
    And alternatives were considered (3 options)
    And rationale is documented
    And stakeholders were consulted
    And expected outcome is defined with measurable criteria
    When the engineering manager records the decision
    Then a decision record is created with decision_id DEC-2024-001
    And all 8 core fields are populated
    And quality score is "Strong" or "Excellent"
    And no immediate pattern alerts are triggered

  @regression
  Scenario: Record decision with missing fields
    Given the engineering manager is recording a decision
    And alternatives were not documented
    And expected outcome is vague
    When the engineering manager records the decision
    Then missing fields are flagged
    And quality score is "Poor" or "Acceptable"
    And recommendations to improve record quality are provided

  # ─── Recall ──────────────────────────────────────────────────────────────

  @regression
  Scenario: Recall exact past decision
    Given decision DEC-2024-014 was recorded 8 months ago
    And it was a similar architecture decision with the same constraints
    And it failed because QA capacity was underestimated
    When the engineering manager recalls past decisions for a similar context
    Then DEC-2024-014 is retrieved and ranked first
    And similarity score is >= 80%
    And the past failure is surfaced with the reason

  @regression
  Scenario: No relevant past decision found
    Given no past decisions match the current context
    When the engineering manager recalls past decisions
    Then no decisions are returned
    And the system states "no relevant history"
    And the new decision proceeds without historical signal

  # ─── Pattern Detection ──────────────────────────────────────────────────

  @regression
  Scenario: Detect repeated failure pattern
    Given 3 architecture decisions were made during Q4 freeze
    And all 3 failed with similar root causes
    When the engineering manager runs pattern detection
    Then a Critical pattern is identified
    And pattern type is "Similar failure"
    And affected decisions are listed
    And a warning is issued before any new Q4 freeze architecture decision

  @regression
  Scenario: No patterns detected — healthy decision history
    Given past decisions show mixed outcomes
    And no domain has 2+ failures with similar root causes
    When the engineering manager runs pattern detection
    Then no Critical patterns are identified
    And Warning patterns are limited to 1 or fewer
    And decision history is classified as "Healthy"

  # ─── Decision Quality ───────────────────────────────────────────────────

  @regression
  Scenario: High-quality decision record
    Given the decision record includes all 8 core fields
    And 3 alternatives with explicit trade-offs
    And measurable success criteria
    And post-hoc lessons learned are documented
    When the decision is assessed
    Then quality score is "Excellent" or "Strong"
    And the record is suitable for future recall

  @regression
  Scenario: Low-quality decision record
    Given the decision record has only 1 alternative
    And rationale is "felt like the right call"
    And no success criteria are defined
    When the decision is assessed
    Then quality score is "Poor"
    And the record is flagged as insufficient for pattern detection

  # ─── Decision Quality Regression ────────────────────────────────────────

  @regression
  Scenario Outline: Decision quality by completeness
    Given the decision record has <field_count> of 8 core fields populated
    When the decision is assessed
    Then quality score is "<expected_quality>"
    And record completeness is flagged accordingly

    Examples:
      | field_count | expected_quality |
      | 8           | Strong or Excellent |
      | 6           | Acceptable |
      | 4           | Acceptable or Poor |
      | 2           | Poor |
