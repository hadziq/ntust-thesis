#!/usr/bin/env bash
# Build the sample PDF of each edition and render the preview images shown on
# the GitHub Pages site (index.html). Used by .github/workflows/build-samples.yml,
# and can also be run locally from any directory.
#
# Requires: xelatex, bibtex, pdftoppm (poppler-utils), pdffonts, cwebp (webp)
#
# Outputs (overwritten in place):
#   English Version/my_ntust_thesis.pdf, 中文版本/my_ntust_thesis.pdf
#   assets/img/preview/{en,zh}-{cover,abstract,contents,chapter,figure,references}.webp
#
# Set REQUIRE_TIMES_NEW_ROMAN=1 to fail instead of silently falling back to
# TeX Gyre Termes when Times New Roman is not installed.

set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
work=$(mktemp -d)
trap 'rm -rf "$work"' EXIT

# Reproducible PDFs: fixed timestamps, so unchanged sources give identical files
export SOURCE_DATE_EPOCH=${SOURCE_DATE_EPOCH:-$(git -C "$root" log -1 --format=%ct 2>/dev/null || date +%s)}
export FORCE_SOURCE_DATE=1

# Page shown for each preview image; keep in sync with the #page=N links in index.html
pages_en="cover:1 abstract:4 contents:6 chapter:10 figure:13 references:15"
pages_zh="cover:1 abstract:2 contents:5 chapter:8 figure:10 references:15"

# Run a command quietly, printing its output only if it fails
run() {
	local out="$work/command.out"
	if ! "$@" >"$out" 2>&1; then
		cat "$out"
		echo "error: '$*' failed" >&2
		return 1
	fi
}

build() {
	local edition=$1 prefix=$2 pages=$3
	local dir="$work/$prefix"

	echo "Building $edition"
	cp -R "$root/$edition" "$dir"
	(
		cd "$dir"
		run xelatex -interaction=nonstopmode -halt-on-error my_ntust_thesis.tex
		# BibTeX exits with 1 when it only has warnings
		bibtex my_ntust_thesis >"$work/bibtex.out" 2>&1 || { [ $? -eq 1 ] || { cat "$work/bibtex.out"; exit 1; }; }
		run xelatex -interaction=nonstopmode -halt-on-error my_ntust_thesis.tex
		run xelatex -interaction=nonstopmode -halt-on-error my_ntust_thesis.tex
		if grep -E "There were undefined references|Rerun to get" my_ntust_thesis.log; then
			echo "error: $edition has unresolved references" >&2
			exit 1
		fi
	)

	if [ "${REQUIRE_TIMES_NEW_ROMAN:-0}" = 1 ] && ! pdffonts "$dir/my_ntust_thesis.pdf" | grep -q TimesNewRoman; then
		echo "error: $edition was not set in Times New Roman; install the font first" >&2
		exit 1
	fi

	cp "$dir/my_ntust_thesis.pdf" "$root/$edition/my_ntust_thesis.pdf"

	local entry name page
	for entry in $pages; do
		name=${entry%%:*}
		page=${entry##*:}
		pdftoppm -png -singlefile -f "$page" -l "$page" -scale-to-x 600 -scale-to-y -1 \
			"$dir/my_ntust_thesis.pdf" "$work/$prefix-$name"
		cwebp -quiet -q 80 -metadata none "$work/$prefix-$name.png" \
			-o "$root/assets/img/preview/$prefix-$name.webp"
	done
}

build "English Version" en "$pages_en"
build "中文版本" zh "$pages_zh"
echo "Done: sample PDFs and preview images updated"
