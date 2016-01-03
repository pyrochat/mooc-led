#!/usr/bin/env python
# -*- coding: utf-8 -*-

####
#
# Ce script génère la structure des répertoire et créé un fichier “infos.yaml” pour chaque chapitre.
# Ce script est a usage unique. Une fois les fichiers “infos.yaml” générés, c’est eux qu’il faut modifier.
#
# Nicolas Jeanmonod, 2016
#
###


sujets = \
[
[ 000, "TOC",             "base",        "PYR"  , ""                 , [ "Plan MOOC LED"                                                                                                                                                                                                                                          ] ],
[ 101, "Théorie",         "base",        "PYR"  , ""                 , [ "**Base des circuits électriques**"                                                                                                                                                                                                                      ] ],
[ 102, "Théorie",         "base",        "'?'"  , ""                 , [ "**Présentation de la LED**"                                                                                                                                                                                                                             ] ],
[ 103, "Pratique",        "base",        "YT"   , ""                 , [ "Montages sur Breadboard"                                                                                                                                                                                                                                ] ],
[ 104, "Théorie",         "base",        "YT"   , "binaire"          , [ "**Représentation binaire**",                                                                                                                                                                                                                            ] ],
[ 105, "Théorie",         "base",        "MLN"  , "sys-combi"        , [ "**Circuits logiques combinatoires**",                                                                                                                                                                                                                   ] ],
[ 106, "Pratique sur PC", "base",        "'?'"  , ""                 , [ "Simulateur logique"                                                                                                                                                                                                                                     ] ],
[ 107, "Théorie",         "base",        "PYR"  , ""                 , [ "**Introduction au microcontrôleur**"                                                                                                                                                                                                                    ] ],
[ 108, "Théorie",         "base",        "PYR"  , ""                 , [ "**Cartes à microcontrôleurs**"                                                                                                                                                                                                                          ] ],
[ 109, "Pratique sur PC", "base",        "'?'"  , ""                 , [ "Programmation avec Energia"                                                                                                                                                                                                                             ] ],
[ 110, "Théorie",         "base",        "MLN"  , "synth-combi"      , [ "**Synthèse de circuits combinatoires**",                                                                                                                                                                                                                ] ],
[ 111, "Pratique",        "avancé",      "'?'"  , ""                 , [ "Montages logiques combinatoires"                                                                                                                                                                                                                        ] ],
[ 112, "Théorie",         "avancé",      "MLN"  , ""                 , [ "**Introduction au VHD**"                                                                                                                                                                                                                                ] ],
[ 113, "Expérience",      "base",        "'?'"  , ""                 , [ "LaunchPad MSP430, 2 LED (+caméra)"                                                                                                                                                                                                                      ] ],
[ 114, "Devoir",          "base",        "'?'"  , ""                 , [ "Génération d’une séquence simple Rouge-Vert-éteint (+chronogramme)"                                                                                                                                                                                     ] ],
[ 201, "Théorie",         "base",        "YT"   , "transistor"       , [ "**Le transistor**",                                                                                                                                                                                                                                     ] ],
[ 202, "Pratique",        "base",        "'?'"  , ""                 , [ "Montages à transistor <!-- (2 segments de 4 LED) -->"                                                                                                                                                                                                   ] ],
[ 203, "Théorie",         "base",        "PYR"  , "enseignes-fixes"  , [ "**Enseignes à motifs fixes**",                                                                                                                                                                                                                          ] ],
[ 204, "Théorie",         "base",        "MLN"  , ""                 , [ "**Circuits logiques séquentiels**"                                                                                                                                                                                                                      ] ],
[ 205, "Pratique",        "base",        "'?'"  , ""                 , [ "Bascule D"                                                                                                                                                                                                                                              ] ],
[ 206, "Théorie",         "base",        "PYR"  , ""                 , [ "**Programmation en C-Arduino**"                                                                                                                                                                                                                         ] ],
[ 207, "Pratique",        "base",        "'?'"  , ""                 , [ "Microcontrôleur sur Breadboard"                                                                                                                                                                                                                         ] ],
[ 208, "Théorie",         "avancé",      "AT"   , ""                 , [ "**Physique des semi-conducteurs**"                                                                                                                                                                                                                      ] ],
[ 209, "Théorie",         "avancé",      "YT"   , "seq-compteur"     , [ "**Séquenceurs à compteurs**",                                                                                                                                                                                                                           ] ],
[ 210, "Pratique sur PC", "avancé",      "'?'"  , ""                 , [ "Séquenceurs sur simulateur logique"                                                                                                                                                                                                                     ] ],
[ 211, "Théorie",         "avancé",      "MLN"  , ""                 , [ "**Circuits séquentiels en VHDL**"                                                                                                                                                                                                                       ] ],
[ 212, "Expérience",      "base",        "'?'"  , ""                 , [ "MSP430, chenillard 8 LED et 1 poussoir sur breadboard"                                                                                                                                                                                                  ] ],
[ 213, "Devoir",          "base",        "'?'"  , ""                 , [ "Chenillard simple", "* Chenillard aller-retour, lancé par un poussoir"                                                                                                                                                                                  ] ],
[ 301, "Théorie",         "base",        "PYR"  , ""                 , [ "**Entrées-sorties et manipulation de champs de bits**"                                                                                                                                                                                                  ] ],
[ 302, "Pratique sur PC", "base",        "'?'"  , ""                 , [ "Passage de l’Arduino au C"                                                                                                                                                                                                                              ] ],
[ 303, "Théorie",         "base",        "PYR"  , "pwm"              , [ "**PWM**",                                                                                                                                                                                                                                               ] ],
[ 304, "Pratique sur PC", "base",        "'?'"  , ""                 , [ "Programmation de deux PWM"                                                                                                                                                                                                                              ] ],
[ 305, "Théorie",         "base",        "PYR"  , "registres-ser-par", [ "**Registre d’extension série-parallèle**",                                                                                                                                                                                                              ] ],
[ 306, "Théorie",         "avancé",      "'?'"  , ""                 , [ "**Microcontrôleurs ARM**"                                                                                                                                                                                                                               ] ],
[ 307, "Pratique sur PC", "avancé",      "'?'"  , ""                 , [ "Mise en oeuvre d’un Launchpad MSP432"                                                                                                                                                                                                                   ] ],
[ 308, "Pratique",        "base",        "'?'"  , ""                 , [ "Montages sur Veroboard"                                                                                                                                                                                                                                 ] ],
[ 309, "Théorie",         "base",        "AT"   , ""                 , [ "**Introduction à la colorimétrie et aux LED RGB**"                                                                                                                                                                                                      ] ],
[ 310, "Pratique",        "base",        "'?'"  , ""                 , [ "Mise en œuvre d’une LED RGB en PWM"                                                                                                                                                                                                                     ] ],
[ 311, "Théorie",         "avancé",      "MLN"  , ""                 , [ "**Introduction aux FPGA**"                                                                                                                                                                                                                              ] ],
[ 312, "Pratique sur PC", "avancé",      "MLN"  , ""                 , [ "Mise en oeuvre d’un DE0-nano"                                                                                                                                                                                                                           ] ],
[ 313, "Théorie",         "avancé",      "AT"   , ""                 , [ "**Spectre de la lumière**"                                                                                                                                                                                                                              ] ],
[ 314, "Expérience",      "base",        "'?'"  , ""                 , [ "Enseigne HOTEL, pilotée par un registre HC595"                                                                                                                                                                                                          ] ],
[ 315, "Devoir",          "base",        "'?'"  , ""                 , [ "Enseigne HOTEL, animation simple", "* Enseigne HOTEL, animation à PWM"                                                                                                                                                                                  ] ],
[ 401, "Théorie",         "base",        "PYR"  , "matrice"          , [ "**Les afficheurs matriciels**",                                                                                                                                                                                                                         ] ],
[ 402, "Pratique",        "base",        "'?'"  , ""                 , [ "Circuit imprimé 16x16 LED"                                                                                                                                                                                                                              ] ],
[ 403, "Théorie",         "base",        "PYR"  , "multiplex"        , [ "**Le multiplexage temporel**",                                                                                                                                                                                                                          ] ],
[ 404, "Théorie",         "base",        "PYR"  , ""                 , [ "**Les afficheurs matriciels multiplexés**"                                                                                                                                                                                                              ] ],
[ 405, "Pratique",        "base",        "'?'"  , ""                 , [ "Veroboard 31x7 LED"                                                                                                                                                                                                                                     ] ],
[ 406, "Théorie",         "base",        "PYR"  , "memoires-perm"    , [ "**Mémoires permanentes**",                                                                                                                                                                                                                              ] ],
[ 407, "Théorie",         "avancé",      "AT"   , ""                 , [ "**Correction Gamma**"                                                                                                                                                                                                                                   ] ],
[ 408, "Théorie",         "avancé",      "MLN"  , ""                 , [ "**Commande d’un afficheur matriciel multiplexé avec une FPGA**"                                                                                                                                                                                         ] ],
[ 409, "Théorie",         "avancé",      "'?'"  , ""                 , [ "**Conception de circuits imprimés**"                                                                                                                                                                                                                    ] ],
[ 410, "Expérience",      "base",        "PCB"  , ""                 , [ "Afficheur matriciel 31x7 (veroboard)", "* Afficheur 16x16"                                                                                                                                                                                              ] ],
[ 411, "Devoir",          "base",        "'?'"  , ""                 , [ "Ping sur afficheur 16x16", "* Texte défilant sur afficheur 31x7"                                                                                                                                                                                        ] ],
[ 501, "Théorie",         "base",        "YT"   , "inter"            , [ "**Les Interruptions**",                                                                                                                                                                                                                                 ] ],
[ 502, "Théorie",         "base",        "YT"   , ""                 , [ "**Les timers**"                                                                                                                                                                                                                                         ] ],
[ 503, "Pratique",        "base",        "'?'"  , ""                 , [ "Récepteur de télécommande IR"                                                                                                                                                                                                                           ] ],
[ 504, "Théorie",         "base",        "'?'"  , ""                 , [ "**Programmation multi-tâche**"                                                                                                                                                                                                                          ] ],
[ 505, "Théorie",         "base",        "'?'"  , ""                 , [ "**Rubans de LEDs**"                                                                                                                                                                                                                                     ] ],
[ 506, "Pratique",        "base",        "'?'"  , ""                 , [ "Mise en oeuvre d’un ruban de LED"                                                                                                                                                                                                                       ] ],
[ 507, "Théorie",         "base",        "PYR"  , ""                 , [ "**Binary Coded Modulation**"                                                                                                                                                                                                                            ] ],
[ 508, "Théorie",         "base",        "PYR"  , ""                 , [ "**Murs de LED**"                                                                                                                                                                                                                                        ] ],
[ 509, "Théorie",         "avancé",      "PYR"  , ""                 , [ "**Langages interprétés spécialisés**"                                                                                                                                                                                                                   ] ],
[ 510, "Expérience",      "base",        "'?'"  , ""                 , [ "Rubans de LEDs RGB, pilotée par un MSP432", "* Afficheur Matriciel RGB"                                                                                                                                                                                 ] ],
[ 511, "Devoir",          "base",        "'?'"  , ""                 , [ "Goutte tombante sur un ruban de LED", "* Animation graphique sur afficheur matriciel RGB"                                                                                                                                                               ] ],
[ 601, "Théorie",         "base",        "PYR"  , ""                 , [ "**Direct Memory Access**"                                                                                                                                                                                                                               ] ],
[ 602, "Pratique",        "base",        "'?'"  , ""                 , [ "Afficheur matriciel commandé en DMA"                                                                                                                                                                                                                    ] ],
[ 603, "Théorie",         "base",        "PYR"  , "horloge"          , [ "**Horloge temps réel**",                                                                                                                                                                                                                                ] ],
[ 604, "Pratique",        "base",        "'?'"  , ""                 , [ "Affichage de l’heure sur une enseigne à MSP432"                                                                                                                                                                                                         ] ],
[ 605, "Théorie",         "base",        "PYR"  , ""                 , [ "**Commande à distance**"                                                                                                                                                                                                                                ] ],
[ 606, "Pratique",        "base",        "NJ"   , ""                 , [ "Mise en oeuvre d’un module WiFi"                                                                                                                                                                                                                        ] ],
[ 607, "Théorie",         "avancé",      "'?'"  , ""                 , [ "**Linux embarqué**"                                                                                                                                                                                                                                     ] ],
[ 608, "Pratique",        "avancé",      "'?'"  , ""                 , [ "Mise en oeuvre d’un Raspberry Pi"                                                                                                                                                                                                                       ] ],
[ 609, "Théorie",         "avancé",      "'?'"  , ""                 , [ "**Affichage vidéo**"                                                                                                                                                                                                                                    ] ],
[ 610, "Expérience",      "base",        "'?'"  , ""                 , [ "(toutes les expériences à disposition)"                                                                                                                                                                                                                 ] ],
[ 611, "Devoir",          "base",        "'?'"  , ""                 , [ "Réalisation libre sur une des expériences à distance disponibles (jury des étudiants pour la vidéo, jury des profs pour les candidats au certificat)", "* -ou- Réalisation pratique personnelle (petit rapport avec photos et sources des programmes)." ] ]
]


import os
import shutil


def createDir( directory ):
	if not os.path.exists( directory ):
	    os.makedirs( directory )

mainDir = "../cours/"
if os.path.exists( mainDir ):
	shutil.rmtree( mainDir )
createDir( mainDir )

for sujet in sujets:
	print( sujet[ 0 ] )
	sujetDir = "%s%.3d/" % ( mainDir, sujet[ 0 ] )
	createDir( sujetDir )
	yamlfilename = "%s%s" % ( sujetDir, 'infos.yaml' )
	yamlfile = open( yamlfilename, 'w' )
	yamlfile.write( 'titre:\n' )
	for TITRE in sujet[ 5 ]:
		TITRE = TITRE.replace( "*", "" ).strip()
		yamlfile.write( '    - "%s"\n'   % TITRE )
	yamlfile.write( 'type:             %s\n'   % ( sujet[ 1 ] ) )
	yamlfile.write( 'niveau:           %s\n'   % ( sujet[ 2 ] ) )
	yamlfile.write( 'auteur:          \n' )
	yamlfile.write( '    - %s\n' % ( sujet[ 3 ] ) )
	if( len( sujet[ 4 ] ) ):
		status = "Relecture"
	else:
		status = "Pas publié"
	yamlfile.write( 'statut:           %s\n' % ( status ) )
	CODE = sujet[ 4 ]
	if( len( CODE ) == 0 ):
		CODE = "codeduchapitre"
	yamlfile.write( 'code:             %s\n' % ( CODE ) )
	yamlfile.write( 'url:\n' )
	yamlfile.write( '    cours-html:   %s.html\n'            % ( CODE ) )
	yamlfile.write( '    cours-pdf:    %s.pdf\n'             % ( CODE ) )
	yamlfile.write( '    dias-video:   %s-dia.pdf\n'         % ( CODE ) )
	yamlfile.write( '    dias-compact: %s-dia-compact.pdf\n' % ( CODE ) )
	yamlfile.close()

