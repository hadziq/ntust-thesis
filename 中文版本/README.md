# ntust-thesis

國立台灣科技大學的論文 LaTeX 範本，可以使用次範本來寫碩士或者博士論文。

## 說明

本範本是由元智大學碩博士論文 latex 範本改編而來，目前主要是修改了以下幾個東西：

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

p.s. 要執行上述命令，煩請確認先更新 MacTeX (macOS) 或 MiKTeX (Windows)，或改用 Overleaf 並將編譯器設為 XeLaTeX（詳見主 README）。
字體“標楷體.ttf”可選擇是否安裝：若未安裝，範本會直接載入本資料夾內的字體檔。

CREDITS to the original author, my senior in CNS Laboratory: Ding-Jie Huang 黃鼎傑
(Website: <http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html>)
