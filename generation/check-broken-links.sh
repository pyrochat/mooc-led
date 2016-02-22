#!/bin/bash

# http://www.createdbypete.com/articles/simple-way-to-find-broken-links-with-wget/

URL=http://pyrochat.github.io/mooc-led/cours/000/plan-mooc-led.html

echo "Vérification des liens de $URL"

wget              \
	--spider      \
	-o wget.log   \
	-e robots=off \
	-w 1          \
	-r            \
	-p $URL

grep -B 2 '404' wget.log

