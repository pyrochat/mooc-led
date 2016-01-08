#!/bin/bash

python ../../generation/pre-dia.py multiplex-dia.md multiplex-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output multiplex-dia.html multiplex-dia-pre.md

weasyprint multiplex-dia.html multiplex-dia.pdf

rm multiplex-dia-pre.md
rm multiplex-dia.html

