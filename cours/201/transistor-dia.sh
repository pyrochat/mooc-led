#!/bin/bash

python ../../generation/pre-dia.py transistor-dia.md transistor-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output transistor-dia.html transistor-dia-pre.md

weasyprint transistor-dia.html transistor-dia.pdf

rm transistor-dia-pre.md
rm transistor-dia.html

