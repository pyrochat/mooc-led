#!/bin/bash

python ../../generation/pre-dia.py binaire-dia.md binaire-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output binaire-dia.html binaire-dia-pre.md

weasyprint binaire-dia.html binaire-dia.pdf

rm binaire-dia-pre.md
rm binaire-dia.html
