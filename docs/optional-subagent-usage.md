# 可选 Subagent 使用方式

本文档保留了 ECC 关于 subagent 和 token 优化的一小部分建议，但去掉了平台化叙事。

主要继承来源：

- `legacy/ecc-source/docs/token-optimization.md`
- `legacy/ecc-source/skills/strategic-compact/SKILL.md`
- `legacy/ecc-source/skills/iterative-retrieval/SKILL.md`
- `legacy/ecc-source/agents/docs-lookup.md`

这个仓库并不要求使用 subagent。默认路径仍然是一个主 agent。

## 什么时候值得用 Subagent

只有当任务足够窄，而且可以并行拆分时，才考虑使用 subagent：

- 题目或仓库探索
- archetype 证据收集
- 与版本相关的文档查询
- README 审阅
- 测试失败 triage

## 什么时候不值得用 Subagent

不要在这些场景下使用它们：

- 并行编写主业务逻辑
- 多个 agent 同时编辑同一批核心文件
- 仍然需要一个负责人来拍板的架构决策

## 适合并行的小任务

- 比较两个候选 archetype
- 扫描仓库里已有的 helper 或测试
- 审阅提交用 README 是否清晰
- 主 agent 继续实现时，单独检查一个失败测试
- 在大型代码库里做 iterative retrieval，只返回最有价值的文件

## 上下文规则

继承自 ECC 的 token 优化建议：

- 用 subagent 把大块探索留在主上下文之外
- 只在阶段边界做压缩
- 不要因为有 subagent，就把主实现线程外包出去

## 为什么最终收敛必须单线程

- 考试任务奖励的是清晰度，不是并发度
- 重叠修改会带来合并噪音和隐藏回归
- 一个负责人更容易保持 scope、contract 和 README 一致

把 subagent 当作可选的分析助手，而不是产品故事本身。
