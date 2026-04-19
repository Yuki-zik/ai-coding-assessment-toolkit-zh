#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

required_paths=(
  "AGENTS.md"
  "README.md"
  "docs/human-start-here.md"
  "docs/exam-usage-guide.md"
  "docs/project-agent-workflow.md"
  "docs/exam-archetypes.md"
  "docs/gateway-mvp-strategy.md"
  "docs/migration-report.md"
  "docs/optional-subagent-usage.md"
  ".agents/skills/mvp-scope-2h/SKILL.md"
  ".agents/skills/agent-archetype-select/SKILL.md"
  ".agents/skills/agent-contract-first/SKILL.md"
  ".agents/skills/minimal-test-gate/SKILL.md"
  ".agents/skills/debug-fast-fail/SKILL.md"
  ".agents/skills/judge-facing-readme/SKILL.md"
  "templates/task-plan.md"
  "templates/contract-template.md"
  "templates/project-agent/project.md"
  "templates/project-agent/tasks.md"
  "templates/project-agent/timeline.md"
  "templates/project-agent/AGENTS.md"
  "templates/readme-outline.md"
  "templates/final-checklist.md"
  "prompts/exam-kickoff.txt"
  "prompts/zh-cn-scenario-prompts.md"
  "scripts/init-project-agent-docs.sh"
  "scripts/verify.sh"
  ".gitignore"
  "LICENSE"
)

legacy_paths=(
  "agent"
  "skills"
  "agents"
  "commands"
  "contexts"
  "examples"
  "hooks"
  "manifests"
  "mcp-configs"
  "plugins"
  "rules"
  "schemas"
  "tests"
  ".claude"
  ".claude-plugin"
  ".codex"
  ".cursor"
  ".opencode"
  ".github"
)

fail() {
  echo "verify: $1" >&2
  exit 1
}

for path in "${required_paths[@]}"; do
  [[ -e "$path" ]] || fail "missing required path: $path"
done

skill_count="$(find ".agents/skills" -mindepth 1 -maxdepth 1 -type d | wc -l | tr -d ' ')"
if (( skill_count < 5 || skill_count > 7 )); then
  fail ".agents/skills 下应有 5 到 7 个技能目录，当前找到 $skill_count 个"
fi

for path in "${legacy_paths[@]}"; do
  [[ ! -e "$path" ]] || fail "不应存在的旧路径仍然存在：$path"
done

grep -q '^| 优先级 | 任务 | 状态 | 负责人 | 截止时间 |' "templates/project-agent/tasks.md" || fail "templates/project-agent/tasks.md 缺少必需的表头"
grep -q '^| 时间 | 事件 | 文件 | 动机 | 结果 |' "templates/project-agent/timeline.md" || fail "templates/project-agent/timeline.md 缺少必需的表头"

while IFS= read -r skill_file; do
  grep -q '^## 来源线索' "$skill_file" || fail "缺少 来源线索 部分：$skill_file"
done < <(find ".agents/skills" -mindepth 2 -maxdepth 2 -name 'SKILL.md' | sort)

echo "verify: 必需文件均已存在"
echo "verify: project-agent 工作流组件已存在"
echo "verify: 技能目录数量 = $skill_count"
echo "verify: 技能来源线索已存在"
echo "verify: 旧的 ECC 暴露面已移除"
echo "verify: PASS"
