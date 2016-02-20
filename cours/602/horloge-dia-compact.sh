#!/bin/bash

python ../../generation/pre-dia.py -c horloge-dia.md horloge-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output horloge-dia-compact.html horloge-dia-pre-compact.md

weasyprint horloge-dia-compact.html horloge-dia-compact.pdf

rm horloge-dia-pre-compact.md
rm horloge-dia-compact.html
