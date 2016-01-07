 #!/bin/bash
pandoc -s --normalize --css ../../statiques/style.css --mathjax -o transistor.html transistor.md
