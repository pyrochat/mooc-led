#!/bin/bash

python ../../generation/pre-dia.py -c C-Arduino-dia.md C-Arduino-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output C-Arduino-dia-compact.html C-Arduino-dia-pre-compact.md

weasyprint C-Arduino-dia-compact.html C-Arduino-dia-compact.pdf

rm C-Arduino-dia-pre-compact.md
rm C-Arduino-dia.html
