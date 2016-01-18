 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o multiplex.html multiplex.md
