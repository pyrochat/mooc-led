#!/bin/bash

python ../../generation/pre-dia.py C-Arduino-dia.md C-Arduino-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output C-Arduino-dia.html C-Arduino-dia-pre.md

weasyprint C-Arduino-dia.html C-Arduino-dia.pdf

rm C-Arduino-dia-pre.md
rm C-Arduino-dia.html

