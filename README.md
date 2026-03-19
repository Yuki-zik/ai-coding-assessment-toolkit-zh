# 代理考试脚手架

这是一个面向 **2 小时 AI coding 笔试** 的 agent 项目增强仓库。

它不是从零新写的一套考试框架，也不是把原始 ECC 原封不动搬过来。它是在 ECC 正文方法基础上的**继承式重构**：保留最有用的 planning、search-first、TDD、verification、security、debug 和交付说明方法，再压缩成更适合考试使用的极简主路径。

本仓库只保留压缩后的主路径和中文化说明，不附带 ECC 原始正文归档。若你需要查看来源关系和迁移关系，可以阅读 [docs/migration-report.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/migration-report.md)。

## 这个仓库解决什么问题

它主要解决 4 件事：

- 帮你在 2 小时内快速收敛范围
- 帮 AI 助手更容易选对实现路径
- 减少原始大而全仓库带来的上下文噪音
- 让最终交付更适合 AI 评分器和人工评委阅读

## 支持哪些题型

当前主路径只覆盖 4 类最常见的 agent 项目 archetype：

1. `gateway / proxy / aggregator / BFF`
2. `tool-using assistant / function-calling agent`
3. `retrieval / knowledge assistant / lightweight RAG`
4. `workflow / planner-executor / task automation`

如果题目开始往这些方向发散，一般要主动裁剪：

- 多 agent control plane
- 完整 RAG 平台
- 多租户、计费、后台管理
- 复杂 orchestration / scheduling / observability

## 先分清楚：哪些文档给人，哪些给 AI

给人类用户看的：

- [README.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/README.md)
- [docs/human-start-here.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/human-start-here.md)
- [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)

主要给 AI 助手看的：

- [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
- [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)

也就是说，`AGENTS.md` 不是默认给你先读的入口。它是为了 AI coding 环境自动读取仓库级指令而保留的。

## 3 分钟快速上手

如果你马上要做题，直接按这个顺序来：

1. 先看 [docs/human-start-here.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/human-start-here.md)。
2. 再看 [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)。
3. 如果你要让 AI 在**真实项目目录**里维护 agent 工作流，先看 [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)，并在目标项目根目录初始化 `agent/`。
4. 如果环境支持技能，让 AI 再去遵循 [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md) 和这些技能：
   - [.agents/skills/mvp-scope-2h/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/mvp-scope-2h/SKILL.md)
   - [.agents/skills/agent-archetype-select/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/agent-archetype-select/SKILL.md)
   - [.agents/skills/agent-contract-first/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/agent-contract-first/SKILL.md)
5. 如果环境不支持技能，直接复制 [prompts/exam-kickoff.txt](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/exam-kickoff.txt)。
6. 如果你想直接用中文 prompt，去看 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)。
7. 用 [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md) 做范围收敛。
8. 用 [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md) 先锁定 contract。
9. 实现最小 happy path。
10. 只补 1-3 个关键路径测试。
11. 按 [templates/readme-outline.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/readme-outline.md) 收尾。
12. 如果该项目启用了项目侧 `agent/` 工作流，结束前更新目标项目里的 `agent/` 文档，然后运行 `./scripts/verify.sh`。

## 如果你是第一次用，建议这样读

为了最快进入状态，建议按下面顺序读：

1. [docs/human-start-here.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/human-start-here.md)
作用：先帮你分清人类入口和 AI 入口，避免一上来走错文档。

2. [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
作用：直接讲考试流程、时间切分、卡住时怎么切换模式。

3. [docs/exam-archetypes.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-archetypes.md)
作用：先判断题目属于哪类，避免一上来写错方向。

4. [docs/gateway-mvp-strategy.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/gateway-mvp-strategy.md)
作用：如果题目明显像 gateway / proxy / BFF，这份最重要。

5. [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)
作用：直接复制中文 prompt 给 AI，用来开题、debug、写 README。

6. [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)
作用：告诉 AI 如何在真实考试项目目录内部创建并维护 `agent/` 工作流。

7. [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md) + [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md)
作用：在真正动手写代码之前，先把 scope 和 contract 固定住。

## 这 6 个技能是干什么的

原始 ECC 把这些能力分散在 agents、commands、rules 和大量技能里。现在压缩成 6 个考试型技能：

- `mvp-scope-2h`
  作用：把题目压成 2 小时可交付范围
- `agent-archetype-select`
  作用：判断题目属于哪种 archetype
- `agent-contract-first`
  作用：先定义最小 contract 再实现
- `minimal-test-gate`
  作用：只补 1-3 个高价值测试
- `debug-fast-fail`
  作用：快速恢复主链路，不做大重构
- `judge-facing-readme`
  作用：生成面向评委的交付说明

每个技能里都有 `来源线索`，能直接看到它继承了哪些 ECC 旧文件。

## 中文 Prompt 模板在哪

如果你希望 AI 助手直接按中文工作流推进，优先看这个文件：

- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)

里面已经准备好的模板包括：

- 通用开题
- 范围收敛
- 先定契约
- 调试：启动失败
- 调试：测试失败
- 网关 / 代理 / BFF
- 工具调用型助手
- 检索 / 轻量级 RAG
- 工作流 / 规划-执行器
- 面向评委的 README 收尾
- 让 AI 帮你继续改 prompt 的元提示

## 推荐工作流

如果你不想想太多，考试时直接按这个套路走：

1. 先复述题目。
2. 先选 archetype。
3. 先做 scope 和 non-goals。
4. 先定 contract。
5. 再写最小主链路。
6. 再补关键路径测试。
7. 最后写 judge-facing README。

不要反过来做，不要一上来就写抽象层，也不要一开始就追求“可扩展平台”。

## 目录说明

```text
.
├── AGENTS.md
├── README.md
├── .agents/
│   └── skills/
│       ├── mvp-scope-2h/
│       ├── agent-archetype-select/
│       ├── agent-contract-first/
│       ├── minimal-test-gate/
│       ├── debug-fast-fail/
│       └── judge-facing-readme/
├── docs/
│   ├── exam-archetypes.md
│   ├── exam-usage-guide.md
│   ├── gateway-mvp-strategy.md
│   ├── human-start-here.md
│   ├── migration-report.md
│   ├── optional-subagent-usage.md
│   └── project-agent-workflow.md
├── prompts/
│   ├── exam-kickoff.txt
│   └── zh-cn-scenario-prompts.md
├── scripts/
│   ├── init-project-agent-docs.sh
│   └── verify.sh
└── templates/
    ├── contract-template.md
    ├── final-checklist.md
    ├── project-agent/
    ├── readme-outline.md
    └── task-plan.md
```

## 哪些内容是主路径，哪些是档案

主路径：

- [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
- [.agents/skills/](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills)
- [docs/](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs)
- [prompts/](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts)
- [templates/](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates)
- [scripts/verify.sh](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/scripts/verify.sh)

档案说明：

- 本仓库不附带 ECC 原始正文归档。
- 如果你需要回看来源关系，请阅读 [docs/migration-report.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/migration-report.md) 了解保留、压缩和迁移的对应关系。

对人类最重要的入口是：

- [docs/human-start-here.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/human-start-here.md)
- [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
- [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)
- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)

对 AI 最重要的入口是：

- [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
- [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)

## 为什么保留归档说明

这次改造不是“把原仓库删光再重写”。为了满足继承式重构要求，主路径文件保留了高价值方法；保留、压缩、归档和删除的决策逻辑，写在 [docs/migration-report.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/migration-report.md) 里。

## 自检命令

仓库唯一官方自检命令：

```bash
./scripts/verify.sh
```

它会检查：

- 主路径核心文件是否存在
- `.agents/skills/` 是否仍然只有 6 个技能
- 每个技能是否带有 `来源线索`
- 旧 ECC 主路径表面层是否已退出当前仓库根目录
- 是否还保留了与迁移说明相对应的结构约束

## 一句话建议

如果你时间很紧，先读 [docs/human-start-here.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/human-start-here.md) 和 [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)，然后直接去 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md) 复制一个最贴近你当前阶段的中文 prompt 开始做题。
