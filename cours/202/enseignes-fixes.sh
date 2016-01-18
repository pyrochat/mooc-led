 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o enseignes-fixes.html enseignes-fixes.md
