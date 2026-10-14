<div align="center">

# ntust-thesis

A LaTeX template for Master's theses and Ph.D. dissertations at National Taiwan University of Science and Technology (NTUST)

國立臺灣科技大學碩博士論文 LaTeX 範本

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](LICENSE)
[![Engine: XeLaTeX](https://img.shields.io/badge/engine-XeLaTeX-008080.svg)](https://tug.org/xetex/)
[![GitHub stars](https://img.shields.io/github/stars/hadziq/ntust-thesis?style=social)](https://github.com/hadziq/ntust-thesis/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/hadziq/ntust-thesis?style=social)](https://github.com/hadziq/ntust-thesis/network/members)

[English](#english) · [中文說明](#中文說明) · [Contributors](#contributors) · [License](#license)

</div>

---

## English

### Table of Contents

- [Features](#features)
- [Repository Structure](#repository-structure)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Writing Your Thesis](#writing-your-thesis)
- [Compiling](#compiling)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Contributors](#contributors)
- [Acknowledgements](#acknowledgements)
- [License](#license)

### Features

This template is adapted from Yuan Ze University's thesis template and tailored to NTUST requirements:

- **Provisional watermark** with the NTUST logo
- **NTUST cover format** (Chinese and English titles, student and advisor names)
- **Placeholder pages** for the advisor's recommendation letter and the committee approval form
- **Streamlined page set** — unnecessary pages removed
- **Clean file structure** separating front pages, chapters, and back pages
- **Bilingual support** via `fontspec` + `xeCJK` (Times New Roman for Latin text, 標楷體 / *AR PL KaitiM Big5* for Chinese)
- **Two ready-to-use editions**: an English version and a Chinese version (中文版本)

### Repository Structure

```text
ntust-thesis/
├── English Version/          # Template for theses written in English
│   ├── my_ntust_thesis.tex   # Main document — compile this file
│   ├── my_ntust_thesis.sh    # Build script (xelatex → bibtex → xelatex × 2)
│   ├── my_bib.bib            # Your BibTeX references
│   ├── frontpages/           # Cover, abstracts, acknowledgements, symbols
│   │   ├── my_names.tex      #   Title, author, advisors, dates
│   │   ├── my_cabstract.tex  #   Chinese abstract
│   │   ├── my_eabstract.tex  #   English abstract
│   │   ├── my_ackn.tex       #   Acknowledgements
│   │   └── my_symbols.tex    #   List of symbols
│   ├── sections/             # One file per chapter
│   ├── backpages/            # Appendix and curriculum vitae
│   ├── figures/              # Figures used in the thesis
│   ├── watermark/            # NTUST watermark
│   ├── ntust_report.cls      # Document class (do not modify)
│   └── 標楷體.ttf             # Chinese font (install before compiling)
└── 中文版本/                  # Template for theses written in Chinese (same layout)
```

> Each edition also has its own `README.md` with edition-specific notes:
> [English Version](English%20Version/README.md) · [中文版本](中文版本/README.md)

### Prerequisites

| Requirement | Notes |
| --- | --- |
| A recent TeX distribution | [MacTeX](https://tug.org/mactex/) (macOS), [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/) (Windows/Linux) |
| XeLaTeX + BibTeX | Included in the distributions above |
| **標楷體.ttf** (*AR PL KaitiM Big5*) | Bundled in each edition folder — install it on your system |
| **Times New Roman** | Used as the main Latin font |

### Quick Start

1. **Get the template** — **Fork** this repository, or clone it:

   ```bash
   git clone https://github.com/hadziq/ntust-thesis.git
   cd ntust-thesis
   ```

2. **Pick an edition** — `English Version/` or `中文版本/` — and work inside that folder.
3. **Install the font** `標楷體.ttf` from that folder.
4. **Compile** (see [Compiling](#compiling)) and open `my_ntust_thesis.pdf`.

### Writing Your Thesis

As a rule of thumb, **only edit files whose names start with `my_`** plus the chapter files in `sections/`.

| What | Where |
| --- | --- |
| Title, names, advisors, dates | `frontpages/my_names.tex` |
| Abstracts (Chinese / English) | `frontpages/my_cabstract.tex`, `frontpages/my_eabstract.tex` |
| Acknowledgements | `frontpages/my_ackn.tex` |
| List of symbols | `frontpages/my_symbols.tex` |
| Chapters | `sections/*.tex`, included from `my_ntust_thesis.tex` |
| References | `my_bib.bib` |
| Appendix / Vitae | `backpages/my_appendix.tex`, `backpages/my_vitae.tex` (`my_vita.tex` in 中文版本) |

Files prefixed with `ntust_` (e.g. `ntust_frontpages.tex`, `ntust_backpages.tex`, `ntust_report.cls`) define the official layout and **should not be modified**.

> **Tip:** While drafting, comment out the `\input{frontpages/...}` or `\input{backpages/...}` lines in `my_ntust_thesis.tex` to speed up compilation.

### Compiling

The table of contents, cross-references, and bibliography require **four passes**:

```text
xelatex → bibtex → xelatex → xelatex
```

**Option 1 — build script (macOS/Linux):**

```bash
cd "English Version"   # or: cd 中文版本
bash my_ntust_thesis.sh
```

**Option 2 — manually:**

```bash
xelatex my_ntust_thesis.tex
bibtex  my_ntust_thesis
xelatex my_ntust_thesis.tex
xelatex my_ntust_thesis.tex
```

**Option 3 — Visual Studio Code ([LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)):**
add the recipe below to your `settings.json`.

<details>
<summary>LaTeX Workshop recipe</summary>

```json
"latex-workshop.latex.recipes": [
  {
    "name": "xelatex ➞ bibtex ➞ xelatex × 2",
    "tools": ["xelatex", "bibtex", "xelatex", "xelatex"]
  }
],
"latex-workshop.latex.tools": [
  {
    "name": "xelatex",
    "command": "xelatex",
    "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
  },
  {
    "name": "bibtex",
    "command": "bibtex",
    "args": ["%DOCFILE%"]
  }
]
```

</details>

### Troubleshooting

| Problem | Solution |
| --- | --- |
| `fontspec error: "font-not-found"` for *AR PL KaitiM Big5* | Install `標楷體.ttf` from the edition folder, then recompile. |
| `fontspec error` for *Times New Roman* | Install Times New Roman, or change `\setmainfont{...}` in `my_ntust_thesis.tex`. |
| Table of contents or citations show `??` | Run the full four-pass sequence, not a single `xelatex`. |
| `pdflatex` fails with CJK errors | This template requires **XeLaTeX**; `pdflatex` is not supported. |

### Contributing

Contributions are welcome — bug fixes, updates to match the latest NTUST formatting rules, and documentation improvements alike.
Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening an issue or pull request.

---

## 中文說明

國立臺灣科技大學的論文 LaTeX 範本，可用於撰寫碩士或博士論文。本範本由元智大學碩博士論文 LaTeX 範本改編而來，主要修改如下：

1. 浮水印
2. 封面格式
3. 加入指導教授推薦書頁面
4. 刪除不必要的頁面
5. 更改檔案結構

### 使用方式

1. 選擇 `English Version/`（英文論文）或 `中文版本/`（中文論文）資料夾。
2. 安裝該資料夾內的字體 **標楷體.ttf**，並確認已安裝 **Times New Roman**。
3. 更新 TeX 環境：MacTeX (macOS)、MiKTeX 或 TeX Live (Windows / Linux)。
4. 撰寫論文時，只需修改檔名為 **`my_XXXXXXX.XXX`** 的文件：
   - 主結構檔為 **`my_ntust_thesis.tex`**
   - 需要修改的前頁與後頁內容位於 **`frontpages/`** 及 **`backpages/`**
   - 論文各章節內容請放置於 **`sections/`** 目錄
   - 參考文獻的 BibTeX 檔請放置於第一層目錄的 **`my_bib.bib`**
5. 以 `ntust_` 開頭的檔案為學校規定格式，請勿更動。

### 編譯

為了產生正確的檔案，請務必依序編譯四次，否則目錄及參考文獻會錯亂：

```text
xelatex → bibtex → xelatex → xelatex
```

或直接執行：

```bash
cd 中文版本
bash my_ntust_thesis.sh
```

> 本範本必須使用 **XeLaTeX** 編譯，不支援 `pdflatex`。

---

## Contributors

Thanks to everyone who has helped improve this template! 感謝所有協助改進本範本的貢獻者！

<table>
  <tr>
    <td align="center"><a href="https://github.com/hadziq"><img src="https://github.com/hadziq.png?size=100" width="80" alt="hadziq"/><br/><sub><b>Hadziq Fabroyir</b></sub></a><br/><sub>Maintainer</sub></td>
    <td align="center"><a href="https://github.com/sheiun"><img src="https://github.com/sheiun.png?size=100" width="80" alt="sheiun"/><br/><sub><b>雪煾 (sheiun)</b></sub></a><br/><sub>Docs</sub></td>
    <td align="center"><a href="https://github.com/wazho"><img src="https://github.com/wazho.png?size=100" width="80" alt="wazho"/><br/><sub><b>Ze-Hao Wang (Salmon)</b></sub></a><br/><sub>Chinese typesetting</sub></td>
    <td align="center"><a href="https://github.com/BoChengHuang"><img src="https://github.com/BoChengHuang.png?size=100" width="80" alt="BoChengHuang"/><br/><sub><b>BoCheng Huang</b></sub></a><br/><sub>Build script</sub></td>
    <td align="center"><a href="https://github.com/yc5"><img src="https://github.com/yc5.png?size=100" width="80" alt="yc5"/><br/><sub><b>yc5</b></sub></a><br/><sub>Docs</sub></td>
  </tr>
</table>

See [CONTRIBUTORS.md](CONTRIBUTORS.md) for details of each contribution, or the
[contributors graph](https://github.com/hadziq/ntust-thesis/graphs/contributors) on GitHub.

## Acknowledgements

Original template author: **Ding-Jie Huang (黃鼎傑)**, CNS Laboratory, NTUST
([NTUST Thesis LaTeX v1.5 release](http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)).
This repository migrated his work from Google Code and continues to maintain it.

The template itself was derived from the Yuan Ze University (元智大學) thesis LaTeX template.

## License

Distributed under the [Apache License 2.0](LICENSE).
The bundled document class (`ntust_report.cls`) retains its original LaTeX Project Public License notice.
