 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o seq-compteur.html seq-compteur.md
