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
# 2016/02/08 : n'affiche plus les niveaux
# 2017/03/22 : en vue de la version définitive du MOOC

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

    BASEPATH = os.getcwd() + "/../cours"
    BROKENLINKS = []

    INFOs = glob.glob( "../cours/*/infos.yaml" )

    TOC = u"""% Enseignes et afficheurs à LED
% Plan du MOOC
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL

<img src="../../statiques/images/vignette.jpg" alt="Vignette du MOOC" style="width: 300px; text-align=center;"/>

Version de travail du 2017/03/22

**Enseignants** : (YT) : Yves Tiecours, (AT) Alain Tiedeu, (MLN) Mamadou Lamine Ndiaye, (PYR) Pierre-Yves Rochat.

**Documents** : Les notes de cours sont disponibles en HTML et en PDF. Les dispositives sont en PDFen version compacte.

**Domaines** : Le cours introduit progressivement des sujets en *électronique* et en *microcontrôleur*, pour apprendre à concevoir des enseignes et des afficheurs à LED. En parallèle, un cours de *circuits logiques* est donné, pour mener à la réalisation de commande d'afficheurs complexes utilisant des FPGA. En plus, quelques sujets de *physique* sont proposés.
"""


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

        ## if( dataMap[ "niveau" ] in [ u"avancé" ] ):
        ##   NIVEAU = u"*[avancé]* "
        ## else:
        NIVEAU = "" ## on n'affiche plus le niveau

        AUTEUR = "(" + dataMap[ "auteur" ][ 0 ] + ")"

        CAT = ''
        if( dataMap[ "categ" ] in [ u"logique" ] ):
           CAT = u"*[Logique]* "
        if( dataMap[ "categ" ] in [ u"physique" ] ):
           CAT = u"*[Physique]* "

        if( dataMap[ "type" ] in [ u"TOC" ] ):
            pass
        elif( dataMap[ "statut" ] in [ u"supprimé" ] ):
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
            TOC = '%s\n**%d.%d** **%s** %s %s %s' % ( TOC, nbsemaine, nbchapitre, dataMap[ "titre" ][ 0 ], NIVEAU, AUTEUR, CAT )
        if( dataMap[ "statut" ] not in [ u"Pas publié" ] ):
            LINKS = []
            fileTypes = [ "cours-html", "cours-pdf", "dias-compact" ]
            for fileType in fileTypes:
                if fileType in dataMap[ "url" ]:
                    fileName = dataMap[ "url" ][ fileType ]
                    LINKPath = "%s/%d%0.2d/%s" % ( BASEPATH, nbsemaine, nbchapitre, fileName )
                    if( not os.path.isfile( LINKPath ) ):
                        BROKENLINKS.append( LINKPath )
                    else:
                        LINKS += [ "[%s](../%d%0.2d/%s)" % ( fileType, nbsemaine, nbchapitre, fileName ) ]
            LINKS = ' '.join( LINKS )
            print "⇒ " + LINKS
            TOC = '%s %s' % ( TOC, LINKS )

        TOC = '%s %s' % ( TOC, '  ' )

    tocfilename = "../cours/000/plan-work-mooc-led.md"
    htmltocfilename = "../cours/000/plan-work-mooc-led.html"
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
    # executeSystemCmd( [ "rm " + tocfilename ] )
    # À cause de l’exécution asynchrone de Pandoc, c’est mieux de ne pas effacer le fichier md tout de suite.

    if( len( BROKENLINKS ) ):
        print u"\n###\n!!! LISTE DES LIENS CASSÉS !!!"
        for BROKENLINK in BROKENLINKS:
            print BROKENLINK
        print u"###\n"


if __name__ == '__main__':

    main()

