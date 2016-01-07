#!/bin/bash

python ../../generation/pre-dia.py -c registres-ser-par-dia.md registres-ser-par-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output registres-ser-par-dia-compact.html registres-ser-par-dia-pre-compact.md

weasyprint registres-ser-par-dia-compact.html registres-ser-par-dia-compact.pdf

rm registres-ser-par-dia-pre-compact.md
rm registres-ser-par-dia-compact.html
