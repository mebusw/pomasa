#!/bin/bash
# export.sh - 将最终研究报告导出为DOCX和PDF格式

set -e

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="${PROJECT_ROOT}/_output"

# 输入文件（默认或从参数获取）
INPUT_FILE="${1:-${PROJECT_ROOT}/data/04.report/final_report.md}"

if [ ! -f "$INPUT_FILE" ]; then
    echo "错误：找不到输入文件: $INPUT_FILE"
    echo "用法：$0 [输入文件路径]"
    exit 1
fi

echo "使用输入文件：$INPUT_FILE"

# 从第一个一级标题提取报告标题
TITLE=$(grep -m 1 '^# ' "$INPUT_FILE" | sed 's/^# //')
if [ -z "$TITLE" ]; then
    echo "错误：未找到标题（期望第一行是 '# 标题' 格式）"
    exit 1
fi

echo "报告标题：$TITLE"

# 清理标题中的特殊字符，使其适合作为文件名
SAFE_TITLE=$(echo "$TITLE" | sed 's/[:<>"|?*\/\\]/-/g' | sed 's/  */ /g')

# 添加时间戳
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BASENAME="${SAFE_TITLE} [${TIMESTAMP}]"

# 确保输出目录存在
mkdir -p "$OUTPUT_DIR"

# 模板文件
DOCX_TEMPLATE="${SCRIPT_DIR}/docx-template.docx"
LATEX_HEADER="${SCRIPT_DIR}/latex-header.tex"

# 导出为DOCX
echo "正在导出为DOCX..."
if [ -f "$DOCX_TEMPLATE" ]; then
    pandoc "$INPUT_FILE" \
        --reference-doc="$DOCX_TEMPLATE" \
        -o "${OUTPUT_DIR}/${BASENAME}.docx"
else
    echo "  警告：未找到DOCX模板（${DOCX_TEMPLATE}），使用默认格式"
    pandoc "$INPUT_FILE" \
        -o "${OUTPUT_DIR}/${BASENAME}.docx"
fi
echo "已创建：${OUTPUT_DIR}/${BASENAME}.docx"

# 导出为PDF
echo "正在导出为PDF..."
if [ -f "$LATEX_HEADER" ]; then
    pandoc "$INPUT_FILE" \
        --pdf-engine=xelatex \
        -H "$LATEX_HEADER" \
        -o "${OUTPUT_DIR}/${BASENAME}.pdf"
else
    echo "  警告：未找到LaTeX头文件（${LATEX_HEADER}），使用默认配置"
    pandoc "$INPUT_FILE" \
        --pdf-engine=xelatex \
        -o "${OUTPUT_DIR}/${BASENAME}.pdf"
fi
echo "已创建：${OUTPUT_DIR}/${BASENAME}.pdf"

echo ""
echo "导出完成！"
echo "输出位置：${OUTPUT_DIR}/"
echo "  - ${BASENAME}.docx"
echo "  - ${BASENAME}.pdf"
