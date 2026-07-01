# Contract Template: Subagent

**Applies to**: every file under `subagents/`

Subagents don't process data inputs the way skills do — they route, synthesize, and decide. Their contract schema is adapted accordingly: "Inputs" becomes the situational context needed to route correctly, and "Required Outputs" is the Output Contract most subagent files already have informally.

## Schema

```
Contract
  Name:                {{subagent name}}
  Inputs:
    Required:          {{situation summary fields needed to route correctly}}
    Optional:           {{context that improves routing but isn't blocking}}
  Required Outputs:      {{every field the Output Contract must contain}}
  Failure Conditions:    {{states where the subagent must escalate rather than proceed}}
  Quality Checks:        {{constraints that every output must satisfy — usually the subagent's Never/Always list}}
  Version:               {{semantic version}}
```

## Worked Example — `subagents/engineering-manager.md`

```
Contract
  Name:                Engineering Manager (Orchestrator)
  Inputs:
    Required:          Situation summary, urgency, audience
    Optional:           Current sprint data, recent 1:1 signals, active incidents,
                        stakeholder asks on the table
  Required Outputs:      STATUS, CONFIDENCE, SUMMARY, SPECIALIST FINDINGS,
                        RECOMMENDATIONS (Immediate/This week/Systemic), RISKS,
                        OPEN QUESTIONS
  Failure Conditions:    Decision requires authority the EM doesn't have | Two specialists
                        conflict and the tie-breaker requires user context | Confidence
                        below 50% (Speculative)
  Quality Checks:        Never do specialist work when a specialist exists | Never omit a
                        confidence level | Details never precede the summary | Every risk
                        has a named mitigation
  Version:               1.0
```

This maps directly onto `subagents/engineering-manager.md`'s existing "Output Contract" and "Constraints" sections — Required Outputs is that file's Output Contract block verbatim; Failure Conditions is its Escalation section; Quality Checks is its Constraints "Never"/"Always" list. The file has been updated with a pointer to this contract.

## Relationship to Existing Subagent Sections

| Existing section | Contract field |
|---|---|
| Scope (Owns / Does Not Own — Routes To) | Not part of the contract — routing table stays in the subagent file |
| Trigger Conditions | Informs Inputs.Required, but stays narrative in the subagent file |
| Routing Logic (decision tree) | Not part of the contract — this is *how* the subagent decides, the contract only states *what* it must input/output |
| Output Contract | Required Outputs |
| Constraints (Never/Always) | Quality Checks |
| Escalation | Failure Conditions |
