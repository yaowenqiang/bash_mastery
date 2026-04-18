#!/bin/bash

echo -n "请输入密码: "
password=""

# -n 1: 每次只读取 1 个字符
# -s: 静默模式（隐藏实际输入的字符）
while IFS= read -r -n 1 -s char; do
    # 如果按下了回车键（ASCII 码为 13 或 10），结束循环
    # 使用空字符串检测更可靠
    if [[ -z "$char" ]] || [[ $char == $'\r' ]] || [[ $char == $'\n' ]]; then
        break
    fi
    
    # 如果是退格键（Backspace），处理删除逻辑
    if [[ $char == $'\b' ]]; then
        # 简单的退格处理：删除字符串最后一个字符，并回退光标
        if [ -n "$password" ]; then
            password="${password%?}"
            echo -ne "\b \b" 
        fi
    else
        # 正常字符：追加到变量，并打印星号
        password="${password}${char}"
        echo -n "*"
    fi
done

echo "" # 换行
echo "你输入的密码是: $password"
