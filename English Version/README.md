# English Version

Use this edition if your thesis or dissertation is written in **English**.
It produces the NTUST cover, the front pages (abstracts, acknowledgements, table of contents, lists of figures, tables, and algorithms), your chapters, and the back pages (references, appendix, and curriculum vitae).

> Prefer to read the overview first? See the [project home page](../) or the [Chinese edition](../中文版本/README.md).

## Before You Start

1. Install a recent TeX distribution: [MacTeX](https://tug.org/mactex/) (macOS), [MiKTeX](https://miktex.org/) or [TeX Live](https://tug.org/texlive/) (Windows/Linux). Alternatively, use [Overleaf](https://www.overleaf.com) with the **XeLaTeX** compiler (see [Using Overleaf](../README.md#using-overleaf)).
2. *(Optional)* Install the font **標楷體.ttf** (*AR PL KaitiM Big5*) bundled in this folder. If it is not installed, the bundled copy is loaded directly.
3. *(Optional)* Install **Times New Roman**. If it is not installed, *TeX Gyre Termes* (included in TeX Live) is used instead.
4. The body text is 12pt by default. To change it, edit `\documentclass[12pt, a4paper]{ntust_report}` in `my_ntust_thesis.tex` (`10pt`, `11pt`, and `14pt` are also available).

## Files to Edit

Only edit files whose names start with `my_`, plus your chapters in `sections/`.

| What | File |
| --- | --- |
| Title, your name, student ID, advisors, dates | `frontpages/my_names.tex` |
| Chinese abstract (off by default; uncomment its block in `frontpages/ntust_frontpages.tex` if required) | `frontpages/my_cabstract.tex` |
| English abstract | `frontpages/my_eabstract.tex` |
| Acknowledgements | `frontpages/my_ackn.tex` |
| List of symbols | `frontpages/my_symbols.tex` |
| Chapters | `sections/*.tex`, listed in `my_ntust_thesis.tex` |
| References (BibTeX) | `my_bib.bib` |
| Appendix | `backpages/my_appendix.tex` |
| Curriculum vitae | `backpages/my_vitae.tex` |

Files starting with `ntust_` (`ntust_report.cls`, `frontpages/ntust_frontpages.tex`, `backpages/ntust_backpages.tex`) define the official layout. Please do not modify them.

## Compiling

The table of contents, cross-references, and bibliography need the full sequence:

```text
xelatex → bibtex → xelatex → xelatex
```

Run the build script (macOS/Linux):

```bash
bash my_ntust_thesis.sh
```

Or run the steps yourself on any platform:

```bash
xelatex my_ntust_thesis.tex
bibtex  my_ntust_thesis
xelatex my_ntust_thesis.tex
xelatex my_ntust_thesis.tex
```

With `latexmk`, a single command reruns everything as needed:

```bash
latexmk -xelatex my_ntust_thesis.tex
```

### Visual Studio Code

If you use the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) extension, add this recipe to your `settings.json`:

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

## Tips

- **Faster drafts:** comment out the `\input{frontpages/...}` and `\input{backpages/...}` lines in `my_ntust_thesis.tex` while you write your chapters.
- **Watermark:** to add the NTUST watermark, uncomment `\input{watermark/ntust_watermark.tex}` in `common_env.tex`.
- **Approval pages:** the template inserts blank pages for the advisor's recommendation letter and the committee approval form. Replace them with the signed scans before binding.

## Credits

Original author: Ding-Jie Huang (黃鼎傑), CNS Laboratory, NTUST
([NTUST Thesis LaTeX v1.5 release](http://hdj-berkeley.blogspot.tw/2011/03/ntust-thesis-latex-v15-release.html)).
See [CONTRIBUTORS.md](../CONTRIBUTORS.md) for everyone who has helped since.
