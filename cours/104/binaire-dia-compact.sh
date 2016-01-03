#!/bin/bash

python ../../generation/pre-dia.py -c binaire-dia.md binaire-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output binaire-dia-compact.html binaire-dia-pre-compact.md

weasyprint binaire-dia-compact.html binaire-dia-compact.pdf

rm binaire-dia-pre.md
rm binaire-dia.html
