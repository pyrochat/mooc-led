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
        $MD_FILE_PRE &>/dev/null
}

function MD2MDprecompact
{
    python                             \
        ../../generation/pre-dia.py -c \
        $MD_FILE_IN                    \
        $MD_FILE_PRE &>/dev/null
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
        -o $PDF_FILE
}

function HTML2PDFweasyprint
{
    weasyprint     \
        $HTML_FILE \
        $PDF_FILE
}

function HTML2PDF
{
    if [ -f $PDF_FILE ]; then
        rm $PDF_FILE
    fi
    # HTML2PDFprince
    HTML2PDFweasyprint
}

function CLEANUP
{
    if [ -f $PDF_FILE ]; then
        echo -e "\xE2\x9C\x94 ⇒ $PDF_FILE créé avec succès"
    else
        echo -e "\xE2\x9C\x96 ⇒ $PDF_FILE N’A PAS ÉTÉ CRÉÉ"
    fi
    rm $HTML_FILE
    rm $MD_FILE_PRE
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

function MD2DIA-NORMAL
{
    CSS_FILE=../../statiques/diaporama.css
    MD_FILE_IN=$CODE-dia.md
    MD_FILE_PRE=$CODE-dia-pre.md
    HTML_FILE=$CODE-dia.html
    PDF_FILE=$CODE-dia.pdf
    if [ -f $MD_FILE_IN ]; then
        MD2MDpre
        MD2HTML
        HTML2PDF
        CLEANUP
    else
        echo -e "\xE2\x9C\x96 ⇒ $MD_FILE_IN N’EXISTE PAS"
    fi
}

function MD2DIA-COMPACT
{
    CSS_FILE=../../statiques/diaporama.css
    MD_FILE_IN=$CODE-dia.md
    MD_FILE_PRE=$CODE-dia-pre-compact.md
    HTML_FILE=$CODE-dia-compact.html
    PDF_FILE=$CODE-dia-compact.pdf
    if [ -f $MD_FILE_IN ]; then
        MD2MDprecompact
        MD2HTML
        HTML2PDF
        CLEANUP
    else
        echo -e "\xE2\x9C\x96 ⇒ $MD_FILE_IN N’EXISTE PAS"
    fi
}

if [[ "$#" == "0" ]]; then

    # Si aucun argument n’est indiqué, on transforme tous les chapitres.
    echo -e "\n*****\n\xF0\x9F\x98\x83   Création des diapositives pour tous les chapitres. Patience... !  \xF0\x9F\x98\x83\n*****\n"
    cd ../cours/
    INFOS=`find . -name infos.yaml`
    INFOS=(${INFOS//:/ })
    for INFO in "${INFOS[@]}"
    do
        echo "INFO   = $INFO"
        STATUT=`awk -F 'statut:[ ]+' '{ print $2 }' $INFO`
        STATUT=`echo $STATUT`
        echo "STATUT = $STATUT"
        if [[ ! "$STATUT" == *"Pas publié"* ]]; then
            CODE=`awk -F 'code:[ ]+' '{ print $2 }' $INFO`
            CODE=`echo $CODE`
            echo "CODE   = $CODE"
            DIR=$(dirname "${INFO}")
            cd ${DIR}
            MD2DIA-NORMAL
            # MD2DIA-COMPACT
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
    MD2DIA-NORMAL
    OPENPDF
    # MD2DIA-COMPACT
    # OPENPDF
fi
