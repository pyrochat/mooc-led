#!/bin/bash

python ../../generation/pre-dia.py carac-dia.md carac-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output carac-dia.html carac-dia-pre.md

weasyprint carac-dia.html carac-dia.pdf

rm carac-dia-pre.md
rm carac-dia.html

