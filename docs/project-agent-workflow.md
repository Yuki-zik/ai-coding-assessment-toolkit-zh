# 项目侧 Agent 工作流

这个工作流不是让 **脚手架仓库自己**维护一个运行态 `agent/` 目录。

它的目标是：

- 当 AI 在真正的考试项目目录里工作时
- 让它主动在那个**项目根目录**创建并维护 `agent/`
- 用这套轻量文档管理当前项目状态、任务、时间线和代理规则

## 什么时候用

当 AI 开始在考试项目仓库里真正工作时，就应该初始化该项目自己的 `agent/`：

```bash
./scripts/init-project-agent-docs.sh /path/to/exam-project
```

如果当前 shell 已经在项目根目录，也可以直接：

```bash
./scripts/init-project-agent-docs.sh .
```

## 会创建什么

会在目标项目目录中创建：

- `agent/project.md`
- `agent/tasks.md`
- `agent/timeline.md`
- `agent/agents.md`

## AI 应该如何使用

### 每次会话开始

1. 确认目标项目根目录存在 `agent/`
2. 如果没有，就初始化它
3. 读取 `agent/timeline.md` 和 `agent/tasks.md`
4. 总结当前状态
5. 确认需求并更新 `agent/tasks.md`

### 每次会话结束

1. 更新 `agent/tasks.md`
2. 在 `agent/timeline.md` 顶部新增条目
3. 时间线条目必须包含 `Motivation`
4. 给出 Conventional Commits 风格 commit message

## 为什么要这样做

因为考试里的 AI 往往会遇到两个问题：

- 会话之间状态断裂
- 任务推进记录只存在于对话里，不存在于项目里

把这 4 个文件放在**项目目录内部**，可以让 AI 在真实项目上下文里形成稳定工作流，而不是把状态写回脚手架仓库自身。
