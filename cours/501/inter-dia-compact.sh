#!/bin/bash

python ../../generation/pre-dia.py -c inter-dia.md inter-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output inter-dia-compact.html inter-dia-pre-compact.md

weasyprint inter-dia-compact.html inter-dia-compact.pdf

rm inter-dia-compact.html
rm inter-dia-pre-compact.md

