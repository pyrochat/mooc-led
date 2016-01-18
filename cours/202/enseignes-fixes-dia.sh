#!/bin/bash

python ../../generation/pre-dia.py enseignes-fixes-dia.md enseignes-fixes-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output enseignes-fixes-dia.html enseignes-fixes-dia-pre.md

weasyprint enseignes-fixes-dia.html enseignes-fixes-dia.pdf

rm enseignes-fixes-dia-pre.md
rm enseignes-fixes-dia.html

