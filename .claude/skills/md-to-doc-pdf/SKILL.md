---
name: md-to-doc-pdf
description: Convert markdown files into Word (.docx) and PDF format, using pandoc with xelatex.
allowed-tools: Read, Bash(python:*), Write
---

# PDF Processing

## Usage
```bash
chmod +x scripts/export.sh
./scripts/export.sh
```

This will create the DOCX and PDF files in the `_output/` directory.
导出的文件将保存在 `_output/` 目录，包括：
- DOCX格式（便于编辑）
- PDF格式（便于分发）