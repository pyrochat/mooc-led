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
# 2016/01/02 : Modifications mineures
# 2016/01/18 : Modifications de la présentation

import glob
import yaml
import os


def executeSystemCmd( cmd ):
    u"""
    executeSystemCmd
    """

    cmd = " ".join( cmd )

    if os.name in [ 'posix' ]:
#        cmd = "TIMEFORMAT='time : %3R s'; time( " + cmd + " )"
        pass
    elif os.name in [ 'nt' ]:
        pass

    print "\n%s\n" % cmd
    os.system( cmd )


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
            TOC = '%s\n**%d.%d** **%s** %s %s' % ( TOC, nbsemaine, nbchapitre, dataMap[ "titre" ][ 0 ], NIVEAU, AUTEUR )
        if( dataMap[ "statut" ] not in [ u"Pas publié" ] ):
            LINKS = []
            fileTypes = [ "cours-html", "cours-pdf", "dias-compact" ]
            for fileType in fileTypes:
                if fileType in dataMap[ "url" ]:
                    fileName = dataMap[ "url" ][ fileType ]
                    LINKS += [ "[%s](../%d%0.2d/%s)" % ( fileType, nbsemaine, nbchapitre, fileName ) ]
            LINKS = ' '.join( LINKS )
            print "⇒ " + LINKS
            TOC = '%s %s' % ( TOC, LINKS )

        TOC = '%s %s' % ( TOC, '  ' )

    tocfilename = "../cours/000/plan-mooc-led.md"
    htmltocfilename = "../cours/000/plan-mooc-led.html"
    tocfile = open( tocfilename, 'w' )
    tocfile.write( TOC.encode( 'utf-8' ) )
    tocfile.close
    print( "\nTable des matières générée dans le fichier " + tocfilename )
    pandocCmd = [
        "pandoc"                              ,
            "--standalone"                    ,
            "--normalize"                     ,
            "--email-obfuscation references"  ,
            "--css ../../statiques/style.css" ,
            "--output " + htmltocfilename     ,
            tocfilename + " &" # Signe & ⇒ exécution asynchrone sinon Pandoc ne génère que la moitié du fichier.
        ]
    executeSystemCmd( pandocCmd )
    print( "\nTable des matières générée dans le fichier " + htmltocfilename )
    # executeSystemCmd( [ "rm " + tocfilename ] ) # À cause de l’exécution asynchrone de Pandoc, c’est mieux de ne pas effacer le fichier md tout de suite.

if __name__ == '__main__':

    main()
