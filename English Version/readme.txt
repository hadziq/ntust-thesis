# ntust-thesis
ntust-thesis is a LaTeX template for writing Master thesis or Ph.D dissertation in NTUST.

### Manual
This LaTeX template is a modified version. It was originally used by Yuan Ze University’s graduate students (Master and Ph.D). Following points are the most important things that had been altered in the NTUST version:

1. Provisional watermark
2. Cover format
3. Page inclusion containing Professor’s recommendation letter
4. Deletion on unnecessary pages
5. Update on the file structures

While writing the thesis, please change every document whose name is **my_xxxxxxx.xxx**. 
This TeX’s main file is **my_ntust_thesis.tex**.
Among all the files you need to edit, the most important parts are in **frontpages** and **backpages** folder.
Please classify the thesis’ main structure and content into its related sections’ directory and table of contents.
Please put the references (BibTeX) onto the first layer of **my_bib.bib**.

In order to generate PDF correctly, please execute four steps compilation process (i.e. LaTeX toolchain) as follows.

> xelatex + bibtex + xelatex + xelatex

p.s.
Please install the latest TeX engine on your computer (e.g. MacTeX for macOS, MiKTeX for Windows OS), and also install Font "標楷體.ttf" in advance.

CREDITS to the Original Author, my Senior in CNS Laboratory: Ding-Jie Huang 黃鼎傑
(Website: http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)

Extra notes for Visual Studio Code users:
In case you are using LaTeX workshop to compile your LaTeX, please copy and paste the following toolchain scripts onto your user settings.

    "latex-workshop.latex.toolchain": [
      {
        "command": "xelatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      }, {
        "command": "bibtex",
        "args": [
          "%DOCFILE%"
        ]
      }, {
        "command": "xelatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      }, {
        "command": "xelatex",
        "args": [
          "-synctex=1",
          "-interaction=nonstopmode",
          "-file-line-error",
          "%DOC%"
        ]
      }
    ]
