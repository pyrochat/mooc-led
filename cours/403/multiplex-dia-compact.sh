#!/bin/bash

python ../../generation/pre-dia.py -c multiplex-dia.md multiplex-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output multiplex-dia-compact.html multiplex-dia-pre-compact.md

weasyprint multiplex-dia-compact.html multiplex-dia-compact.pdf

rm multiplex-dia-pre-compact.md
rm multiplex-dia-compact.html
