#!/bin/bash
# Update Claude Code usage heatmap from local data
# Run periodically or before pushing profile updates

set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCRATCH="$HOME/scratch/2026_04_01_cc_heatmap"

# Regenerate stats and heatmap
cd "$SCRATCH"
uv run --project ~/.claude/cc-python python3 aggregate_all.py
uv run --project ~/.claude/cc-python python3 generate_heatmap.py

# Copy to repo
cp cc-heatmap-dark.svg "$SCRIPT_DIR/"
cp cc-heatmap-light.svg "$SCRIPT_DIR/"

echo "Heatmap updated in $SCRIPT_DIR"
