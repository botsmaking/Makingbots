#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
export PORT="${PORT:-8000}"
exec python -m uvicorn app:app --host 0.0.0.0 --port "$PORT"
