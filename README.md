# ntust-thesis

ntust-thesis is a LaTeX template for writing Master thesis or Ph.D dissertation in NTUST.

國立台灣科技大學的論文 LaTeX 範本，可以使用次範本來寫碩士或者博士論文。

## English Manual

This LaTeX template was made from Yuan Ze University’s thesis template with the following modification:

1. Provisional watermark
2. Cover format
3. Page inclusion containing Professor’s recommendation letter
4. Deletion on unnecessary pages
5. Update on the file structures

Among all the files in this template project, the most important parts are inside **frontpages** and **backpages** folder.
Please classify the thesis’ main structure and content into its related sections’ directory and table of contents.
Please put the references (BibTeX) into **my_bib.bib**.

In order to generate PDF correctly, please execute four steps compilation process (i.e. LaTeX toolchain) as follows.

> xelatex + bibtex + xelatex + xelatex

p.s.
Please install the latest TeX engine on your computer (e.g. MacTeX for macOS, MiKTeX for Windows OS), and also install Font "標楷體.ttf" in advance.

## 中文說明

本範本是由元智大學碩博士論文latex範本改編而來，目前主要是修改了以下幾個東西：

1. 浮水印
2. 封面格式
3. 加入教授推薦書頁面
4. 刪除無用的頁面
5. 更改檔案結構

在進行論文寫作時，只需改變所有檔名為 **my_XXXXXXX.XXX** 之文件。
本tex之主結構檔為 **my_ntust_thesis.tex**。
其中需要修改的東西為在 **frontpages** 及 **backpages** 之文件。
論文主結構及內容請分類放置於sections目錄中。
references的bibtex檔請放置於目錄第一層之 **my_bib.bib** 。

為了生產出正確的檔案，請務必編輯四次，否則目錄及參考資料會亂掉：

> xelatex + bibtext + xelatex + xelatex

p.s. 要執行上述命令，煩請確認先更新 MacTeX (macOS) 或 MiKTeX (Windows)，還有安裝字體如下：“標楷體.ttf”。

CREDITS to the original author, my senior in CNS Laboratory: Ding-Jie Huang 黃鼎傑
(Website: <http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html>)
