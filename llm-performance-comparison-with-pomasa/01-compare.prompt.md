
## 任务一
你将帮我分析比较几个LLM在生产智能体编排的能力表现。
我给他们的原始输入都是同样的 @user_input.md  和 @pattern-catalog/ ，输出是编排结果。

他们的表现不一样，请你详细分析对比他们生成的结果，输出到一个data/compare-orchastrator.md文件中。
1. gemini-2.5-flash生成的，在 @policy_research-gemini-2.5/agents/00.orchestrator.md  
2. gemini-3-pro生成的，在 @policy_research-gemini-3-pro/agents/00.orchestrator.md  
3. claude-opus-4生成的，在 @policy_research-claude-opus-4/agents/00.orchestrator.md 
4. glm-4.7生成的，在 @policy_research-glm-4.7/agents/00.orchestrator.md


## 任务二
帮我分析比较几个LLM在多智能体执行的能力表现。一方面是表面性的，比如字数、数据量和引用数量，另一方面是文章的商业价值，可以从真善美、高广深或(suggested by AI)。他们的原始输入是他们各自编排出来的agents，输出则是报告文章。

他们的表现不一样，请你详细分析对比他们生成的结果，输出到data/compare-reporting-by-glm.md文件中。
1. gemini-2.5-flash生成的，在 @policy_research-gemini-2.5/data/04_final_report/final_research_report.md  
2. gemini-3-pro生成的，在 @policy_research-gemini-3-pro/data/05_final/final_report.md  
3. claude-opus-4生成的，在 @policy_research-claude-opus-4/data/04.reports/final_report.md  
4. glm-4.7生成的，在 @policy_research-glm-4.7/data/04.report/final_report.md
5. glm-4.7+googleSearchMCP 生成的，在 @policy_research-glm-4.7-with-google-search/data/04.report/final_report.md
