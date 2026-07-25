#!/usr/bin/env bash
# ~/꿈/site/hub/sync.sh 교체용 안전 래퍼.
# 전체 포스트 rsync를 하지 않고, publish.py의 승인된 단일 포스트 게이트만 호출한다.
set -euo pipefail

WORKSPACE="${BLOG_WORKSPACE:-$HOME/꿈/9_발행}"
HUB="${BLOG_HUB:-$HOME/꿈/site/hub}"

if [ "$#" -lt 1 ]; then
  echo "사용법: bash ~/꿈/site/hub/sync.sh 콘텐츠/posts/<포스트> [--dry-run]" >&2
  exit 2
fi

exec python3 "$WORKSPACE/ai-agent/publish.py" sync-hub "$1" --hub "$HUB" "${@:2}"
