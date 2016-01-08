#!/bin/bash

python ../../generation/pre-dia.py -c memoires-perm-dia.md memoires-perm-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output memoires-perm-dia-compact.html memoires-perm-dia-pre-compact.md

weasyprint memoires-perm-dia-compact.html memoires-perm-dia-compact.pdf

rm memoires-perm-dia-pre-compact.md
rm memoires-perm-dia-compact.html
