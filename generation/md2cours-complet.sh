#!/bin/bash

# ##########
#
# md2cours-complet.sh ⇒ transforme les fichiers Markdown en fichiers PDF
#
# Usage :
# ./md2cours-complet.sh
#
# Installation des dépendances :
#
# sudo apt-get install pdfjam
# sudo su -c "gem install sass"
# sudo apt-get install realpath
#
# Nicolas Jeanmonod, mars 2016
#
# ##########

function MD2HTML
{
    pandoc                              \
        --standalone                    \
        --from markdown                 \
        --to html                       \
        --highlight-style pygments      \
        --email-obfuscation references  \
        --normalize                     \
        --mathjax                       \
        --css=$CSS_FILE                 \
        --output $CODE.html             \
        $CODE.md
}

function HTML2PDF
{

    prince $HTML_FILE -o $PDF_FILE #--javascript

}

function HTML2PDFweasyprint
{
    weasyprint $HTML_FILE $PDF_FILE

    if [[ "$OSTYPE" == darwin14 ]]; then
        open $PDF_FILE
    fi
}


function OPENPDF
{
    if [ -f $PDF_FILE ]; then
        if [[ "$OSTYPE" == darwin14 ]]; then
            open $PDF_FILE
        elif [[ "$OSTYPE" == linux-gnu ]]; then
            xdg-open $PDF_FILE
        fi
    else
        echo -e "\xE2\x9C\x96 ⇒ $PDF_FILE N’EXISTE PAS"
    fi
}

function DO_ALL
{
    # pwd
    MD_FILE=$CODE.md
    HTML_FILE=$CODE.html
    PDF_FILE=$CODE.pdf

    S1='<xi:include href="'
    S2='"/>'
    # echo $S1../cours/$DIR/$HTML_FILE$S2

# <xi:include href="../cours/102/electric.html"            />
# <xi:include xpointer="xpointer( //body )" href="../cours/102/electric.html"            />
}



SCRIPT=`realpath $0`
CUR_DIR=`dirname $SCRIPT`

# Si aucun argument n’est indiqué, on transforme tous les chapitres.
cd $CUR_DIR/../cours/
INFOS=`find . -name infos.yaml`
INFOS=(${INFOS//:/ })
for INFO in "${INFOS[@]}"
do
    # echo "INFO   = $INFO"
    STATUT=`awk -F 'statut:[ ]+' '{ print $2 }' $INFO`
    STATUT=`echo $STATUT`
    # echo "STATUT = $STATUT"
    if [[ "$STATUT" == *"Pas publié"* ]]; then
        :
    else
        CODE=`awk -F 'code:[ ]+' '{ print $2 }' $INFO`
        CODE=`echo $CODE`
        # echo "CODE   = $CODE"
        DIR=$(dirname "${INFO}")
        # cd ${DIR}
        DO_ALL
        # cd ..
    fi
    # echo "*****"
done


cd $CUR_DIR
CODE="cours-complet"
PDF_FILE=$CODE.pdf
HTML_FILE=$CODE.xhtml
SCSS_FILE="../statiques/style-$CODE.scss"
CSS_FILE="../statiques/style-$CODE.css"

sass $SCSS_FILE $CSS_FILE
NOW=`date "+%Y-%m-%d %H:%M:%S"`
sed -i "s/DateModifParScript/$NOW/g" $CSS_FILE

prince                \
	--no-author-style \
	--style=$CSS_FILE \
	$HTML_FILE        \
	-o $PDF_FILE


OPENPDF

echo "" | ps2pdf -sPAPERSIZE=a5 - pageblanche.pdf
pdftk pageblanche.pdf cours-complet.pdf cat output temp.pdf
pdfjam --nup 2x1 --suffix 2up --landscape --outfile . temp.pdf
PDF_FILE=cours-complet-2up.pdf
mv temp-2up.pdf cours-complet-2up.pdf
rm pageblanche.pdf
# OPENPDF

