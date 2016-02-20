#!/bin/bash

python ../../generation/pre-dia.py distance-dia.md distance-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output distance-dia.html distance-dia-pre.md

weasyprint distance-dia.html distance-dia.pdf

rm distance-dia-pre.md
rm distance-dia.html

