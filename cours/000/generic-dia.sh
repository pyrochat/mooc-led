#!/bin/bash

python ../../generation/pre-dia.py generic-dia.md generic-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output generic-dia.html generic-dia-pre.md

weasyprint generic-dia.html generic-dia.pdf

rm generic-dia-pre.md
rm generic-dia.html

