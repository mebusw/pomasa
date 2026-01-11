#!/bin/bash

# STR-09 Deliverable Export Pipeline
# Converts Markdown reports to DOCX and PDF

INPUT_FILE="data/04_final_report/final_research_report.md"
OUTPUT_DIR="_output"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BASENAME="industry_research_report_${TIMESTAMP}"

mkdir -p "$OUTPUT_DIR"

if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file $INPUT_FILE not found."
    exit 1
fi

echo "Exporting $INPUT_FILE..."

# Check for Pandoc
if ! command -v pandoc &> /dev/null; then
    echo "Error: Pandoc is not installed. Please install it to generate reports."
    exit 1
fi

# Export to DOCX
pandoc "$INPUT_FILE" \
    -o "$OUTPUT_DIR/${BASENAME}.docx" \
    --toc \
    --reference-doc="scripts/docx-template.docx" 2>/dev/null || \
    pandoc "$INPUT_FILE" -o "$OUTPUT_DIR/${BASENAME}.docx" --toc

echo "Generated DOCX: $OUTPUT_DIR/${BASENAME}.docx"

# Export to PDF (requires LaTeX/XeLaTeX with CJK support)
if command -v xelatex &> /dev/null; then
    pandoc "$INPUT_FILE" \
        -o "$OUTPUT_DIR/${BASENAME}.pdf" \
        --pdf-engine=xelatex \
        -H scripts/latex-header.tex \
        -V mainfont="PingFang SC" \
        --toc
    echo "Generated PDF: $OUTPUT_DIR/${BASENAME}.pdf"
else
    echo "Warning: xelatex not found. Skipping PDF generation."
fi
