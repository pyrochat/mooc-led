#!/bin/bash

python ../../generation/pre-dia.py -c sys-combi-dia.md sys-combi-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output sys-combi-dia-compact.html sys-combi-dia-pre-compact.md

weasyprint sys-combi-dia-compact.html sys-combi-dia-compact.pdf

rm sys-combi-dia-pre-compact.md
rm sys-combi-dia-compact.html
