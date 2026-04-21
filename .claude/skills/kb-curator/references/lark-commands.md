# lark-cli 命令速查

所有命令默认 `--as user`(已登录 Jet.D)。涉及写入的操作需要 user 身份的 `wiki:node:create` + `docx:document:create` 权限。

## fetch:从 wiki 节点读取 markdown

```bash
lark-cli docs +fetch --doc "https://www.feishu.cn/wiki/<wiki_node>" --format pretty
```

或用 doc_id:

```bash
lark-cli docs +fetch --doc "<doc_id>" --format pretty
```

返回:markdown 文本(stdout)。

## update:更新已存在的文档

```bash
lark-cli docs +update \
  --doc "<doc_id 或 wiki url>" \
  --markdown "$(cat path/to/file.md)" \
  --mode overwrite
```

`--mode` 取值:

| 值 | 用途 |
|---|---|
| `overwrite` | 整篇替换。**默认推荐**,简单可靠 |
| `append` | 在文档末追加 |
| `replace_range` | 替换指定区间(配合 `--selection-by-title` 或 `--selection-with-ellipsis`) |
| `replace_all` | 全文替换某段文本 |
| `insert_before` / `insert_after` | 在某锚点前/后插入 |
| `delete_range` | 删除指定区间 |

`--selection-by-title`:用 markdown 标题定位,如 `'## 开票'`。
`--selection-with-ellipsis`:用前后文定位,如 `'问题开始...问题结束'`。

**例:覆盖整篇**

```bash
cd knowledge_base && lark-cli docs +update \
  --doc "https://www.feishu.cn/wiki/V4LDwIfqZiWdXNkD8cKcj7sanxe" \
  --markdown "$(cat 开平客服需知信息.md)" \
  --mode overwrite
```

**例:替换某个 ## 段落**

```bash
lark-cli docs +update \
  --doc "<wiki url>" \
  --selection-by-title "## 开票" \
  --markdown "$(cat new_section.md)" \
  --mode replace_range
```

## create:在父 wiki 节点下创建新子文档

```bash
lark-cli docs +create \
  --wiki-node YylYwP4AWicKt8kdqdCcv2Tanaf \
  --title "<新文档标题>" \
  --markdown "$(cat path/to/new.md)"
```

返回 JSON:

```json
{
  "ok": true,
  "data": {
    "doc_id": "<新 doc_id>",
    "doc_url": "https://www.feishu.cn/wiki/<新 wiki_node>"
  }
}
```

把 `doc_id` 和从 `doc_url` 里提取的 `wiki_node` 写入 `state/wiki_mapping.json`(skill 内部状态)。

## auth:权限检查与重新登录

```bash
# 检查
lark-cli auth check --scope "wiki:node:create docx:document:create"

# 缺权限时,发起设备授权(--no-wait 立即返回 verification_url)
lark-cli auth login --scope "wiki:node:create docx:document:create wiki:node:read docx:document:readonly" --no-wait --json
```

把返回的 `verification_url` 给用户,他在浏览器里授权。然后用返回的 `device_code` 完成:

```bash
lark-cli auth login --device-code "<device_code>" --json
```

## 注意:zsh 变量陷阱

zsh 内置只读变量 `status`,在 shell 脚本里**不要**用 `status=` 赋值,改用 `st=` 或其他名字。
