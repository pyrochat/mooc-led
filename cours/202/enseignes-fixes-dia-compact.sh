#!/bin/bash

python ../../generation/pre-dia.py -c enseignes-fixes-dia.md enseignes-fixes-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output enseignes-fixes-dia-compact.html enseignes-fixes-dia-pre-compact.md

weasyprint enseignes-fixes-dia-compact.html enseignes-fixes-dia-compact.pdf

rm enseignes-fixes-dia-pre-compact.md
rm enseignes-fixes-dia-compact.html
