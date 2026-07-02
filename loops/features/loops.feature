Feature: Loop Routing and Disambiguation
  As an Engineering Manager
  I want loops to route to the correct subagent and stay disambiguated from adjacent loops
  So that a request is handled by exactly one loop, not zero or two

  # Executor: subagents/engineering-manager.md (routes), individual loops/*.md files
  # Skill:    loops/*.md
  # Cadence:  Every time a loop is invoked, directly or via commands/

  Background:
    Given the request has been classified by domain and cadence
    And the matching loop file's Trigger Conditions are known

  # ─── Correct Routing ──────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Command entry point invokes its matching loop
    Given "commands/weekly.md" is triggered
    When the command's entry point is resolved
    Then it invokes "loops/sprint-loop.md"
    And no other loop is invoked for the same trigger

  @healthy @regression
  Scenario: Loop routes to its primary subagent
    Given "loops/incident-loop.md" is invoked
    When Step 3 ("Route to subagent(s)") is executed
    Then the primary subagent is "incident-manager"
    And "engineering-manager" is only invoked if the root cause is architectural

  # ─── Disambiguation Holds ─────────────────────────────────────────────────

  @healthy @regression
  Scenario: Sprint-loop and delivery-loop do not both fire for the same request
    Given a request is "produce this sprint's review"
    When the request is classified
    Then only "loops/sprint-loop.md" fires
    And "loops/delivery-loop.md" does not fire

  @healthy @regression
  Scenario: Delivery-loop fires for a cross-sprint trend request
    Given a request is "is our delivery health trending up or down"
    When the request is classified
    Then only "loops/delivery-loop.md" fires
    And "loops/sprint-loop.md" does not fire

  @healthy @regression
  Scenario: Career-loop and promotion-loop do not both fire for the same request
    Given a request is "check in on this engineer's career direction"
    When the request is classified
    Then only "loops/career-loop.md" fires
    And "loops/promotion-loop.md" does not fire unless a promotion cycle is explicitly open

  # ─── Failure: Ambiguous or Missing Routing ────────────────────────────────

  @warning @regression
  Scenario: Request matches no loop's Trigger Conditions
    Given a request does not match any loop file's Trigger Conditions
    When the engineering manager attempts to classify it
    Then no loop is invoked
    And the request is handled directly by the engineering-manager subagent per its own Routing Logic

  @critical @regression
  Scenario: Request ambiguously matches two loops' Trigger Conditions
    Given a request matches the Trigger Conditions of two different loops
    When the engineering manager attempts to classify it
    Then classification is Critical — this indicates a Related Loops disambiguation gap
    And the ambiguity is logged to kaizen/failures.md as a Process failure
    And both loop files' Related Loops sections are reviewed for a missing boundary statement

  # ─── Memory Logging ────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Loop's Log outcome step writes to the correct memory domain
    Given "loops/stakeholder-loop.md" completes its Steps
    When Step 5 ("Log outcome") executes
    Then the entry is written to "memory/stakeholders/"
    And it is not written to a generic or non-existent memory path

  # ─── Parametrized Loop-to-Subagent Regression ─────────────────────────────

  @regression
  Scenario Outline: Each loop's primary subagent matches its Reusable by field
    Given "<loop>" is invoked
    When Step 3 ("Route to subagent(s)") is executed
    Then the primary subagent is "<primary_subagent>"

    Examples:
      | loop                              | primary_subagent   |
      | loops/sprint-loop.md               | delivery-manager    |
      | loops/delivery-loop.md             | delivery-manager    |
      | loops/incident-loop.md             | incident-manager    |
      | loops/executive-loop.md            | executive-summary   |
      | loops/career-loop.md               | engineering-coach   |
      | loops/promotion-loop.md            | engineering-coach   |
      | loops/architecture-loop.md         | tech-lead           |
      | loops/stakeholder-loop.md          | product-partner     |
      | loops/prediction-loop.md           | executive-summary   |
