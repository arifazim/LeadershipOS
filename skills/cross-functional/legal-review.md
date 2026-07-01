# Skill: Legal Review

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Per-initiative (legal review trigger) + On-demand (contract, compliance, incident)

---

## Purpose

Navigate engineering-legal interactions — knowing when to trigger a legal review, how to communicate technical context to legal teams, and how to manage legal feedback as a delivery constraint without letting it become an indefinite blocker.

Engineering and legal rarely communicate fluently. Legal thinks in risk and liability. Engineering thinks in systems and timelines. The EM who can translate between these frames earns trust from both teams and avoids the most expensive outcome: a legal review that arrives after launch.

**The review imperative**: Legal issues are always more expensive to fix after they're in production than before. A legal review that takes two weeks before launch prevents a legal problem that takes six months to remediate after.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of qualifying initiatives that triggered a legal review before implementation | >95% | <90% = Yellow; <80% = Red |
| **Decision latency** | Median days from legal review request to legal opinion received | ≤10 business days | >15 days = Yellow; >20 days = Red |
| **Cross-team blockers** | Launches blocked by unresolved legal review | 0 | >1 active = Yellow |
| **Dependency aging** | Legal reviews in progress for >15 business days without resolution | 0 | >1 aging = Yellow |
| **Collaboration health** | Legal engaged early; engineering provides complete context; no adversarial pattern | Green | Post-launch discoveries = Red |
| **Stakeholder satisfaction** | Legal team's confidence that engineering engages appropriately | Green | Quarterly 1:1 |

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Initiative description** | What engineering is building — in non-technical terms |
| **Data involved** | What user or customer data is collected, stored, or processed |
| **Jurisdictions** | What geographies or user populations are affected |
| **Third-party services** | Any external vendors or APIs involved in data flow |

### Optional
| Input | Description |
|---|---|
| **Prior legal opinions** | Related legal guidance from past projects |
| **Compliance framework** | GDPR, CCPA, HIPAA, SOC 2, or other applicable standards |
| **Contract terms** | Customer or vendor contracts that affect technical implementation |
| **Timeline** | When engineering needs the legal opinion by |

---

## Analysis

### Step 1 — Legal Review Trigger Checklist

The EM needs a consistent classification of which engineering work requires legal review. Use this checklist before starting any significant initiative:

| Trigger | Review type needed |
|---|---|
| New user data collection (any type) | Privacy review |
| New data storage or processing jurisdiction | GDPR/CCPA/regional compliance review |
| New third-party data sharing | Data processing agreement review |
| New product feature visible to customers | Terms of service review (may be needed) |
| New AI/ML capability using customer data | AI governance review |
| Vendor contract or API with PII flow | Vendor DPA review |
| Change to data retention or deletion | Privacy policy and process review |
| New payment processing | PCI-DSS review |
| New health data (any) | HIPAA review |
| Open source library with unusual license | IP and licensing review |

**Rule**: If any trigger applies, route to legal before implementation starts. Not after. Not "as we go."

### Step 2 — Communicate Technical Context to Legal

Legal teams cannot evaluate engineering work they don't understand. The EM's job is to translate:

**Legal review request template:**
```
Initiative: {{name}}
What we're building: {{description in plain English — no jargon}}
What data is involved: {{type of data, who it belongs to, how it's collected}}
Where data is stored: {{geography and service}}
Who has access: {{internal teams, third parties}}
How long data is retained: {{retention policy}}
What happens if we don't get approval: {{business impact — helps legal prioritize}}
When we need your opinion by: {{date}}
Questions we have: {{specific legal questions}}
```

### Step 3 — Manage Legal Feedback as a Constraint

Legal opinions produce three types of feedback:

| Feedback type | What it means | Engineering response |
|---|---|---|
| **Approved** | Proceed as designed | Document the approval; proceed |
| **Approved with conditions** | Proceed with specific changes | Implement conditions; document what changed |
| **Not approved** | Cannot proceed as designed | Re-scope or halt; escalate to VP |

"Approved with conditions" is the most common outcome. Treat conditions as requirements — not suggestions.

**When legal says no**: This is not the end of the conversation. Ask:
1. What specifically makes this not approvable?
2. What would need to change for it to be approvable?
3. Is there a phased approach that is approvable?

---

## Decision Tree

```
What is the legal review state?

├── NEW INITIATIVE — ASSESS TRIGGER
│   └── Apply trigger checklist (Step 1)
│       If any trigger applies: route to legal before sprint planning
│       If no trigger applies: document the assessment and proceed
│       Do NOT: skip the checklist and assume no review needed

├── LEGAL REVIEW REQUESTED — AWAITING RESPONSE
│   └── Track aging: flag at >10 business days
│       Check in at day 7 if no response: "Checking on timing — our delivery date is [X]."
│       Escalate at day 15: Involve EM's VP if legal timeline is blocking delivery

├── LEGAL SAYS "NOT APPROVED"
│   └── Do not ship. Full stop.
│       Request: "What would make this approvable?" (always ask this)
│       Escalate: To VP Engineering + Chief Legal Officer if business-critical
│       Options: Redesign / descope / delay / accept risk in writing with exec sign-off
│       Never: Ship knowingly without approval and hope it's fine

├── LEGAL FEEDBACK HAS CONDITIONS
│   └── Implement conditions as requirements — not suggestions
│       Document: What changed and why (audit trail)
│       Confirm: Get legal sign-off on the conditions implementation before launch
│       Do NOT: Implement "most" of the conditions

└── LEGAL RELATIONSHIP IS HEALTHY
    └── Invest: Quarterly meeting with legal to preview upcoming initiatives
        Share: Roadmap items that may need legal review — give them lead time
        Recognize: When early legal engagement prevented a post-launch problem
```

---

## Output

### Legal Review Register

```
LEGAL REVIEW REGISTER — {{Team}} — {{Quarter}}

METRICS
Alignment score:     {{N}}% qualifying initiatives reviewed before implementation | {{🟢/🟡/🔴}}
Decision latency:    {{N}} days avg from request to opinion | {{🟢/🟡/🔴}}
Cross-team blockers: {{N}} launches blocked by pending legal review | {{🟢/🟡/🔴}}
Dependency aging:    {{N}} reviews pending >15 business days | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{Legal team's last signal + date}}

ACTIVE REVIEWS
Initiative        | Review type | Requested   | Status           | Age | ETA
{{Initiative}}    | Privacy     | {{date}}    | In review        | 8d  | {{date}}
{{Initiative}}    | Vendor DPA  | {{date}}    | Approved ✅      | —   | Done
{{Initiative}}    | GDPR        | {{date}}    | Conditions 🟡    | —   | Implementing

UPCOMING REVIEWS NEEDED (next quarter)
• {{Initiative}} — {{trigger type}} — planned start: {{date}} — legal needed by: {{date}}

CONDITIONS IN IMPLEMENTATION
• {{Initiative}}: {{condition}} — implementation owner: {{name}} — by: {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Legal trigger checklist applied to all initiatives | Base: 65% |
| Legal review register maintained | +10% |
| Reviews requested before implementation (not after) | +15% |
| Conditions tracked to completion | +10% |
| Stakeholder satisfaction updated quarterly | +5% |
| Any "not approved" shipped without resolution | −50% (critical failure) |
| Reviews consistently initiated post-implementation | −25% |
| Conditions treated as optional | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Post-launch discovery** | Legal issue discovered after the feature is live | Apply trigger checklist. Pre-launch legal review is non-negotiable for triggers. |
| **No review request** | Engineering assumes "we've done this before" | Past approval doesn't cover new implementations. Each initiative is reviewed. |
| **Conditions as suggestions** | Legal says "approved with X condition" — X is partially implemented | Conditions are requirements. Get sign-off on implementation before launch. |
| **Adversarial relationship** | Engineering and legal in conflict on timelines | Share roadmap quarterly. Give legal lead time. They become faster with more context. |
| **Shipping with "not approved"** | Business pressure overrides legal decision | This requires explicit C-suite written sign-off with accepted risk. Document it. Never do it unilaterally. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/cross-functional/security-partnership.md` — Security and legal often share compliance review
- `docs/engineering-playbook.md` → Risk section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/security-partnership.md` | Security and legal reviews often overlap for compliance |
| `skills/cross-functional/finance-partnership.md` | Legal reviews sometimes affect budget (vendor DPAs, compliance cost) |
| `skills/executive/executive-risk-report.md` | Legal blocks escalated as delivery risk |
| `skills/cross-functional/dependency-management.md` | Legal review is a tracked dependency |
