# 故障排查

## 权限不足:Unauthorized / scope missing

症状:`MCP: create wiki node failed: ... required one of these privileges: [wiki:wiki, wiki:node:create]`。

原因:user token 没拿到对应 scope。

修复:

```bash
lark-cli auth check --scope "wiki:node:create docx:document:create"
# 如果 missing 不为空,重新登录:
lark-cli auth login \
  --scope "wiki:node:create wiki:node:read wiki:space:read docx:document:create docx:document:write_only docx:document:readonly" \
  --no-wait --json
```

把返回的 `verification_url` 给用户(在浏览器里点),拿到 `device_code` 后:

```bash
lark-cli auth login --device-code "<device_code>" --json
```

可以加 `&` 后台跑等用户,或用 ScheduleWakeup。

## 应用待审批:authorization failed: The app is pending approval

user 身份首次或扩 scope 时,如果飞书后台还没批准,会卡在 `pending approval`。

兜底:回退到 bot 身份(`--as bot`)。但 bot 没有 wiki:node:create,只能读不能写。如果是 read 操作可用。否则只能等管理员批准。

## bot 拿不到 wiki:tenant needs read permission

症状:bot 身份调 `wiki spaces get_node` 报 `[131006] permission denied: node permission denied, tenant needs read permission`。

原因:bot 不是该 wiki space 的成员。

修复(两条路任选):

1. 在飞书 wiki 设置 → 成员管理 → 把 app `cli_a940d2e2ea399bd2` 加为可阅读成员
2. 或改用 user 身份(`--as user`)

## 命令报 `unknown flag`

CLI 版本可能更新过。先 `lark-cli <subcommand> --help` 确认参数名,不要靠记忆。

## zsh:read-only variable: status

zsh 内置 `status` 是只读的,在 shell 脚本里**不能**用 `status=` 赋值。改名:`st=`、`ok=`、`result=`。

## 限流

短时间大量 push/create 可能触发限流,串行操作之间 sleep 1 秒比较保险。如果遇到 429 或 NETWORK:5002,稍等几秒重试。

## 飞书 API 返回但未生效(罕见)

如果 push 后立刻 fetch 看不到新内容,可能是 wiki 缓存延迟。等 5-10 秒再 fetch。
