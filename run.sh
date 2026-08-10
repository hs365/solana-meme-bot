#!/bin/bash

# ============================================================
# Solana Meme Coin Trading Bot - 启动脚本
# ============================================================

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════════════════╗"
echo "║   Solana Meme Coin Trading Bot  -  启动中...     ║"
echo "╚═══════════════════════════════════════════════════╝"
echo -e "${NC}"

# 检查 Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[ERROR] Python3 未安装，请先安装 Python 3.10+${NC}"
    exit 1
fi

# 检查依赖
if [ ! -f "requirements.txt" ]; then
    echo -e "${RED}[ERROR] requirements.txt 未找到${NC}"
    exit 1
fi

# 检查环境配置文件
if [ ! -f "config.env" ]; then
    echo -e "${YELLOW}[WARN] config.env 未找到，正在从示例创建...${NC}"
    cp config.env.example config.env
    echo -e "${YELLOW}[INFO] 请编辑 config.env 填写你的配置，然后重新运行${NC}"
    exit 0
fi

# 检查是否 Dry-Run 模式
DRY_RUN_MODE=true
if [ "$1" == "--live" ]; then
    DRY_RUN_MODE=false
    echo -e "${RED}[!] 警告：实盘模式已启用，将使用真实 SOL 进行交易！${NC}"
    echo ""
fi

# 导出环境变量
set -a
source config.env
set +a

# 设置 Dry-Run 模式
if [ "$DRY_RUN_MODE" = true ]; then
    export DRY_RUN=true
    echo -e "${GREEN}[INFO] 运行模式：模拟盘 (Dry-Run)${NC}"
else
    export DRY_RUN=false
    echo -e "${RED}[INFO] 运行模式：实盘 (Live Trading)${NC}"
fi

# 创建日志目录
mkdir -p logs

# 启动机器人
echo ""
echo -e "${GREEN}[INFO] 正在启动机器人...${NC}"
echo ""

# 使用 nohup 后台运行，保留日志
nohup python3 -u main.py > logs/bot_$(date +%Y%m%d_%H%M%S).log 2>&1 &
BOT_PID=$!

echo "$BOT_PID" > .bot.pid

echo -e "${GREEN}[OK] 机器人已启动！PID: ${BOT_PID}${NC}"
echo -e "${GREEN}[OK] 日志文件：logs/bot_$(date +%Y%m%d_%H%M%S).log${NC}"
echo ""
echo -e "查看日志：tail -f logs/bot_*.log"
echo -e "停止机器人：bash stop.sh"
echo ""
