# Skill: Security Partnership

**Domain**: Cross-Functional
**Owner**: `subagents/engineering-manager.md`
**Cadence**: Per-initiative (security review) + Quarterly (posture review) + On-demand (incident)

---

## Purpose

Build a productive engineering-security partnership where security requirements are discovered early, security reviews are a predictable part of delivery (not a late-stage blocker), and security debt is visible and managed.

The most common engineering-security failure mode: security is consulted at the end of the project, discovers significant issues, and becomes the villain who delays the launch. This is a process failure, not a security failure.

**The security partnership model**: Security sets the standards and reviews the design. Engineering implements the standards and surfaces new risks. Both share accountability for the security posture of the product.

---

## Metrics

| Metric | Definition | Target | Health signal |
|---|---|---|---|
| **Alignment score** | % of initiatives that had security review before implementation started | >90% | <80% = Yellow; <70% = Red |
| **Decision latency** | Median days from security review request to completed review | ≤5 business days | >10 days = Yellow; >15 days = Red |
| **Cross-team blockers** | Releases blocked by security findings discovered late | 0 | >1/quarter = Yellow; >2/quarter = Red |
| **Dependency aging** | Open security findings without a remediation commitment | 0 High/Critical | Any High open >14d = Yellow; any Critical open = Red |
| **Collaboration health** | Security involved in design; findings addressed without blame; shared ownership | Green | Late involvement pattern = Yellow |
| **Stakeholder satisfaction** | Security team's confidence that engineering takes security seriously | Green | Quarterly 1:1 |

**Security debt severity classification:**
```
Critical: Actively exploitable; customer data at risk → remediate within 72 hours
High:     Significant risk; clear exploit path → remediate within 14 days
Medium:   Risk present but requires specific conditions → remediate within 90 days
Low:      Best practice gap; low risk → schedule within 6 months
```

---

## Inputs

### Required
| Input | Description |
|---|---|
| **Open security findings** | All unresolved findings by severity with age |
| **Upcoming initiatives** | Features or infrastructure changes needing security review |
| **Compliance requirements** | SOC 2, GDPR, HIPAA, or other regulatory frameworks in scope |
| **Recent incidents** | Any security-related incidents or near-misses |

### Optional
| Input | Description |
|---|---|
| **Penetration test results** | External security assessments |
| **Dependency vulnerability scan** | Third-party library CVEs in use |
| **Security training completion** | Team's completion rate on required security training |

---

## Analysis

### Step 1 — Security Review Classification

Determine which engineering work needs security review and at what depth:

| Work type | Security review needed | When to engage |
|---|---|---|
| New feature touching auth, payments, PII | Full security design review | Before implementation starts |
| New third-party integration | Vendor security review + integration review | Before vendor contract |
| Infrastructure change | Architecture security review | Before provisioning |
| Minor UI/UX change (no data flow change) | No formal review needed | Flag to security for awareness only |
| Dependency upgrade | Automated CVE scan; manual if High/Critical CVEs | Before merging |

**Rule**: If in doubt, ask security early. The cost of an early "no review needed" conversation is 15 minutes. The cost of a late security finding is weeks.

### Step 2 — Manage the Security Debt Register

Every open security finding is organizational debt. Track it explicitly:

```
SECURITY DEBT REGISTER
ID    | Finding         | Severity | Age | Remediation plan   | Target date
SF-01 | XSS in form X   | High     | 8d  | Sanitization PR #42| July 15
SF-02 | Outdated crypto | Medium   | 45d | Sprint 46 planned  | August 1
SF-03 | Missing RBAC    | Critical | 2d  | IMMEDIATE          | July 3
```

Any Critical finding triggers immediate escalation, regardless of delivery schedule.

### Step 3 — Prepare for Compliance Reviews

When compliance certifications (SOC 2, ISO 27001, GDPR, HIPAA) are in scope:
- Map engineering controls to compliance requirements
- Ensure evidence collection is automated where possible
- Surface certification timeline to executive team — these have hard deadlines

---

## Decision Tree

```
What is the security partnership state?

├── CRITICAL FINDING DISCOVERED
│   └── Immediate: Stop related work until remediation plan is confirmed
│       Notify: Security lead + EM manager within 2 hours
│       Frame: "We have a Critical finding. Work is paused. Remediation in progress.
│               Expected resolution: {{date}}."
│       → Invoke: skills/executive/executive-risk-report.md if customer data is at risk

├── RELEASE BLOCKED BY LATE SECURITY FINDING
│   └── Root cause: Security was not engaged early enough
│       Immediate: Assess: can finding be remediated before launch? Or is a scope reduction needed?
│       Structural fix: Add security review to Definition of Ready for new initiatives
│       Do NOT: Ship knowingly with an unmitigated High or Critical finding
│               (unless security team explicitly accepts the risk in writing)

├── HIGH ALIGNMENT SCORE BUT HIGH DECISION LATENCY
│   └── Security is engaged but reviews take too long
│       Conversation: "Our review SLA is causing delivery risk. Can we agree on a
│                      5-day standard for design reviews?"
│       Escalation: If security team is under-resourced, surface to shared manager

├── SECURITY DEBT GROWING (aging findings without remediation)
│   └── Add security debt to sprint capacity allocation
│       Rule: No sprint should have 0 security debt remediation if debt register is non-empty
│       Escalate: If High/Critical findings are aging beyond thresholds, surface to VP

└── PARTNERSHIP IS HEALTHY
    └── Invest: Invite security lead to architecture reviews proactively
        Share: Incident post-mortems with security team (they learn from them)
        Maintain: Quarterly joint review of security posture and debt register
```

---

## Output

### Security Partnership Health Report

```
SECURITY PARTNERSHIP HEALTH — {{Quarter / Month}}

METRICS
Alignment score:      {{N}}% initiatives with pre-implementation security review | {{🟢/🟡/🔴}}
Decision latency:     {{N}} days median for security reviews | {{🟢/🟡/🔴}}
Cross-team blockers:  {{N}} releases blocked by security findings | {{🟢/🟡/🔴}}
Dependency aging:     Critical open: {{N}} | High open >14d: {{N}} | {{🟢/🟡/🔴}}
Collaboration health: {{Green | Yellow | Red}}
Stakeholder satisfaction: {{Security team's last signal + date}}

SECURITY DEBT REGISTER SUMMARY
Critical: {{N}} (target: 0) | High: {{N}} | Medium: {{N}} | Low: {{N}}
Oldest High finding: {{N}} days

UPCOMING REVIEWS NEEDED
• {{Initiative}} — review type: {{design/vendor/infra}} — deadline: {{date}}

COMPLIANCE STATUS
{{Certification}}: {{on track / at risk / not started}} — deadline: {{date}}
```

---

## Confidence Score

| Condition | Modifier |
|---|---|
| Security review classification defined | Base: 65% |
| Security debt register maintained with severity + age | +15% |
| Alignment score tracked | +10% |
| Decision latency tracked | +5% |
| Critical findings trigger immediate escalation | +5% (process confirmed) |
| No security debt register | −25% |
| Security consistently engaged post-implementation | −20% |
| Critical findings tracked but not escalated | −20% |

---

## Failure Modes

| Mode | Symptom | Fix |
|---|---|---|
| **Late engagement** | Security reviews happen at "done, please approve" stage | Add security to Definition of Ready. Design review before implementation. |
| **Critical debt untracked** | High/Critical findings in informal notes, not a register | Formalize the register. Every finding has severity, age, and owner. |
| **Compliance surprise** | Certification deadline appears late in the year | Map compliance timeline at annual planning. Surface to VP in Q1. |
| **Security as villain** | Engineering resents security blocks | Fix the process, not the relationship. Late-stage blocks are a process failure. |
| **No risk acceptance process** | Ship anyway with unmitigated findings, undocumented | Every consciously accepted security risk needs security team sign-off in writing. |

---

## References

- `skills/cross-functional/dependency-management.md` — Canonical metric definitions
- `skills/executive/executive-risk-report.md` — Escalation format for Critical findings
- `docs/engineering-playbook.md` → Risk section

## Related Skills

| Skill | Relationship |
|---|---|
| `skills/cross-functional/dependency-management.md` | Security review dependencies tracked here |
| `skills/cross-functional/legal-review.md` | Legal review often interacts with security posture |
| `skills/executive/executive-risk-report.md` | Critical security findings escalated via this framework |
| `skills/cross-functional/qa-partnership.md` | Security and QA share quality ownership |
