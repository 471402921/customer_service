# MiniMax Agent 客服知识

本文件覆盖 **MiniMax Agent**(独立 AI 助手产品线,入口 `agent.minimaxi.com`)的客服知识。MiniMax Agent 与 MiniMax 开放平台(`platform.minimaxi.com`)是两个独立的产品和账号体系,积分与余额完全不互通。本文档中的发票、积分、续费、API Key、退款、内容审核等规则均针对 MiniMax Agent 产品,与开放平台规则不同,不可混用。

## MiniMax Agent 产品总览

### Q. MiniMax Agent 是什么?入口地址是多少?

MiniMax Agent 是 MiniMax 推出的 AI 助手平台,入口为 `agent.minimaxi.com`。MiniMax Agent 平台包含四个核心产品:

- **Agent 对话模式**(智能 AI 对话):直接与 AI 进行多轮对话,支持知识库检索增强(RAG)
- **MaxClaw**(云端 AI 助手):云端托管的 OpenClaw 实例,7x24 运行,开箱即用
- **SkillHub**(技能社区):上百种现成技能,一键装入 MaxClaw
- **Desktop**(桌面端应用):在本地电脑部署 OpenClaw,自主掌控数据

注意:MiniMax Agent 是独立产品线,不是 MiniMax 开放平台 API。本文涉及的发票、积分、续费、API Key 等规则仅适用于 MiniMax Agent。

### Q. MiniMax Agent 新用户如何快速开始使用?

新用户推荐从 MaxClaw 开始,3 步完成:

1. 打开 `agent.minimaxi.com`,注册或登录账号
2. 进入 MaxClaw 页面,点击「创建」部署你的专属龙虾
3. 直接发消息开始使用,无需配置 API Key 或服务器

### Q. MiniMax Agent 的官方联系方式是什么?

MiniMax Agent 官方支持渠道:

- **官方邮箱**:`MiniMaxAgent@minimax.io`(发票、退款、积分异常、技术报错均通过此邮箱)
- **积分激励活动表单**:`https://vrfi1sk8a0.feishu.cn/share/base/form/shrcnIzj7eOF9Y3eL8zu8kAmBVe`

### Q. MiniMax Agent 客服机器人能回答什么问题?

MiniMax Agent 客服机器人主要解答:产品使用、功能咨询、积分计费、技术报错等问题。

不提供:图片/视频生成、闲聊、与产品无关的内容。

## Agent 对话模式

### Q. MiniMax Agent 对话模式是什么?有哪些核心能力?

Agent 对话模式是 MiniMax Agent 平台的核心 AI 对话功能,支持多轮上下文对话,可结合知识库实现精准问答。

核心能力:

- **多轮上下文对话**:AI 理解对话历史,连续追问、深入讨论
- **知识库检索增强(RAG)**:基于结构化知识库文档回答,结果更准确
- **工具调用**:联网搜索、图片生成、文件读写、代码执行等
- **多模态支持**:支持文本、图片输入

### Q. Agent 对话模式和 MaxClaw 有什么区别?

二者定位不同:

- **Agent 对话模式**:即时 AI 对话,无长期记忆(会话结束即重置),无定时任务,无 IM 接入,按 token 消耗积分
- **MaxClaw**:云端长期运行的个人 AI 助手,有长期记忆(MEMORY.md 持久化),支持 Cron 定时任务,支持飞书/企微/微信等 IM 接入,按 token 消耗积分

使用建议:

- 快速问答、单次任务 -> 选 Agent 对话模式
- 需要长期记忆、自动化、IM 接入 -> 选 MaxClaw

## MaxClaw 云端 AI 助手

### Q. MaxClaw 是什么?和 OpenClaw 是什么关系?

MaxClaw 是基于 OpenClaw 的云端 AI 助手服务,在云端为每个用户运行独立的 OpenClaw 实例,接入 MiniMax 自有模型,无需自备服务器或 API Key,开箱即用。MaxClaw 的昵称是「龙虾」。

MaxClaw 与 OpenClaw 的关系:**MaxClaw = 云端托管的 OpenClaw**。底层由 OpenClaw 驱动,接入 MiniMax 自有模型。如需本地部署,可自行安装 OpenClaw,参考 `openclaw.ai`。

### Q. MaxClaw 有哪些核心能力?

MaxClaw 核心能力:

- **7x24 云端运行**:随时待命,不依赖本地设备
- **长期记忆**:记住偏好、习惯、历史对话(MEMORY.md)
- **内置工具**:联网搜索、图片视频生成、文件读写、命令执行
- **定时任务(Cron)**:自动化每日新闻推送、定时提醒等
- **多端接入**:网页端 + 手机 APP + 飞书/钉钉/企微/微信

### Q. MaxClaw 支持哪些终端?手机 APP 和网页端数据互通吗?

MaxClaw 支持的终端:

- **网页端**(`agent.minimaxi.com`):支持,主要使用入口
- **手机 APP**(MiniMax 官方 App):支持,与网页端数据互通
- **飞书 / 企业微信 / 微信**:支持连接
- **PC 桌面客户端**:暂不支持 MaxClaw,请使用网页端

数据互通说明:MaxClaw 网页端和 MiniMax 官方手机 APP 使用同一账号,数据、积分、对话记录均共享。

### Q. 一个账号可以部署几只龙虾(MaxClaw)?多龙虾怎么用?

一个 MiniMax Agent 账号最多可同时部署 **3 只龙虾**,每只龙虾可以设置不同的名字、性格(SOUL.md)和专长,分别连接不同的 IM 机器人。

多龙虾分工示例:

- **小秘**:日程、邮件、提醒
- **老K**:代码、技术调研
- **阿财**:数据分析、报表

多龙虾 + IM 组合玩法:每只龙虾连接不同的 IM 机器人,加入同一群聊,@所有人可同时调动所有龙虾协作。

### Q. MaxClaw 生成的文件找不到怎么办?文件存储目录有哪些?

MaxClaw 文件存储说明:

- `memory/` 目录:Agent 内部工作区,不直接显示在文件列表
- `WorkSpace/` 目录:用户可见文件区

如找不到生成的文件,告诉 Agent「把文件移动到 WorkSpace 目录下」即可。

### Q. MaxClaw 版本可以手动更新吗?

不建议手动更新。MaxClaw 版本更新由官方定期推送,手动更新容易导致容器损坏、浪费积分。建议等待官方推送即可。

注意:版本更新后 IM 连接可能断开,需重新按对应平台流程重新配置。受影响用户可获得积分补偿,如未收到请提供 chat_id 联系 `MiniMaxAgent@minimax.io`。

## MaxClaw 功能使用

### Q. MaxClaw 的 /new 命令是做什么的?什么时候用?

`/new` 命令用于开启新对话,清除短期记忆(当前对话历史),不影响长期记忆(MEMORY.md、技能、配置等持久化内容)。

- **清除**:当前对话轮次的聊天记录(不再随请求发送给模型)
- **保留**:MaxClaw 记住的重要信息、设置、已安装技能

推荐用法:每完成一件事就发 `/new`,再开始下一件事,可大幅节省积分消耗。把 `/new` 当做「任务切换键」。

### Q. MaxClaw 的定时任务(Cron)怎么用?积分耗尽会怎样?

MaxClaw 支持定时自动执行任务,如每日新闻推送、定时提醒等。

注意事项:

- 积分耗尽时定时任务会停止,充值后自动恢复
- 如定时任务消失,可在网页端对话中重新配置

### Q. MaxClaw 支持哪些输入类型?有哪些工具能力?

MaxClaw 支持的输入类型:

- 纯文本消息
- 图片(图片内容会被带入上下文,注意 token 消耗)
- 文件(上传后 Agent 可读取处理)

MaxClaw 工具能力:

- **联网搜索**:获取实时信息
- **图片生成**:文字描述生成图片
- **视频生成**:文字描述生成视频
- **文件读写**:读取/创建/修改文件
- **代码执行**:运行 Python 等代码
- **定时任务**:Cron 自动化任务

### Q. MaxClaw 的 Office Skills 支持哪些文件类型?

MiniMax Office Skills 已完整开源(MIT 协议),于 2025-03-25 上线,支持以下文件类型:

- **Word**:无损编辑、格式零损耗
- **Excel**:原生公式保留、透视表支持
- **PPT**:专业级排版设计
- **PDF**:一句话完成全流程交付

## 多端接入与 IM 连接

### Q. MaxClaw 支持接入哪些 IM 平台?

MaxClaw 支持的接入方式:

- **网页端**(`agent.minimaxi.com`):支持,主要使用入口
- **手机 APP**(MiniMax 官方 App):支持,与网页端数据互通
- **飞书**:支持,支持群聊机器人
- **企业微信**:支持,支持群聊机器人
- **个人微信**:支持,2025-03-27 全面修复上线
- **PC 桌面客户端**:不支持 MaxClaw

### Q. MaxClaw 怎么连接飞书或企业微信?(5 步流程)

MaxClaw 连接飞书或企业微信只需 5 步:

1. 告诉龙虾「我要连飞书」或「我要连企业微信」
2. 点击龙虾给的链接,创建机器人
3. 向机器人发消息获取配对码
4. 把配对码告诉龙虾
5. 完成

### Q. MaxClaw 怎么连接个人微信?

MaxClaw 连接个人微信:

- **新龙虾**:对话框输入「连接微信」-> 一键完成
- **老龙虾**:等待系统自动升级,无需手动重建

### Q. 怎么把 MaxClaw 添加到群聊?

群聊中添加 MaxClaw 机器人步骤:

打开群聊 -> 群设置 -> 群机器人 -> 添加 -> 找到 MaxClaw -> 确认

### Q. MaxClaw IM 连接的注意事项?

MaxClaw IM 连接注意事项:

- 手动更新版本可能导致容器损坏,建议等待官方推送
- 版本更新后 IM 连接可能断开,需重新配置
- 连接失败时优先尝试「自动修复」,再考虑删除重建

## MiniMax Agent 积分、计费与会员

### Q. MiniMax Agent 积分是怎么消耗的?为什么消耗很快?

MiniMax Agent(包括 MaxClaw)按实际消耗的 token 计费,和自己调用 MiniMax API 是同样的逻辑。Agent 的消耗会根据每个任务实际执行过程中所需的积分计算,可以在界面左下角点击头像 -> Credits 查看积分历史。

注意:在对话里指定积分消耗是无效的。

消耗快的常见原因:

- 每次操作(安装技能、创建 Agent 集群、工具调用)都需要模型参与
- 对话历史越长,每次请求携带的 token 越多
- 联网搜索、图片生成等工具调用带入完整上下文

节省积分技巧:

- 完成一个任务后立即发 `/new`,清除当前对话历史
- 把 `/new` 当做「任务切换键」,每完成一件事就发一次
- 避免在同一对话里做太多不相关的事

### Q. MiniMax Agent 注册后有免费积分吗?有效期多久?

注册成功后,可以在 MiniMax Agent 界面左下角点击头像查看个人的基本信息和当前所有的 Credits。新注册用户会获得一定数量的免费积分来体验产品,这些积分**有效期为 3 天**,请尽快使用。

### Q. MiniMax Agent 积分耗尽后会怎样?

MiniMax Agent 积分耗尽后的影响:

- 积分为零时,对话、工具调用均无法执行
- 定时任务(Cron)和每日推送也会停止
- 充值恢复积分后,定时任务重新正常运行

### Q. MiniMax Agent 会员套餐多少钱?

MiniMax Agent 会员方案:

- **基础版(Basic)**:39 元/月(每月续费均为此价格,非首月优惠价)

### Q. MiniMax Agent 积分和 MiniMax 开放平台余额可以通用吗?

**不通用**。MiniMax Agent 积分和 MiniMax 开放平台余额是完全独立的账号体系:

- **MiniMax Agent**:使用积分(Credits),在 `agent.minimaxi.com` 管理和充值
- **MiniMax 开放平台**:使用人民币余额,在 `platform.minimaxi.com` 管理和充值

二者不能互相抵扣或转换,需分别充值。

### Q. MaxClaw 可以接入 MiniMax Token Plan 或 API Key 吗?

MaxClaw 支持接入 MiniMax Token Plan 或按量付费 API Key,可抵扣主要的文本模型积分消耗,具体规则:

1. 需要 **MiniMax Agent Basic 及以上会员**
2. 工具调用(图片/视频生成等)仍扣 Agent 账户积分,不能用 Token Plan 抵扣
3. 仅支持在网页版配置:`https://agent.minimaxi.com/max-claw`
4. Token Plan 有 5 小时窗口限额,超出后需升级套餐或等额度刷新
5. 切换为 Token Plan 后无法直接回退,如需切回积分模式需删除后重新部署

注意:MiniMax Agent 积分与 MiniMax 开放平台余额完全不互通,需分别充值。

### Q. 如何查询 MiniMax Agent 积分消耗明细?

查询 MiniMax Agent 积分消耗明细的方式:

1. 在 MiniMax Agent 界面左下角点击头像 -> Credits 查看积分历史
2. 如需更详细的查询,提供 chat_id 后发送邮件至 `MiniMaxAgent@minimax.io` 询问

chat_id 获取方式:打开对话页面,复制 URL 末尾数字。例如 `https://agent.minimaxi.com/chat?id=370943808623550` 中的 `370943808623550` 即为 chat_id。

## MiniMax Agent 发票、订阅与退款

### Q. MiniMax Agent 如何获取发票?

MiniMax Agent 获取发票流程:在主界面,点击左下角头像右侧的订阅状态。在弹出的计划管理窗口中,点击底部的「获取发票」即可进入发票管理页面。

注意:MiniMax Agent 的发票流程独立于 MiniMax 开放平台,二者发票互不通用。

### Q. MiniMax Agent 如何取消自动续费?取消后还能继续使用吗?

MiniMax Agent 产品默认采用自动续费订阅模式,一个月后自动续费。

取消方式:点击主界面左下角头像旁边的订阅状态,在计划管理窗口中点击底部的「取消自动续费」。

取消后影响:**当月服务将继续有效,取消将从下个月开始生效**。

### Q. MiniMax Agent 升级套餐怎么计费?

MiniMax Agent 升级套餐计费规则:如果在当前计划到期前决定升级,将根据原计划未使用部分的按比例价差进行计算。

### Q. MiniMax Agent 怎么申请退款?

MiniMax Agent 退款必须走官方邮箱审核渠道:

- 发送邮件至 `MiniMaxAgent@minimax.io`,说明订单信息和退款原因
- 具体结论由审核团队邮件回复,不在客服渠道承诺退款结果

注意:MiniMax Agent 的退款规则独立于 MiniMax 开放平台,不能混用。

## SkillHub 技能社区

### Q. SkillHub 是什么?如何使用 SkillHub 技能?

SkillHub 是 MiniMax Agent 的技能社区,提供上百种现成技能,可一键安装到 MaxClaw 中。装了什么技能,龙虾就拥有什么能力,无需写任何代码。

使用方法:

1. 打开 SkillHub 社区,浏览技能列表
2. 选中你想要的技能,点击「立即使用」
3. 在 MaxClaw 或 MiniMax Agent 对话中即可一键添加,无需任何配置

### Q. SkillHub 有哪些常见技能类型?

SkillHub 常见技能示例:

- **信息获取**:股票分析、新闻摘要、天气查询
- **文档处理**:论文摘要、PDF 阅读、Office 文档编辑
- **自动化**:定时推送、日程管理
- **开发辅助**:代码 Review、技术调研

### Q. 如何创建并上传技能到 SkillHub 赚取积分?

你可以自己创建 Skill 并上传到 SkillHub 社区:每被他人使用一次,获得 **100 积分**。优质 Skill 可持续获得积分收益。

### Q. 安装 SkillHub 技能会消耗积分吗?

会消耗。安装技能需要模型理解、配置、执行,会消耗 MiniMax Agent 积分。积分耗尽后技能将无法调用,充值后恢复。

## Desktop 桌面端

### Q. MiniMax Agent Desktop 是什么?和 MaxClaw 有什么区别?

MiniMax Agent Desktop 是桌面端客户端应用,支持在本地电脑部署 OpenClaw,数据完全由自己掌控。

注意:Desktop 用于本地部署 OpenClaw,与 MaxClaw(云端版)是不同的使用方式。

Desktop 与 MaxClaw 的区别:

- **Desktop(本地)**:运行在本地电脑,数据存储在本地,需要自备 API Key,依赖电脑开机运行,使用 MiniMax 开放平台余额(人民币)计费
- **MaxClaw(云端)**:运行在 MiniMax 云端服务器,数据存储在云端,无需自备 API Key 开箱即用,7x24 后台运行,使用 MiniMax Agent 积分(Credits)计费

### Q. MiniMax Agent Desktop 主要功能有哪些?

MiniMax Agent Desktop 主要功能:

- **本地部署 OpenClaw**:在自己的电脑上运行 AI 助手,无需依赖云端
- **自主掌控数据**:所有对话、文件存储在本地
- **自带"龙虾医生"**:预装安全诊断技能,自动拦截高危操作,遇报错自动诊断修复

### Q. 本地部署 OpenClaw 的积分怎么算?

Desktop 本地部署 OpenClaw 接入 MiniMax 模型时,需要在 **MiniMax 开放平台**(`platform.minimaxi.com`)充值,使用 API Key 消耗开放平台余额(人民币计费)。

注意:Desktop 使用的开放平台余额与 MaxClaw 使用的 MiniMax Agent 积分完全不互通,需分别充值。

## MiniMax Agent 内容审核与回答质量

### Q. MiniMax Agent 回答不准确或编造内容怎么办?

MiniMax Agent 底层是大语言模型,可能会产生「幻觉」(即生成看似合理但不准确的内容)。遇到此情况建议:

1. 对关键信息进行人工核实
2. 在提示中明确要求 Agent 标注信息来源
3. 使用 Restore Checkpoint 功能回退到正确节点重新执行
4. 如果代码不能运行,尝试提供更明确的需求描述和参考代码

注意:MiniMax Agent 的「编造内容」属于大模型固有问题,与开放平台 API 一样需要用户做最终把关。

### Q. MiniMax Agent 的 API Key 会泄露吗?

MiniMax Agent 使用安全的产品方式来请求 Agent 所需的敏感信息,如 API Key 和数据库密码。**用户的 API Key 不会有泄露风险**。

注意:此处的 API Key 处理机制是 MiniMax Agent 产品内的安全设计,与开放平台 API Key 的管理方式不同。

### Q. MiniMax Agent 内容被审核拦截怎么办?

MiniMax Agent 内容被拦截分两种情况:

**Moderation blocked / 内容被拦截**:

- 原因:内容触发平台内容审核
- 处理:删除当前 MaxClaw,重新部署后重试
- 申诉:如认为误伤,发邮件至 `MiniMaxAgent@minimax.io` 附 chat_id 申请审核,误伤退还积分

**Task stopped, try a new task / 任务停止无法输入**:

- 原因:触发安全审核
- 处理:删除当前 MaxClaw 重新创建

## MiniMax Agent 报错排查总流程

### Q. MiniMax Agent 遇到报错怎么排查?(快速自查 6 步)

MiniMax Agent / MaxClaw 遇到任何问题,按以下顺序排查:

1. **检查积分余额**:右上角积分耗尽会导致大多数错误
2. **点击重启**:右上角重启按钮
3. **发 /new**:清除对话历史,开启新对话
4. **自动修复**:右上角齿轮 -> 自动修复
5. **删除重建**:以上均无效时,删除 MaxClaw 后重新创建
6. **联系支持**:提供 chat_id 发邮件至 `MiniMaxAgent@minimax.io`

chat_id 获取方式:打开对话页面,复制 URL 末尾数字。

### Q. MiniMax Agent 客服需要的 chat_id 怎么获取?

chat_id 获取方法:打开 MiniMax Agent 对话页面,复制链接末尾数字即为 chat_id。

示例:`https://agent.minimaxi.com/chat?id=370943808623550` -> chat_id 为 `370943808623550`。

遇到技术问题,客服需要 chat_id 才能进一步排查,请提前准备。

## MiniMax Agent 常见报错处理

### Q. MiniMax Agent 报 400 / HTTP 500 / Internal server error 怎么办?

- 原因:积分耗尽(最常见),或服务异常
- 处理流程:检查积分余额 -> 积分充足则点击重启 -> 仍无效提供 chat_id 发邮件至 `MiniMaxAgent@minimax.io`

### Q. MiniMax Agent 报 413 / Maximum request body size exceeded / 请求体过大怎么办?

- 原因:对话历史过长(约超 1MB),图片识别后尤其容易触发
- 处理:发送 `/new` 清除历史,然后重试

### Q. MiniMax Agent 出现 loading 无响应或长时间不回消息怎么办?

处理流程:右上角重启 -> 点击自动修复 -> 仍无效提供 chat_id 发邮件至 `MiniMaxAgent@minimax.io`。

### Q. MiniMax Agent 发消息后超时怎么办?

处理:发送 `/new` 开启新对话,通常立即恢复。

### Q. MiniMax Agent 积分为负或余额不足无法使用怎么办?

处理流程:打开 MaxClaw 网页端查看积分余额 -> 积分耗尽则充值 -> 积分充足但仍报错则点击重启。

### Q. MiniMax Agent 突然终止或对话卡死怎么办?

处理:删除当前 MaxClaw,然后重新创建。

## MiniMax Agent IM 连接问题

### Q. 飞书配对失败 / 一直显示重启中 / 服务繁忙怎么办?

- 原因:提示词不明确导致 Claw 自我修改配置文件损坏
- 处理:右上角齿轮 -> 自动修复 -> 无效则删除后重新部署
- 建议:不要频繁修改 IM 配置

### Q. 飞书子话题或线程回复跑到主群聊怎么办?

- 原因:飞书线程路由参数未正确配置
- 处理:可联系支持处理,提供 chat_id 发邮件至 `MiniMaxAgent@minimax.io`

### Q. MaxClaw 版本更新后 IM 连接断开怎么办?

处理流程:在网页版 MaxClaw 对话确认记忆和 IM 连接情况 -> 重新按对应平台的连接流程配置。

补偿说明:受影响用户可获得积分补偿,如未收到请提供 chat_id 联系 `MiniMaxAgent@minimax.io`。

## MiniMax Agent 网络问题排查

### Q. MiniMax Agent 出现 WebSocket 连接断开怎么排查?

- 现象:语音通话或实时对话中突然断开
- 排查步骤:检查网络稳定性 -> 确认 WebSocket 端口未被防火墙拦截 -> 查看服务端日志是否有超时记录 -> 检查负载均衡器 idle timeout 配置(建议 >= 300s)

### Q. 调用 MiniMax Agent API 请求超时(504)怎么办?

- 现象:调用 Agent API 返回 504 或请求超时
- 常见原因:知识库检索慢(ES 集群负载过高)/ LLM 响应慢(GPU 资源不足)/ 跨区域调用延迟高
- 建议配置:客户端超时 30s / 网关超时 60s / 服务端超时 90s

### Q. MiniMax Agent 前端调用 API 报 CORS 跨域错误怎么办?

- 现象:前端调用 API 报 CORS 错误
- 解决:后端已设置 CORS 头。仍有问题需检查:
  - 是否经过额外代理层覆盖了 CORS 头
  - 是否使用了自定义请求头需在 `Access-Control-Allow-Headers` 中添加

## MiniMax Agent 积分活动与免费积分

### Q. MiniMax Agent 如何获得免费积分?

获得 MiniMax Agent 免费积分的途径:

- 注册新用户赠送一定数量免费积分(有效期 3 天)
- 在小红书、抖音、微信等平台分享 MaxClaw 使用体验,可获得 5000~10000 积分奖励

参与详情请填写表单:`https://vrfi1sk8a0.feishu.cn/share/base/form/shrcnIzj7eOF9Y3eL8zu8kAmBVe`

### Q. 参与 MiniMax Agent 活动后积分未到账怎么办?

活动积分需人工审核。若长时间未到账,请按以下步骤处理:

1. 核对内容是否满足活动达标要求(点赞、收藏等互动数据)
2. 确认符合后,将活动 ID + 内容链接发送至 `MiniMaxAgent@minimax.io` 申请复核

### Q. 上传 SkillHub 技能能赚多少积分?

在 SkillHub 上传自创 Skill,每被他人使用一次,获得 **100 积分**。优质 Skill 可持续获得积分收益。
