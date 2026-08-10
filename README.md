# Solana 土狗交易机器人 (Solana Meme Coin Trading Bot)

<div align="center">

![Solana](https://img.shields.io/badge/Solana-000000?style=for-the-badge&logo=solana)
![Python](https://img.shields.io/badge/Python-3.10+-00ADD8?style=for-the-badge&logo=python)
![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram)

**24/7 自动监控 pump.fun 新币 · 成交量触发买入 · 多层止盈止损**

*Built by Xuge (许哥)*

</div>

---

## 🎯 产品简介

Solana 土狗交易机器人是一款**全自动化的 Meme 币交易工具**，专为在 pump.fun 平台发现早期潜力币而设计。通过实时监控成交量异动，机器人能够在第一时间捕捉到即将启动的 Meme 币，并自动执行买入策略。

支持**模拟盘（Dry-Run）** 和**实盘**两种模式切换，小白也能快速上手。

---

## ✨ 核心功能

| 功能 | 说明 |
|------|------|
| 🔴 **24/7 自动监控** | 全天候监控 pump.fun 新上币种，不错过任何机会 |
| 📊 **成交量触发买入** | 不依赖时间判断，纯看成交量是否突破阈值 |
| 🛡️ **多层止盈止损** | 30% 止损，50% / 100% / 200% 分批止盈 |
| 🔔 **Telegram 推送** | 每笔交易实时推送通知，仓位变化全知道 |
| 🎮 **模拟/实盘双模式** | 模拟盘测试策略，实盘一键切换 |
| ⚙️ **可配置参数** | 投资金额、止损比例、成交量门槛全部可调 |
| 💧 **流动性门槛过滤** | 过滤低流动性币种，避免被恶意砸盘 |

---

## 🚀 快速开始

### 1. 安装依赖

```bash
pip install -r requirements.txt
```

### 2. 配置环境变量

```bash
cp config.env.example config.env
# 编辑 config.env，填入你的 API Key 和配置参数
```

### 3. 启动机器人

```bash
# 方式一：一键启动（默认 Dry-Run 模拟盘）
bash run.sh

# 方式二：实盘模式
bash run.sh --live
```

### 4. 停止机器人

```bash
bash stop.sh
```

---

## 📁 目录结构

```
bot_package/
├── README.md           # 本说明文件
├── requirements.txt    # Python 依赖
├── config.env.example  # 环境变量示例
├── run.sh             # 启动脚本
├── stop.sh            # 停止脚本
└── main.py            # 机器人主程序（需自行实现）
```

---

## ⚙️ 配置说明

| 参数 | 说明 | 默认值 |
|------|------|--------|
| `SOLANA_RPC_URL` | Solana RPC 节点 | QuickNode/Alchemy |
| `BOT_WALLET_KEY` | 钱包私钥（仅实盘） | - |
| `INVEST_AMOUNT_SOL` | 单笔买入 SOL 数量 | 0.01 |
| `STOP_LOSS_PCT` | 止损比例 | 30% |
| `TAKE_PROFIT_1` | 第一止盈目标 | 50% |
| `TAKE_PROFIT_2` | 第二止盈目标 | 100% |
| `TAKE_PROFIT_3` | 第三止盈目标 | 200% |
| `VOLUME_THRESHOLD` | 成交量触发阈值 (SOL) | 50 |
| `MIN_LIQUIDITY` | 最小流动性门槛 (SOL) | 1000 |
| `TELEGRAM_BOT_TOKEN` | Telegram Bot Token | - |
| `TELEGRAM_CHAT_ID` | 通知接收者 ID | - |
| `DRY_RUN` | 是否模拟盘 | true |

---

## 🔐 安全提示

> ⚠️ **重要：钱包私钥仅在实盘模式下需要，且永远不要将私钥泄露给任何人！**
>
> - 推荐使用专用小钱包操作，**不要用主钱包**
> - 实盘操作前务必先在模拟盘充分测试
> - 定期检查机器人日志，监控异常行为

---

## ⚠️ 风险声明

本机器人仅供辅助参考，**不构成投资建议**。Meme 币交易本身具有极高风险，加密货币市场波动剧烈，请理性投资，量力而行。开发者不对任何交易损失承担责任。

---

## 📞 联系方式

- **TG @your_bot_username** （有问题欢迎联系）
- **Built by Xuge (许哥)**

---

<div align="center">

*使用本工具即表示你已同意上述风险声明*

</div>
