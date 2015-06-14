#!/bin/bash
# Author: Ding-jie Huang
#echo $0
test=$0
prefix=`echo $test |cut -d "/" -f 2|cut -d "." -f 1 `
#echo $test
echo $prefix
name=$prefix 
echo "Compile $name.tex"
xelatex -no-pdf $name.tex 
bibtex $name
xelatex -no-pdf $name.tex 
xelatex $name.tex 
#dvips -Ppdf -G0 -tletter $name.dvi 
#ps2pdf -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress $name.ps $name.pdf
  
