# MiniMax Token Plan 专项

本文件是 MiniMax Token Plan 的主版本说明文档，覆盖 Token Plan 的产品定义、套餐价格、限制特性、极速版与标准版区别、API Key 获取、额度查询、兼容工具、5 小时重置规则、限额处理、升降级、退款、周额度、邀请活动以及多模态使用等全部主题。

适用平台：MiniMax 开放平台（国内，域名 `minimaxi.com`）。Token Plan 的官方订阅入口：https://platform.minimaxi.com/subscribe/token-plan ；账户管理入口：https://platform.minimaxi.com/user-center/payment/token-plan 。

---

## 产品定义

### Q. Token Plan 是什么？适合哪些用户使用？

Token Plan 是 MiniMax 面向 AI 场景推出的全模态订阅计划，支持文本、语音、视频、音乐、图像等全模态模型，以「请求（request）」为计费单位。

适用人群：

- 在 Claude Code、Cursor、Cline、OpenCode、OpenClaw、Codex CLI、MonkeyCode、Kilo Code、Droid 等 AI 编程工具里高频调用 MiniMax 文本模型的用户。
- 需要使用 MiniMax 语音、音乐、视频、图像等多模态模型的用户。
- 希望以固定订阅费覆盖所有支持模型、追求性价比的用户。

详细介绍：https://platform.minimaxi.com/docs/token-plan/intro

### Q. Coding Plan 是什么？

Coding Plan 是 Token Plan 的**前身套餐名称**。在 **2026 年 3 月 18 日** 之前，Coding Plan 是 MiniMax 面向 AI 编码场景推出的订阅计划，仅支持文本模型，按 prompt 计费，适用于纯编程 coding 场景。

自 **2026 年 3 月 18 日** 起，Coding Plan 已**升级为 Token Plan**，套餐权益全面升级，覆盖全模态模型与最新 M2.7。Coding Plan 已停售，新用户请直接订阅 Token Plan。

### Q. Coding Plan 与 Token Plan 的区别是什么？

| 对比项 | Coding Plan（已停售） | Token Plan（当前） |
|---|---|---|
| 状态 | 2026 年 3 月 18 日前的旧套餐，已停售 | 2026 年 3 月 18 日起的当前套餐 |
| 模型支持 | 仅支持文本模型 | 支持全模态模型（文本+语音+视频+音乐+图像） |
| 计费单位 | 以 prompt 为计费单位 | 以请求（request）为计费单位 |
| 适用场景 | 纯编程 coding 场景 | 编程 + 多模态内容创作 |
| 模型版本 | 旧版文本模型 | 最新 M2.7 大语言模型 |
| 极速能力 | 无 | 新增 M2.7-highspeed 专属极速推理 |

主要升级点：

1. **模型升级**：支持最新的 M2.7 大语言模型。
2. **全模态支持**：新增语音合成、视频生成、音乐生成、图像生成等能力。
3. **极速版**：新增 M2.7-highspeed 专属极速推理。
4. **计费优化**：从 prompt 改为更直观的请求计数。

### Q. Token Plan 的核心优势有哪些？

1. **全模态统一访问**：在单一订阅额度下使用所有模态模型（文本、语音、视频、音乐、图像）。
2. **搭载最新 M2.7 模型**：所有套餐均支持最新的 M2.7 大语言模型。
3. **极具性价比**：固定订阅费即可覆盖所有支持的模型，无需按量付费。
4. **持续获取新模型**：订阅有效期内自动获得未来发布的新模型访问权限。

---

## 套餐价格

完整定价文档：https://platform.minimaxi.com/docs/guides/pricing-token-plan

### Q. Token Plan 的计费方式是怎样的？

Token Plan 的计费方式按模型类型区分：

- **M2.7 / M2.7-highspeed 文本模型**：按请求（request）计费，采用 **5 小时滚动窗口** 重置。
- **其他模型（语音 / 图像 / 视频 / 音乐）**：按每日额度计费，**每日重置**。
- **各模型额度独立计算**，互不影响。
- 支持按月订阅和按年订阅，按年订阅有额外折扣，配额与月度相同。

### Q. Token Plan 标准版各档位套餐价格和额度分别是多少？

Token Plan 按月订阅（标准版）共三档：

| 套餐 | 月费 | M2.7 文本（5 小时） | 语音 Speech 2.8（每日） | 图像 image-01（每日） | 视频（每日） | 音乐 Music-2.6（每日） |
|---|---|---|---|---|---|---|
| Starter | ￥29/月 | 600 次请求 | 不支持 | 不支持 | 不支持 | 100 首（限时免费推广） |
| Plus | ￥49/月 | 1500 次请求 | 4000 字符 | 50 张 | 不支持 | 100 首（限时免费推广） |
| Max | ￥119/月 | 4500 次请求 | 11000 字符 | 120 张 | Hailuo-2.3-Fast 768P 6s 2 条 + Hailuo-2.3 768P 6s 2 条 | 100 首（限时免费推广） |

档位说明：

- **Starter（￥29/月）**：仅支持文本模型 M2.7 和 Music-2.6（限时免费推广）。
- **Plus（￥49/月）** 起：支持语音和图片。
- **Max（￥119/月）** 起：支持全模态（含视频）。

### Q. Token Plan 极速版各档位套餐价格和额度分别是多少？

Token Plan 按月订阅（极速版）共三档，专属支持 M2.7-highspeed 模型：

| 套餐 | 月费 | M2.7-highspeed（5 小时） | 语音 Speech 2.8（每日） | 图像 image-01（每日） | 视频（每日） | 音乐 Music-2.6（每日） |
|---|---|---|---|---|---|---|
| Plus 极速版 | ￥98/月 | 1500 次请求 | 9000 字符 | 100 张 | 不支持 | 100 首（限时免费推广） |
| Max 极速版 | ￥199/月 | 4500 次请求 | 19000 字符 | 200 张 | Hailuo-2.3-Fast 768P 6s 3 条 + Hailuo-2.3 768P 6s 3 条 | 100 首（限时免费推广） |
| Ultra 极速版 | ￥899/月 | 30000 次请求 | 50000 字符 | 800 张 | Hailuo-2.3-Fast 768P 6s 5 条 + Hailuo-2.3 768P 6s 5 条 | 100 首（限时免费推广） |

### Q. Token Plan 是否支持按年订阅？

支持。Token Plan 支持按年订阅，按年订阅享有额外折扣，配额与按月订阅相同（即每月获得对应配额）。具体折扣以官网订阅页面 https://platform.minimaxi.com/subscribe/token-plan 显示为准。

### Q. Token Plan 的 Music-2.6 音乐生成是免费的吗？

Music-2.6 目前处于**限时免费推广**期，所有 Token Plan 套餐（包括 Starter）均可使用，每个套餐每日 100 首额度，每首歌曲时长 ≤ 5 分钟。免费推广期结束后规则以官方公告为准。

---

## 限制与特性

### Q. Token Plan 有哪些关键限制和特性？

- **M2.7 文本模型**：用量以「请求（request）」为单位，采用 **5 小时滚动窗口** 额度计算。
- **其他模型（语音 / 图像 / 视频 / 音乐）**：使用每日额度，每日重置。
- **极速版 M2.7-highspeed**：每次调用消耗 1 次请求（与标准版 M2.7 单次调用消耗相同）。
- **额度独立**：各模型额度独立计算，互不影响。
- **Music-2.6 限时免费**：所有套餐均可使用，每首歌曲时长 ≤ 5 分钟。
- **多工具共享**：同一套餐可在多个 AI 编程工具中并行使用，但额度共享。
- **Key 不混用**：Token Plan API Key 与按量付费 API Key 不能混用，且 Token Plan API Key 仅在订阅有效期内可用。

---

## 极速版 vs 标准版

### Q. Token Plan 极速版和标准版有什么区别？

| 对比项 | 标准版 | 极速版 |
|---|---|---|
| 专属模型 | M2.7 | M2.7-highspeed（专属） |
| 推理速度 | 标准速度 | 更快的推理速度 |
| 单次调用消耗 | 1 次请求 | 1 次请求（与标准版相同） |
| 适用场景 | 通用 AI 编程与多模态创作 | 对响应速度有较高要求的场景 |
| 套餐档位 | Starter / Plus / Max | Plus 极速版 / Max 极速版 / Ultra 极速版 |

注意：极速版唯一专属能力是接入 **MiniMax-M2.7-highspeed** 模型，带来更快的推理响应。极速版与标准版在「请求」消耗规则上一致。

---

## 获取 API Key

### Q. 如何获取 Token Plan 的 API Key？

完成 Token Plan 套餐订阅后，访问「账户管理 / Token Plan」页面获取 API Key：

https://platform.minimaxi.com/user-center/payment/token-plan

注意事项：

- Token Plan API Key 仅在订阅有效期内可用。
- Token Plan API Key 不能与按量付费 API Key 混用。
- 如需切换至按量付费，需替换为按量付费 API Key。

---

## 查看额度

### Q. 如何查看 Token Plan 剩余额度？

提供两种方式查看 Token Plan 剩余额度：

- **方式一：订阅管理页面**
  访问 https://platform.minimaxi.com/user-center/payment/token-plan ，可查看当前订阅状态与各模型剩余额度。
- **方式二：通过 API 查询**
  调用查询 API 获取实时剩余额度，适合在工具或脚本中集成。

---

## 兼容的 AI 编程工具

### Q. Token Plan 支持接入哪些 AI 编程工具？

Token Plan 当前支持以下主流 AI 编程工具：

- OpenCode
- OpenClaw
- Claude Code
- Cursor
- Cline
- Codex CLI
- MonkeyCode
- Kilo Code
- Droid

详细接入指南：https://platform.minimaxi.com/docs/guides/text-ai-coding-tools

### Q. 可以同时在多个 AI 编程工具里使用同一个 Token Plan 套餐吗？

可以。同一个 Token Plan 套餐可以同时在多个 AI 编程工具里使用，但**额度是共享的**——所有工具的请求都会从同一个套餐的 5 小时滚动窗口请求池中扣减。

### Q. 在 Token Plan 下如何切换模型？

直接在 API 请求中修改 `model` 参数即可。Token Plan 支持的所有文本模型共享同一个套餐请求额度（M2.7 用标准版额度，M2.7-highspeed 用极速版额度）。

---

## 5 小时滚动窗口重置规则

### Q. Token Plan「每 5 小时重置」具体是怎么计算的？

Token Plan 的 M2.7 / M2.7-highspeed 文本请求额度采用**动态速率限制（5 小时滚动窗口）**机制：

- 系统统计**最近 5 小时内**的请求使用量。
- 超过 5 小时的历史用量会**自动释放**，重新可用。
- 不是「整点重置」也不是「每 5 小时打卡式清零」，而是**连续滚动**。

举例：若你在上午 10:00 用掉 100 次请求，那么这 100 次会占用你的额度直到下午 15:00（10:00 + 5 小时），15:00 后这部分用量自动释放。

注意：5 小时滚动窗口规则**仅适用于 M2.7 / M2.7-highspeed 文本模型**。语音、图像、视频、音乐模型采用「每日额度，每日重置」规则，不走 5 小时滚动窗口。

---

## 限额处理

### Q. 达到 Token Plan 套餐限额后应该怎么办？

按模型类型分别处理：

**文本模型（M2.7 / M2.7-highspeed）限额 —— 5 小时滚动窗口：**

1. **切换至按量计费**：替换为按量计费 API Key，按实际 Token 用量计费继续调用。
2. **等待额度恢复**：5 小时滚动窗口计算，暂停使用等待最早的请求超过 5 小时后自动释放额度。

**非文本模型（语音 / 图像 / 视频 / 音乐）限额 —— 每日额度：**

1. **切换至按量计费**：使用按量计费 API Key 继续调用对应模型。
2. **等待次日重置**：每日额度会在次日自动重置。

### Q. Token Plan API Key 和普通按量付费 API Key 能混用吗？

**不能混用。**

- Token Plan API Key：用于订阅套餐，按请求计数扣减套餐额度，仅在订阅有效期内可用。
- 普通 API Key：用于按量付费，按实际 Token 消耗计费。

两者计费机制和归属账户体系不同，必须分开使用。如需在套餐限额后继续调用，需替换为按量付费 API Key。

---

## 升级与降级

### Q. Token Plan 套餐可以升级吗？

可以。Token Plan 套餐升级流程：

- 直接在官网 https://platform.minimaxi.com/subscribe/token-plan 选择新套餐订阅。
- 原套餐剩余权益会**折算抵扣**新套餐部分费用。
- 新套餐**立即生效**。
- 原套餐周期**立即终止**，升级后**重新计算**新的订阅自然周期。

### Q. Token Plan 套餐可以降级吗？

目前 Token Plan 套餐权益**暂不支持直接降级**。如需更换更低档位套餐，操作步骤：

1. 在支付宝订阅管理中**关闭自动续订**。
2. 等待当前套餐周期**自然结束**。
3. 周期结束后，重新选择合适档位的套餐订阅即可。

---

## 退款政策

### Q. Token Plan 支持退款吗？退款政策是什么？

Token Plan 支持退款，但需符合以下条件：

**一、退款金额**：退款金额**按天核算**，以套餐生效日至提交退款申请日为已使用周期，扣除已使用天数费用后退还剩余金额。退款以**实际支付金额**为基数，购买时使用的**代金券不予返还**。

**二、权益回收**：提交退款申请后 **1-2 个工作日内**将回收相关权益；若期间仍有权益任务消耗，将默认**取消本次退款申请**。

**三、退款表单**：填写「套餐退款申请表」：[MiniMax Token Plan 用户权益变更表](https://vrfi1sk8a0.feishu.cn/share/base/form/shrcnj5q5gfC4KkUxLcQXD9IDsn)

**四、支付方式与到账时间**：

- 支付宝**全额购买**：原路返回。
- **合并支付**（使用部分代金券 / 余额）：退款会需要 **3-5 天** 处理。
- 退款将在 **7-15 个工作日**内到账。

---

## 周额度限制规则

### Q. Token Plan 周额度限制规则是什么？

Token Plan 周额度限制按购买时间区分两类用户：

- **2026 年 3 月 22 日 23:59:59 之前购买的用户**：**不受**周额度限制，平级续订或升级后**也不会**受周限制影响。
- **2026 年 3 月 23 日 00:00:00 起购买的用户**：**适用**周额度限制规则。

注意：周额度限制**仅限制 M2.x 系列文本生成模型**（即 M2.7 / M2.7-highspeed），不影响语音、图像、视频、音乐等其他模型。

### Q. 我是 Token Plan 老用户，原本没有使用限制，升级后会受周额度限制影响吗？

按购买时间判定：

- **2026 年 3 月 22 日 23:59:59 前购买的用户**：不受周额度限制，**平级续订或升级**后仍不受该限制影响。
- **2026 年 3 月 23 日 00:00:00 起购买的用户**：需遵守周额度限制规则。
- 该限制**仅针对 M2.x 系列文本生成模型**，不影响其他模态模型。

---

## 订阅、邀请与企业批量采购

### Q. 如何订阅 Token Plan？

可在 MiniMax 官网订阅 Token Plan：https://platform.minimaxi.com/subscribe/token-plan

通过**好友邀请链接**订阅，可享 **9 折优惠**。

### Q. Token Plan 的邀请活动规则是什么？

Token Plan 邀请活动详细规则请关注 MiniMax 官方公告。当前已知优惠：通过好友邀请链接订阅可享 9 折优惠。

### Q. 企业批量采购 Token Plan 的流程是什么？

企业批量采购 Token Plan 的商务流程：

**框架协议 → 线下打款 → 发合作邮件 → 权益下发 → 找财务入账 → 开票申请。**

如有意启动批量采购合作，请通过官方邮箱 **api@minimaxi.com** 与 MiniMax 团队取得联系，将由专人对接。

### Q. 订阅年度 Token Plan 套餐后，未来发布的新模型用户能自动获得访问权限吗？

可以。Token Plan 用户在订阅有效期内会**持续获得**最新发布的模型，无需额外付费即可使用新模型（在套餐额度范围内）。

---

## 多模态使用（MiniMax CLI / mmx-cli）

### Q. Token Plan 用户如何使用多模态能力（语音 / 视频 / 音乐 / 图像）？

Token Plan 用户可通过安装 **MiniMax CLI（mmx-cli）** 工具，**无需写代码**即可在 AI Agent 中调用 MiniMax 的全部多模态能力。

- GitHub 仓库：https://github.com/MiniMax-AI/cli
- 配置文档：https://platform.minimaxi.com/docs/token-plan/minimax-cli

### Q. MiniMax CLI（mmx-cli）的安装方式有哪些？

提供两种安装方式：

**安装方式一：通过 Agent 安装（推荐）**

在 OpenClaw、Claude Code、Cursor 等 AI Agent 中发送以下提示词，Agent 会自动完成安装和配置：

```plaintext
帮我安装 MiniMax CLI：https://github.com/MiniMax-AI/cli
```

**安装方式二：手动安装**

1. 全局安装 mmx-cli：`npm install -g mmx-cli`
2. 使用 API Key 认证：`mmx auth login --api-key sk-xxxxx`

### Q. MiniMax CLI（mmx-cli）支持哪些多模态能力？

mmx-cli 支持以下多模态能力：

- **文本**：多轮对话、流式输出、系统提示词、JSON 输出。
- **图像**：文生图，支持宽高比和批量生成。
- **视频**：异步视频生成（Hailuo 2.3），支持任务查询和下载。
- **语音**：文本转语音（TTS），支持多种音色和流式输出。
- **音乐**：文生音乐（Music 2.6），支持歌词模式和纯音乐模式。
- **图像理解**：识别和理解图片内容，支持本地文件、URL 和 file_id。
- **网络搜索**：内置搜索能力。

### Q. 如何在 Agent 中通过自然语言调用 MiniMax CLI 的多模态能力？

安装 mmx-cli 后，在 Agent 中直接用自然语言描述需求即可，示例：

- 生成视频：「生成一段视频：夕阳下，一只猫坐在窗边望向远方」
- 生成音乐：「生成一首轻快爵士风格的歌曲，主题是夏天的海边」
- 语音合成：「用温柔女声朗读：欢迎使用 MiniMax Token Plan」
- 生成图片：「生成一张赛博朋克风格的城市夜景图，16:9 比例」

生成的文件保存在当前目录下的 `minimax-output/` 文件夹中。

### Q. 如何手动调用 MiniMax CLI（mmx-cli）的命令？

mmx-cli 提供以下手动 CLI 命令：

- 文本：`mmx text chat --message "你的问题"`
- 视频：`mmx video generate --prompt "视频描述"`
- 音乐：`mmx music generate --prompt "音乐描述" --out output.mp3`
- 语音：`mmx speech synthesize --text "朗读内容" --out voiceover.mp3`
- 图像：`mmx image "图片描述"`

运行 `mmx`（不带任何参数）可打开 CLI 仪表盘，查看可用资源、使用量和帮助信息。
