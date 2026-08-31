import os
from core.agent_engine import AgentEngine
from typing import List, Dict, Any

class Orchestrator:
    def __init__(self, api_key: str = None):
        self.engine = AgentEngine(api_key=api_key)

    def _detect_routing(self, situation: str, metrics: Dict[str, Any]) -> List[str]:
        routes = []
        
        # Incident Check (P1/P2)
        pagerduty = metrics.get("pagerduty", {})
        incident_count = pagerduty.get("incident_count_last_30d", 0)
        # In a real scenario, we'd check for *active* P1/P2
        if "incident" in situation.lower() or "outage" in situation.lower() or incident_count > 0:
            routes.append("incident-manager")

        # Delivery Health
        if any(kw in situation.lower() for kw in ["sprint", "velocity", "delivery", "dora", "milestone"]):
            routes.append("delivery-manager")

        # Technical/Architecture
        if any(kw in situation.lower() for kw in ["architecture", "tech debt", "technical", "adr", "design"]):
            routes.append("tech-lead")

        # People/Coaching
        if any(kw in situation.lower() for kw in ["burnout", "1:1", "coaching", "growth", "performance"]):
            routes.append("engineering-coach")

        # Product/Roadmap
        if any(kw in situation.lower() for kw in ["roadmap", "priority", "stakeholder", "product"]):
            routes.append("product-partner")

        # Talent/Hiring
        if any(kw in situation.lower() for kw in ["hire", "interview", "onboarding", "talent"]):
            routes.append("talent-partner")

        # Decision Provenance / History
        if any(kw in situation.lower() for kw in ["history", "provenance", "audit", "why did we", "decided"]):
            routes.append("decision-provenance-agent")

        # Default to Engineering Manager if no clear route
        if not routes:
            routes.append("engineering-manager")
            
        return list(set(routes)) # Remove duplicates

    def run(self, situation: str) -> str:
        metrics = self.engine._load_metrics()
        routes = self._detect_routing(situation, metrics)
        
        print(f"Routing situation to: {', '.join(routes)}")
        
        results = {}
        for agent in routes:
            print(f"Invoking {agent}...")
            # Here we could also dynamically load relevant skills for the agent
            results[agent] = self.engine.execute(agent, situation)

        if len(routes) == 1:
            return results[routes[0]]

        # Synthesize results using the Engineering Manager persona
        print("Synthesizing results via Engineering Manager...")
        synthesis_input = f"""
SITUATION: {situation}

SPECIALIST FINDINGS:
{self._format_results(results)}

Please synthesize these findings into a coherent response following the Engineering Manager output contract.
"""
        return self.engine.execute("engineering-manager", synthesis_input)

    def _format_results(self, results: Dict[str, str]) -> str:
        formatted = ""
        for agent, result in results.items():
            formatted += f"\n--- FINDINGS FROM {agent.upper()} ---\n{result}\n"
        return formatted

if __name__ == "__main__":
    orchestrator = Orchestrator()
    res = orchestrator.run("We are seeing some burnout signals in the team and our sprint velocity is dropping.")
    print(res)
