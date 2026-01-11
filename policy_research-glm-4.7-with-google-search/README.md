# 宏观政治经济洞察研究系统

## 项目简介

本项目是一个基于 POMASA（Pattern-Oriented Multi-Agent System Architecture）框架构建的声明式多智能体研究系统，用于分析宏观政治经济政策对汽车行业及德赛西威的影响。

### 研究目标

1. 分析国家层面政治政策与经济的未来趋势（"十五五"规划、中央经济工作会议等）
2. 研究这些趋势对汽车行业的影响
3. 评估这些趋势对德赛西威的具体影响
4. 提供针对性的战略建议

## 系统架构

本系统遵循 POMASA 框架的模式设计，采用以下架构模式：

### 核心模式（COR - 必选）

- **COR-01**: Prompt-Defined Agent - 使用自然语言蓝图定义 Agent 行为
- **COR-02**: Intelligent Runtime - 依赖智能运行时环境（如 Claude Code）

### 结构模式（STR - 必选/推荐）

- **STR-01**: Reference Data Configuration - 外部化领域知识和方法论指导
- **STR-02**: Filesystem Data Bus - 通过文件系统在 Agent 之间传递数据
- **STR-03**: Workspace Isolation - Agent 仅在指定工作目录内执行
- **STR-04**: Business-Driven Agent Design - Agent 划分遵循业务流程
- **STR-05**: Composable Document Assembly - 分段生成，机械组装长文档
- **STR-06**: Methodological Guidance - 提供数据源、分析方法、输出模板指导
- **STR-08**: Pandoc-Ready Markdown Format - 确保正确转换为 DOCX/PDF
- **STR-09**: Deliverable Export Pipeline - 导出最终报告为 DOCX/PDF

### 行为模式（BHV - 必选/推荐）

- **BHV-01**: Orchestrated Agent Pipeline - 按阶段顺序协调多个 Agent
- **BHV-02**: Faithful Agent Instantiation - 子代理必须读取完整 Blueprint
- **BHV-05**: Grounded Web Research - 先 WebFetch 再使用网络信息

### 质量模式（QUA - 必选/推荐）

- **QUA-01**: Embedded Quality Standards - 在 Blueprint 中嵌入质量标准

## 项目结构

```
policy_research-glm-4.7/
├── agents/                           # Agent 蓝图
│   ├── 00.orchestrator.md            # 总协调器
│   ├── 01.policy_data_collector.md   # 政策数据收集与分析
│   ├── 02.industry_impact_analyzer.md # 行业影响分析
│   ├── 03.corporate_impact_analyzer.md # 企业影响分析
│   └── 04.report_generator.md        # 报告生成器
│
├── references/                       # 参考数据
│   ├── domain/                       # 领域知识（预留）
│   └── methodology/                  # 方法论指导
│       ├── research-overview.md      # 研究概述
│       ├── data-sources.md           # 数据来源指南
│       ├── analysis-methods.md       # 分析方法指南
│       └── output-template.md        # 输出模板
│
├── data/                             # 运行时数据
│   ├── 01.materials/                 # 原始材料
│   │   ├── 01.policy_documents/      # 政策文件
│   │   ├── 02.industry_data/         # 行业数据
│   │   └── 03.corporate_info/        # 企业信息
│   ├── 02.analysis/                  # 分析结果
│   │   ├── 01.policy_analysis/       # 政策分析
│   │   ├── 02.industry_impact/       # 行业影响分析
│   │   ├── 03.corporate_impact/      # 企业影响分析
│   │   └── 04.synthesis/             # 综合研判
│   ├── 03.sections/                  # 报告章节
│   ├── 04.report/                    # 最终报告
│   └── 05.final/                     # 最终交付物
│
├── scripts/                          # 工具脚本
│   ├── assemble.sh                   # 报告组装脚本
│   ├── export.sh                     # 导出 DOCX/PDF 脚本
│   ├── latex-header.tex              # PDF 格式控制
│   └── docx-template.docx            # DOCX 格式模板（需自行创建）
│
├── _output/                          # 交付物输出目录
├── wip/                              # 工作进行中记录
└── README.md                         # 本文件
```

## 使用方法

### 前置要求

1. **智能运行时环境**：需要 Claude Code 或类似的具有文件访问和 AI 能力的环境
2. **Pandoc**（可选）：用于导出 DOCX/PDF
   ```bash
   # macOS
   brew install pandoc

   # Ubuntu/Debian
   sudo apt-get install pandoc
   ```
3. **XeLaTeX**（可选，用于 PDF 导出）：
   ```bash
   # macOS
   brew install mactex-no-gui

   # Ubuntu/Debian
   sudo apt-get install texlive-xetex
   ```

### 执行研究

1. **启动总协调器**

   在 Claude Code 中执行：
   ```
   请阅读 policy_research-glm-4.7/agents/00.orchestrator.md 并严格按照该 Blueprint 执行
   ```

2. **等待执行完成**

   总协调器将依次调用各个 Agent，完成整个研究流程：
   - 阶段一：政策数据收集
   - 阶段二：行业影响分析
   - 阶段三：企业影响分析
   - 阶段四：综合研判
   - 阶段五：报告生成
   - 阶段六：交付物导出

3. **查看结果**

   最终研究报告将生成在：
   - Markdown 版本：`data/04.report/final_report.md`
   - DOCX 版本：`_output/宏观政治经济洞察及其对汽车行业和德赛西威的影响研究 [时间戳].docx`
   - PDF 版本：`_output/宏观政治经济洞察及其对汽车行业和德赛西威的影响研究 [时间戳].pdf`

### 单独执行某个阶段

如果需要单独执行某个阶段（例如重新生成报告）：

```
请阅读 policy_research-glm-4.7/agents/04.report_generator.md 并严格按照该 Blueprint 执行

参数：
- EXECUTION_ID: [唯一标识]
```

### 手动导出报告

如果需要手动导出报告：

```bash
cd policy_research-glm-4.7

# 导出为 DOCX 和 PDF
./scripts/export.sh data/04.report/final_report.md
```

## 调整系统

### 修改研究目标

编辑 `references/methodology/research-overview.md`，修改研究目标、核心问题等内容。

### 调整数据来源

编辑 `references/methodology/data-sources.md`，添加或删除数据来源类型。

### 修改分析方法

编辑 `references/methodology/analysis-methods.md`，调整分析框架和方法。

### 调整输出格式

编辑 `references/methodology/output-template.md`，修改报告结构和格式规范。

### 调整 Agent 行为

编辑相应 Agent 的 Blueprint 文件（`agents/*.md`）。

## 质量保证

本系统采用以下质量保证机制：

1. **嵌入式质量标准**：每个 Agent Blueprint 中都包含质量标准和完成标准
2. **验证机制**：总协调器在每阶段完成后验证输出质量
3. **基于事实的网络研究**：必须先获取完整网页内容才能使用信息
4. **可验证的数据血缘**：所有数据都有明确的来源标注

## 注意事项

1. **工作空间隔离**：所有 Agent 都被限制在项目目录内执行
2. **Agent 调用规范**：遵循 BHV-02 模式，子代理必须自己读取完整 Blueprint
3. **网络研究规范**：遵循 BHV-05 模式，不能直接使用搜索摘要
4. **文档格式规范**：遵循 STR-08 模式，确保正确转换为 DOCX/PDF

## 技术依赖

- **POMASA 框架**：v0.8
- **Claude Code**：作为智能运行时环境
- **Pandoc**：文档格式转换
- **XeLaTeX**：PDF 生成（支持中文）

## 版本历史

- **v1.0** (2025-01-11)：初始版本生成

## 许可

本项目遵循 POMASA 框架的许可协议。

## 联系方式

如有问题或建议，请联系项目维护者。
