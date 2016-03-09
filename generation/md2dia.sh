 #!/bin/bash

# ##########
#
# md2dia.sh ⇒ transforme les fichiers Markdown en fichiers diapositives PDF
# utilise le script “pre-dia.py” pour le préprocess
#
# Usage :
# ./md2dia.sh # Traverse tous les chapitres, vérifie que leur statut est différent de “Pas publié” avant de faire la conversion
# ./md2dia.sh 501 # Ne transforme que le chapitre 501
#
# Nicolas Jeanmonod, mars 2016
#
# ##########


function MD2MDpre
{
    python                          \
        ../../generation/pre-dia.py \
        $MD_FILE_IN                 \
        $MD_FILE_PRE
}

function MD2HTML
{
    pandoc                             \
        --standalone                   \
        --from markdown                \
        --to html                      \
        --highlight-style pygments     \
        --email-obfuscation references \
        --normalize                    \
        --css=$CSS_FILE                \
        --output $HTML_FILE            \
        $MD_FILE_PRE
}

function HTML2PDFprince
{
    prince           \
        $HTML_FILE   \
        -o $PDF_FILE #--javascript
}

function HTML2PDFweasyprint
{
    weasyprint     \
        $HTML_FILE \
        $PDF_FILE
}

function CLEANUP
{
    rm $HTML_FILE
    rm $MD_FILE_PRE
}

function OPENPDF
{
    if [[ "$OSTYPE" == darwin14 ]]; then
        open $PDF_FILE
    elif [[ "$OSTYPE" == linux-gnu ]]; then
        xdg-open $PDF_FILE
    fi
}

function DO_ALL
{
    MD_FILE_IN=$CODE-dia.md
    MD_FILE_PRE=$CODE-dia-pre.md
    HTML_FILE=$CODE-dia.html
    PDF_FILE=$CODE-dia.pdf
    CSS_FILE=../../statiques/diaporama.css

    if [ -f $MD_FILE_IN ]; then
        MD2MDpre
        MD2HTML
        HTML2PDFweasyprint
        CLEANUP
        OPENPDF
    else
        echo "$MD_FILE_IN n’existe pas"
    fi
}

if [[ "$#" == "0" ]]; then

    # Si aucun argument n’est indiqué, on transforme tous les chapitres.
    echo "Pas d’arguments donné. On process tous les chapitres !"
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
    echo "process du chapitre $CHAP_NB"
    cd ../cours/$CHAP_NB
    CODE=`awk -F 'code:[ ]+' '{ print $2 }' infos.yaml`
    CODE=`echo $CODE`
    echo "CODE = $CODE"
    DO_ALL
fi
