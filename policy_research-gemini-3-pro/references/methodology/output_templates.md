# 输出模板规范

本文件定义了最终研究报告的 Markdown 结构。所有 Agent 在生成各自部分的报告时，应参考此结构。

## 总体结构 (Final Report Structure)

```markdown
% 宏观政治经济洞察及其对汽车行业与德赛西威的影响研究报告
% 作者：Deep Research AI
% 日期：2026年01月10日

# 摘要 (Executive Summary)

（简要概述主要发现，包括宏观趋势的核心判断、对汽车行业的关键影响以及对德赛西威的战略建议。）

# 1. 宏观政治经济趋势分析 (Macro-Political & Economic Trends)

## 1.1 "十五五"规划前瞻 (15th Five-Year Plan Outlook)
（分析国家层面的战略方向、重点发展领域。）

## 1.2 中央经济工作会议解读 (Central Economic Work Conference Analysis)
（解读最新的财政政策、货币政策及经济工作重点。）

## 1.3 宏观经济未来走势 (Future Economic Trends)
（GDP增速、通胀、投资、消费等关键宏观指标预测。）

# 2. 汽车行业影响分析 (Impact on Automotive Industry)

## 2.1 政策对汽车行业的传导机制 (Policy Transmission Mechanism)
（宏观政策如何具体影响汽车产业链。）

## 2.2 市场趋势与竞争格局 (Market Trends & Competition)
（新能源、智能化、出海等趋势在宏观背景下的演变。）

## 2.3 关键挑战与机遇 (Key Challenges & Opportunities)
（供应链安全、技术创新支持、消费刺激政策等。）

# 3. 德赛西威 (Desay SV) 影响与应对 (Impact on Desay SV)

## 3.1 德赛西威业务现状简述 (Desay SV Business Overview)
（智能座舱、智能驾驶、网联服务等核心业务。）

## 3.2 宏观与行业趋势的具体影响 (Specific Impacts)
- **正面影响**: （例如：智能化政策红利、自主品牌崛起）
- **负面影响**: （例如：芯片制裁风险、价格战压力）

## 3.3 战略建议 (Strategic Recommendations)
（基于上述分析，提出具体的应对策略。）

# 4. 结论 (Conclusion)

（总结全文，重申核心观点。）

# 参考文献 (References)

（列出所有引用的政策文件、研报、新闻链接。）
```

## 格式规范 (Format Specifications)

遵循 **STR-08 Pandoc-Ready Markdown** 规范：

1.  **标题**: 使用 `#` 表示一级标题，`##` 表示二级标题，以此类推。标题前后保持空行。
2.  **列表**: 使用 `-` 或 `1.`，列表项需缩进。
3.  **引用**: 使用 `> `。
4.  **表格**: 使用标准 Markdown 表格语法。
    ```markdown
    | 列1 | 列2 |
    |-----|-----|
    | 内容 | 内容 |
    ```
5.  **图片**: `![图注](路径)`。
6.  **脚注/链接**: `[文本](URL)`。
