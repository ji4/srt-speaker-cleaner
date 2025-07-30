#!/bin/bash

# 方法1: 使用 sed 直接修改文件
# sed -i 's/^Speaker [0-9]*: //g' filename.srt

# 方法2: 創建新文件（推薦，保留原文件）
if [ $# -eq 0 ]; then
    echo "使用方法: $0 <輸入文件> [輸出文件]"
    echo "範例: $0 input.srt output.srt"
    exit 1
fi

input_file="$1"
output_file="${2:-${input_file%.*}_cleaned.${input_file##*.}}"

if [ ! -f "$input_file" ]; then
    echo "錯誤: 文件 '$input_file' 不存在"
    exit 1
fi

# 刪除所有 "Speaker X: " 前綴
sed 's/^Speaker [0-9]*: //g' "$input_file" > "$output_file"

echo "處理完成！"
echo "輸入文件: $input_file"
echo "輸出文件: $output_file"

# 方法3: 一行命令版本
# sed 's/^Speaker [0-9]*: //g' input.srt > output.srt