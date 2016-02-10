#!/bin/bash

python ../../generation/pre-dia.py -c pcb-vero-dia.md pcb-vero-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output pcb-vero-dia-compact.html pcb-vero-dia-pre-compact.md

weasyprint pcb-vero-dia-compact.html pcb-vero-dia-compact.pdf

rm pcb-vero-dia-pre-compact.md
rm pcb-vero-dia.html
