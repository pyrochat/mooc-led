#!/bin/bash

python ../../generation/pre-dia.py -c pwm-dia.md pwm-dia-pre-compact.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output pwm-dia-compact.html pwm-dia-pre-compact.md

weasyprint pwm-dia-compact.html pwm-dia-compact.pdf

rm pwm-dia-pre-compact.md
rm pwm-dia-compact.html
