 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o memoires-perm.html memoires-perm.md
