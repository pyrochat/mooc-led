#!/bin/bash

python ../../generation/pre-dia.py synth-combi-dia.md synth-combi-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output synth-combi-dia.html synth-combi-dia-pre.md

weasyprint synth-combi-dia.html synth-combi-dia.pdf

rm synth-combi-dia-pre.md
rm synth-combi-dia.html

