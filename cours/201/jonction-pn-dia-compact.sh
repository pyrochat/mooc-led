#!/bin/bash

python ../../generation/pre-dia.py -c jonction-pn-dia.md jonction-pn-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output jonction-pn-dia-compact.html jonction-pn-dia-pre-compact.md

weasyprint jonction-pn-dia-compact.html jonction-pn-dia-compact.pdf

rm jonction-pn-dia-pre-compact.md
rm jonction-pn-dia-compact.html
