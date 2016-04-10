 #!/bin/bash

# ##########
#
# md2pdf.sh ⇒ transforme les fichiers Markdown en fichiers PDF
#
# Usage :
# ./md2pdf.sh # Traverse tous les chapitres, vérifie que leur statut est différent de “Pas publié” avant de faire la conversion
# ./md2pdf.sh 203 # Ne transforme que le chapitre 203
#
# Nicolas Jeanmonod, janvier 2016
#
# ##########

function MD2HTML
{
    TEMPLATE=pandoc-html-template.html
    pandoc                              \
        --standalone                    \
        --from markdown                 \
        --to html                       \
        --highlight-style pygments      \
        --email-obfuscation references  \
        --normalize                     \
        --mathjax                       \
        --template=$TEMPLATE            \
        --data-dir=$CUR_DIR             \
        --css=$CSS_FILE                 \
        --output $CODE.html             \
        $CODE.md
}

function HTML2PDF
{

    prince $HTML_FILE -o $PDF_FILE --javascript

}

function HTML2PDFweasyprint
{
    weasyprint $HTML_FILE $PDF_FILE

    if [[ "$OSTYPE" == darwin14 ]]; then
        open $PDF_FILE
    fi
}

function DO_ALL
{
    pwd
    CSS_FILE=../../statiques/style.css
    MD_FILE=$CODE.md
    HTML_FILE=$CODE.html
    PDF_FILE=$CODE.pdf
    echo "Génération de $PDF_FILE"
    MD2HTML
    HTML2PDF
}



SCRIPT=`realpath $0`
CUR_DIR=`dirname $SCRIPT`


if [[ "$#" == "0" ]]; then

    # Si aucun argument n’est indiqué, on transforme tous les chapitres.
    cd ../cours/
    INFOS=`find . -name infos.yaml`
    INFOS=(${INFOS//:/ })
    for INFO in "${INFOS[@]}"
    do
        echo "INFO   = $INFO"
        STATUT=`awk -F 'statut:[ ]+' '{ print $2 }' $INFO`
        STATUT=`echo $STATUT`
        echo "STATUT = $STATUT"
        if [[ "$STATUT" == *"Pas publié"* ]]; then
            :
        else
            CODE=`awk -F 'code:[ ]+' '{ print $2 }' $INFO`
            CODE=`echo $CODE`
            echo "CODE   = $CODE"
            DIR=$(dirname "${INFO}")
            cd ${DIR}
            DO_ALL
            cd ..
        fi
        echo "*****"
    done
else

    # Si un argument est indiqué, on ne transforme que ce chapitre.
    CHAP_NB=$1
    cd ../cours/$CHAP_NB
    CODE=`awk -F 'code:[ ]+' '{ print $2 }' infos.yaml`
    CODE=`echo $CODE`
    echo "CODE = $CODE"
    DO_ALL
fi


