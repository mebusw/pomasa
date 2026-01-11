#!/bin/bash
# export.sh - Export final report to DOCX and PDF

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="${PROJECT_ROOT}/_output"

# Input file (default)
INPUT_FILE="${1:-${PROJECT_ROOT}/data/05_final/final_report.md}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file not found: $INPUT_FILE"
    echo "Please ensure the research pipeline has completed successfully."
    exit 1
fi

# Extract title from YAML metadata or first heading
# Try YAML title first
TITLE=$(grep -m 1 '^% ' "$INPUT_FILE" | sed 's/^% //')
if [ -z "$TITLE" ]; then
    # Fallback to first markdown header
    TITLE=$(grep -m 1 '^# ' "$INPUT_FILE" | sed 's/^# //')
fi

if [ -z "$TITLE" ]; then
    TITLE="Research Report"
fi

# Sanitize title for filename
SAFE_TITLE=$(echo "$TITLE" | sed 's/[:<>