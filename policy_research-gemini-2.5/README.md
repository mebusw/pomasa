# Macro-Political & Economic Insight Research System

**Project ID**: industry_research
**Topic**: Impact of 15th Five-Year Plan & Central Economic Work Conference on Automotive Industry & Desay SV.

## System Architecture

This system is built using the **POMASA (Pattern-Oriented Multi-Agent System Architecture)**.

### Agents (`agents/`)
1.  **00.orchestrator**: Manages the overall workflow.
2.  **01.policy_analyst**: Researches macro policies (15th Five-Year Plan, Central Economic Work Conference).
3.  **02.auto_industry_analyst**: Analyzes impact on the automotive sector (NEV, Intelligent Connected Vehicles).
4.  **03.corp_strategy_analyst**: Analyzes impact on Desay SV (德赛西威).
5.  **04.reviewer**: Compiles and quality-checks the final report.

### Directory Structure
- `agents/`: Agent Blueprints (Prompts).
- `data/`: Runtime data and intermediate outputs.
- `references/`: Domain knowledge and methodology guidelines.
- `scripts/`: Tools for exporting reports.
- `_output/`: Final exported documents (DOCX/PDF).

## How to Run

### Prerequisites
- An intelligent runtime (e.g., a CLI tool that can read these blueprints and execute LLM calls).
- **Pandoc** (for generating DOCX/PDF reports).
- **XeLaTeX** (optional, for PDF generation).

### Step 1: Execute the Agents
You should run the Orchestrator, which will guide you (or the system) to run the subsequent agents.

If running manually or step-by-step:
1.  **Macro Analysis**: Run `01.policy_analyst`.
2.  **Industry Analysis**: Run `02.auto_industry_analyst`.
3.  **Corporate Analysis**: Run `03.corp_strategy_analyst`.
4.  **Final Compilation**: Run `04.reviewer`.

### Step 2: Export Deliverables
After the final report is generated in `data/04_final_report/final_research_report.md`, run:

```bash
chmod +x scripts/export.sh
./scripts/export.sh
```

This will create the DOCX and PDF files in the `_output/` directory.

## Customization
- **Templates**: Place a custom `docx-template.docx` in `scripts/` to style the output.
- **Blueprints**: Edit files in `agents/` to refine the research focus.
