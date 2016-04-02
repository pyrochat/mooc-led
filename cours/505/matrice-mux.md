% Afficheurs matriciels multiplexés
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/03/09


## Afficheur matriciel et schéma de commande ###

Le schéma classique d’un afficheur matriciel nécessite simplement une sortie de registre par LED, comme le rappelle ce schéma :

![Organisation de l’afficheur 8×16 pixels](images/aff-8x16.svg "Organisation de l’afficheur 8×16 pixels"){ width=95% }

L'envoi des données dans le registre série-parallèle se fait selon le diagramme des temps suivant :

![Envoi des données dans un registre série-parallèle](images/reg-ser-par-timing-s.svg "Envoi des données dans un registre série-parallèle"){ width=60% }

Lorsque le nombre de LED augmente, le nombre de registres augmente aussi. Ainsi un afficheur de 32 fois 32 pixels nécessite 1024 sorties de registre. En utilisant le registres parallèle-série classique 74HC595, il faut 128 circuits intégrés et 1024 résistances. Et ces nombres sont multipliés par 3 pour un afficheurs couleur RGB, où un pixel est formé de trois LED.

Avec l’usage de registres à 16 sorties du type SUM2016, dont les sorties sont à courant constant, une matrice de 32 x 32 pixels RGB nécessitera tout de même 64 circuits intégrés et 64 résistances.

Il existe une solution beaucoup plus simple du point de vue du schéma : c’est l’usage du multiplexage temporel. Notons dès maintenant que cette solution aura des conséquences sur la luminosité de l’afficheur et sur la complexité du programme de commande.

## Simplifier l’électronique par le multiplexage temporel ##

Pour illustrer plus simplement notre propos, choisissons de réaliser un petit afficheur matriciel de 4 lignes de 8 pixels.Voici comment les LED vont être connectées :

![Matrice de 4x8 LED](images/matrice-mux-4x8.svg "Matrice de 4x8 LED"){ width=70% }

La figure montre qu'il est impossible d'allumer en même temps certaines LED sans en allumer d'autre LED non souhaitées. Dans l'exemple suivant, on souhaite allumer les LED (1,1) et (3,2). En alimentant les lignes et colonnes correspondantes, on voit qu'on allume aussi les LED (3,1) et (1,2).

![Allumages non souhaités](images/matrice-mux-4x8-2all.svg "Allumages non souhaités]"){ width=70% }

Il est possible de commande cette matrice de LED selon le principe du multiplexage temporel, présenté dans une leçon précédente. Le principe du multiplexage temporel consiste à afficher successivement certaines parties de l’afficheur, à une vitesse telle que l’œil ne s’en rende pas compte. Voici le diagramme des temps correspondant :

![Diagramme des temps d'un afficheur 4x8 multiplexé](images/diagr-4x8-mux.svg "Diagramme des temps d'un afficheur 4x8 multiplexé")

Voici un schéma permettant de réaliser notre afficheur multiplexé :

![Afficheur 4x8 multiplexé](images/aff-4x8-mux.svg "Afficheur 4x8 multiplexé")

Ou voit que le nombre de registre a diminué, dans ce cas, il n’en reste qu’un. Par contre, il est nécessaire de pouvoir sélectionner les lignes. Un démultiplexeur est nécessaire. Ce dispositif combinatoire est aussi souvent appelé un décodeur. Ses entrées correspondent aux valeur binaires. Une seule de ses sorties peut être activée à un instant donné. Comme chacune de ses sorties doit commander toute une ligne, ici par les anodes des LED, il est nécessaire de placer un élément d’amplification. Nous avons utilisé ici un transistors PNP.

## Comparaisons des architectures ##

Le multiplexage offre une diminution du nombre de composants nécessaires à l’électronique de commande, mais il diminue l’intensité résultante de l’afficheur. Un multiplexage par 2 ne perd que très peu d’intensité. En effet, on peut jouer sur le fait que le courant nominal peut être dépassé, vu que ce courant n’est pas permanent. Le courant pouvant aller jusqu’à une valeur proche du courant maximal, l’intensité instantanée est sensiblement augmentée. Ce choix du multiplexage par 2 était très souvent utilisé par les modules constituant les panneaux utilisés pour les écran vidéos géants, allant jusqu’à plusieurs dizaines de mètres carrés.

Au delà de 2, les valeurs 4, 8 et 16 se rencontrent fréquemment. Le prix d’achat d’un module diminue bien entendu lorsque le chiffre du multiplexage augmente, mais il faut bien être conscient de l’incidence sur la luminosité de l’afficheur.

Un module RGB multiplexé par 16 a été rendu très populaire parmi les *hacker* par le site Adafruit. Ce module est disponible en 32 x 16 et en 32 x 32. Nous l’utiliserons pour illustrer notre sujet.

## Programmation ##



~~~~~~~



