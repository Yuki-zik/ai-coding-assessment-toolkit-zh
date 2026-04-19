#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEMPLATE_DIR="$ROOT_DIR/templates/project-agent"
TARGET_DIR="${1:-.}"

mkdir -p "$TARGET_DIR/agent"

copy_if_missing() {
  local name="$1"
  local src="$TEMPLATE_DIR/$name"
  local dst="$TARGET_DIR/agent/$name"

  if [[ ! -f "$dst" ]]; then
    cp "$src" "$dst"
    echo "init-project-agent-docs: 已创建 $dst"
  else
    echo "init-project-agent-docs: 已存在 $dst"
  fi
}

copy_root_if_missing() {
  local name="$1"
  local src="$TEMPLATE_DIR/$name"
  local dst="$TARGET_DIR/$name"

  if [[ ! -f "$dst" ]]; then
    cp "$src" "$dst"
    echo "init-project-agent-docs: 已创建 $dst"
  else
    echo "init-project-agent-docs: 已存在 $dst"
  fi
}

copy_if_missing "project.md"
copy_if_missing "tasks.md"
copy_if_missing "timeline.md"
copy_root_if_missing "AGENTS.md"

echo "init-project-agent-docs: 已完成 $TARGET_DIR"
