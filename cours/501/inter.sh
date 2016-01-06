 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o inter.html inter.md
