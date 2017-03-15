# ntust-thesis
ntust-thesis is a dedicated LaTeX template for writing Master thesis or Ph.D dissertation in NTUST.

國立台灣科技大學的論文 LaTeX 範本，可以使用次範本來寫碩士或者博士論文。

### English Manual
This LaTeX template is a modified version. It was originally used by Yuan Ze University’s graduate students (Master and Ph.D). Following points are the most important things that had been altered in the NTUST version:

1. Provisional watermark
2. Cover format
3. Page inclusion containing Professor’s recommendation letter
4. Deletion upon unnecessary pages
5. Update upon the file structure

While writing the thesis, please change every document whose name is **my_xxxxxxx.xxx**. 
This TeX’s main file is **my_ntust_thesis.tex**.
Among all the files you need to edit, the most important parts are in **frontpages** and **backpages** folder.
Please classify the thesis’ main structure and content into its related sections’ directory and table of contents.
Please put the references (BibTeX) onto the first layer of **my_bib.bib**.

In order to generate the correct files, please ensure that it goes through 4 four steps compilation process, otherwise the table of contents and the bibliography would be messed up.

For Mac Users (using MacTeX)
> pdflatex + bibtex + pdflatex + pdflatex

For Windows Users (using MiKTeX)
> xelatex + bibtex + xelatex + xelatex
p.s. Before running aforementioned commands, please run "MiKTeX Update (Admin)" and also install Font "標楷體.ttf" in advance.

CREDITS to the Original Author, my Senior in CNS Laboratory: Ding-Jie Huang 黃鼎傑
(Website: http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)
