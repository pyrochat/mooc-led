#!/bin/bash

python ../../generation/pre-dia.py -c generic-dia.md generic-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output generic-dia-compact.html generic-dia-pre-compact.md

weasyprint generic-dia-compact.html generic-dia-compact.pdf

rm generic-dia-pre-compact.md
rm generic-dia-compact.html
