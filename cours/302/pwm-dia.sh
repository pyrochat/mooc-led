#!/bin/bash

python ../../generation/pre-dia.py pwm-dia.md pwm-dia-pre.md

pandoc  --standalone --from markdown --to html --highlight-style pygments --email-obfuscation references \
--normalize --css=../../statiques/diaporama.css --output pwm-dia.html pwm-dia-pre.md

weasyprint pwm-dia.html pwm-dia.pdf

rm pwm-dia-pre.md
rm pwm-dia.html

