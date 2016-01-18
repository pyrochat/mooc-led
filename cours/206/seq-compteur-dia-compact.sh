#!/bin/bash

python ../../generation/pre-dia.py -c seq-compteur-dia.md seq-compteur-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output seq-compteur-dia-compact.html seq-compteur-dia-pre-compact.md

weasyprint seq-compteur-dia-compact.html seq-compteur-dia-compact.pdf

rm seq-compteur-dia-pre-compact.md
rm seq-compteur-dia-compact.html
