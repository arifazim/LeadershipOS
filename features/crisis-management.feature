Feature: Management Crisis Navigation
  As an Engineering Manager
  I want to navigate organizational and human crises with the same discipline technical incidents receive
  So that I can protect team trust, executive confidence, and recovery speed under the highest-pressure conditions

  # Executor: subagents/engineering-manager.md
  # Loop:     loops/crisis-loop.md
  # Skills:   skills/people/difficult-message-delivery.md
  #           skills/executive/pressure-decision-framework.md
  #           skills/mentoring/em-self-coaching.md (post-crisis growth input)
  #           skills/organizational/reorg-navigation.md (org shock type)
  #           skills/people/trust-recovery-playbook.md (people crisis type)
  # Cadence:  On-demand

  Background:
    Given an engineering manager is facing a management crisis
    And the crisis has been classified into one of the five types: people / executive trust / cross-team / org shock / delivery

  # ─── Healthy (Well-Navigated) ─────────────────────────────────────────────

  @healthy @regression
  Scenario: Key Person Departure — handled with dignity and speed
    Given a senior engineer announces their resignation
    And the EM informs their manager before the news spreads
    And affected team members are told by the EM directly within 24 hours
    And the team is briefed honestly with context they can act on
    And a transition plan is established within 48 hours
    When the engineering manager assesses the response
    Then crisis navigation status is "Healthy"
    And recommendation is "Log the succession gap in memory/conflicts/ and update bus-factor assessment"
    And confidence is "High"

  @healthy @regression
  Scenario: Org Shock Communicated Proactively — reorg landed without panic
    Given a reorg is announced that affects the EM's team
    And the EM learns about it before the public announcement
    And they brief each affected team member individually before the all-hands
    And they provide a clear statement of what changes and what does not
    And they acknowledge what is uncertain without speculating
    When the engineering manager assesses communication quality
    Then org shock response is "Healthy"
    And recommendation is "Monitor team sentiment for 2 weeks — org shocks have delayed trust impact"
    And confidence is "High"

  # ─── Warning ──────────────────────────────────────────────────────────────

  @warning @regression
  Scenario: Executive Trust Decline — skip-level surfaced concerns
    Given the EM's manager conducts skip-levels and hears critical feedback about the EM
    And the feedback pattern spans more than one team member
    And the EM has not been aware of the concern
    When the engineering manager receives the synthesis
    Then executive trust status is "Warning"
    And recommendation is "Acknowledge with manager immediately. Set one specific growth edge within 3 days. Reference it in the next skip-level prep."
    And route to em-self-coaching for EM-as-subject pattern analysis
    And confidence is "Medium"

  @warning @regression
  Scenario: Cross-Team Conflict Escalated — peer EM bypassed the EM to escalate
    Given a peer engineering manager has raised a cross-team conflict to shared leadership
    And they did not first attempt resolution with the EM directly
    And the EM learns about the escalation from their manager, not the peer
    When the engineering manager assesses the situation
    Then cross-team conflict status is "Warning"
    And recommendation is "Request a direct bilateral conversation with the peer EM before responding to leadership escalation"
    And confidence is "High"

  @warning @regression
  Scenario: Delivery Crisis — missed commitment has damaged stakeholder trust
    Given a committed milestone was missed without prior warning to stakeholders
    And stakeholders learned about the miss from someone other than the EM
    And the EM has not yet communicated a revised plan
    When the delivery-manager assesses the crisis
    Then delivery crisis status is "Warning"
    And recommendation is "Stakeholder communication within 4 hours: what happened, what the revised plan is, and one specific ask"
    And invoke pressure-decision-framework for any commitments that must be made under current pressure
    And confidence is "High"

  # ─── At Risk ──────────────────────────────────────────────────────────────

  @at-risk @regression
  Scenario: People Crisis — multiple flight risks materializing simultaneously
    Given two or more team members show active flight risk signals simultaneously
    And at least one has received a competing offer
    And the team is aware that departures are happening
    When the engineering manager assesses team stability
    Then team stability status is "At Risk"
    And recommendation is "Triage: identify which retention matters most to the team's capability. Address root cause, not symptoms."
    And invoke skills/people/flight-risk-model.md for remaining team assessment
    And escalate to EM manager: "team stability is at risk — I need a conversation this week"
    And confidence is "Medium"

  @at-risk @regression
  Scenario: Executive Bypassing EM — executive contacting team directly
    Given the EM's executive is communicating directly with team members
    And doing so without informing the EM
    And team members are receiving direction that may conflict with the EM's own
    When the engineering manager identifies the pattern
    Then executive trust status is "At Risk"
    And recommendation is "Direct conversation with the executive: 'I've noticed you've been speaking with the team directly. I want to make sure I understand what's driving that.'"
    And confidence-engine executive trust score should be assessed before the conversation
    And confidence is "Medium"

  # ─── Critical ─────────────────────────────────────────────────────────────

  @critical @immediate-action @regression
  Scenario: Team Member in Acute Distress — mental health or safety concern
    Given a team member has expressed or exhibited signs of acute mental health distress
    Or a team member has made statements that suggest risk to themselves
    When the engineering manager becomes aware
    Then crisis classification is "Critical — People Safety"
    And immediate action is "Contact HR and employee assistance resources within the hour"
    And do not attempt to manage this without HR involvement
    And follow up with the team member within 24 hours after HR has been engaged
    And confidence is "High"
    And note: this scenario takes priority over all other management activities

  @critical @immediate-action @regression
  Scenario: Executive Confidence Lost — executive is considering removing the EM
    Given the EM's manager has expressed loss of confidence directly or through a surrogate
    And specific concerns have been named
    And the EM has not addressed these concerns in prior conversations
    When the engineering manager assesses the situation
    Then executive trust status is "Critical"
    And immediate action is "Request an honest conversation with your manager: 'I want to understand the full picture of your concerns.'"
    And produce a 30-day recovery plan with specific observable behavioral changes
    And confidence is "Low — situation is fragile"
    And note: defensive responses at this stage accelerate loss of confidence

  @critical @immediate-action @regression
  Scenario: Org Shock Without Warning — layoff affects the EM's team
    Given the EM's team has been affected by a layoff round
    And the EM was not consulted on the selection
    And remaining team members know a layoff occurred
    When the engineering manager responds
    Then crisis classification is "Critical — Org Shock"
    And immediate action sequence is: "Brief remaining team within 4 hours. Deliver each affected person's message directly. Do not let HR be the only touchpoint."
    And invoke skills/people/difficult-message-delivery.md for individual conversations
    And invoke skills/people/trust-recovery-playbook.md for the team's remaining stability
    And confidence is "Medium — recovery depends heavily on EM communication quality in first 48 hours"

  # ─── Parametrized Regression ──────────────────────────────────────────────

  @regression
  Scenario Outline: Crisis communication sequencing
    Given a management crisis of type <crisis_type>
    And the EM's manager was informed: <manager_informed_first>
    And affected individuals were told by the EM directly: <direct_communication>
    And the team received a coherent message: <team_communicated>
    When the engineering manager assesses communication quality
    Then communication sequence status is "<sequence_status>"

    Examples:
      | crisis_type       | manager_informed_first | direct_communication | team_communicated | sequence_status |
      | people            | yes                    | yes                  | yes               | Healthy         |
      | people            | no                     | yes                  | yes               | Warning         |
      | org shock         | yes                    | yes                  | yes               | Healthy         |
      | org shock         | yes                    | no                   | yes               | Warning         |
      | delivery          | yes                    | yes                  | yes               | Healthy         |
      | delivery          | no                     | no                   | no                | Critical        |
      | executive trust   | yes                    | yes                  | no                | Healthy         |
      | cross-team        | yes                    | yes                  | no                | Warning         |
