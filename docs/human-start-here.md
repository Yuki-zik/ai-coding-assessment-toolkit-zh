# 人类从这里开始

这份文档是给**人类考生**看的，不是给 AI 助手看的。

如果你只想知道考试时该怎么用这个仓库，从这里开始，不要先读 `AGENTS.md`。

## 先说结论

- `README.md`：帮你快速认识仓库
- `docs/human-start-here.md`：帮你 1 分钟上手
- `docs/exam-usage-guide.md`：给你考试里的实际操作顺序
- `docs/project-agent-workflow.md`：告诉你如何把 agent 工作流落到真实项目目录里
- `prompts/zh-cn-scenario-prompts.md`：提供可以直接复制给 AI 的中文 prompt
- `AGENTS.md`：给 AI 助手的仓库级指令，不是给你优先阅读的

## 你真正该怎么用

### 情况 1：你想最快开始做题

按这个顺序：

1. 先看 [README.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/README.md)
2. 再看 [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
3. 打开 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)
4. 复制一个最接近你当前阶段的 prompt 给 AI

### 情况 2：你想让 AI 自动按仓库规则工作

这时 AI 才需要读取：

- [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)

也就是说：

- `AGENTS.md` 主要是 **AI 运行时指令**
- `README.md` 和 `docs/*.md` 才是 **面向人类的指南**

## 最短路径

如果你现在就要考试，直接做这三步：

1. 读 [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
2. 去 [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md) 复制 prompt
3. 让 AI 开始帮你做 scope -> archetype -> contract -> happy path -> tests -> README

## 为什么仓库里还保留 AGENTS.md

因为很多 AI coding 环境会自动读取仓库根目录的 `AGENTS.md`，把它当成行为约束。

所以它存在是为了：

- 给 AI 一个稳定的仓库级指令入口
- 让 AI 更少发散
- 让 AI 更容易遵守 scope / contract / test / README 的顺序

不是为了让你这个人类用户先手工啃它。

## 如果你只记一句话

人类先看：

- [README.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/README.md)
- [docs/exam-usage-guide.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/docs/exam-usage-guide.md)
- [prompts/zh-cn-scenario-prompts.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/prompts/zh-cn-scenario-prompts.md)

AI 才看：

- [AGENTS.md](/Users/a-znk/code/ai-coding-assessment-toolkit-zh/AGENTS.md)
