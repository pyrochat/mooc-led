#!/bin/bash

python ../../generation/pre-dia.py horloge-dia.md horloge-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output horloge-dia.html horloge-dia-pre.md

weasyprint horloge-dia.html horloge-dia.pdf

rm horloge-dia-pre.md
rm horloge-dia.html

