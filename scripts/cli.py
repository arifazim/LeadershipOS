import os
import sys
import argparse
import json
from dotenv import load_dotenv

# Add project root to path to allow imports from core
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from core.orchestrator import Orchestrator

load_dotenv()

# Paths
COMMANDS_DIR = "commands"

def list_commands():
    print("\nAvailable EM-OS Commands:")
    print("-" * 30)
    if os.path.exists(COMMANDS_DIR):
        for f in os.listdir(COMMANDS_DIR):
            if f.endswith(".md"):
                print(f"- {f[:-3]}")
    else:
        print("No commands found in 'commands/' directory.")
    print("")

def show_status():
    metrics_path = "memory/current_metrics.json"
    print("\nCurrent Operational Status:")
    print("-" * 30)
    if os.path.exists(metrics_path):
        with open(metrics_path, 'r', encoding='utf-8') as f:
            metrics = json.load(f)
            print(json.dumps(metrics, indent=2))
    else:
        print("No current metrics found. Run 'scripts/ingest_metrics.py' first.")
    print("")

def run_command(command_name):
    cmd_path = os.path.join(COMMANDS_DIR, f"{command_name}.md")
    situation = ""
    
    if os.path.exists(cmd_path):
        with open(cmd_path, 'r', encoding='utf-8') as f:
            situation = f.read()
    else:
        # If not a file, treat the name as the situation itself
        situation = command_name

    print(f"\nProcessing situation: {command_name}")
    print("-" * 30)
    
    orchestrator = Orchestrator()
    result = orchestrator.run(situation)
    
    print("\nFINAL OUTPUT:")
    print("-" * 30)
    print(result)
    print("-" * 30)

def main():
    parser = argparse.ArgumentParser(description="Engineering Manager OS CLI")
    subparsers = parser.add_subparsers(dest="action")

    # List command
    subparsers.add_parser("list", help="List available commands")

    # Status command
    subparsers.add_parser("status", help="Show current operational metrics")

    # Run command
    run_parser = subparsers.add_parser("run", help="Run a command or process a situation")
    run_parser.add_argument("name", help="Name of the command or a free-text situation description")

    args = parser.parse_args()

    if args.action == "list":
        list_commands()
    elif args.action == "status":
        show_status()
    elif args.action == "run":
        run_command(args.name)
    else:
        parser.print_help()

if __name__ == "__main__":
    main()
