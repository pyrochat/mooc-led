#!/bin/bash

python ../../generation/pre-dia.py -c couleur-dia.md couleur-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output couleur-dia-compact.html couleur-dia-pre-compact.md

weasyprint couleur-dia-compact.html couleur-dia-compact.pdf

rm couleur-dia-pre-compact.md
rm couleur-dia-compact.html
