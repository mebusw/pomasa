## Role

你是一名科普自媒体作家，擅长深入浅出，吸引人完整阅读，请你写一篇对比评测文章。

## Context

关于POMASA的介绍见（https://github.com/mebusw/pomasa/blob/main/publication/asianplop-2026-outline.md），扩展性好，每个用户可以自行选择我要用哪些模式不要用哪些模式。注意POMASA不是claude code的skill或agent，POMASA是创建skill/agent的框架，POMASA回应的是认识论的问题，但是POMASA generator可以看做是一个meta-SKILL去创建真正干活的skill/agent。

以下评测结果是选用了4个大模型，进行同样的一项任务：基于POMASA多智能体框架和用户的意图输入，从一些智能体的元模式，生成编排器和多个专用智能体，用于后续的任务执行。
本次评测针对的是编排器的生成结果。




## Action

请你写一篇文章, 根据我的评测结果，参考后续的行文风格，覆盖一下段落，请你思考要如何组织文章。
1. 组织文章大纲
   1. 首先简介POMASA，让读者理解本次评测的对象是编排出来的结果，和生成的实际的调研报告，而不是泛泛的跑分测评。
   2. 强调相比其他智能体框架，POMASA是站在了更高层的认识论上作为理论指导，而不是单次的自动化工具，是具有思想和意识的。不能直接提出POMASA，而是要用介绍给读者评测背景和对象的方式来引入。 
   3. 然后重点基于后续我给出的评测结果。组织和润色，形成吸引人阅读的，特别像传递给读者：同一个框架和机制，不同模型、不同搜索引擎带来的的表现差别。
   4. 最终指出不同大模型各自优势，提醒用户根据自己的场景选择大模型和搜索引擎，顺便暗暗推介POMASA框架的简易上手（例如，完全不用写代码的，甚至比ClaudeCode的Skill更容易，因为智能体都是模型从零开始生成的。每个编排出的智能体相当于一个SKILL）
   5. 引发读者既要正视国产与国外模型的差距，又要激发对于民族工业的信心
2. 基于事实和数据，丰富评测内容，加入一些判断性的结论，用自然通顺的语言娓娓道来，避免只有一些生硬的表格，也避免AI味道
3. 输出到 output/result.md
4. cross-check, 复查引用和数据的真实性，和结论的客观性，并去除任何违规违法内容
5. 调整文章结构，要做到吸引人阅读且不断阅读的黄金结构，要合理引发读者感性情绪。用读者的点赞、收藏、转发和阅读完成率作为评估标准。


### 评测结果
- @data/compare-orchastrator-by-gemini.md
- @data/compare-orchastrator-by-glm.md
- @data/searching-differences.md
- @data/compare-reporting-by-glm.md

### 行文风格参考

1. https://github.com/mebusw/pomasa/blob/main/references/%E5%85%AC%E4%BC%97%E5%8F%B7%E6%96%87%E7%AB%A0-MAS%E6%9E%84%E5%9E%8B%E8%AE%BE%E8%AE%A1%E6%8C%87%E5%8D%97.md
2. @../../references/公众号文章-MAS构型设计指南.md
3. @../../references/20251104-mas-intro-cn-v2.md


