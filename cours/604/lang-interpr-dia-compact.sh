#!/bin/bash

python ../../generation/pre-dia.py -c lang-interpr-dia.md lang-interpr-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output lang-interpr-dia-compact.html lang-interpr-dia-pre-compact.md

weasyprint lang-interpr-dia-compact.html lang-interpr-dia-compact.pdf

rm lang-interpr-dia-pre-compact.md
rm lang-interpr-dia-compact.html
