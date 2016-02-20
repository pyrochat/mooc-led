#!/bin/bash

python ../../generation/pre-dia.py -c synth-combi-dia.md synth-combi-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output synth-combi-dia-compact.html synth-combi-dia-pre-compact.md

weasyprint synth-combi-dia-compact.html synth-combi-dia-compact.pdf

rm synth-combi-dia-pre-compact.md
rm synth-combi-dia-compact.html
