#!/usr/bin/env bash
# Show local KB status: file, lines, char count, mapping presence, last_pushed.
# Usage: bash scripts/status.sh
set -euo pipefail

REPO="$(cd "$(dirname "$0")/../../../.." && pwd)"
SKILL_DIR="$(cd "$(dirname "$0")/.." && pwd)"
KB="$REPO/knowledge_base"
MAP="$SKILL_DIR/state/wiki_mapping.json"

if [ ! -d "$KB" ]; then echo "knowledge_base/ not found at $KB" >&2; exit 1; fi
if [ ! -f "$MAP" ]; then echo "wiki_mapping.json missing at $MAP" >&2; exit 1; fi

python3 - <<PY
import json, os, sys, datetime
KB = "$KB"
MAP = "$MAP"
m = json.load(open(MAP))
files = m["files"]
local = sorted(f for f in os.listdir(KB) if f.endswith(".md"))
print(f"# KB Status\nparent wiki: {m['wiki_parent_url']}\n")
print(f"{'file':40s} {'lines':>6s} {'chars':>7s} {'mapped':>6s} last_pushed")
print("-" * 90)
for f in local:
    path = os.path.join(KB, f)
    txt = open(path).read()
    lines = txt.count('\n') + 1
    chars = len(txt)
    info = files.get(f)
    mapped = "Y" if info else "N"
    pushed = info["last_pushed"] if info else "-"
    print(f"{f:40s} {lines:>6d} {chars:>7d} {mapped:>6s} {pushed}")
extra = set(files) - set(local)
if extra:
    print("\nIn mapping but not on disk:")
    for f in sorted(extra): print(f"  {f} -> {files[f]['url']}")
PY
