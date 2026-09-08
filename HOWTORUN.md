# HOW TO RUN: Engineering Manager OS

This guide provides the necessary steps to set up, configure, and operate the Engineering Manager OS (EM-OS) and its AI agents.

---

## 1. Prerequisites

- **Python 3.9+**
- **PowerShell 7+** (for `.ps1` wrapper scripts)
- **AI API Key** — choose one:
  - **Google Gemini**: `GOOGLE_API_KEY` — get one at [AI Studio](https://aistudio.google.com/) *(current default engine)*
  - **OpenAI / Codex**: `OPENAI_API_KEY` — get one at [platform.openai.com](https://platform.openai.com/) *(set `LLM_PROVIDER=openai` in `.env`)*
  - **Anthropic Claude**: `ANTHROPIC_API_KEY` — get one at [console.anthropic.com](https://console.anthropic.com/) *(set `LLM_PROVIDER=anthropic` in `.env`)*

If you are using this repo in **conversational mode** (Claude Code, Codex CLI, Cursor, or a web chat), no API key setup is needed here — your AI tool handles authentication. The Python setup below is only required for the automated `./bin/em-os.ps1` command runner.

---

## 2. Setup & Configuration

### A. Install Dependencies
Run the following command to install the required Python libraries:
```bash
pip install -r requirements.txt
```

### B. Environment Variables
1. Copy the template environment file:
   ```bash
   cp .env.example .env
   ```
2. Open `.env` and set your API key for whichever provider you're using:
   - **Gemini (default)**: set `GOOGLE_API_KEY`
   - **OpenAI / Codex**: set `OPENAI_API_KEY` and `LLM_PROVIDER=openai`
   - **Anthropic Claude**: set `ANTHROPIC_API_KEY` and `LLM_PROVIDER=anthropic`
3. (Optional) Add tokens for GitHub, Jira, PagerDuty, etc., to enable real-time data ingestion.

### C. Team Context
Update `config/team.json` with your team's details (name, size, tech stack, OKRs). This provides the "ground truth" for all agents.

---

## 3. Operational Workflow

### Step 1: Ingest Metrics
Before running agents, update the system's "memory" with the latest data from your engineering tools:
```bash
python scripts/ingest_metrics.py
```
*Note: If no API tokens are provided in `.env`, this will generate mock data for demonstration.*

### Step 2: Check OS Status
Verify the current metrics and signals stored in the system:
```powershell
./bin/em-os.ps1 status
```

### Step 3: Execute Agent Commands

The EM-OS uses an **Intelligent Orchestrator** to route situations to the correct specialists.

#### **Run a Pre-defined Loop**
Execute standard leadership routines located in the `commands/` directory:
```powershell
./bin/em-os.ps1 run daily   # Processes the Daily Leadership Loop
./bin/em-os.ps1 run weekly  # Processes the Weekly Strategic Review
```

#### **Process a Custom Situation (Ad-hoc)**
Pass any leadership challenge directly to the orchestrator. Below are **7 Critical Categories** with **5 Examples each** on how to leverage the OS for high-stakes leadership decisions:

### 1. Delivery & Velocity Crisis
Use these when roadmap commitments are at risk or DORA metrics show a downward trend.
- `./bin/em-os.ps1 run "Our deployment frequency dropped by 40% this month. Identify the bottleneck."`
- `./bin/em-os.ps1 run "Sprint velocity is inconsistent. Is this due to scope creep or technical debt?"`
- `./bin/em-os.ps1 run "We have 5 P1 bugs blocking the release. Re-prioritize the sprint for maximum stability."`
- `./bin/em-os.ps1 run "Lead time for changes is increasing. Analyze the PR review cycle for friction."`
- `./bin/em-os.ps1 run "The legacy migration is stalling. How much capacity is being drained by dual-support?"`

### 2. Team Health & Burnout
Use these to detect silent attrition risks and manage high-pressure periods.
- `./bin/em-os.ps1 run "On-call volume doubled this week. Which senior engineers are at critical burnout risk?"`
- `./bin/em-os.ps1 run "Team sentiment is low after the reorg. Initiate the Trust Recovery Playbook."`
- `./bin/em-os.ps1 run "Identify 'Key Person Risk' in our current architecture. Who is the single point of failure?"`
- `./bin/em-os.ps1 run "The team is working late every night. Analyze the 'Disruption Signal' in on-call metrics."`
- `./bin/em-os.ps1 run "Assess psychological safety. Is the team providing healthy dissent during design reviews?"`

### 3. AI Governance & Engineering Integrity
Use these to manage the risks of AI-assisted coding and agentic workflows.
- `./bin/em-os.ps1 run "Are senior engineers losing their debugging edge due to Copilot? Check Skill Atrophy signals."`
- `./bin/em-os.ps1 run "A pilot agent is now handling production PII. Run an AI Governance audit immediately."`
- `./bin/em-os.ps1 run "Define the Human-in-the-Loop (HITL) requirements for our new automated deployment agent."`
- `./bin/em-os.ps1 run "Is our AI-generated code increasing our 'Change Failure Rate'? Compare human vs AI PRs."`
- `./bin/em-os.ps1 run "Review the routing rationale for our LLM usage. Are we over-spending on high-reasoning models?"`

### 4. Strategic Alignment & Product Drift
Use these to ensure engineering effort translates to business value.
- `./bin/em-os.ps1 run "The 'AI Chat' PoC has 50 users now. Detect scope-drift and graduation requirements."`
- `./bin/em-os.ps1 run "What percentage of our capacity this quarter went to 'New Capabilities' vs 'Maintenance'?"`
- `./bin/em-os.ps1 run "A stakeholder is requesting a 'quick fix' that bypasses the ADR. Log the strategic risk."`
- `./bin/em-os.ps1 run "Compare our current work against the Q3 OKRs. Are we working on the right things?"`
- `./bin/em-os.ps1 run "Cross-team dependency check: Is Team B's usage of our API diverging from our intent?"`

### 5. Talent Acquisition & Growth
Use these for hiring, onboarding, and career development.
- `./bin/em-os.ps1 run "Calibrate the Backend Engineer interview loop to focus on system design and debugging."`
- `./bin/em-os.ps1 run "Generate a 30-60-90 day onboarding plan for a new Staff Engineer joining next week."`
- `./bin/em-os.ps1 run "Analyze the promotion readiness of the senior devs. Who is showing 'Staff-level' influence?"`
- `./bin/em-os.ps1 run "Identify skill gaps in the team. Do we have enough expertise for the upcoming cloud migration?"`
- `./bin/em-os.ps1 run "We just lost a candidate to a competitor. Review our interview feedback for bias or friction."`

### 6. Political Intelligence & Risk
Use these to navigate organizational dynamics and decision-making.
- `./bin/em-os.ps1 run "Decisions are being reversed by the VP. Is there an ownership ambiguity in our charter?"`
- `./bin/em-os.ps1 run "We are being excluded from the Product Strategy meetings. How do we rebuild influence?"`
- `./bin/em-os.ps1 run "An incentive misalignment is causing friction with Sales. Propose a collaborative OKR."`
- `./bin/em-os.ps1 run "Identify 'Decision Latency' for the new Auth module. Who is blocking the final approval?"`
- `./bin/em-os.ps1 run "Is there a 'Political Signal' of distrust from our cross-functional partners? Analyze meeting patterns."`

### 7. Institutional Memory & Audit
Use these to recall history and defend architectural choices.
- `./bin/em-os.ps1 run "Why did we decide to move away from the monolith 8 months ago? Recall the ADR rationale."`
- `./bin/em-os.ps1 run "Audit the decision provenance for the 'Billing Migration'. Who approved the rejected options?"`
- `./bin/em-os.ps1 run "Identify patterns in our failed projects. Is there a recurring theme of 'Low Evidence' decisions?"`
- `./bin/em-os.ps1 run "A new Director is asking about our tech stack history. Summarize the last 3 major pivots."`
- `./bin/em-os.ps1 run "Which rejected architectural alternatives should we reconsider given our new scale?"`

---

## 4. Understanding Agent Routing

The OS automatically routes your input based on keywords and metrics:

| Situation Type | Primary Agent | Key Skills Applied |
| :--- | :--- | :--- |
| **Incidents/Outages** | `incident-manager` | On-Call Fatigue, Post-mortem Debt |
| **Sprint/DORA Metrics** | `delivery-manager` | DevEx Assessment, Legacy Migration |
| **Architecture/Tech Debt** | `tech-lead` | Cross-Team Contracts, ADR Review |
| **People/Coaching** | `engineering-coach` | Skill Atrophy, Trust Recovery |
| **Product/Roadmap** | `product-partner` | Scope-Drift Detection |
| **Hiring/Onboarding** | `talent-partner` | Interview Calibration, 30-60-90 Playbook |
| **History/Audits** | `decision-provenance-agent` | Decision Latency, Authority Audit |

---

## 5. Troubleshooting

- **No API Key**: The system will run in **MOCK MODE**. Output will be static and for demonstration only.
- **Import Errors**: Ensure you are running commands from the project root directory.
- **Permission Denied**: On Windows, you may need to run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` in PowerShell to run `.ps1` scripts.
