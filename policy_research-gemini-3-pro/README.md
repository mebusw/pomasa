# Macro-Political/Economic Insights and Corporate Impact Research System

**Project Identifier**: deep_research-gemini-3-pro
**Research Topic**: Macro-political/economic insights (15th Five-Year Plan, Central Economic Work Conference) -> Trends -> Impact on Auto Industry -> Impact on Desay SV

## System Architecture

This is a **Pattern-Oriented Multi-Agent System (POMASA)** generated based on user requirements.

### Adopted Patterns

- **Core**: COR-01 Prompt-Defined Agent, COR-02 Intelligent Runtime
- **Structure**: STR-01 Reference Data Configuration, STR-02 Filesystem Data Bus, STR-03 Workspace Isolation, STR-04 Business-Driven Agent Design, STR-05 Composable Document Assembly, STR-06 Methodological Guidance, STR-08 Pandoc-Ready Markdown, STR-09 Deliverable Export Pipeline
- **Behavior**: BHV-01 Orchestrated Agent Pipeline, BHV-02 Faithful Agent Instantiation, BHV-05 Grounded Web Research
- **Quality**: QUA-01 Embedded Quality Standards, QUA-03 Verifiable Data Lineage

## Directory Structure

```
deep_research-gemini-3-pro/
├── agents/                  # Agent Blueprints
│   ├── 00.orchestrator.md
│   ├── 01.macro_policy_analyst.md
│   ├── 02.auto_industry_analyst.md
│   ├── 03.corp_strategy_analyst.md
│   └── 04.reviewer.md
├── references/              # Reference Data
│   ├── domain/              # Domain knowledge
│   └── methodology/         # Methodological guidance & templates
├── scripts/                 # Utility scripts
│   ├── export.sh            # Export to DOCX/PDF
│   ├── latex-header.tex     # PDF format control
│   └── docx-template.docx   # DOCX format template
├── data/                    # Runtime Data
├── _output/                 # Deliverables
├── wip/                     # Work in Progress
└── README.md
```

## How to Run

### Prerequisites

- A Multi-Agent Runtime capable of reading `agents/` blueprints.
- **Pandoc** and **XeLaTeX** (for PDF export) installed on the host system.

### Execution Steps

1. **Initialization**: The Orchestrator (`agents/00.orchestrator.md`) initiates the process.
2. **Analysis**:
   - `01.macro_policy_analyst`: Researches macro trends (15th Five-Year Plan, etc.).
   - `02.auto_industry_analyst`: Analyzes impact on the Auto Industry.
   - `03.corp_strategy_analyst`: Analyzes impact on Desay SV.
3. **Review**: `04.reviewer` compiles and reviews the final report.
4. **Export**: Run `scripts/export.sh` to generate DOCX/PDF deliverables in `_output/`.

```bash
# Example for exporting
./scripts/export.sh
```

## Configuration

- **Domain Knowledge**: Add background materials to `references/domain/`.
- **Methodology**: Adjust research guidelines in `references/methodology/`.
