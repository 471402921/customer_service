---
name: kb-curator
description: 维护「开平客服｜knowledge_base」飞书知识库 (CRUD) 与处理客服 BadCase。当用户想新增/修改/查询/同步 knowledge_base/*.md 文件或对应飞书 wiki 节点的客服知识时使用,以及当用户带着客服答错的真实案例(BadCase / 用户反馈 / 客户截图)来要"修一下知识库"时使用。覆盖场景:"加一条 Q&A"、"改某条回答"、"新建一个主题文档"、"看下知识库现状"、"把本地改的推到飞书"、"从飞书拉最新版"、"客服答错了帮我修下"、"看下今天的 badcase"、"@badcases/xxx.md 处理一下"。即使用户没明说"飞书"或"知识库",只要话题是 MiniMax 开放平台客服 FAQ/手册的增改查或答错修复,都用这个 skill。
---

# kb-curator —— 开平客服知识库维护

## 你在帮谁做什么

用户是 MiniMax 开放平台的客服管理同学。他们要维护一份发布在**飞书 wiki**(节点「开平客服｜knowledge_base」)、底层喂给**七陌 RAG** 的客服知识库。本地仓库的 `knowledge_base/*.md` 是**唯一可信源**(source of truth),飞书是它的发布镜像。

你的任务是把"加一条 Q&A"、"改某个回答"、"新增一个主题"、"看现在有什么"这种自然语言指令,翻译成对**本地 MD 的精确修改 + 推送到飞书**的两步动作。

## 路径与配置

- 本地知识库目录:`knowledge_base/`(相对仓库根)
- 文件 ↔ wiki 节点映射:`.claude/skills/kb-curator/state/wiki_mapping.json`(skill 自有状态)
- 父 wiki 节点:`YylYwP4AWicKt8kdqdCcv2Tanaf`(space `7612502644069780687`)
- RAG 写作规范:见仓库 `CLAUDE.md` 的「RAG-friendly authoring rules」段落
- 工具链:`lark-cli`(已登录用户 Jet.D)

## 核心工作流

### 1. 触发即先 read mapping

任何操作前**先读 `state/wiki_mapping.json`**(相对 skill 根目录)。这是所有操作的索引。

### 2. 操作分类

| 用户意图(示例) | 你要做的事 |
|---|---|
| "知识库现在有什么"/"列一下" | 读 mapping + 列出文件名/URL/lines/last_pushed |
| "在 XX 文档里加一条 Q:..." | 见「§ Q&A 级:增加」 |
| "把 XX 的 Q…… 改成 ……" | 见「§ Q&A 级:修改」 |
| "新建一个主题:XXX" | 见「§ 文档级:新建」 |
| "改下整篇 XX(改动较大)" | 见「§ 文档级:整篇覆盖」 |
| "把本地改的推到飞书" | 见「§ 推送(push)」 |
| "从飞书拉最新版" | 见「§ 拉取(pull)」 |
| "删除 XX 文档" | **不在此 skill 范围**。告知用户去飞书手动删,删完再 `delete_local_and_unmap` |

### 3. RAG 规范是硬约束

任何写入(新增/修改 Q&A、新建文档)都必须遵守仓库 `CLAUDE.md` 中的 RAG 友好规范:

- 段落 ≤ 2048 字符,自包含,无指代词("它/该功能"等)
- 答案前置(先结论再解释),关键词前置(按用户问法组织标题)
- Q&A 格式 `### Q. xxx?` 必须保留,Q 中包含核心关键词
- URL 一字不改保留
- 术语统一:`minimaxi.com`(国内,多个 i)/ `minimax.io`(国际),Token Plan / 按量计费 / 资源包名称固定

写入前**自检**这些点;写入后再读一遍验证。

## § Q&A 级:增加

1. 读取目标 MD 文件
2. 找到合适的 `##` 子主题(若没有,可新增一个)
3. 在该子主题下追加:
   ```markdown
   ### Q. <关键词前置的问句>?
   <答案前置的回答,必要时用列表分点>
   ```
4. 用 `Edit` 写回本地
5. 触发 push(见下文)更新对应 wiki 节点

## § Q&A 级:修改

1. 读取目标 MD 文件
2. 用 `Grep` 或 `Read` 定位到要改的 `### Q. ...?` 块
3. 用 `Edit` 替换该 Q&A 的答案部分(注意保持周围的 Q&A 不变)
4. push 到 wiki

**注意**:用户经常用模糊关键词(如"5 小时重置那条"),你需要 Grep 找到所有候选,如果命中多条,**列出来让用户确认是哪一条**,不要猜。

## § 文档级:新建

新主题应单独成文(对应一个 wiki 子节点)。流程:

1. 跟用户确认文件名(中文,无空格,主题清晰)和归属判定(参考 `CLAUDE.md` 里的「knowledge_base/ file boundaries」表)
2. 在 `knowledge_base/<新文件>.md` 写入完整内容(`# 标题` 开头,RAG 规范)
3. 推送创建新 wiki 子节点(见 `references/lark-commands.md` 的 `create` 段)
4. 把返回的 `doc_id`/`wiki_node`/`url` 写入 `state/wiki_mapping.json`

## § 文档级:整篇覆盖

适用场景:整篇文档大改、结构调整。

1. 修改本地 MD 完毕
2. push 时使用 `--mode overwrite`(直接整篇替换)
3. 更新 `last_pushed`

## § 推送 (push)

把本地变更推到对应 wiki 节点。

- **单文件 push**:见 `references/lark-commands.md` 的 `update` 段
- **追加 vs 覆盖**:小改用 `overwrite`(简单可靠);若是局部 Q&A 增加可用 `append`(在文档末追加),但需验证位置是否合理
- **多文件 push**:遍历需要推的文件串行 push,**避免并行**(可能触发限流)
- 每次 push 成功后,更新 `wiki_mapping.json` 的 `last_pushed`

## § 拉取 (pull)

从飞书拉最新内容覆盖本地。**慎用**:本地是 SoT,只在确认飞书侧有人手工改了的时候才拉。

详见 `references/lark-commands.md` 的 `fetch` 段。

## § 权限自检

任何"会写入"的操作之前,先用 `lark-cli auth check --scope "wiki:node:create docx:document:create"` 验证。如缺权限,触发 `lark-cli auth login --scope ...` 流程,把 verification_url 给用户(用户要在浏览器里点)。详见 `references/troubleshooting.md`。

## § Mapping 一致性

`state/wiki_mapping.json`(skill 内部状态)是机器维护的索引。每次:

- 新建文档 → 加一条
- 推送 → 更新 `last_pushed`
- 删除(手动飞书删后)→ 移除对应条目并通知用户

如果发现 mapping 缺条目(比如本地有 MD 但 mapping 里没有),先问用户是新文档要 push,还是 mapping 漂移要补回。

## § BadCase 驱动的修复流程

`badcases/YYYY-MM.md` 是按月归档的 BadCase 清单(详见 `badcases/README.md`)。**多人 append**,极简 4 行结构:

```markdown
## YYYY-MM-DD <关键词> @报告人
**问**:<用户原话>
**答错**:<Agent 实际回答>
**对的**:<期望答案>
```

收到"看下这个月的 badcase"/"@badcases/xxx.md 处理一下"/"客服答错了"等指令时:

1. **读取目标月份文件**(默认当月,用 `date +%Y-%m`)
2. **筛未处理的 case**:扫所有 `## YYYY-MM-DD ...` 段,**没有 `> ✅ 已修复` 行的就是未处理**
3. **逐条诊断**:对照「**问**/**答错**/**对的**」三段,自行判断错误类型(信息缺失/过时/矛盾/杜撰/链接失效/术语误用/格式问题/答非所问)。无需要求用户填类型字段
4. **定位文件**:Grep 「**问**」中的关键词在 `knowledge_base/` 找候选;若找不到合适文件,按「跨文件归属」表(SKILL.md 上文)选最合适的归属
5. **执行修改**:Edit 本地 MD,严格遵守 RAG 规范(`references/rag-rules.md`)
6. **push 到飞书**:`bash scripts/push.sh <file>` 单文件覆盖
7. **回填处理记录**:在该 case 段末尾 append 一行:

   ```markdown
   > ✅ 已修复 by kb-curator @ YYYY-MM-DD HH:MM — 改了「<文件名> → <段落>」,<wiki URL>
   ```

   wiki URL 从 `state/wiki_mapping.json` 取
8. **告诉用户**:简述本轮处理了几条、改了哪些文件、给 wiki 链接验收

**多个 case 指向同一文件**:合并成一次 Edit + 一次 push,但每条 case 都要单独回填处理记录(指向同一次 push 即可)。

**已处理过的 case**(有 `> ✅` 行的)**直接跳过**,不要重复处理。

## 子文件指引

- `references/lark-commands.md` —— `lark-cli` 的精确命令、参数、返回结构
- `references/rag-rules.md` —— RAG 写作规范的执行清单(写完自检用)
- `references/troubleshooting.md` —— 权限/限流/编码常见错误
- `scripts/status.sh` —— 列出 14 个文件的本地行数 vs `last_pushed`
- `scripts/push.sh <filename>` —— 推送单个文件到 wiki(覆盖模式)
