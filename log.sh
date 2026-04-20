#!/bin/bash
set -euo pipefail

# 定义日志函数
log() {
    local level=$1
    local msg=$2
    # 打印到屏幕并追加到日志文件，同时带上时间戳
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $msg" | tee -a /var/log/myscript.log
}

# 使用示例
log "INFO" "开始备份 Milvus..."
log "ERROR" "MinIO 连接失败！"
