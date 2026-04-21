# OpenClaw 接入 MiniMax 模型指南

OpenClaw 是第三方编程辅助工具,本文整理 OpenClaw 与 MiniMax 模型集成时的所有常见问题,涵盖接入步骤、图像识别、报错排查与 MCP 工具配置。

## 接入步骤(初次使用)

### Q. OpenClaw 初次使用如何接入 MiniMax 模型(初次安装配置流程)?

OpenClaw 初次安装时一般会直接进入配置流程。若没有自动开始配置引导,可通过以下命令进入配置流程:

```plaintext
openclaw onboard --install-daemon
```

模型配置推荐选择 OAuth 登录的方式,完整步骤如下:

1. Where will the Gateway run? → 选择 Local (this machine)
2. Select sections to configure → 选择 Model
3. Model/auth provider → 选择 MiniMax
4. MiniMax auth method → 选择 MiniMax OAuth
5. MiniMax endpoint → 需按自身情况选择。在 MiniMax 开放平台(国内)购买服务的请选 CN,在 MiniMax International(海外)购买服务的请选 Global,两者服务的请求地址不同:
   - Global 国际用户(请求地址为 `api.minimax.io`)
   - CN 国内用户(请求地址为 `api.minimaxi.com`)
6. 回车后,将跳转官网进行账号登录。登录完成,终端显示 `MiniMax OAuth Complete` 则配置成功。
7. 选择具体模型时,注意通过 OAuth 登录的有效模型前缀为 `minimax-portal/`,可以选择 `minimax-portal/MiniMax-M2.7`。若订阅的是极速版 Token Plan 或使用按量计费,还可以选择 `minimax-portal/MiniMax-M2.7-highspeed`。

参考官网文档: https://platform.minimaxi.com/docs/coding-plan/openclaw

注意事项:
- 普通 Token Plan 无法使用 `MiniMax-M2.7-highspeed`(极速版模型)
- 不要选择 `MiniMax-M2.5-Lightning`,该模型名已经废弃

## 接入步骤(已配置,需添加模型)

### Q. OpenClaw 已完成基础配置,如何通过 OAuth 添加 MiniMax 模型(推荐方法)?

已经购买 Token Plan(原 Coding Plan)的用户,通过 OAuth 配置方式将自动接入使用 Token Plan 的配额,无需手动输入 API 密钥,这是推荐的接入方法。

完整步骤:

**Step 0** 通过以下命令再次进行 OpenClaw 配置:

```plaintext
openclaw configure
```

**Step 1** 用 OAuth 登录认证:

- Where will the Gateway run? → 选择 Local (this machine)
- Select sections to configure → 选择 Model
- Model/auth provider → 选择 MiniMax
- MiniMax auth method → 选择 MiniMax OAuth
- MiniMax endpoint → 需按自身情况选择。在 MiniMax 开放平台(国内)购买服务的请选 CN,在 MiniMax International(海外)购买服务的请选 Global,两者服务的请求地址不同:
  - Global 国际用户(请求地址为 `api.minimax.io`)
  - CN 国内用户(请求地址为 `api.minimaxi.com`)

**Step 2** 回车后,将跳转官网进行账号登录。登录完成,终端显示 `MiniMax OAuth Complete` 则配置成功。

**Step 3** 选择模型,注意通过 OAuth 登录的有效模型前缀为 `minimax-portal/`,可以选择 `minimax-portal/MiniMax-M2.7`。若订阅的是极速版 Token Plan 或使用按量计费,还可以选择 `minimax-portal/MiniMax-M2.7-highspeed`。

注意事项:
- 普通 Token Plan 无法使用 `MiniMax-M2.7-highspeed`(极速版模型)
- 不要选择 `MiniMax-M2.5-Lightning`,该模型名已经废弃

参考官网文档: https://platform.minimaxi.com/docs/coding-plan/openclaw

### Q. OpenClaw 如何通过手动输入 API Key 配置 MiniMax 模型(备选方法)?

若无法使用 OAuth 登录,可手动输入 API Key 配置 MiniMax 模型,步骤如下:

**Step 1** Model/auth provider → 选择 MiniMax

**Step 2** MiniMax auth method → 国内用户选择 MiniMax M2.7(CN),海外用户请选择 MiniMax M2.7

**Step 3** MiniMax API key → 填入您的 MiniMax API Key

**Step 4** Models in /model picker → 直接回车使用默认选项

请注意区分 API Key 类型:

- **Token Plan API Key**:通过「接口密钥 > 重置并获取 Token Plan 专属 Key」获取,以 `sk-cp` 开头。获取地址: https://platform.minimaxi.com/user-center/payment/token-plan
- **按量付费 API Key**:通过「接口密钥 > 创建新的 API Key」获取,以 `sk-api` 开头。获取地址: https://platform.minimaxi.com/user-center/basic-information/interface-key

参考官网文档: https://platform.minimaxi.com/docs/coding-plan/openclaw

## 图像识别配置

### Q. OpenClaw 中使用 MiniMax 模型如何进行图片识别?

在 OpenClaw(>=3.8 版本)中,通过 OAuth 登录 MiniMax 账号,OpenClaw 会自动给你的龙虾配置好一个可以用来读图的 `image` 工具。

为了确保这个工具生效,请在命令行运行以下命令:

```plaintext
openclaw config set tools.profile coding
```

完成后,可以直接给你的龙虾发送图片进行识别,无需额外配置任何 skills 或者 mcp。

### Q. OpenClaw 中 MiniMax 模型为什么无法进行图像识别?

OpenClaw 中 MiniMax 模型无法进行图像识别,通常有以下两种排查方向:

**方向 1:OAuth 登录情况下未启用 coding 工具配置**

在 OpenClaw(>=3.8 版本)中,通过 OAuth 登录 MiniMax 账号,会自动给你的龙虾配置好一个可以用来读图的 `image` 工具。为了确保这个工具生效,请在命令行运行以下命令:

```plaintext
openclaw config set tools.profile coding
```

**方向 2:使用手动配置的情况**

若使用手动配置 API Key 的方式接入 MiniMax 模型,建议先尝试改用 OAuth 登录方式,参考: https://platform.minimaxi.com/docs/token-plan/openclaw

若因网络设置等问题只能使用手动配置模型,则需要在 OpenClaw 中通过 mcporter 的 skill 接入 MiniMax Token Plan MCP,参考: https://platform.minimaxi.com/docs/token-plan/mcp-guide

## 报错排查

### Q. OpenClaw 接入 MiniMax 模型出现 401 报错怎么办?

OpenClaw 接入 MiniMax 模型出现 401 报错,解决方法是将 OpenClaw 升级到最新版,然后进入模型配置,MiniMax auth method 选择 MiniMax OAuth 的方式重新登录。具体方法可参考 https://platform.minimaxi.com/docs/coding-plan/openclaw

注意事项:

1. 选择 MiniMax endpoint 时,需按自身情况选择。在 MiniMax 开放平台(国内)购买服务的请选 CN,在 MiniMax International(海外)购买服务的请选 Global,两者服务的请求地址不同:
   - Global 国际用户(请求地址为 `api.minimax.io`)
   - CN 国内用户(请求地址为 `api.minimaxi.com`)
2. 选择模型时,通过 OAuth 登录的有效模型前缀为 `minimax-portal/`,可以选择 `minimax-portal/MiniMax-M2.7`。若订阅的是极速版 Token Plan 或使用按量计费,还可以选择 `minimax-portal/MiniMax-M2.7-highspeed`。

注意:普通 Token Plan 无法使用 `MiniMax-M2.7-highspeed`(极速版模型);不要选择 `MiniMax-M2.5-Lightning`,该模型名已经废弃。

### Q. OpenClaw 接入 MiniMax 模型出现 Cooldown 报错无法使用模型怎么办?

Cooldown 报错是 OpenClaw 的内部限流机制,当请求过于频繁等情况下会出现,并非 MiniMax 模型本身的问题。

解决方法:删除 `/root/.openclaw/agents/main/agent/auth-profiles.json` 文件中的 `usageStats` 配置项,然后重启 OpenClaw gateway 即可解决。

### Q. OpenClaw 出现 413 Maximum request body size exceeded(请求体过大)报错怎么办?

OpenClaw 出现 413 Maximum request body size exceeded 报错,根因是上下文太大,超出了请求体大小限制。可通过以下方式解决:

- 在 OpenClaw 中,使用 `/new` 命令开启一个新会话(系统提示词和工具还在,只是之前的对话记录被清除)
- 在 Claude、Cursor 等 IDE 中,新开一个会话

### Q. OpenClaw 出现 LLM request timeout(请求超时)怎么办?

OpenClaw 出现 LLM request timeout 报错,根因通常是上下文太大导致请求超时。可通过以下方式解决:

- 在 OpenClaw 中,使用 `/new` 命令开启一个新会话(系统提示词和工具还在,只是之前的对话记录被清除)
- 在 Claude、Cursor 等 IDE 中,新开一个会话

### Q. OpenClaw 出现 connect error(连接失败)/ OAuth 无法跳转怎么办?

OpenClaw 出现 connect error(连接失败)或 OAuth 无法跳转,根因是网络证书问题,有以下可能的原因,请逐一排查:

- **代理/安全软件影响(最关键)**:先确认是不是公司代理或安全软件导致。关掉 VPN 或切换到家庭网络,清除之前的 OpenClaw 配置,然后重新进行配置
- **npm 自定义证书冲突**:可能添加了 npm 自定义证书,可以先把 npm/Node 的证书相关自定义配置全部排查并清除。若仍无法解决,则完整卸载 Node 并重新安装(建议不要使用 brew 安装,而是直接用官网方式安装)
- **进一步排查**:上述方式无法解决时,需具体问题具体分析。connect error 的根因是网络问题,建议先用 Claude Code 等工具对电脑环境进行排查

### Q. OpenClaw 进行 OAuth 登录时显示 MiniMax OAuth failed: fetch failed 怎么办?

OpenClaw 进行 OAuth 登录时出现 `MiniMax OAuth failed: fetch failed` 报错,这是网络问题导致的,可能由于挂 VPN、公司网络、网络证书等原因。需要排查网络环境,关闭 VPN 或切换网络后重试。

### Q. OpenClaw 2.26 版本 OAuth 不可用如何解决(2.26 版本 bug)?

OpenClaw 2.26 版本引入了 bug,导致 MiniMax OAuth 不可用。目前已在 2026.2.25 及之前版本验证通过,以下为最简单的解决方案:

1. 安装出问题前的版本:`npm install -g openclaw@2026.2.25`
2. 确认当前版本:`openclaw --version`
3. 重新执行初始化向导:`openclaw onboard`
4. 重启:`openclaw gateway stop && openclaw gateway run`

### Q. OpenClaw 手动输入 API Key 配置后报错如何排查?

OpenClaw 模型配置涉及多个配置文件,可能没有同步改正信息,导致配置混乱。建议优先使用 OAuth 登录方式。

**方法 1:完全卸载并重装**

完全卸载 OpenClaw,尤其要删除 `.openclaw` 目录,以免残留旧的配置。然后重新走一遍模型配置流程。

**方法 2:逐一检查配置文件**

若手动输入 API 配置仍出问题,可逐一检查以下文件:

- `openclaw.json` 中 `agents.primary` 是否为 `minimax-portal/MiniMax-M2.7`
- `~/.openclaw/agents/main/agent/models.json` 中 `apiKey` 是否正确
- `~/.openclaw/agents/main/agent/auth.json` 中 `apiKey` 是否正确
- `~/.openclaw/agents/main/agent/auth-profiles.json` 中 `apiKey` 是否正确

## MCP 工具配置

### Q. OpenClaw 中如何配置图像识别、网络搜索等 MCP 工具?

Token Plan 订阅用户可在 OpenClaw 中使用 Token Plan MCP 配置图像识别、网络搜索等工具,有以下两种方式:

**方式 1:OAuth 登录自动配置(推荐)**

在最新版本的 OpenClaw 中,如果通过 OAuth 登录 MiniMax 账号,OpenClaw 会自动配置好读图的 `image` 工具。请运行以下命令启用:

```plaintext
openclaw config set tools.profile coding
```

**方式 2:通过 mcporter skill 接入 MCP**

OpenClaw 中也可以通过 mcporter 的 skill 来接入 MiniMax Token Plan MCP,配置指南:

- 国内用户: https://platform.minimaxi.com/docs/coding-plan/mcp-guide
- 海外用户: https://platform.minimax.io/docs/coding-plan/mcp-guide

**注意**:按量计费(以 `sk-api` 开头的 API Key)不可调用 Token Plan MCP,该 MCP 仅限 Token Plan 订阅用户使用。
