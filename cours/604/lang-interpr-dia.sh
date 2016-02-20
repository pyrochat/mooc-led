#!/bin/bash

python ../../generation/pre-dia.py lang-interpr-dia.md lang-interpr-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output lang-interpr-dia.html lang-interpr-dia-pre.md

weasyprint lang-interpr-dia.html lang-interpr-dia.pdf

rm lang-interpr-dia-pre.md
rm lang-interpr-dia.html

