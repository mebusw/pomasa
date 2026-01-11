#!/bin/bash

# POMASA 报告导出脚本
# 将Markdown格式的研究报告导出为DOCX和PDF格式

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 检查pandoc是否安装
check_pandoc() {
    if ! command -v pandoc &> /dev/null; then
        echo -e "${RED}错误：未安装pandoc${NC}"
        echo "请先安装pandoc："
        echo "  macOS: brew install pandoc"
        echo "  Ubuntu: sudo apt-get install pandoc"
        echo "  其他系统请访问：https://pandoc.org/installing.html"
        exit 1
    fi
}

# 检查XeLaTeX是否安装（用于PDF生成）
check_xelatex() {
    if ! command -v xelatex &> /dev/null; then
        echo -e "${YELLOW}警告：未安装XeLaTeX，将跳过PDF生成${NC}"
        echo "要生成PDF，请安装TeX发行版："
        echo "  macOS: brew install --cask mactex"
        echo "  Ubuntu: sudo apt-get install texlive-xetex texlive-fonts-recommended texlive-lang-chinese"
        return 1
    fi
    return 0
}

# 生成时间戳
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# 定义路径
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
REPORT_DIR="${PROJECT_DIR}/data/04.reports"
OUTPUT_DIR="${PROJECT_DIR}/_output"
TEMPLATE_DIR="${SCRIPT_DIR}"

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 定义输入文件
MAIN_REPORT="${REPORT_DIR}/final_report.md"
EXEC_SUMMARY="${REPORT_DIR}/executive_summary.md"

# 检查输入文件是否存在
if [ ! -f "$MAIN_REPORT" ]; then
    echo -e "${RED}错误：未找到主报告文件 ${MAIN_REPORT}${NC}"
    echo "请先运行研究系统生成报告"
    exit 1
fi

echo -e "${GREEN}=== POMASA 报告导出工具 ===${NC}"
echo "时间戳：${TIMESTAMP}"
echo ""

# 检查依赖
check_pandoc
HAS_XELATEX=$(check_xelatex && echo "yes" || echo "no")

# 导出主报告为DOCX
export_main_docx() {
    echo -e "${YELLOW}正在导出主报告为DOCX...${NC}"

    OUTPUT_FILE="${OUTPUT_DIR}/research_report_${TIMESTAMP}.docx"

    if [ -f "${TEMPLATE_DIR}/docx-template.docx" ]; then
        pandoc "$MAIN_REPORT" \
            -f markdown \
            -t docx \
            --reference-doc="${TEMPLATE_DIR}/docx-template.docx" \
            --toc \
            --toc-depth=3 \
            -o "$OUTPUT_FILE"
    else
        pandoc "$MAIN_REPORT" \
            -f markdown \
            -t docx \
            --toc \
            --toc-depth=3 \
            -o "$OUTPUT_FILE"
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ 主报告DOCX已生成：${OUTPUT_FILE}${NC}"
    else
        echo -e "${RED}✗ 主报告DOCX生成失败${NC}"
        return 1
    fi
}

# 导出主报告为PDF
export_main_pdf() {
    if [ "$HAS_XELATEX" != "yes" ]; then
        echo -e "${YELLOW}跳过PDF生成（未安装XeLaTeX）${NC}"
        return 0
    fi

    echo -e "${YELLOW}正在导出主报告为PDF...${NC}"

    OUTPUT_FILE="${OUTPUT_DIR}/research_report_${TIMESTAMP}.pdf"

    # 使用XeLaTeX引擎以支持中文
    if [ -f "${TEMPLATE_DIR}/latex-header.tex" ]; then
        pandoc "$MAIN_REPORT" \
            -f markdown \
            -t pdf \
            --pdf-engine=xelatex \
            --include-in-header="${TEMPLATE_DIR}/latex-header.tex" \
            --toc \
            --toc-depth=3 \
            -V geometry:margin=1in \
            -V documentclass=article \
            -V fontsize=11pt \
            -V linestretch=1.5 \
            -o "$OUTPUT_FILE"
    else
        pandoc "$MAIN_REPORT" \
            -f markdown \
            -t pdf \
            --pdf-engine=xelatex \
            --toc \
            --toc-depth=3 \
            -V geometry:margin=1in \
            -V documentclass=article \
            -V fontsize=11pt \
            -V linestretch=1.5 \
            -V CJKmainfont="STSong" \
            -o "$OUTPUT_FILE"
    fi

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ 主报告PDF已生成：${OUTPUT_FILE}${NC}"
    else
        echo -e "${RED}✗ 主报告PDF生成失败${NC}"
        return 1
    fi
}

# 导出执行摘要
export_summary() {
    if [ ! -f "$EXEC_SUMMARY" ]; then
        echo -e "${YELLOW}未找到执行摘要文件，跳过${NC}"
        return 0
    fi

    echo -e "${YELLOW}正在导出执行摘要...${NC}"

    # DOCX
    DOCX_OUTPUT="${OUTPUT_DIR}/executive_summary_${TIMESTAMP}.docx"
    pandoc "$EXEC_SUMMARY" \
        -f markdown \
        -t docx \
        -o "$DOCX_OUTPUT"

    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ 执行摘要DOCX已生成：${DOCX_OUTPUT}${NC}"
    else
        echo -e "${RED}✗ 执行摘要DOCX生成失败${NC}"
    fi

    # PDF
    if [ "$HAS_XELATEX" = "yes" ]; then
        PDF_OUTPUT="${OUTPUT_DIR}/executive_summary_${TIMESTAMP}.pdf"

        if [ -f "${TEMPLATE_DIR}/latex-header.tex" ]; then
            pandoc "$EXEC_SUMMARY" \
                -f markdown \
                -t pdf \
                --pdf-engine=xelatex \
                --include-in-header="${TEMPLATE_DIR}/latex-header.tex" \
                -V geometry:margin=1in \
                -V documentclass=article \
                -V fontsize=12pt \
                -V linestretch=1.5 \
                -o "$PDF_OUTPUT"
        else
            pandoc "$EXEC_SUMMARY" \
                -f markdown \
                -t pdf \
                --pdf-engine=xelatex \
                -V geometry:margin=1in \
                -V documentclass=article \
                -V fontsize=12pt \
                -V linestretch=1.5 \
                -V CJKmainfont="STSong" \
                -o "$PDF_OUTPUT"
        fi

        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✓ 执行摘要PDF已生成：${PDF_OUTPUT}${NC}"
        else
            echo -e "${RED}✗ 执行摘要PDF生成失败${NC}"
        fi
    fi
}

# 主流程
main() {
    echo -e "${YELLOW}开始导出过程...${NC}"
    echo ""

    # 导出主报告
    export_main_docx
    export_main_pdf

    echo ""

    # 导出执行摘要
    export_summary

    echo ""
    echo -e "${GREEN}=== 导出完成 ===${NC}"
    echo -e "输出目录：${OUTPUT_DIR}"
    echo ""
    echo "生成的文件："
    ls -lh "${OUTPUT_DIR}"/*"${TIMESTAMP}"* 2>/dev/null | awk '{print "  - " $9 " (" $5 ")"}'
}

# 执行主流程
main