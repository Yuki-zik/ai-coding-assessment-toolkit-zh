# 考试实战使用说明

这份文件不是解释仓库理念，而是告诉你在**真实 2 小时 AI coding 笔试**里，应该怎么用这套系统。

适用前提：

- 题目方向是 agent 相关项目
- 你在 AI IDE / coding assistant 环境里做题
- 目标是 2 小时内交付一个可运行、范围清楚、说明清楚的最小 MVP

## 一句话总流程

先定方向，再定范围，再定 contract，再定最小验证标准，再做 happy path，再补最小测试，最后写清楚 README。

不要反过来。

## 标准使用顺序

考试中默认按这个顺序走：

1. 先让 AI 读取 [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
2. 如果你希望 AI 在真实考试项目目录里维护 agent 工作流，先看 [docs/project-agent-workflow.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/project-agent-workflow.md)
3. 在目标项目根目录初始化 `agent/`
4. 让 AI 读取目标项目中的 `agent/timeline.md` 和 `agent/tasks.md`
5. 再读 [docs/exam-archetypes.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-archetypes.md)，判断题目属于哪类
6. 用 [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md) 收敛范围
7. 用 [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md) 锁定最小 contract
8. 先定义最小验收测试或最小验证方式
9. 实现最小 happy path
10. 用 [.agents/skills/minimal-test-gate/SKILL.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/minimal-test-gate/SKILL.md) 或等价思路补 1-3 个关键测试
11. 用 [templates/readme-outline.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/readme-outline.md) 收尾 README
12. 如果启用了项目侧 agent 工作流，更新目标项目中的 `agent/tasks.md` 和 `agent/timeline.md`
13. 最后运行 `./scripts/verify.sh`

## 如果环境支持技能

优先按这个顺序触发：

1. [mvp-scope-2h](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/mvp-scope-2h/SKILL.md)
2. [agent-archetype-select](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/agent-archetype-select/SKILL.md)
3. [agent-contract-first](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/agent-contract-first/SKILL.md)
4. [minimal-test-gate](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/minimal-test-gate/SKILL.md)
5. [debug-fast-fail](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/debug-fast-fail/SKILL.md)
6. [judge-facing-readme](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/judge-facing-readme/SKILL.md)

注意：

- 技能是为了减少 AI 发散，不是为了增加流程复杂度
- 不需要每个都强行用一遍
- 如果项目已经明显卡在 debug 阶段，就直接切到 `debug-fast-fail`
- 进入正式编码前，先把计划写进目标项目的 `agent/tasks.md`
- 进入正式编码前，至少写下“要用什么测试或验证方式证明它真的工作”

## 如果环境不支持技能

直接退化成这条路径：

1. 让 AI 读 [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
2. 复制 [prompts/exam-kickoff.txt](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/exam-kickoff.txt) 给 AI
3. 如果你更习惯中文，直接用 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)
4. 手工参考 `templates/` 和 `docs/` 推进

也就是说，没有技能也能用，只是少了一层自动收敛。

## 如果环境支持子 agent

只建议在这些阶段使用：

- 题目分析
- repo 探索
- 文档 / API 资料核对
- README 审查
- 测试失败 triage

不建议这样用：

- 多个 agent 同时写同一批核心业务文件
- 把核心设计和最终收敛交给多个 agent 并发完成
- 把“多 agent”当成题目卖点写进最终交付

默认原则：

- 多 agent 是你做题的方法，不是最终产物的重点
- 最终代码收敛必须单线程完成

## 15 分钟到 120 分钟的实战节奏

### 0-15 分钟

你应该完成：

- 读题
- 选 archetype
- 做 scope / non-goals
- 写最小文件树
- 定 contract

这个阶段最重要的事不是写代码，而是**避免写错代码**。

### 15-75 分钟

你应该完成：

- 最小主链路
- 能跑通的一条 happy path
- 必要的最小输入校验
- 必要的最小错误返回
- 至少一个事先定义好的验证点

这个阶段不要追求：

- 可扩展架构
- 平台化抽象
- 复杂观测
- 漂亮但没必要的重构

### 75-100 分钟

你应该完成：

- 1-3 个关键路径测试
- 修掉真正阻塞交付的 bug
- bug fix 优先补回归测试，再修，再复验
- 确认 contract 和真实行为一致

### 100-120 分钟

你应该完成：

- README
- limitations
- tradeoffs
- next hour
- 最终自检

## 先选 archetype，再决定写法

### 1. 网关 / 代理 / 聚合器 / BFF

出现这些信号时，优先选它：

- 题目在说路由、转发、聚合、归一化、响应整形
- 重点是“接一个请求 -> 调上游 -> 返回稳定结构”

默认最小交付：

- 一个入口
- 一个 validation layer
- 一个或两个 adapter
- 一个统一成功响应
- 一个统一错误响应

### 2. 工具调用型助手

出现这些信号时，优先选它：

- 题目重点是“判断该调哪个工具”
- 重点是 tool input / output / failure behavior

默认最小交付：

- 一组固定工具
- 一个 tool selection 流程
- 一套稳定的 tool contract

### 3. 检索 / 轻量级 RAG

出现这些信号时，优先选它：

- 题目重点是从文档、知识库、数据集中找信息
- 重点是 grounding、sources、no-result 行为

默认最小交付：

- query -> retrieve -> select -> answer
- 一个 no-result 路径
- 一个稳定返回结构

### 4. 工作流 / 规划-执行器

出现这些信号时，优先选它：

- 题目重点是“输入任务 -> 规划步骤 -> 顺序执行 -> 返回状态”
- 重点是 deterministic loop 和状态流

默认最小交付：

- 线性步骤
- 明确状态
- 遇到首个清晰失败就停止

## 题目一到手，最先该问 AI 的问题

建议按这个顺序问：

1. 这题属于哪种 archetype
2. 2 小时内最小 MVP 是什么
3. non-goals 应该怎么写
4. 最小 contract 应该长什么样
5. 最小文件树应该是什么
6. 先写哪条 happy path
7. 最小测试集合是什么

这些问题都可以直接用 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md) 里的中文模板。

## 真正卡住时怎么切换模式

### 卡在“题目太大”

切回：

- [templates/task-plan.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/task-plan.md)
- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md) 里的“范围收敛”

### 卡在“到底该怎么设计接口”

切回：

- [templates/contract-template.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/contract-template.md)
- `agent-contract-first`

### 卡在“跑不起来 / 启动失败 / 测试挂了”

切到：

- [debug-fast-fail](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/debug-fast-fail/SKILL.md)
- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md) 里的 debug 模板

### 卡在“最后 README 不知道怎么写”

切到：

- [templates/readme-outline.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/templates/readme-outline.md)
- [judge-facing-readme](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/.agents/skills/judge-facing-readme/SKILL.md)

## 最容易犯的错

考试里最常见的错误不是“不会写”，而是“写太多”。

高频错误：

- 还没选 archetype 就开始编码
- contract 还没定就开始铺业务逻辑
- 一开始就加插件系统、队列、缓存、重试、后台任务
- 为了 coverage 去补大量低价值测试
- 修 bug 时直接改代码，却没有先证明 bug 被稳定复现
- README 最后匆忙乱写，和真实实现不一致
- 把归档区的旧 ECC 目录当成考试主路径来读

## 最终交付前必须确认的事

提交前至少确认：

- 如果启用了项目侧 agent 工作流，目标项目的 `agent/tasks.md` 状态已更新
- 如果启用了项目侧 agent 工作流，目标项目的 `agent/timeline.md` 新增了本次条目，并包含 `Motivation`
- 项目能启动
- 一条 happy path 真能跑
- 1-3 个关键测试存在
- README 里写清楚测了什么、覆盖了哪些关键路径、哪些没测以及原因
- README 里 run / verify 命令真实可用
- 已实现范围写清楚
- 刻意放弃的部分写清楚
- 已知限制写清楚

然后再运行：

```bash
./scripts/init-project-agent-docs.sh /path/to/project
./scripts/verify.sh
```

## 最短使用建议

如果你只想记住一条：

先让 AI 读 [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)，再选 archetype，再定 scope 和 contract，然后才写 happy path。
