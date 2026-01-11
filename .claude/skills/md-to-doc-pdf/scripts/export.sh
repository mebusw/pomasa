#!/bin/bash

# STR-09 Deliverable Export Pipeline
# Converts Markdown reports to DOCX and PDF
#
# Usage: export.sh <PROJECT_FOLDER> <INPUT_FILE> [OUTPUT_NAME]
#   PROJECT_FOLDER: Path to the project folder
#   INPUT_FILE: Relative path from PROJECT_FOLDER to the input markdown file
#   OUTPUT_NAME: (Optional) Base name for output files (without extension)
#
# Examples:
#   export.sh /path/to/project data/04.report/final_report.md
#   export.sh /path/to/project docs/report.md my_report

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Parse arguments
PROJECT_FOLDER="${1}"
INPUT_FILE="${2}"
OUTPUT_NAME="${3}"

# Validate arguments
if [ -z "$PROJECT_FOLDER" ] || [ -z "$INPUT_FILE" ]; then
    echo -e "${RED}Error: Missing required arguments${NC}"
    echo "Usage: $0 <PROJECT_FOLDER> <INPUT_FILE> [OUTPUT_NAME]"
    echo ""
    echo "Examples:"
    echo "  $0 /path/to/project data/04.report/final_report.md"
    echo "  $0 /path/to/project docs/report.md my_report"
    exit 1
fi

# Check for Pandoc
check_pandoc() {
    if ! command -v pandoc &> /dev/null; then
        echo -e "${RED}Error: Pandoc is not installed${NC}"
        echo "Please install pandoc:"
        echo "  macOS: brew install pandoc"
        echo "  Ubuntu: sudo apt-get install pandoc"
        echo "  Other: https://pandoc.org/installing.html"
        exit 1
    fi
}

# Check for XeLaTeX (for PDF generation)
check_xelatex() {
    if ! command -v xelatex &> /dev/null; then
        echo -e "${YELLOW}Warning: XeLaTeX not found, skipping PDF generation${NC}"
        echo "To generate PDF, install a TeX distribution:"
        echo "  macOS: brew install --cask mactex"
        echo "  Ubuntu: sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-lang-chinese"
        return 1
    fi
    return 0
}

# Setup paths
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Resolve absolute paths
PROJECT_FOLDER="$(cd "$PROJECT_FOLDER" && pwd)"
INPUT_FILE="${PROJECT_FOLDER}/${INPUT_FILE}"
OUTPUT_DIR="${PROJECT_FOLDER}/_output"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

# Use provided output name or generate default
if [ -n "$OUTPUT_NAME" ]; then
    BASENAME="${OUTPUT_NAME}"
else
    # Generate default basename from input filename
    INPUT_BASENAME=$(basename "$INPUT_FILE" .md)
    BASENAME="${INPUT_BASENAME}_${TIMESTAMP}"
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Validate input file
if [ ! -f "$INPUT_FILE" ]; then
    echo -e "${RED}Error: Input file not found: ${INPUT_FILE}${NC}"
    exit 1
fi

echo -e "${GREEN}=== Markdown Export Pipeline ===${NC}"
echo "Timestamp: ${TIMESTAMP}"
echo ""

# Check dependencies
check_pandoc
HAS_XELATEX=$(check_xelatex && echo "yes" || echo "no")

# Export to DOCX
export_docx() {
    echo -e "${YELLOW}Exporting to DOCX...${NC}"

    local output_file="${OUTPUT_DIR}/${BASENAME}.docx"

    if [ -f "${SCRIPT_DIR}/docx-template.docx" ]; then
        pandoc "$INPUT_FILE" \
            -f markdown \
            -t docx \
            --reference-doc="${SCRIPT_DIR}/docx-template.docx" \
            --toc \
            -o "$output_file"
    else
        pandoc "$INPUT_FILE" \
            -f markdown \
            -t docx \
            --toc \
            -o "$output_file"
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ DOCX generated: ${output_file}${NC}"
    else
        echo -e "${RED}✗ DOCX generation failed${NC}"
        return 1
    fi
}

# Export to PDF
export_pdf() {
    if [ "$HAS_XELATEX" != "yes" ]; then
        echo -e "${YELLOW}Skipping PDF generation (XeLaTeX not installed)${NC}"
        return 0
    fi

    echo -e "${YELLOW}Exporting to PDF...${NC}"

    local output_file="${OUTPUT_DIR}/${BASENAME}.pdf"

    if [ -f "${SCRIPT_DIR}/latex-header.tex" ]; then
        pandoc "$INPUT_FILE" \
            -f markdown \
            -t pdf \
            --pdf-engine=xelatex \
            --include-in-header="${SCRIPT_DIR}/latex-header.tex" \
            --toc \
            --toc-depth=3 \
            -V geometry:margin=1in \
            -V documentclass=article \
            -V fontsize=12pt \
            -V linestretch=1.5 \
            -o "$output_file"
    else
        pandoc "$INPUT_FILE" \
            -f markdown \
            -t pdf \
            --pdf-engine=xelatex \
            --toc \
            --toc-depth=3 \
            -V geometry:margin=1in \
            -V documentclass=article \
            -V fontsize=12pt \
            -V linestretch=1.5 \
            -V CJKmainfont="STSong" \
            -o "$output_file"
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ PDF generated: ${output_file}${NC}"
    else
        echo -e "${RED}✗ PDF generation failed${NC}"
        return 1
    fi
}

# Main export flow
main() {
    echo -e "${YELLOW}Starting export process...${NC}"
    echo ""

    export_docx
    export_pdf

    echo ""
    echo -e "${GREEN}=== Export Complete ===${NC}"
    echo -e "Output directory: ${OUTPUT_DIR}"
    echo ""
    echo "Generated files:"
    for ext in docx pdf; do
        if [ -f "${OUTPUT_DIR}/${BASENAME}.${ext}" ]; then
            size=$(ls -lh "${OUTPUT_DIR}/${BASENAME}.${ext}" | awk '{print $5}')
            echo "  - ${OUTPUT_DIR}/${BASENAME}.${ext} (${size})"
        fi
    done
}

# Execute main flow
main
