#!/usr/bin/env bash
set -euo pipefail

CONFIG_PATH="${OPENSKALD_AGENT_CONFIG:-config/config.yaml}"

openskald --config "$CONFIG_PATH" validate-config
exec uvicorn backend.app.main:app --host "${HOST:-0.0.0.0}" --port "${PORT:-8000}"
