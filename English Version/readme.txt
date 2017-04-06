# ntust-thesis
ntust-thesis is a LaTeX template for writing Master thesis or Ph.D dissertation in NTUST.

### Manual
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

CREDITS to the original author, my senior in CNS Laboratory: Ding-Jie Huang 黃鼎傑
(Website: http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)
