Feature: Specification Contract Enforcement
  As an Engineering Manager
  I want a skill or subagent's contract to block invalid invocation and catch malformed output
  So that a request is never processed with missing inputs or returned with a broken output shape

  # Executor: any subagent or skill invoking a file under contracts/
  # Skill:    contracts/skill.contract.md, contracts/subagent.contract.md, and the 5 filled domain contracts
  # Cadence:  Every time a skill or subagent with a contract is invoked

  Background:
    Given the invoked skill or subagent has a corresponding contracts/*.md file
    And the contract's Inputs, Required Outputs, Failure Conditions, and Quality Checks are known

  # ─── Failure Conditions Block Invalid Invocation ──────────────────────────

  @healthy @regression
  Scenario: Missing required input blocks execution
    Given "skills/delivery/review-sprint.md" is invoked per contracts/skill.contract.md's worked example
    And "Sprint goal" (a Required input) is MISSING
    When the skill attempts to run
    Then execution is blocked before analysis begins
    And the missing input is named explicitly, not silently inferred

  @healthy @regression
  Scenario: A Failure Condition distinct from a bad score does not block execution
    Given "skills/delivery/review-sprint.md" is invoked with all Required inputs present
    And sprint completion rate is 40% (a bad outcome, not a missing input)
    When the skill runs
    Then execution proceeds — a low score is a valid output, not a Failure Condition
    And the output correctly reports the low completion rate

  @critical @regression
  Scenario: Subagent Failure Condition triggers escalation instead of a decision
    Given "subagents/engineering-manager.md" is invoked per contracts/subagent.contract.md's worked example
    And confidence in the available information is below 50% (Speculative)
    When the subagent attempts to produce a recommendation
    Then it escalates instead of deciding, per its Failure Conditions
    And it does not proceed without more information

  # ─── Quality Checks Catch Malformed Output ────────────────────────────────

  @warning @regression
  Scenario: Output missing a confidence level fails its Quality Check
    Given a skill produces output with a recommendation but no stated confidence level
    When the contract's Quality Checks are applied
    Then the output fails validation
    And the skill must restate the output with an explicit confidence level before it is returned

  @warning @regression
  Scenario: Output with details before the summary fails its Quality Check
    Given a skill's output places detailed findings before the executive summary
    When the contract's Quality Checks are applied
    Then the output fails validation per "Details never precede the summary"

  # ─── Contract Versioning ──────────────────────────────────────────────────

  @healthy @regression
  Scenario: Changing Required Outputs requires a Version bump
    Given a skill's Output section gains a new required field
    When the corresponding contracts/*.md file is updated to add that field to Required Outputs
    Then the contract's Version is incremented
    And the skill's prose can still change without a Version bump if Required Outputs/Failure Conditions/Quality Checks are unchanged

  # ─── Parametrized Contract Coverage Regression ────────────────────────────

  @regression
  Scenario Outline: Each filled contract's flagship file is correctly governed
    Given "<contract>" is invoked
    When its Failure Conditions and Quality Checks are checked against "<flagship_skill>"
    Then all of "<flagship_skill>"'s documented Failure Conditions and Quality Checks are enforced

    Examples:
      | contract                          | flagship_skill                                          |
      | contracts/prediction.contract.md   | skills/confidence-engine/prediction_confidence.md        |
      | contracts/dashboard.contract.md    | skills/leadership-health/leadership-health-engine.md           |
      | contracts/meeting.contract.md      | skills/meetings/meeting-planner.md                       |
      | contracts/executive.contract.md    | skills/executive/executive-status-report.md              |
      | contracts/presentation.contract.md | skills/executive/board-level-summary.md                  |
