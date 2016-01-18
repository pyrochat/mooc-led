#!/bin/bash

python ../../generation/pre-dia.py memoires-perm-dia.md memoires-perm-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output memoires-perm-dia.html memoires-perm-dia-pre.md

weasyprint memoires-perm-dia.html memoires-perm-dia.pdf

rm memoires-perm-dia-pre.md
rm memoires-perm-dia.html
