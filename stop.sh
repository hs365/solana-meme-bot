#!/bin/bash

# ============================================================
# Solana Meme Coin Trading Bot - 停止脚本
# ============================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}[INFO] 正在停止 Solana Meme Coin Trading Bot...${NC}"

# 检查 PID 文件
if [ -f ".bot.pid" ]; then
    BOT_PID=$(cat .bot.pid)
    
    if kill -0 "$BOT_PID" 2>/dev/null; then
        echo -e "[INFO] 发送停止信号到 PID: $BOT_PID"
        kill -TERM "$BOT_PID" 2>/dev/null
        
        # 等待进程结束
        for i in {1..10}; do
            if ! kill -0 "$BOT_PID" 2>/dev/null; then
                echo -e "${GREEN}[OK] 机器人已停止${NC}"
                rm -f .bot.pid
                exit 0
            fi
            sleep 1
        done
        
        # 强制杀死
        echo -e "${YELLOW}[WARN] 进程未响应，强制终止...${NC}"
        kill -9 "$BOT_PID" 2>/dev/null
        rm -f .bot.pid
        echo -e "${GREEN}[OK] 机器人已强制停止${NC}"
    else
        echo -e "${YELLOW}[WARN] 进程不存在或已停止${NC}"
        rm -f .bot.pid
    fi
else
    echo -e "${YELLOW}[WARN] 未找到 PID 文件，尝试查找并停止进程...${NC}"
    
    # 备用方案：查找并停止 python 进程
    PIDS=$(pgrep -f "python3.*main.py" 2>/dev/null || true)
    if [ -n "$PIDS" ]; then
        echo -e "[INFO] 找到运行中的进程: $PIDS"
        echo "$PIDS" | xargs kill -TERM 2>/dev/null
        echo -e "${GREEN}[OK] 已发送停止信号${NC}"
    else
        echo -e "${GREEN}[OK] 没有正在运行的机器人进程${NC}"
    fi
fi

echo ""
echo -e "${GREEN}停止完成！${NC}"
