# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

This is **not a code repository**. It is a content/knowledge-base workspace for building a 七陌 (7Moor) RAG-powered customer service Agent for the MiniMax 开放平台 (Open Platform). Work consists of:

1. Pulling source content from 飞书 (Feishu) wiki docs via `lark-cli`.
2. Rewriting them as RAG-friendly Markdown under [knowledge_base/](knowledge_base/) for ingestion into 七陌.
3. Evaluating customer-service vendors (七陌 / 网易七鱼 / 容联七陌) — vendor manuals live in [客服系统资料/](客服系统资料/).

The day-to-day knowledge maintenance workflow is owned by the **kb-curator skill** at [.claude/skills/kb-curator/](.claude/skills/kb-curator/) — invoke it for any add/edit/query/sync of `knowledge_base/*.md` or BadCase handling. Skill state (file ↔ wiki node mapping) lives at [.claude/skills/kb-curator/state/wiki_mapping.json](.claude/skills/kb-curator/state/wiki_mapping.json).

## Provenance

The 14 files under `knowledge_base/` were initially derived (2026-04-21) from the merged Feishu wiki doc [客服售后系统资料 1.0](https://vrfi1sk8a0.feishu.cn/wiki/Md2CwcEppiqfTxk5JiacjMo7n8f), which itself superseded an earlier 10-doc set under wiki space `7547552167591559171`. After the initial rewrite, **local Markdown is the source of truth**; Feishu wiki node `YylYwP4AWicKt8kdqdCcv2Tanaf` (「开平客服｜knowledge_base」) is its published mirror, maintained by the kb-curator skill.

## knowledge_base/ file boundaries

These 14 files have **explicit topical ownership** — when adding new Q&A, route to the correct file by topic. Duplicates across files are intentionally allowed (七陌 RAG benefits from multiple recall paths).

| File | Owns |
|---|---|
| [开平客服需知信息.md](knowledge_base/开平客服需知信息.md) | 开票 / 账户 / 企业认证 / 报错排查入口 / Trace ID / 代金券 / 退款 / Tokenplan升级杂项 |
| [产品介绍与定价.md](knowledge_base/产品介绍与定价.md) | 模型矩阵、付费模式选型、价格档位概览(详细 Token Plan 规则不在这里) |
| [文本/语音/视频/图像/音乐模型使用指南.md](knowledge_base/) | 各模态 API 调用细节、参数、示例、计费 |
| [文件管理使用指南.md](knowledge_base/文件管理使用指南.md) | 文件上传/列出/检索/下载/删除接口 |
| [Token_Plan专项.md](knowledge_base/Token_Plan专项.md) | **Token Plan 主版本** —— 套餐、限制、5 小时重置、升降级、退款、邀请、多模态使用 |
| [快速入门与使用指南.md](knowledge_base/快速入门与使用指南.md) | 接入准备、API Key 三种类型选型、MCP、综合 API 能力索引 |
| [常见问题解答.md](knowledge_base/常见问题解答.md) | 综合 FAQ 入口(允许与专项文件内容重复) |
| [MiniMax_Agent客服知识.md](knowledge_base/MiniMax_Agent客服知识.md) | **MiniMax Agent 独立产品**(不是开放平台 API),术语和规则与开平不同 |
| [OpenClaw接入指南.md](knowledge_base/OpenClaw接入指南.md) | 第三方工具 OpenClaw 的接入和报错(401/Cooldown/413/timeout/OAuth 等) |
| [技术类报错排查.md](knowledge_base/技术类报错排查.md) | **报错主版本** —— 错误码 1000/1305/520/2061/2062/2064、Claude Code、网络、MCP、VSCode 插件 |

## Workflow for ingesting a Feishu doc

One conversation = one link. The user is logged into `lark-cli` as `Jet.D`.

```bash
lark-cli docs +fetch --doc "<飞书文档URL>" --format pretty
```

Then write the rewritten Markdown to `knowledge_base/<主题>.md` — **one Feishu doc → one MD file**, multiple subtopics organized via `##` headings inside the same file (do not split across files).

After writing, update the status table in [任务指令_客服知识库梳理.md](任务指令_客服知识库梳理.md) (`状态` → 已完成, `输出文件` → filename).

## RAG-friendly authoring rules (七陌 ingestion)

These are hard constraints from the platform — violations break retrieval quality:

- **Paragraphs ≤ 2048 chars** (七陌 chunk limit). Split longer sections by subtopic.
- **Self-contained paragraphs** — each chunk must stand alone after slicing. Repeat key terms; never use 它/该功能 / pronouns that reference earlier paragraphs.
- **Answer first, explanation after** — conclusion-led structure.
- **Front-load keywords** — phrase headings/openings the way a user would ask.
- **Markdown headings only** (`#` `##` `###`) — never hand-written numbering like "1.1" / "3.2".
- **Lists for hierarchy** — ordered/unordered lists, not manual numbering inside prose.
- **Preserve URLs verbatim** — platform addresses and form links must stay complete.
- **Consistent terminology** — same concept, same wording everywhere in the file.
- **Images → text** — 七陌 cannot parse image semantics; rewrite image content as prose.
- **Simplify tables** — convert merged-cell tables to natural language; for tables that stay, ensure each row is independently complete.

## Domain conventions to preserve

When editing knowledge-base files, keep these distinctions intact — they are the most common source of customer confusion:

- **国内 vs 国际域名**: 国内用 `minimaxi.com` (extra `i`), 国际用 `minimax.io`. Never mix.
- **API base URLs differ by compatibility mode**: OpenAI-compatible uses `/v1`; Anthropic-compatible uses `/anthropic`.
- **海外平台仅支持谷歌邮箱登录** — call this out wherever signup is mentioned.

## Vendor procurement context

Memory tracks ongoing vendor evaluation (容联七陌 trial leaning toward recommend; 网易七鱼 awaiting quote). Vendor reference manuals are in [客服系统资料/](客服系统资料/) (large PDFs/DOCX — read with the `pdf` / `docx` skills, not raw `Read`).
