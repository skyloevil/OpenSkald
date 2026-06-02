#!/usr/bin/env bash
set -euo pipefail

CONFIG_PATH="${1:-config/demo.yaml}"

uv sync --extra dev
uv run OpenSkald --config "$CONFIG_PATH" validate-config
uv run OpenSkald --config "$CONFIG_PATH" config-summary
uv run OpenSkald --config "$CONFIG_PATH" knowledge-ingest
uv run OpenSkald --config "$CONFIG_PATH" status
uv run OpenSkald --config "$CONFIG_PATH" generate-once \
  --content-type daily_summary \
  --platform blog \
  --platform x \
  --platform wechat \
  --platform xiaohongshu
uv run OpenSkald --config "$CONFIG_PATH" review-list --status pending_review
