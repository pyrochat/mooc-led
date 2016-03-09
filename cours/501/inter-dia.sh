#!/bin/bash

CODE=inter
MD_FILE_IN=$CODE-dia.md
MD_FILE_PRE=$CODE-dia-pre.md
HTML_FILE=$CODE-dia.html
PDF_FILE=$CODE-dia.pdf
CSS_FILE=../../statiques/diaporama.css

python                          \
	../../generation/pre-dia.py \
	$MD_FILE_IN                 \
	$MD_FILE_PRE

pandoc                             \
	--standalone                   \
	--from markdown                \
	--to html                      \
	--highlight-style pygments     \
	--email-obfuscation references \
	--normalize                    \
	--css=$CSS_FILE                \
	--output $HTML_FILE            \
	$MD_FILE_PRE

weasyprint     \
	$HTML_FILE \
	$PDF_FILE

rm $HTML_FILE
rm $MD_FILE_PRE
