#!/bin/bash

python ../../generation/pre-dia.py pcb-vero-dia.md pcb-vero-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output pcb-vero-dia.html pcb-vero-dia-pre.md

weasyprint pcb-vero.html pcb-vero.pdf

rm pcb-vero-pre.md
rm pcb-vero-dia.html

