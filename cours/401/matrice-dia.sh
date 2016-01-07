#!/bin/bash

python ../../generation/pre-dia.py C-Arduino-dia.md matrice-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output matrice-dia.html matrice-dia-pre.md

weasyprint matrice.html matrice.pdf

rm matrice-pre.md
rm matrice-dia.html

