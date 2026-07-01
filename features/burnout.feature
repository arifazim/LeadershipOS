Feature: Team Wellbeing and Burnout Risk
  As an Engineering Manager
  I want to detect wellbeing signals before they become attrition or burnout
  So that I can intervene early and protect the team's long-term sustainability

  # Executor: subagents/engineering-coach.md
  # Skill:    skills/people/assess-burnout.md
  # Cadence:  Weekly (signal review) + Every 1:1 (individual check)
  # Framework: SPACE — Satisfaction and Wellbeing dimension

  Background:
    Given 1:1 notes are available for the trailing 4 weeks
    And sprint velocity data is available for comparison
    And on-call burden data is available from PagerDuty

  # ─── Healthy ──────────────────────────────────────────────────────────────

  @healthy @regression
  Scenario: Team Health Green — all signals positive
    Given no engineers have raised wellbeing concerns in 1:1s
    And velocity is stable within 10% of the 4-sprint average
    And on-call burden is < 3 actionable off-hours pages per week
    And no attrition risk has been signaled
    When the engineering coach assesses team wellbeing
    Then team health is "Green"
    And recommendation is "Sustain — maintain 1:1 cadence and monitor"
    And confidence is "High"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Early Warning Signal — single engineer flagging concern
    Given one engineer has raised a wellbeing or workload concern in a 1:1
    And velocity shows a minor decline of < 10%
    And the concern is isolated to one individual
    When the engineering coach assesses team wellbeing
    Then team health is "Yellow"
    And recommendation is "Follow up in next 1:1 — understand root cause before taking action"
    And coaching questions are generated for the follow-up
    And confidence is "Medium"

  @warning @regression
  Scenario: On-Call Burden Elevated — engineers reporting fatigue
    Given on-call burden exceeds 3 actionable off-hours pages per week
    And engineers have mentioned on-call fatigue in 1:1s
    And the pattern has persisted for > 1 week
    When the engineering coach assesses team wellbeing
    Then team health is "Yellow"
    And recommendation is "Escalate to incident manager — reliability investment needed to reduce burden"
    And confidence is "High"
    And the incident manager is notified

  @warning @regression
  Scenario: Career Stagnation Risk — growth conversations absent
    Given no career or growth discussion has occurred for one or more engineers in > 6 weeks
    And those engineers have not indicated development goals recently
    When the engineering coach assesses team wellbeing
    Then team health is "Yellow"
    And recommendation is "Schedule a dedicated career conversation — not an agenda item, a full session"
    And confidence is "Medium"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: Multiple Signals — pattern emerging across the team
    Given 2 or more engineers have raised workload or morale concerns in 1:1s
    And velocity has declined > 10% for 2 consecutive sprints
    And the cause is not attributable to a single external event
    When the engineering coach assesses team wellbeing
    Then team health is "At Risk"
    And recommendation is "Investigate systemic cause — workload, process, culture, or leadership"
    And the engineering manager is notified to assess structural causes
    And confidence is "Medium"

  @at-risk @regression
  Scenario: Post-Incident Fatigue — team depleted after major incident
    Given a P1 incident occurred in the last 2 weeks requiring significant off-hours effort
    And engineers have mentioned exhaustion in 1:1s following the incident
    And velocity has dropped by > 15% in the sprint following the incident
    When the engineering coach assesses team wellbeing
    Then team health is "At Risk"
    And recommendation is "Protect next sprint capacity — reduce commitment by 20% for recovery"
    And confidence is "High"
    And a wellbeing check-in is added to the next retrospective agenda

  @at-risk @regression
  Scenario: Engagement Decline — disengagement signals in 1:1s
    Given one or more engineers are giving minimal responses in 1:1s
    And they have stopped raising issues or suggestions
    And this change is observable over > 3 consecutive 1:1 sessions
    When the engineering coach assesses team wellbeing
    Then team health is "At Risk"
    And recommendation is "Have a direct, low-pressure check-in conversation — name the pattern you're observing"
    And coaching questions are generated for the conversation
    And confidence is "Medium"

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Burnout Imminent — multiple severe signals with attrition risk
    Given 2 or more engineers have explicitly stated they are overwhelmed or considering leaving
    And velocity has declined > 20% for 2 or more consecutive sprints
    And on-call burden is in the Critical range
    When the engineering coach assesses team wellbeing
    Then team health is "Red"
    And recommendation is "Immediate intervention — stop adding work, reduce commitments, address root cause this week"
    And the engineering manager is notified with urgency
    And an immediate action is created for "1:1 with each at-risk engineer within 48 hours"
    And confidence is "High"

  @critical @immediate-action @regression
  Scenario: Attrition Risk Stated — engineer explicitly signals intent to leave
    Given an engineer has directly stated they are considering leaving
    And this was surfaced in a 1:1 conversation
    When the engineering coach assesses the individual situation
    Then individual health status is "Critical"
    And recommendation is "Do not delay — address the root concern directly in the next session"
    And the engineering manager is notified immediately
    And a retention plan is initiated within 48 hours
    And confidence is "High"

  # ─── Parametrized Signal Regression ──────────────────────────────────────

  @regression
  Scenario Outline: Team health classification by signal combination
    Given <engineers_flagging> engineers have raised wellbeing concerns
    And velocity decline is <velocity_decline>%
    And on-call off-hours pages per week is <oncall_pages>
    When the engineering coach assesses team wellbeing
    Then team health is "<health_status>"

    Examples:
      | engineers_flagging | velocity_decline | oncall_pages | health_status |
      | 0                  | 0                | 1            | Green         |
      | 1                  | 5                | 2            | Yellow        |
      | 1                  | 12               | 4            | At Risk       |
      | 2                  | 15               | 3            | At Risk       |
      | 2                  | 22               | 6            | Red           |
      | 3                  | 25               | 7            | Red           |
