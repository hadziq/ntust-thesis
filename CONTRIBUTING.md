# Contributing to ntust-thesis

Thank you for helping improve the NTUST thesis template! 歡迎大家一起改進本範本！

## Ways to Contribute

- **Report a bug.** Open an [issue](https://github.com/hadziq/ntust-thesis/issues) with your OS, TeX distribution and version, which edition you used (`English Version` or `中文版本`), and the relevant part of the `.log` file.
- **Keep the format up to date.** NTUST's thesis formatting rules change from time to time. If you notice a mismatch, please mention which regulation or which year's guideline you are following.
- **Improve the documentation.** Clarifications, translations, and fixes for typos are always welcome.

## Pull Request Workflow

1. Fork the repository and create a branch from `master`:

   ```bash
   git checkout -b fix/short-description
   ```

2. Make your changes. Where the change applies to both editions, update **both** `English Version/` and `中文版本/` so they stay in sync.
3. Compile the template you changed with the full sequence and check the resulting PDF:

   ```text
   xelatex → bibtex → xelatex → xelatex
   ```

4. **Do not commit build artifacts** (`*.aux`, `*.log`, `*.toc`, `*.xdv`, `*.bbl`, …); they are already listed in `.gitignore`.
5. Keep Markdown files consistent with [markdownlint](https://github.com/DavidAnson/markdownlint) style.
6. Add yourself to [CONTRIBUTORS.md](CONTRIBUTORS.md).
7. Open a pull request that describes **what** changed and **why**. If the layout changed, attach a screenshot of the affected pages.

## Guidelines

- Do not include personal thesis content (real names, abstracts, unpublished research) in pull requests.
- Prefer small, focused pull requests over large mixed ones.
- Changes to the `ntust_*` files and `ntust_report.cls` affect every user, so please explain the reason for them clearly.

## License

By contributing, you agree that your contributions are licensed under the [Apache License 2.0](LICENSE).
