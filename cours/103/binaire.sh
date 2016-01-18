 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o binaire.html binaire.md
