# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

This is **not a code repository**. It is a content/knowledge-base workspace for building a 七陌 (7Moor) RAG-powered customer service Agent for the MiniMax 开放平台 (Open Platform). Work consists of:

1. Pulling source content from 飞书 (Feishu) wiki docs via `lark-cli`.
2. Rewriting them as RAG-friendly Markdown under [knowledge_base/](knowledge_base/) for ingestion into 七陌.
3. Evaluating customer-service vendors (七陌 / 网易七鱼 / 容联七陌) — vendor manuals live in [客服系统资料/](客服系统资料/).

The full task brief and the link queue are in [任务指令_客服知识库梳理.md](任务指令_客服知识库梳理.md). All ten links in that queue are currently marked 已完成; new links get appended to the same table.

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
