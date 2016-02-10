#!/bin/bash

python ../../generation/pre-dia.py -c carac-dia.md carac-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output carac-dia-compact.html carac-dia-pre-compact.md

weasyprint carac-dia-compact.html carac-dia-compact.pdf

rm carac-dia-pre-compact.md
rm carac-dia-compact.html
