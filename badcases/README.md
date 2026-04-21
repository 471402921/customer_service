# BadCase 收集与处理

线上客服答错的真实案例放这里。**一个月一个文件**(如 `2026-04.md`),所有人在同一文件里**追加**自己遇到的 case,顺序无所谓。

## 怎么记一条 BadCase

只要 4 行,直接 append 到当月文件末尾即可:

```markdown
## YYYY-MM-DD <关键词> @你的名字
**问**:<用户原话,直接复制>
**答错**:<客服 Agent 实际给的回答>
**对的**:<你认为正确的答案,可以是要点>
```

**例子**:

```markdown
## 2026-04-22 发票类型答错 @Jet.D
**问**:MiniMax 开放平台支持开什么发票?
**答错**:只支持电子普票。
**对的**:支持电子普票和增值税专用发票,需要走 https://biaodan.info/web/formview/6503f8ba75a03c4a8388a91a 申请。
```

就这么多。**不需要**填错误类型、来源、状态等字段 —— 让 kb-curator skill 自己判断。

## 怎么让我修

记完一条或几条之后,在 Claude Code 里说:

- "处理一下这个月的 badcase" / "看下 4 月的 badcase"
- 或者直接 `@badcases/2026-04.md`

我会:
1. 扫这个月文件里**未处理**的 case(没有 `> 已修复` 行的就是未处理)
2. 逐条诊断 → 改 `knowledge_base/*.md` → push 飞书
3. 在每条 case 末尾追加一行处理记录:

```markdown
> ✅ 已修复 by kb-curator @ 2026-04-22 16:30 — 改了「开平客服需知信息.md → 开票」段,https://www.feishu.cn/wiki/V4LDwIfqZiWdXNkD8cKcj7sanxe
```

下次再来就只看没有 `> ✅` 标记的 case。

## 月度文件命名

- `YYYY-MM.md`,如 `2026-04.md`
- 月初新建一个空文件即可(或第一个记 case 的人顺手建)
- 已修复的 case 不要删,留作回归参考
