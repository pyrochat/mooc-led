#!/bin/bash

python ../../generation/pre-dia.py gamma-dia.md gamma-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output gamma-dia.html gamma-dia-pre.md

weasyprint gamma-dia.html gamma-dia.pdf

rm gamma-dia-pre.md
rm gamma-dia.html

