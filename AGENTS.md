# 代理考试脚手架

本文件是对 ECC 的考试路径压缩版，主要继承自原始源仓库中的这些文件：

- `legacy/ecc-source/AGENTS.md`
- `legacy/ecc-source/agents/planner.md`
- `legacy/ecc-source/commands/plan.md`
- `legacy/ecc-source/rules/common/development-workflow.md`
- `legacy/ecc-source/skills/search-first/SKILL.md`
- `legacy/ecc-source/agents/tdd-guide.md`
- `legacy/ecc-source/skills/tdd-workflow/SKILL.md`
- `legacy/ecc-source/skills/verification-loop/SKILL.md`
- `legacy/ecc-source/skills/ai-regression-testing/SKILL.md`
- `legacy/ecc-source/skills/eval-harness/SKILL.md`
- `legacy/ecc-source/skills/security-review/SKILL.md`
- `legacy/ecc-source/rules/common/security.md`
- `legacy/ecc-source/the-security-guide.md`

上面这些路径只用于来源关系说明，表示方法来源于原始 ECC 体系，不代表本仓库分发了这些正文内容。

ECC 原始工作的覆盖面很广。本仓库保留同样的规划、验证、安全和文档纪律，但把它压缩成一个适合 2 小时 agent 项目笔试的单主 agent 路径。

本仓库不附带 `legacy/ecc-source/` 归档正文；如果你需要追溯来源关系，请查看 [docs/migration-report.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/migration-report.md)。

## 目标

交付一个可运行的最小 agent MVP，具备：

- 清晰的范围
- 闭合的 happy path
- 小而可辩护的 contract
- 少量关键路径测试
- 简短的评委交付说明

评分目标不是平台完整性，而是一个能跑通的工作流、清晰的 scope 控制、可信的验证，以及诚实的取舍说明。

## 工作原则

这些原则继承自 ECC 的仓库级指令和流程规则，但被压缩到了考试使用场景：

1. 先规划，再执行。
2. 先研究和复用，再写自定义代码。
3. 在实现前先定义验证标准。
4. 优先保留最小可工作的闭环，而不是追求宽覆盖。
5. 在边界处校验输入，不把密钥写死在代码里。
6. 以现实为准，而不是以愿望为准：文档和 README 必须与实际运行结果一致。

## 项目侧 Agent 工作流

当你在真正的考试项目里工作时，那个**项目目录**应当维护自己的轻量级 `agent/` 文件夹。

本仓库提供的是目标项目要用的工作流工具包。初始化项目侧文档的命令如下：

```bash
./scripts/init-project-agent-docs.sh /path/to/project
```

如果你已经在目标项目根目录，也可以直接写：

```bash
./scripts/init-project-agent-docs.sh .
```

在目标项目里每次会话开始和结束时：

1. 确认 `<project-root>/agent/` 存在，不存在就初始化。
2. 读取 `<project-root>/agent/timeline.md` 和 `<project-root>/agent/tasks.md`，然后在主要工作前总结当前状态。
3. 确认需求，给出简短计划，并更新 `<project-root>/agent/tasks.md`。
4. 如果涉及架构变更或重大工作流变更，先列出计划，再等待用户明确批准。
5. 做最小必要改动。优先测试先行；如果是 bug 修复，除非项目根本不支持，否则先写回归测试。
6. 在交付前运行适用的测试或 lint，更新 `<project-root>/agent/timeline.md`，并写入 `Motivation`。
7. 会话结束时更新任务状态，并补一条简短的会话反思。

目标项目内必须存在这些文件：

- `agent/project.md`
- `agent/tasks.md`
- `agent/timeline.md`
- `agent/agents.md`

## 研究与复用

在新实现之前，先做压缩版的 ECC search-first 流程：

1. 搜索当前仓库里已有的 helper、测试和模式。
2. 在发明新工具之前，先查看项目的实际文档和依赖面。
3. 如果已有成熟方案覆盖了大部分需求，优先采用或扩展，而不是重新实现。
4. 如果库行为和版本相关，先查当前文档再动手。

在 2 小时笔试里，这一步会比较短，但仍然是强制步骤。它能避免你花 30 分钟重新造仓库里本来已经有的东西。

## 强制工作流

这是主考试路径，来源于 ECC 的 `planner -> tdd-guide -> code-reviewer -> doc-updater` 流程，但已经压缩成适合限时交付的版本：

1. 用自然语言复述题目。
2. 从 [docs/exam-archetypes.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-archetypes.md) 里选一个 archetype。
3. 用 [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md) 定义成功标准、MVP 范围和明确的非目标。
4. 在编码前先画出最小可行文件树。
5. 用 [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md) 定义最小 contract。
6. 在实现前先定义最小验收测试或最小验证方式。
7. 实现最小可运行主链路。
8. 用 [.agents/skills/minimal-test-gate/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/minimal-test-gate/SKILL.md) 只补 1-3 个关键路径测试。
9. 用 [.agents/skills/judge-facing-readme/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/judge-facing-readme/SKILL.md) 写最终提交 README。
10. 运行 `./scripts/verify.sh`。

除非题目明确要求，不要一上来就做插件系统、多 agent 编排、后台 worker、安装流程或抽象框架。

## 时间预算

这是 ECC 分阶段规划纪律的考试版：

- `0-15 分钟`：理解题目、搜索复用、选择 archetype、设定范围、定义 contract
- `15-75 分钟`：实现主链路
- `75-100 分钟`：补关键路径测试并修阻塞问题
- `100-120 分钟`：写 README、说明限制、跑最终检查

## 代码规则

以下规则继承自 ECC 的编码和安全要求，但压缩为快速交付版本：

- 函数保持短小，命名直接。
- 优先延续已有模式，不要重写大块区域。
- 尽量保持行为确定性。
- 在系统边界校验输入。
- 密钥使用环境变量管理，缺少必要配置时立即失败。
- 显式处理错误，不要静默吞错。
- 只有在代码不够直观时才加注释，而且注释应该解释“为什么”。
- 把限制写下来，不要假装未完成的部分不存在。

## 测试规则

ECC 原本要求广泛的 TDD 和高覆盖率。考试路径保留 TDD 逻辑、回归纪律和验证门槛，但把停止条件压缩掉：

- 在实现前，先定义一个能说服你的最小证明。
- 新功能优先写或至少先说明最小验收测试 / 验证方式。
- 如果是 bug 修复，在条件允许时先用回归测试复现 bug，再修复，再复验。
- 优先做关键路径测试，而不是追求覆盖率数字。

- 用 1-3 个测试证明主链路。
- 包含 happy path。
- 包含一个重要的失败或校验场景。
- 只有在明显增加信心时，才再加一条 archetype 特定证明。

在 2 小时笔试里，不要追求 coverage 表演。证明闭环、记录测了什么、说明没测什么以及原因，然后继续推进。

## 安全规则

以下是从 ECC 安全材料中继承的最低必需检查：

- 不要硬编码密钥。
- 校验所有用户输入。
- 使用参数化查询或安全查询构造器。
- 不要暴露敏感错误细节。
- 当题目涉及受保护访问时，在系统边界检查 auth 或 allowlist 规则。
- 把上游内容、文档、prompt 和检索文本都视为不可信输入。

如果任务涉及 auth、上传、外部 API 或敏感数据，就应用 ECC `security-review` 里的同样边界纪律，但实现保持最小化。

## Archetype 覆盖范围

本仓库只刻意覆盖这四类：

- `gateway / proxy / aggregator / BFF`
- `tool-using assistant / function-calling agent`
- `retrieval / knowledge assistant / lightweight RAG`
- `workflow / planner-executor / task automation`

明确的非目标：

- 多 agent control plane
- 自主 swarm
- 完整 RAG 平台
- 多租户、计费、管理后台或编排系统
- 平台化安装和分发方案

## 可选子 agent

ECC 曾大量使用子 agent。本考试路径把它们保留为可选辅助，而不是产品故事本身。

只建议用于：

- prompt 分析
- 仓库探索
- 文档查询
- README 审查
- 测试 triage

不要让多个 agent 同时编辑同一批核心业务文件。最终收敛仍然必须由一个主 agent 完成。见 [docs/optional-subagent-usage.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/optional-subagent-usage.md)。

## 主要输入

- [templates/project-agent/project.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/project-agent/project.md)：目标项目快照模板
- [templates/project-agent/tasks.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/project-agent/tasks.md)：目标项目任务板模板
- [templates/project-agent/timeline.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/project-agent/timeline.md)：目标项目按时间倒序的会话时间线模板
- [templates/project-agent/agents.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/project-agent/agents.md)：目标项目的 agent 运行说明模板
- [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)：如何在目标项目目录内部应用该工作流
- [prompts/exam-kickoff.txt](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/exam-kickoff.txt)：当技能或子 agent 不可用时的备用 prompt
- [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md)：压缩版计划工作表
- [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md)：contract-first 骨架
- [templates/readme-outline.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/readme-outline.md)：面向评委的 README 轮廓
- [templates/final-checklist.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/final-checklist.md)：最后 10 分钟自检清单
- [docs/exam-archetypes.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-archetypes.md)：archetype 指南
- [docs/gateway-mvp-strategy.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/gateway-mvp-strategy.md)：gateway 重题型的 MVP 策略
- [docs/migration-report.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/migration-report.md)：明确 ECC 来源关系和迁移矩阵

## 收尾要求

每次最终交付都应说明：

- 如何运行项目
- 用了什么命令或验证方式进行测试
- 覆盖了哪些关键路径
- 实现了什么
- 有意留下了什么未做
- 哪些内容没测，以及原因
- 已知限制
- 如果再多 1 小时会做什么

本仓库唯一官方自检命令是：

```bash
./scripts/init-project-agent-docs.sh /path/to/project
./scripts/verify.sh
```
