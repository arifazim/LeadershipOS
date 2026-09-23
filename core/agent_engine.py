import os
import json
from typing import List, Dict, Any

DEFAULT_MODEL = os.getenv("GEMINI_MODEL", "gemini-flash-latest")
FALLBACK_MODELS = [
    DEFAULT_MODEL,
    "gemini-flash-latest",
    "gemini-2.5-flash",
    "gemini-2.0-flash",
]


class AgentEngine:
    def __init__(self, api_key: str = None, model_name: str = None):
        self.api_key = api_key or os.getenv("GOOGLE_API_KEY") or os.getenv("GEMINI_API_KEY")
        self.model_name = model_name or DEFAULT_MODEL
        self.mock_mode = not self.api_key
        self.client = None

        if self.mock_mode:
            print("Warning: No GOOGLE_API_KEY found. Running in MOCK MODE.")
            return

        from google import genai

        self.client = genai.Client(api_key=self.api_key)

    def _read_file(self, path: str) -> str:
        if not os.path.exists(path):
            return ""
        with open(path, "r", encoding="utf-8") as f:
            return f.read()

    def _load_agent_definition(self, agent_name: str) -> str:
        return self._read_file(f"subagents/{agent_name}.md")

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
            with open(path, "r", encoding="utf-8") as f:
                return json.load(f)
        return {}

    def _load_team_context(self) -> Dict[str, Any]:
        path = "config/team.json"
        if os.path.exists(path):
            with open(path, "r", encoding="utf-8") as f:
                return json.load(f)
        return {}

    def _generate(self, prompt: str) -> str:
        models = []
        for name in [self.model_name, *FALLBACK_MODELS]:
            if name and name not in models:
                models.append(name)

        last_error = None
        for model in models:
            try:
                response = self.client.models.generate_content(
                    model=model,
                    contents=prompt,
                    config={"automatic_function_calling": {"disable": True}},
                )
                text = getattr(response, "text", None)
                if text:
                    if model != self.model_name:
                        print(f"Model '{self.model_name}' unavailable; used '{model}'.")
                    return text
                last_error = "Empty response from model"
            except Exception as exc:
                last_error = exc
                continue
        return f"Error during execution: {last_error}"

    def execute(self, agent_name: str, user_input: str, skill_paths: List[str] = None) -> str:
        skill_paths = skill_paths or []
        agent_def = self._load_agent_definition(agent_name)
        skills_def = self._load_skills(skill_paths)
        metrics = self._load_metrics()
        team_context = self._load_team_context()

        prompt = f"""YOU ARE AN OPERATIONAL AGENT WITHIN THE ENGINEERING MANAGER OS.
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

USER REQUEST:
{user_input}
"""

        if self.mock_mode:
            return (
                f"[MOCK RESPONSE for {agent_name}]\n"
                f"Based on your input: '{user_input}', I have analyzed the metrics and context.\n\n"
                f"RECOMMENDATION: In mock mode, I suggest reviewing the agent definition in {agent_name}.md for real-world application."
            )

        return self._generate(prompt)


if __name__ == "__main__":
    engine = AgentEngine()
    print(engine.execute("delivery-manager", "How is our current sprint looking?"))
