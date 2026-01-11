#!/bin/bash
# assemble.sh - 将各章节组装成完整报告

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SECTIONS_DIR="${PROJECT_ROOT}/data/03.sections"
OUTPUT_DIR="${PROJECT_ROOT}/data/04/report"
OUTPUT_FILE="${OUTPUT_DIR}/final_report.md"

# 确保输出目录存在
mkdir -p "$OUTPUT_DIR"

# 清空或创建输出文件
> "$OUTPUT_FILE"

# 添加报告标题
echo "# 宏观政治经济洞察及其对汽车行业和德赛西威的影响研究" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

# 按顺序组装各章节
echo "正在组装报告..."

for section in "${SECTIONS_DIR}"/*.md; do
    if [ -f "$section" ]; then
        echo "  添加: $(basename "$section")"
        cat "$section" >> "$OUTPUT_FILE"
        # 确保章节之间有空行
        echo "" >> "$OUTPUT_FILE"
    fi
done

echo ""
echo "报告组装完成！"
echo "输出文件：$OUTPUT_FILE"

# 显示报告行数和字数统计
LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
CHAR_COUNT=$(wc -m < "$OUTPUT_FILE")
echo "  行数：$LINE_COUNT"
echo "  字符数：$CHAR_COUNT"
