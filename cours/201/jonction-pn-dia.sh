#!/bin/bash

python ../../generation/pre-dia.py jonction-pn-dia.md jonction-pn-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output jonction-pn-dia.html jonction-pn-dia-pre.md

weasyprint jonction-pn-dia.html jonction-pn-dia.pdf

rm jonction-pn-dia-pre.md
rm jonction-pn-dia.html

