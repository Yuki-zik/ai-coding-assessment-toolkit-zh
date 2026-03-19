# 迁移报告

这个仓库正在被重构为一个面向 2 小时 agent 项目考试的、继承自 ECC 的改造版本。

原始 ECC 源内容的对应资料保留在上游源仓库中作为只读历史材料；当前中文仓库只保留迁移后的正文与中文化结果，而不是那份完整源语料。

## 迁移原则

1. 先迁移内容，再清理结构
2. 先抽取、压缩、合并，再重写
3. 为每个新 skill 保留来源线索
4. 保留对原始 ECC 源语料的引用，但不要把它误写成当前仓库里可直接执行的内容
5. 把过宽的产品面归档，而不是假装它们从未存在

## 迁移摘要

- 继承的核心主题：
  - 先规划
  - 先搜索
  - TDD 与验证
  - 边界安全
  - 最小差异调试
  - contract-first 设计
  - 基于现实的文档
- 新增的考试专用内容：
  - 严格 2 小时时间盒
  - 为考试题目定义清晰的 archetype 分类
  - 对测试范围设硬上限
  - 面向评审的 README 结构

## 迁移矩阵

| 原始路径 | 原始主题 | 原始价值 | 保留？ | 保留方式 | 迁移目标 | 迁移说明 | 归档/删除原因 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `legacy/ecc-source/AGENTS.md` | 仓库级操作模型 | 高 | 是 | 压缩重写 | `AGENTS.md`、`README.md` | 延续规划/TDD/安全/评审的整套仓库级纪律 | 未删除；源资料保留在上游 ECC 资料集中 |
| `legacy/ecc-source/agents/planner.md` | 需求、阶段、风险、成功标准 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`.agents/skills/mvp-scope-2h/SKILL.md`、`templates/task-plan.md` | 是规划流程和阶段式实现的主要来源 | 源资料保留 |
| `legacy/ecc-source/commands/plan.md` | 先规划的交互契约 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`prompts/exam-kickoff.txt`、`templates/task-plan.md` | 保留需求复述与带门槛的规划行为 | 源资料保留 |
| `legacy/ecc-source/rules/common/development-workflow.md` | 搜索 -> 规划 -> TDD -> 评审的循环 | 高 | 是 | 直接抽取 + 压缩 | `AGENTS.md`、`README.md`、`prompts/exam-kickoff.txt` | 成为考试脚手架工作流的骨架 | 源资料保留 |
| `legacy/ecc-source/skills/search-first/SKILL.md` | 先搜索以及 adopt/extend/build 决策矩阵 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`templates/task-plan.md`、`prompts/exam-kickoff.txt` | 保留仓库优先、复用优先的行为，但不再单独保留一个 search skill | 源资料保留 |
| `legacy/ecc-source/agents/tdd-guide.md` | RED/GREEN/REFACTOR 与边界情况预期 | 高 | 是 | 合并 + 压缩 | `.agents/skills/minimal-test-gate/SKILL.md`、`AGENTS.md`、`templates/final-checklist.md` | 提供 test-first 节奏和失败路径强调 | 源资料保留 |
| `legacy/ecc-source/skills/tdd-workflow/SKILL.md` | 以用户旅程为中心的 TDD 与测试分类 | 高 | 是 | 合并 + 压缩 | `.agents/skills/minimal-test-gate/SKILL.md`、`templates/final-checklist.md` | 增加以行为为中心的测试框架和关键路径选择 | 源资料保留 |
| `legacy/ecc-source/skills/verification-loop/SKILL.md` | 验证阶段与就绪检查 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`.agents/skills/minimal-test-gate/SKILL.md`、`.agents/skills/debug-fast-fail/SKILL.md`、`templates/final-checklist.md` | 保留结构化的变更后检查，同时去掉广义 CI 表演性内容 | 源资料保留 |
| `legacy/ecc-source/skills/ai-regression-testing/SKILL.md` | 针对已观测故障和环境漂移的回归测试 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`.agents/skills/minimal-test-gate/SKILL.md`、`docs/exam-usage-guide.md` | 加入 bug 修复默认动作：先复现，再修复，再重跑 | 源资料保留 |
| `legacy/ecc-source/skills/eval-harness/SKILL.md` | 在实现前定义通过/失败标准 | 中 | 是 | 提取小概念 | `AGENTS.md`、`.agents/skills/minimal-test-gate/SKILL.md`、`docs/exam-usage-guide.md` | 复用为“先定义证明目标”，但不引入沉重的评测系统 | 源资料保留 |
| `legacy/ecc-source/commands/verify.md` | 简洁的验证报告格式 | 高 | 是 | 合并 + 压缩 | `.agents/skills/judge-facing-readme/SKILL.md`、`templates/readme-outline.md`、`scripts/verify.sh` | 提供紧凑的“通过了什么 / 失败了什么”报告形态 | 源资料保留 |
| `legacy/ecc-source/commands/quality-gate.md` | 质量门禁清单与修复框架 | 中 | 是 | 提取小概念 | `templates/final-checklist.md`、`.agents/skills/judge-facing-readme/SKILL.md` | 保留为轻量提交门槛，而不是独立命令表面 | 源资料保留 |
| `legacy/ecc-source/agents/code-reviewer.md` | 严重性排序与高置信度评审 | 高 | 是 | 合并 + 压缩 | `.agents/skills/minimal-test-gate/SKILL.md`、`.agents/skills/judge-facing-readme/SKILL.md`、`templates/final-checklist.md` | 复用为“不要堆砌、要证明信号、要清楚写风险”的指导 | 源资料保留 |
| `legacy/ecc-source/skills/security-review/SKILL.md` | 密钥、校验、SQL 安全、认证、上传校验 | 高 | 是 | 合并 + 压缩 | `AGENTS.md`、`.agents/skills/agent-contract-first/SKILL.md`、`docs/gateway-mvp-strategy.md`、`templates/contract-template.md` | 是考试边界设计最实用的安全来源 | 源资料保留 |
| `legacy/ecc-source/rules/common/security.md` | 简短的强制安全护栏 | 高 | 是 | 直接抽取 + 压缩 | `AGENTS.md`、`templates/final-checklist.md` | 为考试主路径提供简短且始终生效的规则 | 源资料保留 |
| `legacy/ecc-source/agents/build-error-resolver.md` | 最小差异的构建和类型修复循环 | 高 | 是 | 合并 + 压缩 | `.agents/skills/debug-fast-fail/SKILL.md` | 是“只修复阻塞主循环的问题”的核心来源 | 源资料保留 |
| `legacy/ecc-source/commands/build-fix.md` | 识别栈、分组错误、逐个修复 | 高 | 是 | 合并 + 压缩 | `.agents/skills/debug-fast-fail/SKILL.md` | 提供栈识别和一次只修一个阻塞点的修复循环 | 源资料保留 |
| `legacy/ecc-source/skills/continuous-agent-loop/SKILL.md` | 通过缩小到失败单元进行恢复 | 中 | 是 | 提取小概念 | `.agents/skills/debug-fast-fail/SKILL.md` | 只用于恢复/triage 的语言，不用于自主循环 | 源资料保留 |
| `legacy/ecc-source/agents/architect.md` | 取舍、contract、数据流、反模式 | 高 | 是 | 合并 + 压缩 | `.agents/skills/agent-archetype-select/SKILL.md`、`.agents/skills/agent-contract-first/SKILL.md`、`docs/exam-archetypes.md` | 提供 contract 和反过度设计的推理 | 源资料保留 |
| `legacy/ecc-source/skills/agent-harness-construction/SKILL.md` | 窄行动空间、稳定工具 I/O、确定性输出 | 高 | 是 | 合并 + 压缩 | `.agents/skills/agent-archetype-select/SKILL.md`、`.agents/skills/agent-contract-first/SKILL.md`、`docs/exam-archetypes.md`、`docs/gateway-mvp-strategy.md` | 是单循环、窄 contract 思维的重要来源 | 源资料保留 |
| `legacy/ecc-source/skills/backend-patterns/SKILL.md` | 中间件、服务/仓储、校验 | 高 | 是 | 合并 + 压缩 | `.agents/skills/agent-contract-first/SKILL.md`、`docs/gateway-mvp-strategy.md`、`templates/contract-template.md` | 当 gateway/BFF 题目需要最小后端结构时复用 | 源资料保留 |
| `legacy/ecc-source/skills/api-design/SKILL.md` | 响应封装、状态码、错误结构 | 高 | 是 | 合并 + 压缩 | `.agents/skills/agent-contract-first/SKILL.md`、`docs/gateway-mvp-strategy.md`、`templates/contract-template.md` | 是稳定响应/错误 contract 语言的主要来源 | 源资料保留 |
| `legacy/ecc-source/skills/iterative-retrieval/SKILL.md` | 渐进式检索/细化循环 | 中 | 是 | 合并 + 压缩 | `docs/exam-archetypes.md`、`docs/optional-subagent-usage.md`、`prompts/exam-kickoff.txt` | 支持 retrieval archetype 和低权重 subagent 使用 | 源资料保留 |
| `legacy/ecc-source/agents/docs-lookup.md` | 使用当前文档处理版本敏感 API | 中 | 是 | 提取概念 | `docs/exam-archetypes.md`、`prompts/exam-kickoff.txt` | 复用为“库相关任务使用当前文档”，而不是保留一个独立 agent | 源资料保留 |
| `legacy/ecc-source/skills/documentation-lookup/SKILL.md` | 基于 Context7 的文档查询 | 中 | 是 | 提取概念 | `docs/exam-archetypes.md`、`prompts/exam-kickoff.txt` | 支持检索/工具类 archetype，而不是再增加第七个 skill | 源资料保留 |
| `legacy/ecc-source/agents/doc-updater.md` | 文档必须与现实一致，来源于事实 | 高 | 是 | 合并 + 压缩 | `.agents/skills/judge-facing-readme/SKILL.md`、`templates/readme-outline.md`、`README.md` | 是面向评审文档纪律的主要来源 | 源资料保留 |
| `legacy/ecc-source/commands/update-docs.md` | 从真实命令和环境生成运行/验证文档 | 中 | 是 | 合并 + 压缩 | `.agents/skills/judge-facing-readme/SKILL.md`、`templates/readme-outline.md` | 提供“运行说明必须反映现实”的指导 | 源资料保留 |
| `legacy/ecc-source/commands/save-session.md` | 已做成什么、失败了什么、下一步是什么、阻塞点是什么 | 高 | 是 | 合并 + 压缩 | `.agents/skills/judge-facing-readme/SKILL.md`、`templates/readme-outline.md` | 复用到 README 中对证据、限制和下一小时计划的描述 | 源资料保留 |
| `legacy/ecc-source/docs/COMMAND-AGENT-MAP.md` | 命令到角色/技能的结构图 | 中 | 是 | 提取小摘要 | `README.md`、`docs/migration-report.md` | 帮助解释 ECC 原语如何收敛成新的主路径 | 源资料保留 |
| `legacy/ecc-source/docs/token-optimization.md` | 战略压缩与可选 subagent 的成本模型 | 中 | 是 | 合并 + 压缩 | `.agents/skills/mvp-scope-2h/SKILL.md`、`docs/optional-subagent-usage.md` | 只用于阶段边界的上下文管理和低权重 subagent 规则 | 源资料保留 |
| `legacy/ecc-source/skills/strategic-compact/SKILL.md` | 阶段边界压缩 | 中 | 是 | 提取小概念 | `.agents/skills/mvp-scope-2h/SKILL.md`、`docs/optional-subagent-usage.md` | 支持显式阶段边界，而不是单独保留一个 skill | 源资料保留 |
| `legacy/ecc-source/the-security-guide.md` | 最小化攻击面并对外部内容保持怀疑 | 中 | 是 | 提取小概念 | `AGENTS.md`、`docs/gateway-mvp-strategy.md` | 提供“缩小攻击面”和“把外部内容视为不可信输入”的框架 | 源资料保留 |
| `legacy/ecc-source/README.md` | 脚手架定位与广泛目录 | 中 | 部分保留 | 压缩 + 其余归档 | `README.md`、`docs/migration-report.md` | 保留脚手架定位，删去营销和过宽的产品面 | 产品营销内容归档在源语料中 |
| `legacy/ecc-source/commands/test-coverage.md` | 面向覆盖率的测试缺口审视 | 中 | 部分保留 | 提取窄概念 | `.agents/skills/minimal-test-gate/SKILL.md` | 只保留“主成功路径加一个有意义的失败路径”的优先级，不再作为主路径覆盖率目标 | 过度追求覆盖率与 2 小时考试约束冲突 |

## 新增内容：因为 legacy 不足以覆盖这些需求

- 明确的四类考试 archetype 分类：
  - `gateway / proxy / aggregator / BFF`
  - `tool-using assistant / function-calling agent`
  - `retrieval / knowledge assistant / lightweight RAG`
  - `workflow / planner-executor / task automation`
- 严格的 2 小时时间盒和分钟级节奏
- 用 1-3 个关键路径测试代替宽泛的 80% 覆盖率目标
- 面向评审的 README 结构：
  - 做了什么
  - 如何运行
  - 如何验证
  - 已知限制
  - 有意省略了什么
  - 如果再多一小时会做什么

这些内容之所以新增，是因为 ECC 本身已经有很强的工作流内容，但它更适合一个宽泛的脚手架产品，而不是一个紧凑计分的考试场景。

## 测试迁移说明

测试是这套考试脚手架中刻意压缩，但没有被丢弃的部分。

- 从 ECC 保留的内容：
  - 尽早定义证明目标
  - RED -> GREEN -> REFACTOR 思维
  - 针对已复现 bug 的回归测试
  - 把验证当作发布门禁
  - 文档必须报告真实测试证据
- 作为主路径不再保留的内容：
  - 宽泛覆盖率目标
  - 重型评测基础设施
  - 针对每个题目都构建多层测试金字塔

原因是考试经济学，而不是对 ECC 的否定。在 2 小时任务里，这套脚手架更适合少量高信号测试，去证明关键路径和一个有意义的失败路径。

## 归档策略

- 原始 ECC 源内容有意保留在上游源仓库中。
- 这次重构不会删除已恢复的源语料。
- 通过排除来减少主路径噪音，而不是假装旧材料没有价值。
