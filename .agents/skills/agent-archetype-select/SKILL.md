---
name: agent-archetype-select
description: 仅在接收题目后使用，用于把任务归类为 gateway/proxy/aggregator/BFF、tool-using assistant、retrieval assistant 或 workflow agent，然后选择最小且合适的实现路径。不要用于框架比较或编码。
origin: ECC-derived
---

# 类型选择

## 来源线索

主要继承来源：

- `legacy/ecc-source/agents/architect.md`
- `legacy/ecc-source/skills/agent-harness-construction/SKILL.md`
- `legacy/ecc-source/skills/backend-patterns/SKILL.md`
- `legacy/ecc-source/skills/api-design/SKILL.md`

继承的方法：

- 选择能闭环的最小架构
- 保持行动空间窄且显式
- 优先稳定输入和确定性输出
- 尽早拒绝重叠抽象和通用框架

## 何时使用

在完成范围压缩、进入 contract 设计之前使用。

## 预期输出

- 选定的 archetype
- 简短的选择理由
- 该 archetype 的最小可行闭环
- 一小组需要拒绝的过度范围想法

## 决策规则

当题目重心在以下内容时，选择 `gateway / proxy / aggregator / BFF`：
- 请求路由
- 上游转发
- 响应规范化
- 来源分发与合并
- 面向特定客户端的 payload 整形

当题目重心在以下内容时，选择 `tool-using assistant`：
- 选择工具
- 校验工具参数
- 返回依赖工具的答案

当题目重心在以下内容时，选择 `retrieval assistant`：
- 从小型语料中获取上下文
- 为答案提供依据
- 对检索结果排序或过滤

当题目重心在以下内容时，选择 `workflow agent`：
- 简短的确定性步骤
- plan -> execute -> report
- 任务状态迁移或进度汇报

## 选择偏好

选择能把行动空间压得最窄的 archetype：

- 如果核心价值是路由或整形外部响应，选 `gateway`。
- 如果核心价值是选择并调用一个或少量工具，选 `tool-using assistant`。
- 如果核心价值是从语料中检索并为答案提供依据，选 `retrieval assistant`。
- 如果核心价值是按顺序执行离散步骤并汇报状态，选 `workflow agent`。

如果两个 archetype 都说得通，就选组件更少的那个，并把另一个列为非目标。

## 输出格式

- 选定的 archetype：
- 选择理由：
- 最小闭环：
- 非目标：

## 不要做什么

- 除非题目强制要求，否则不要把多个 archetype 混在一起
- 不要默认升级成多 agent 编排
- 不要因为架构看起来可复用就把范围扩宽
- 当单一 archetype 已经能闭环时，不要再造混合框架
