#!/bin/bash

python ../../generation/pre-dia.py -c transistor-dia.md transistor-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output transistor-dia-compact.html transistor-dia-pre-compact.md

weasyprint transistor-dia-compact.html transistor-dia-compact.pdf

rm transistor-dia-pre-compact.md
rm transistor-dia-compact.html
