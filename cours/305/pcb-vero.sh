 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o pcb-vero.html pcb-vero.md
