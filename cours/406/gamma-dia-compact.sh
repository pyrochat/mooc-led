#!/bin/bash

python ../../generation/pre-dia.py -c gamma-dia.md gamma-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output gamma-dia-compact.html gamma-dia-pre-compact.md

weasyprint gamma-dia-compact.html gamma-dia-compact.pdf

rm gamma-dia-pre-compact.md
rm gamma-dia-compact.html
