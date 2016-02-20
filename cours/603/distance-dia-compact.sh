#!/bin/bash

python ../../generation/pre-dia.py -c distance-dia.md distance-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output distance-dia-compact.html distance-dia-pre-compact.md

weasyprint distance-dia-compact.html distance-dia-compact.pdf

rm distance-dia-pre-compact.md
rm distance-dia-compact.html
