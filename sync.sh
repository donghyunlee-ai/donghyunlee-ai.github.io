#!/usr/bin/env bash
# 워크스페이스의 발행 원본(콘텐츠/posts) → 허브(content/posts) 동기화.
# 허브엔 index.md + 이미지만 복사(네이버.md·링크드인.md는 제외).
# 사용법:  bash ~/꿈/site/hub/sync.sh   그 뒤 git add/commit/push 는 본인이 직접.
set -euo pipefail

SRC="$HOME/꿈/9_발행/콘텐츠/posts/"
DST="$HOME/꿈/site/hub/content/posts/"

if [ ! -d "$SRC" ]; then
  echo "원본 폴더 없음: $SRC (아직 발행 글이 없습니다)"; exit 0
fi
mkdir -p "$DST"

rsync -av \
  --include='*/' \
  --include='index.md' \
  --include='*.png' --include='*.jpg' --include='*.jpeg' --include='*.webp' --include='*.gif' \
  --exclude='*' \
  "$SRC" "$DST"

echo ""
echo "동기화 완료. 미리보기:  hugo server -s ~/꿈/site/hub"
echo "배포(본인 실행):  cd ~/꿈/site/hub && git add -A && git commit -m '글 추가' && git push"
