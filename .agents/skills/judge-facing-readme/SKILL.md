---
name: judge-facing-readme
description: 仅在考试任务结束时使用，用于撰写面向提交的简短 README，告诉评审做了什么、如何运行、如何验证、刻意省略了什么，以及下一步会做什么。不用于营销、变更日志或长篇架构论文。
origin: ECC-derived
---

# 面向评审的 README

## 来源线索

主要继承来源：

- `legacy/ecc-source/agents/doc-updater.md`
- `legacy/ecc-source/commands/update-docs.md`
- `legacy/ecc-source/commands/save-session.md`
- `legacy/ecc-source/commands/verify.md`
- `legacy/ecc-source/skills/verification-loop/SKILL.md`
- `legacy/ecc-source/agents/tdd-guide.md`
- `legacy/ecc-source/agents/code-reviewer.md`

继承的方法：

- 文档必须与代码库现实一致
- 运行和验证部分必须来自真实执行过的命令，而不是假设
- 要包含测试证据，而不只是命令列表
- 总结什么成功了、什么失败了、下一步是什么
- 清楚报告风险，避免空泛叙述

## 何时使用

在实现和测试完成之后，或者测试已明确封顶时使用。

## 预期输出

- 一份简短的 README 草稿
- 清晰的运行说明
- 一个验证部分
- 一个测试证据部分
- 明确的取舍与限制
- 一个简短的下一步部分

## 必需章节

- 概述
- 已正常工作的内容
- 如何运行
- 如何验证
- 测试证据
- 假设与取舍
- 已知限制
- 下一小时计划

## 基于证据编写

- 根据真实的项目入口推导运行命令
- 根据你实际跑过的检查推导验证命令
- 说明这些检查覆盖了哪些关键路径
- 说明哪些内容没有测试，以及原因
- 明确写出被省略的工作
- 如果有失败或跳过，直接说明

## 输出格式

- 概述：
- 已正常工作的内容：
- 如何运行：
- 如何验证：
- 测试证据：
- 假设与取舍：
- 已知限制：
- 如果我还有一小时：

## 语气

- 直接
- 具体
- 五分钟内容易扫读

## 不要做什么

- 不要写发布说明
- 不要描述平台愿景
- 不要隐藏未完成的工作
- 不要用生态或环境搭建理论去填充 README
