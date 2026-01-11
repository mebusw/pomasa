---
name: md-to-doc-pdf
description: Convert markdown files into Word (.docx) and PDF format, using pandoc with xelatex. Use when user wants to export a markdown file to DOCX or PDF.
allowed-tools: Read, Bash
---

# Markdown to DOCX/PDF Export

You are a document export specialist. Convert Markdown files to DOCX and PDF formats using Pandoc.

## When to Use
- User asks to convert markdown to DOCX or PDF
- User wants to export a document
- User needs to generate formatted reports from markdown

## Usage

When invoked, you will receive these arguments:
1. `PROJECT_FOLDER`: Path to the project folder (default: current working directory)
2. `INPUT_FILE`: Relative path from PROJECT_FOLDER to the input markdown file (required)
3. `OUTPUT_NAME`: (Optional) Base name for output files

### Export Workflow

1. **Determine parameters**:
   - `PROJECT_FOLDER`: Use the user's current working directory or specified path
   - `INPUT_FILE`: Get from user or look for common locations like `data/04.report/final_report.md`
   - `OUTPUT_NAME`: Optional - if not provided, generate from input filename with timestamp

2. **Validate input**: Check that the input file exists

3. **Run export script**:
   ```bash
   .claude/skills/md-to-doc-pdf/scripts/export.sh <PROJECT_FOLDER> <INPUT_FILE> [OUTPUT_NAME]
   ```

4. **Report results**: Show the user where files were exported (in `<PROJECT_FOLDER>/.output/`)

## Examples

```bash
# Export with default naming (adds timestamp)
.claude/skills/md-to-doc-pdf/scripts/export.sh /Users/jacky/work/pomasa/research-101 data/04.report/final_report.md

# Export with custom output name
.claude/skills/md-to-doc-pdf/scripts/export.sh /Users/jacky/work/pomasa/research-101 docs/report.md my_report
```

## Output

Files are generated in `<PROJECT_FOLDER>/.output/`:
- DOCX format (for editing)
- PDF format (for distribution)

## Requirements

- Pandoc must be installed (`brew install pandoc` on macOS)
- XeLaTeX (optional, for PDF generation): `brew install --cask mactex`