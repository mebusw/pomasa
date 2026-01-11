## Role

你是一名科普自媒体作家，擅长深入浅出，吸引人完整阅读，请你写一篇对比评测文章。

## Context

以下评测结果是选用了4个大模型，进行同样的一项任务：基于POMASA多智能体框架和用户的意图输入，从一些智能体的元模式，生成编排器和多个专用智能体，用于后续的任务执行。
本次评测针对的是编排器的生成结果
关于POMASA的介绍见附件（https://github.com/mebusw/pomasa/blob/main/publication/asianplop-2026-outline.md），注意POMASA不是skill/agent，POMASA是创建skill/agent的框架，POMASA回应的是认识论的问题，但是POMASA generator可以作为一个meta-SKILL去创建真正干活的skill/agent



## Action

写一篇文章，首先简介POMASA，让读者理解本次评测的对象，然后重点基于后续我给出的评测结果润色，形成吸引人阅读的，特别像传递给读者：同一个框架和机制，不同模型的表现的差别。最终提醒用户根据自己的场景选择，顺便推介POMASA框架的简易上手（完全不用写代码的，甚至比ClaudeCode的Skill更容易，因为智能体都是模型从零开始生成的。每个编排出的智能体相当于一个SKILL）



## 附：行文风格参考

https://github.com/mebusw/pomasa/blob/main/references/%E5%85%AC%E4%BC%97%E5%8F%B7%E6%96%87%E7%AB%A0-MAS%E6%9E%84%E5%9E%8B%E8%AE%BE%E8%AE%A1%E6%8C%87%E5%8D%97.md

## 附：提示词


你将帮我分析比较几个LLM在生产智能体编排的能力表现。
我给他们的原始输入都是同样的 @user_input.md  和 @pattern-catalog/ 。

他们的表现不一样，请你详细分析对比他们生成的结果，输出到一个md文件中。
1. gemini-2.5-flash生成的，在 @policy_research-gemini-2.5/agents/00.orchestrator.md  
2. gemini-3-pro生成的，在 @policy_research-gemini-3-pro/agents/00.orchestrator.md  
3. claude-opus-4生成的，在 @policy_research-claude-opus-4/agents/00.orchestrator.md 
4. glm-4.7生成的，在 @policy_research-glm-4.7/agents/00.orchestrator.md



再将帮我分析比较几个LLM在多智能体执行的能力表现（例如：真善美、高广深或suggested by AI）。他们的原始输入是他们各自编排出来的agents.

他们的表现不一样，请你详细分析对比他们生成的结果，输出到一个md文件中。
1. gemini-2.5-flash生成的，在 @policy_research-gemini-2.5/data/04_final_report/final_research_report.md  
2. gemini-3-pro生成的，在 @policy_research-gemini-3-pro/data/05_final/final_report.md  
3. claude-opus-4生成的，在 @policy_research-claude-opus-4/data/04.reports/final_report.md  
4. glm-4.7生成的，在 @policy_research-glm-4.7/data/04.report/final_report.md
5. glm-4.7+googleSearchMCP 生成的，在 @policy_research-glm-4.7-with-google-search/data/04.report/final_report.md
