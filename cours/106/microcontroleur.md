% Introduction au microcontrôleur
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/01/30


## Système informatique dans un circuit intégré ##

Pour commander des enseignes ou des afficheurs à LED, c'est très souvent un **microcontrôleur** qui est utilisé.

Nous somme tous familier avec les systèmes informatique, à commencer par nos ordinateurs de bureau et nos *smartphones*. A l'intérieur de tout système informatique se trouvent a moins :

* un **processeur**, qui exécute les instructions. Il est cadencé par une horloge (H).
* une **mémoire morte** (ROM : *Read Only Memory*) qui contient les instructions. Son contenu est permanent : il reste intact lorsque le système n'est plus alimenté.
* une **mémoire vivre** (RAM : *Random Access Memory*, qui permet de stocker des données. Son contenu est perdu lorsque le courant est coupé.
* des circuits d'**Entrée-Sortie** (I/O : *Input/Output*). Ce sont les circuits qui permettent l'interaction avec l'extérieur : clavier, souris, écran, mémoires externes, imprimante, etc.

Des lignes électriques, appelées *bus* relient ensemble ces éléments.

![Architecture d'un système informatique](images/architecture-sys-info-200dpi.png "Architecture d'un système informatique"){ width=90% }

## Microcontrôleur ##

Un **microcontrôleur** est aussi un système informatique. Sa particularité est qu'il est contenu dans un seul circuit intégré. L'architecture est la même que celle présentée sur la figure. Par rapport à une carte-mère de PC, les éléments qui constituent un microcontrôleur sont généralement plus simples, moins puissants, leur capacité est plus limitée :

* la mémoire morte contient généralement de 1 kB à quelques centaines de kB.
* le processeur est cadencé à des fréquences de quelques MHz ou dizaines de MHz. Il ne consomme généralement qu'une fraction de Watt. Son jeu d'instructions est plus simple.
* la mémoire vivre est généralement très limitée : de quelques centaines de Bytes à quelques dizaines de kB, selon les modèles.
* les circuits d'entrée-sortie sont simplement des entrées logiques (pour lire une valeur binaire, par exemple un interrupteur) et des sorties logiques (capables de fournir quelques mA, par exemple pour commander une LED).

L'intérêt des microcontrôleurs est leur coût très faible (parfois moins d'un Euro), leur consommation de courant très limitée (quelques dizaines de mA) et leur taille très réduite (un seul circuit intégré). Ils sont donc utilisés dans de très nombreuses applications.

Bien que des microcontrôleurs existent depuis les années 1970, ils se sont développés de manière spectaculaire depuis quelques années. Alors qu'il était encore complexe et coûteux de mettre en œuvre un microcontrôleur au début des années 2000, cette tâche est maintenant beaucoup plus simple et ne nécessite que du matériel très peu coûteux. Les microcontrôleurs sont donc devenus des composants électronique incontournables, modifiant profondément la manière de concevoir les circuits électroniques.

## De nombreuses familles ##

Plusieurs fabricants proposent des microcontrôleurs (Microchip, Atmel, Texas-Instrument, NXP-FreeScale, ST-micro, Cypress, etc). Chaque fabricant propose souvent plusieurs familles de microcontrôleurs (PIC et dsPIC chez Microchip; AVR, AVR32 et ARM chez Atmel; MSP430, MSP432 chez Texas Intrument, etc). Chaque famille comporte souvent des dizaines de modèles, qui diffèrent principalement par les tailles mémoires (RAM et ROM) et le nombre de broches d'entrée-sortie.

A titre d'exemple, le processeur MSP430G2253 de Texas Instrument contient :

* un processeur 16 bits, avec une centaine d'instructions, cadencé au maximum à 16 MHz , avec 16 registres de 16 bits.
* une mémoire morte de type *flash* (technologie similaire à celle des clés USB) de 16 kB. Cette mémoire peut être effacée et écrite à nouveau un très grand nombre de fois.
* une mémoire vive de 512 B.
* 16 broches d'entrée-sorties. Huit d'entre elles peuvent être connectées à un convertisseur analogique-numérique de 10 bits de résolution. Certaines de ces broches ont également d'autres fonctions spécifiques (capture d'événements, utilisation d'un quartz, etc).

Le MSP430G est disponible dans plusieurs boîtiers, dont le DIL20 (Dual-in-line 20 pins), facile à mettre en œuvre. Voici son brochage :

![Brochage du MSP430G2553](images/msp430g2553.png "Brochage du MSP430G2553"){ width=15cm }

## Mise en oeuvre matérielle et logicielle ##

Un microcontrôleur est donc à la fois un composant électronique et un système informatique. Il nécessite donc une mise en œuvre matérielle et une mise en œuvre logicielle. En d'autres termes, il est à la frontière entre l'électronique et l'informatique. Il nécessite donc les compétences d'un électronicien et d'un informaticien !

## Schéma de mise en œuvre ##

Chaque broche est désignée par un ou plusieurs noms. Identifions les trois groupes de broches indispensables à la réalisation d'un premier montage fonctionnel à microcontrôleur :

* les alimentations (Gnd et Vcc)
* les broches de programmation (RST et TEST)
* les broches d'entrées-sorties pour l'application proprement dite (toutes les autres broches)

Les microcontrôleurs sont presque toujours réalisés en technologie **CMOS** et nécessitent une alimentation unique. Les MSP430 acceptent une tension comprise entre 1.8 et 3.6 volt. Deux piles AA ou AAA de 1.5 volt montées en série peuvent donc convenir. La borne négative de l'alimentation est souvent désignée par *Gnd* (*Ground* : masse). C'est la broche 14 du MSP430G2302, notée ici *DVSS*. La borne positive est notée *DVcc*, c'est la  broche 1.

La broche *RST* ou *RESET* est la 16. Ignorons pour le moment le fait que cette broches a aussi d'autres noms. Le RST est une entrée du circuit. Notez la barre sur son nom : cela signifie que cette entrée est active à zéro. On le note aussi parfois avec le signe / (slash) précédent le nom. C'est une bonne habitude de mettre en évidence qu'un signal est actif à zéro. Il sera nécessaire de fixer à l'état 1 la broche *RST* pour le fonctionnement normal du microcontrôleur. C'est une résistance reliée au *Vcc* qui joue ce rôle. On parle de résistance de tirage (en anglais *pull-up* : tirer vers le haut). Une valeur d'environ 47 kOhm convient dans ce cas.

La programmation des MSP430 peut se faire par l'intermédiaire de deux signaux: le *RST* et un signal nommé *TEST* (broche 17). Il n'est pas nécessaire de comprendre le rôle exact de ce signal. Il est généré par le logiciel de programmation qui s'exécute sur un PC (par exemple *Code Composer Studio* ou *Energia*). Il est transmis par un programmateur, par exemple celui inclus dans le *LaunchPad MSP430*.

Les autres broches du MSP430G2553 sont des entrées-sorties. Elles sont regroupées en 2 ports: P1 et P2. Ces deux ports sont complets : ils comportent chacun 8 broches. D'autres versions du MSP430 sont proposées en boîtier à 14 broches (DIL 14). Dans ce cas, les broches P2.0 à P2.5 n'existent pas.

Un microcontrôleur est un composant électronique. Il va trouver sa place dans un schéma électronique pour sa mise en œuvre :

![Schéma de mise en œuvre d'un microcontrôleur](images/schema-msp430-200dpi.png "Schéma de mise en œuvre d'un microcontrôleur"){ width=50% } 

Ce schéma est très simple. En plus du microcontrôleur, on y trouve une LED, connectée à la broche *P1.0*, avec sa résistance de limitation du courant reliée en série vers la masse. Notez la présence d'un condensateur de découplage entre le + et le -. Les électroniciens savent qu'il est utile pour filtrer l'alimentation. On peut dire qu'il est une petite réserve de charges électriques. Sa valeur est souvent de 100 nF. Il sera placé tout près du circuit intégré.

L'entrée Reset est maintenue à l'état logique *1* par une résistance reliés à l'alimentation positive. Les signaux Reset et Test sont reliés à un connecteur, comportant aussi des broches pour l'alimentation. C'est par ce connecteur que le microcontrôleur pourra être programmé.

## Réalisation d'un montage à microcontrôleur ##

L'assemblage de composants électroniques se fait le plus souvent sur un circuit imprimé (**PBC** : *Printed Circuit Board*). Pour des montages de test, il est possible d'utiliser des techniques de montage sans soudure, tels que les plaques t'expérimentation, appelées en anglais *breadboard*. Voici comment le...

## Programmation d'un microcontrôleur ##

La programmation d'un microcontrôleur se fait à travers ses broches de programmation. Un **programmateur** est généralement utilisé, au moins pour la première programmation.

Dans le cas du MSP430G, la carte LaunchPad contient un programmateur capable de générer les signaux Reset et Test nécessaires à la programmation.


## Cartes à microcontrôleur ##

Tout le monde n'étant pas électronicien, les cartes à microcontrôleur facilitent la mise en œuvre des microcontrôleurs. Les cartes **Arduino** ont rendu très populaires les microcontrôleurs.

Contrairement au Launchpad MSP430, elle ne contient pas de programmateur. Il est donc nécessaire qu'elle dispose d'un microcontrôleur déjà programmé. Par contre, il est possible de changer le programme du microcontrôleur par une ligne série


