#!/usr/bin/env bash
# Push a single local MD file to its mapped wiki node (overwrite mode).
# Usage: bash scripts/push.sh <filename.md>
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "usage: bash $0 <filename.md>" >&2
  exit 2
fi

FILE="$1"
REPO="$(cd "$(dirname "$0")/../../../.." && pwd)"
SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
KB="$REPO/knowledge_base"
MAP="$SKILL_DIR/state/wiki_mapping.json"
FP="$KB/$FILE"

if [ ! -f "$FP" ]; then echo "file not found: $FP" >&2; exit 1; fi
if [ ! -f "$MAP" ]; then echo "mapping missing: $MAP" >&2; exit 1; fi

DOC_URL=$(python3 -c "import json,sys; m=json.load(open('$MAP')); f=m['files'].get('$FILE'); print(f['url'] if f else '')")
if [ -z "$DOC_URL" ]; then
  echo "no mapping for $FILE — use 'create' workflow instead (see SKILL.md § 文档级:新建)" >&2
  exit 1
fi

echo ">>> pushing $FILE -> $DOC_URL" >&2
out=$(lark-cli docs +update --doc "$DOC_URL" --markdown "$(cat "$FP")" --mode overwrite --as user 2>&1)
echo "$out"

ok=$(echo "$out" | python3 -c "import sys,json
try: d=json.loads(sys.stdin.read()); print('OK' if d.get('ok') is not False and 'error' not in d else 'FAIL')
except: print('PARSE')")

if [ "$ok" != "OK" ]; then
  echo ">>> FAILED" >&2
  exit 1
fi

# Bump last_pushed
python3 - <<PY
import json, datetime
m = json.load(open("$MAP"))
m["files"]["$FILE"]["last_pushed"] = datetime.datetime.now().astimezone().isoformat(timespec="seconds")
json.dump(m, open("$MAP", "w"), ensure_ascii=False, indent=2)
print(">>> updated last_pushed in mapping")
PY
