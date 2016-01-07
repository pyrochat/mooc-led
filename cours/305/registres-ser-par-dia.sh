#!/bin/bash

python ../../generation/pre-dia.py registres-ser-par-dia.md registres-ser-par-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output registres-ser-par-dia.html registres-ser-par-dia-pre.md

weasyprint registres-ser-par-dia.html registres-ser-par-dia.pdf

rm registres-ser-par-dia-pre.md
rm registres-ser-par-dia.html

