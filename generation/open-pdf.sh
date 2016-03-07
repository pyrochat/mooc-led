 #!/bin/bash

# ##########
#
# open-pdf.sh ⇒ ouvre les fichiers PDF des cours pour vérifier qu’ils sont OK manuellement
#
#
# Nicolas Jeanmonod, février 2016
#
# ##########


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
    pwd
    CSS_FILE=../../statiques/style.css
    MD_FILE=$CODE.md
    HTML_FILE=$CODE.html
    PDF_FILE=$CODE.pdf
    echo "ouverture de $PDF_FILE"
    OPENPDF
}





if [[ "$#" == "0" ]]; then

    # Si aucun argument n’est indiqué, on transforme tous les chapitres.
    cd ../cours/
    INFOS=`find . -name infos.yaml`
    INFOS=(${INFOS//:/ })
    for INFO in "${INFOS[@]}"
    do
        echo $INFO
        STATUT=`awk -F 'statut:[ ]+' '{ print $2 }' $INFO`
        STATUT=`echo $STATUT`
        echo $STATUT
        if [[ "$STATUT" == *"Pas publié"* ]]; then
            :
        else
            CODE=`awk -F 'code:[ ]+' '{ print $2 }' $INFO`
            CODE=`echo $CODE`
            echo $CODE
            DIR=$(dirname "${INFO}")
            echo "${DIR}"
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
    echo $CODE
    DO_ALL
fi


