#!/bin/bash

python ../../generation/pre-dia.py inter-dia.md inter-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output inter-dia.html inter-dia-pre.md

weasyprint inter-dia.html inter-dia.pdf

rm inter-dia.html
rm inter-dia-pre.md

