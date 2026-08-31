import os
import json
import google.generativeai as genai
from typing import List, Dict, Any

class AgentEngine:
    def __init__(self, api_key: str = None, model_name: str = "gemini-1.5-flash"):
        self.api_key = api_key or os.getenv("GOOGLE_API_KEY")
        self.model_name = model_name
        self.mock_mode = not self.api_key
        
        if not self.mock_mode:
            genai.configure(api_key=self.api_key)
            self.model = genai.GenerativeModel(model_name)
        else:
            print("Warning: No GOOGLE_API_KEY found. Running in MOCK MODE.")

    def _read_file(self, path: str) -> str:
        if not os.path.exists(path):
            return ""
        with open(path, 'r', encoding='utf-8') as f:
            return f.read()

    def _load_agent_definition(self, agent_name: str) -> str:
        path = f"subagents/{agent_name}.md"
        return self._read_file(path)

    def _load_skills(self, skill_paths: List[str]) -> str:
        skills_content = ""
        for path in skill_paths:
            content = self._read_file(path)
            if content:
                skills_content += f"\n--- SKILL: {os.path.basename(path)} ---\n{content}\n"
        return skills_content

    def _load_metrics(self) -> Dict[str, Any]:
        path = "memory/current_metrics.json"
        if os.path.exists(path):
            with open(path, 'r', encoding='utf-8') as f:
                return json.load(f)
        return {}

    def _load_team_context(self) -> Dict[str, Any]:
        path = "config/team.json"
        if os.path.exists(path):
            with open(path, 'r', encoding='utf-8') as f:
                return json.load(f)
        return {}

    def execute(self, agent_name: str, user_input: str, skill_paths: List[str] = []) -> str:
        agent_def = self._load_agent_definition(agent_name)
        skills_def = self._load_skills(skill_paths)
        metrics = self._load_metrics()
        team_context = self._load_team_context()

        system_prompt = f"""
YOU ARE AN OPERATIONAL AGENT WITHIN THE ENGINEERING MANAGER OS.
FOLLOW THE IDENTITY, SCOPE, AND CONSTRAINTS DEFINED BELOW.

AGENT DEFINITION:
{agent_def}

AVAILABLE SKILLS:
{skills_def}

TEAM CONTEXT:
{json.dumps(team_context, indent=2)}

CURRENT OPERATIONAL METRICS:
{json.dumps(metrics, indent=2)}

INSTRUCTIONS:
1. Act as the agent described.
2. Use the provided metrics and team context to inform your response.
3. If a specific skill is relevant, follow its analysis and output template.
4. Maintain the defined identity and tone.
5. Provide actionable recommendations.
"""

        if self.mock_mode:
            return f"[MOCK RESPONSE for {agent_name}]\nBased on your input: '{user_input}', I have analyzed the metrics and context. \n\nRECOMMENDATION: In mock mode, I suggest reviewing the agent definition in {agent_name}.md for real-world application."

        try:
            response = self.model.generate_content([system_prompt, user_input])
            return response.text
        except Exception as e:
            return f"Error during execution: {str(e)}"

if __name__ == "__main__":
    # Test run
    engine = AgentEngine()
    result = engine.execute("delivery-manager", "How is our current sprint looking?")
    print(result)
