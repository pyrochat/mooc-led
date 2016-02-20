#!/bin/bash

python ../../generation/pre-dia.py couleur-dia.md couleur-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output couleur-dia.html couleur-dia-pre.md

weasyprint couleur-dia.html couleur-dia.pdf

rm couleur-dia-pre.md
rm couleur-dia.html

