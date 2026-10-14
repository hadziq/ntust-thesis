# 中文版本

若你的論文以**中文**撰寫，請使用此版本。
編譯後會產生臺科大論文封面、前頁（中英文摘要、誌謝、目錄、圖目錄、表目錄）、各章內容，以及後頁（參考文獻、附錄、自傳）。

> 想先了解整體介紹？請參閱[專案首頁](../)或[英文版](../English%20Version/README.md)。

## 開始之前

1. 安裝最新版的 TeX 環境：[MacTeX](https://tug.org/mactex/)（macOS）、[MiKTeX](https://miktex.org/) 或 [TeX Live](https://tug.org/texlive/)（Windows / Linux）；或改用 [Overleaf](https://www.overleaf.com) 並將編譯器設為 **XeLaTeX**（詳見[使用 Overleaf](../README.md#使用-overleaf)）。
2. （選用）安裝本資料夾中的字型 **標楷體.ttf**（*AR PL KaitiM Big5*）。若未安裝，範本會直接載入本資料夾內的字型檔。
3. （選用）安裝 **Times New Roman**。若未安裝，英文字型會改用 TeX Live 內建的 *TeX Gyre Termes*。
4. 內文字體大小預設為 12pt，可在 `my_ntust_thesis.tex` 的 `\documentclass[12pt, a4paper]{ntust_report}` 改為 `10pt`、`11pt` 或 `14pt`。

## 需要修改的檔案

只需修改檔名以 `my_` 開頭的檔案，以及 `sections/` 中的各章檔案。

| 內容 | 檔案 |
| --- | --- |
| 論文題目、姓名、學號、指導教授、日期 | `frontpages/my_names.tex` |
| 中文摘要 | `frontpages/my_cabstract.tex` |
| 英文摘要 | `frontpages/my_eabstract.tex` |
| 誌謝 | `frontpages/my_ackn.tex` |
| 符號說明 | `frontpages/my_symbols.tex` |
| 各章內容 | `sections/*.tex`，並在 `my_ntust_thesis.tex` 中引入 |
| 參考文獻（BibTeX） | `my_bib.bib` |
| 附錄 | `backpages/my_appendix.tex` |
| 自傳 | `backpages/my_vita.tex` |

以 `ntust_` 開頭的檔案（`ntust_report.cls`、`frontpages/ntust_frontpages.tex`、`backpages/ntust_backpages.tex`）為學校規定格式，請勿更動。

## 編譯

為了產生正確的目錄、交互參照與參考文獻，請務必依序編譯四次：

```text
xelatex → bibtex → xelatex → xelatex
```

使用編譯腳本（macOS / Linux）：

```bash
bash my_ntust_thesis.sh
```

或在任何平台上手動執行：

```bash
xelatex my_ntust_thesis.tex
bibtex  my_ntust_thesis
xelatex my_ntust_thesis.tex
xelatex my_ntust_thesis.tex
```

也可以使用 `latexmk`，一個指令即可自動完成所有步驟：

```bash
latexmk -xelatex my_ntust_thesis.tex
```

> Visual Studio Code（LaTeX Workshop）的設定方式請參閱[英文版說明](../English%20Version/README.md#visual-studio-code)。

## 小技巧

- **加快編譯：** 撰寫各章草稿時，可在 `my_ntust_thesis.tex` 中將 `\input{frontpages/...}` 與 `\input{backpages/...}` 註解掉。
- **浮水印：** 如需加上臺科大浮水印，請在 `common_env.tex` 中取消 `\input{watermark/ntust_watermark.tex}` 的註解。
- **推薦書與審定書：** 範本已預留空白頁，口試完成後請在裝訂前替換為已簽名的掃描檔。
- **編譯器：** 本範本必須使用 **XeLaTeX** 編譯，不支援 `pdflatex`。

## 致謝

原作者：CNS 實驗室黃鼎傑
（[NTUST Thesis LaTeX v1.5 release](http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)）。
感謝所有協助改進本範本的[貢獻者](../CONTRIBUTORS.md)。
