---
name: agent-contract-first
description: 仅在实现前使用，用于定义 agent 项目的最小 contract：入口或接口、工具 contract、输入输出结构、状态流、错误处理和假设。不用于抽象架构设计。
origin: ECC-derived
---

# 契约优先

## 来源线索

主要继承来源：

- `legacy/ecc-source/agents/architect.md`
- `legacy/ecc-source/skills/agent-harness-construction/SKILL.md`
- `legacy/ecc-source/skills/api-design/SKILL.md`
- `legacy/ecc-source/skills/backend-patterns/SKILL.md`
- `legacy/ecc-source/skills/security-review/SKILL.md`

继承的方法：

- 保持工具名和入口点显式
- 让输入遵循 schema-first 且保持窄小
- 返回确定性的输出结构
- 定义带停止条件的错误路径
- 在边界校验用户输入和 secret

## 何时使用

在完成 archetype 选择之后、开始接触业务逻辑之前使用。

## 预期输出

- 一份最小 contract 文档
- 请求和响应结构
- 如果存在工具，则给出工具输入和输出规则
- 状态迁移或流程说明
- MVP 中值得处理的错误场景
- 明确的假设

## Contract 清单

- 存在哪个入口点？
- 需要哪些输入字段？
- 哪种输出结构足以用于测试？
- 会读取、写入或忽略哪些状态？
- 哪些错误应该干净地返回？
- 哪些假设能让实现保持小巧？

## Contract 规则

- 除非题目明显需要更多，否则只保留一个入站接口。
- 优先一个稳定的成功结构和一个稳定的错误结构。
- 对工具类任务，定义固定的工具名、工具输入、工具输出和失败行为。
- 对检索类任务，定义来源或引用在输出中的呈现方式。
- 对 workflow 类任务，定义步骤状态和失败时的停止条件。
- 对 gateway 类任务，定义上游边界、规范化规则，以及认证或 allowlist 检查。

## 边界安全

在这里应用压缩后的 ECC 安全清单：

- 校验所有外部输入
- 避免硬编码 secrets
- 使用安全的查询模式
- 不要泄露敏感错误细节
- 如果端点受保护，要明确写出认证要求

## 默认偏好

- 保持一个入站接口
- 保持一个稳定的响应结构
- 让状态显式且小
- 尽早规范化输出
- 记录缺失部分，不要发明完整抽象层

## 不要做什么

- 不要发明通用 SDK
- 不要为 MVP 之外的特性定义 contract
- 不要添加题目不需要的 schema 复杂度
- 不要把错误 contract 拖到实现之后再定义
