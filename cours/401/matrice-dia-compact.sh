#!/bin/bash

python ../../generation/pre-dia.py -c matrice-dia.md matrice-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output matrice-dia-compact.html matrice-dia-pre-compact.md

weasyprint matrice-dia-compact.html matrice-dia-compact.pdf

rm matrice-dia-pre-compact.md
rm matrice-dia-compact.html
