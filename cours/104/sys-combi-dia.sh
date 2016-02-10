#!/bin/bash

python ../../generation/pre-dia.py sys-combi-dia.md sys-combi-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output sys-combi-dia.html sys-combi-dia-pre.md

weasyprint sys-combi-dia.html sys-combi-dia.pdf

rm sys-combi-dia-pre.md
rm sys-combi-dia.html

