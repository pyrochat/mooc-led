#!/bin/bash

python ../../generation/pre-dia.py seq-compteur-dia.md seq-compteur-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output seq-compteur-dia.html seq-compteur-dia-pre.md

weasyprint seq-compteur-dia.html seq-compteur-dia.pdf

rm seq-compteur-dia-pre.md
rm seq-compteur-dia.html

