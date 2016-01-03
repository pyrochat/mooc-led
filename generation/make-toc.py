#!/usr/bin/env python
# -*- coding: utf-8 -*-

####
#
# Génération automatique de la table des matières du MOOC LED
#
# Installation de pyyaml
# pip install pyyaml
# (sous Linux, installer d'abord libyaml)
#
# Nicolas Jeanmonod, 2016
#
###
# Pierre-Yves Rochat :
# 2015/01/02 : Modifications mineures

import glob
import yaml


def main():

    INFOs = glob.glob( "../cours/*/infos.yaml" )

    TOC = u"""% Enseignes et afficheurs à LED
% Plan du MOOC
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL

<img src="../../statiques/images/vignette.jpg" alt="Vignette du MOOC" style="width: 300px; text-align=center;"/>

Version de travail du 2016/01/02

**Enseignants** : (YT) : Yves Tiecours, (AT) Alain Tiedeu, (MLN) Mamadou Lamine Ndiaye, (PYR) Pierre-Yves Rochat (?) à déterminer.

**Documents** : Les notes de cours sont disponibles en HTML et en PDF. Les dispositives sont en PDF, avec une version complète utilisée pour les vidéos, ainsi qu'une version compacte qui sera mise à disposition des participants du MOOC."""


    prevnbsemaine = 0
    for INFO in sorted(INFOs):
        print INFO
        f = open( INFO )
        dataMap = yaml.safe_load( f )
        f.close()

        nbsemaine = int( INFO[ 9 ] )
        nbchapitre = int( INFO[ 10:12 ] )

        if( prevnbsemaine != nbsemaine ):
            prevnbsemaine = nbsemaine
            TOC = '%s\n\n## Semaine %d ##\n\n\n' % ( TOC, nbsemaine )

        if( dataMap[ "niveau" ] in [ u"avancé" ] ):
            NIVEAU = u"*[avancé]* "
        else:
            NIVEAU = ""

        AUTEUR = "(" + dataMap[ "auteur" ][ 0 ] + ")"

        if( dataMap[ "type" ] in [ u"TOC" ] ):
            pass
        elif( dataMap[ "type" ] in [ u"Expérience" ] ):
            TOC = u'%s\n\n### Expérience à distance\n\n' % ( TOC )
            for TITRE in dataMap[ "titre" ]:
                TOC = '%s* %s\n' % ( TOC, TITRE )
        elif( dataMap[ "type" ] in [ u"Devoir" ] ):
            TOC = u'%s\n### Devoirs de programmation\n\n' % ( TOC )
            for TITRE in dataMap[ "titre" ]:
                TOC = '%s* %s\n' % ( TOC, TITRE )
        elif( dataMap[ "type" ] in [ u"Pratique sur PC", u"Pratique" ] ):
            TOC = '%s\n**%d.%d** *%s :* %s %s' % ( TOC, nbsemaine, nbchapitre, dataMap[ "type" ], dataMap[ "titre" ][ 0 ], AUTEUR )
        else:
            TOC = '%s\n**%d.%d** %s**%s** %s' % ( TOC, nbsemaine, nbchapitre, NIVEAU, dataMap[ "titre" ][ 0 ], AUTEUR )

        if( dataMap[ "code" ] not in [ "codeduchapitre" ] ):
            LINKS = []
            for key, URL in dataMap[ "url" ].iteritems():
                LINKS += [ "[%s](%s)" % ( key, URL ) ]
            TOC = '%s %s' % ( TOC, ' | '.join( LINKS ) )

        TOC = '%s %s' % ( TOC, '  ' )

    tocfilename = "../cours/000/plan-mooc-led.md"
    tocfile = open( tocfilename, 'w' )
    tocfile.write( TOC.encode( 'utf-8' ) )
    tocfile.close

    print( "\nTable des matières générée dans le fichier " + tocfilename )




if __name__ == '__main__':

    main()
