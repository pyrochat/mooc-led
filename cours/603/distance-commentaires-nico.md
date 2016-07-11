% Commande à distance
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/07/10


## Changer le comportement de l’enseigne ou de l’afficheur ##

Les enseignes et afficheurs fonctionnent généralement sans intervention humaine. Mais il est souvent utile de pouvoir modifier leur comportement. Pour une enseigne, on souhaitera par exemple :

* l’allumer et l’éteindre
* changer sa luminosité
* activer des informations exceptionnelles, par exemple : *Nouvel arrivage* ou *Pharmacie de garde*.

Pour les afficheurs, on souhaitera en plus changer les textes qui défilent, les images, etc.

Dans certains cas, quelques boutons-poussoirs ou un clavier seront placés sur l’enseigne ou l’afficheur, mais souvent, on souhaite déporter le dispositif de commande. Dans ce cas, les données seront transférées par l’un des nombreux moyens existants pour communiquer avec un microcontrôleur : liaisons série asynchrone RS232 ou RS485, I²C, Ethernet, etc.<!-- Pour l’I²C les distances sont trop faibles pour le citer dans cette liste... -->

Mais les enseignes et afficheurs, pour qu’ils soient bien visibles, sont souvent placés à des endroits peu accessibles, par exemple en hauteur. Les différentes techniques de commande sans fils sont alors les solutions les plus pratiques. Nous évoquerons quelques solutions basées sur des transmissions de signaux infrarouges et radio.


<!--

Pour toutes les technologies présentées, ça serait bien que tu traites les points suivants :


- Robustesse
- Disponibilité des composants matériels
- Disponibilité des bibliothèques logicielles
- Consommation électrique
- Coût
- Vitesse
- Portée
- Signaux directionnels ou non (il n’y a que l’infrarouge qui pose problème je suppose)
- Gestion matérielle du cryptage (pour soulager la partie logicielle et la personne qui s’occupe de l’intégration)
- Gestion matérielle des collisions (corrolaire du nombre de périphériques qui peuvent cohabiter)
- Norme publique ou propriétaire (ça fait une différence pour ceux qui veulent vendre des solutions clé en main)
- Facilité de créer un terminal (il faut bien pouvoir écrire le texte qu’on veut envoyer... est-ce que tu as prévu d’en parler ?)

 -->


## Infrarouge ##

Les LED infrarouges (IR), associées à des phototransistors, offrent une manière très simple d’envoyer des informations à un afficheur. On connaît les télécommandes des téléviseurs et autres climatiseurs.

Une simple LED IR peut être utilisée comme émetteur. Mais pour que la liaison fonctionne sans être perturbée par toutes sortes de rayonnements infrarouges, tels que les tubes fluorescents, les signaux d’une télécommande sont modulés à une fréquence bien précise, généralement 38 kHz. La réception se fait alors avec des circuits qui contiennent non seulement un phototransistor, mais également un filtre sélectif réglé sur cette fréquence de 38 kHz. Seul le signal de modulation est alors lu par le microcontrôleur.

![Réception de signaux infrarouges](images/sreception-ir.png "Réception de signaux infrarouges"){ width=80% }

Plusieurs protocoles existent pour transmettre l’information. Le protocole RC-5 de Philips :

![Protocole RC-5](images/sreception-ir.png "Protocole RC-5"){ width=80% }

Le protocole japonais, appelé souvent protocole NEC :

![Protocole NEC](images/sreception-ir.png "Protocole NEC"){ width=80% }

Alors que le microcontrôleur d’une enseigne ou d’un afficheur est bien occupé par l’affichage des animations, est-il possible de lui confier encore le décodage des signaux du récepteur infrarouge ? C’est possible, en utilisant des interruptions sur les flancs du signal sortant du détecteur, puis en mesurant avec un *timer* le temps entre ces flancs. Des bibliothèques existent pour l’Arduino.

### Avantages ###

- Robustesse liée à la simplicité des composants
- Disponibilité des composants
- Consommation électrique modérée à faible
- Très peu coûteux

### Désavantages ###

- Lenteur
- Portée très faible
- Signaux directionnels (il faut être en face pour que ça marche)
- Pas de gestion matérielle du cryptage
- Pas de gestion matérielle des collisions


## Radio ##

Les signaux radio peuvent aussi être utilisés pour communiquer avec une enseigne ou un afficheur à LED. Bien entendu, il faut alors respecter la législation en vigueur dans chaque pays.

En Europe, une bande de fréquence autour de 433 MHz est libre. Cette bande fait partie des bandes de fréquences librement utilisables appelées ISM (bandes Industrielles, Scientifiques et Médicales). Une puissance maximale ne doit pas être dépassée. On trouve des paires de petits modules émetteur-récepteur. Voici comment ils se présentent :

![Modules radio 433 MHz](images/modules-radio.jpg "Modules radio 433 MHz"){ width=15cm }

La mise en œuvre est très simple. L’émetteur et le récepteur doivent être alimentés. L’émetteur dispose d’une entrée qui active l’émission radio. Le récepteur offre simplement une sortie, qui correspond au signal reçu. Ce type de sytème n’est adapté que dans un environnement où il n’y a pas beaucoup d’autres émetteurs du même type car la gestion des collisions n’est pas intégrée au niveau du matériel. Elle doit être implémentée au niveau logiciel, ce qui est coûteux en ressources.

En principe, le signal sortant du récepteur va être l’image du signal entrant dans l’émetteur, si la liaison est bonne. Mais des contraintes bien particulières doivent être imposées au signal pour que la transmission fonctionne : le signal ne doit pas avoir de composante continue et les durées des 0 et des 1 successifs doivent être contenues dans un intervalle limité. On utilisera donc souvent des bibliothèques spécialisées pour mettre en œuvre de tels modules, comme la bibliothèque *[RadioHead](http://www.airspayce.com/mikem/arduino/RadioHead/)*.

### Avantages ###

- Assez robuste
- Disponibilité des composants
- Consommation électrique modérée à faible
- Très peu coûteux
- Portée moyenne à longue

### Désavantages ###

- Lenteur
- Pas de gestion matérielle du cryptage
- Pas de gestion matérielle des collisions
- Gammes de fréquences différentes suivant les pays


<!--

La bibliothèque *Virtual-Wire* n’est plus développée. Les auteurs conseillent d’utiliser RadioHead à la place. Voir à ce sujet : http://www.airspayce.com/mikem/arduino/VirtualWire/. Note que les deux bibliothèques sont hébergées sur airspayce.com, on peut donc supposer que les auteurs sont les mêmes.

Note que la bibliothèque RadioHead est conçue par des gens très pointus dans le domaine de la RF et que c’est galère pour un novice de s’y retrouver.

Pour mon projet de QUIZZ, j’ai testé la bibliothèque “Manchester.h” qui intègre le protocole du même nom (comme RadioHead il me semble) et qui a le grand avantage d’être tellement petite qu’on peut l’utiliser sur un ATtiny

https://github.com/mchr3k/arduino-libs-manchester.git

Quoi qu’il en soit, les modules RF433 bon marchés n’intègrent pas de gestion des collisions au niveau hardware. Certains modèles indiquent qu’on peut changer la fréquence (315, 330 ou 433 MHz), mais je n’ai jamais réussi à trouver les infos sur les détails pratiques de cette possibilité. Cette limitation implique qu’il faut gérer les collisions au niveau software ce qui est difficile pour moi. Et je suppose que même pour un spécialiste du domaine, la taille du programme fera que le système ne sera pas intéressant.

En plus de la limitation due aux collisions, il y a le problèmes des fréquences autorisées qui sont différentes suivant les pays.

Et pour finir, le RF433 est extrêmement lent......

Résultat des courses, je pense que le RF433 est a déconseiller très vivement... Dans les solutions ultra low cost, le nRF24L01+ est nettement plus attractif. Il n’a aucun des problèmes que j’ai cité ci-dessus. Son seul désavantage est d’être un protocole propriétaire de Nordic Semiconductor.

À ce sujet, tu as choisis de ne présenter que les normes publiques et pas les normes propriétaires. Peut-être que tu pourrais indiquer une liste succintes de protocoles sans entrer dans le détail.

-->


## Bluetooth ##

Le standard Bluetooth présente plusieurs avantages :

* C’est un standard disponible sur beaucoup de systèmes informatiques : *smartphones*, tablettes et PC.
* Il est économe en énergie, surtout dans la version Bluetooth 4 *Low Energy*. Mais cet avantage n’est pas déterminant pour une enseigne ou un afficheur, qui consomment eux-mêmes beaucoup de courant.
* La confidentialité des données est assurée par des mots de passe et le cryptage des données transmises.

Mais si la couche d’établissement de la communication et de la transmission des données est standardisée, le contenu des données est libre. Il est donc nécessaire de faire fonctionner un logiciel dédié sur le terminal utilisé (*smartphone*, tablette, ordinateur) .



<!-- Je propose une nouvelle version de ce paragraphe ci-dessous. -->
Le système d’exploitation *Android* permet d’écrire facilement des applications qui communiquent par Bluetooth. L’application doit alors être installée avant de pouvoir communiquer. Pour être d’usage plus général, il faudrait adapter l’application aux différents systèmes d’exploitation : Android, iOS, Windows, Linux, Mac OSX, etc.

<!--
Les systèmes d’exploitation d’ordinateurs (Windows, OSX, Linux,...) et de périphériques mobiles (Android, iOS, Windows 10,...) permettent tous d’écrire facilement des applications utilisant la communication Bluetooth. Le désavantage de cette approche est que les applications doivent être adaptées, voire complètement réécrites pour chaque système d’exploitation. Ce désavantage est un frein sérieux au dveloppement des applications Bluetooth. Le protocole WiFi ne souffre pas de cette contrainte car il peut être utilisé via un navigateur internet et cette solution est compatible sur tous les systèmes d’exploitation (voir ci-dessous).
-->

### Avantages ###

- Assez robuste
- Disponibilité des composants
- Consommation électrique modérée à faible
- Portée moyenne
- Assez rapide
- Gestion matérielle du cryptage
- Gestion matérielle des collisions
- Gammes de fréquences identiques partout dans le monde

### Désavantages ###

- Prix moyen, mais nécessite des terminaux onéreux (*smartphone* par exemple)
- Nécessite de créer des logiciels distincts pour chaque système d’exploitation qui doit être supporté
- Certains fabriquants ajoutent des fonctionnalités propriétaires qui peuvent entrer en conflit avec la norme de base <!-- Apple pour ne pas les citer... -->




## WiFi ##

Le standard WiFi permet de manière générale de relier des ordinateurs en réseau. Sa complexité et ses performances peuvent sembler dépasser les besoins d’une enseigne ou d’un afficheur. Mais l’avantage du WiFi est qu’il va permettre la connexion à un système informatique sans devoir le configurer de manière spécifique, en utilisant des protocoles standards comme le HTTP : il sera alors possible de dialoguer avec l’afficheur avec un simple navigateur internet (*web browser*), disponible sur tous les systèmes d’exploitation. Cette solution présente l’avantage indéniable de l’interopérabilité entre les différents systèmes d’exploitation.

Des modules WiFi très peu coûteux sont apparus sur le marché depuis quelques années. Il est donc possible de rendre un afficheur paramétrable par WiFi avec un minimum d’efforts et de coûts. Examinons quelques solutions possibles.


## ESP8266 ##

Le circuit ESP8266 du fabricant chinois Espressif Systems est un *System-on-Chip* (SoC) qui comporte tout ce qu’il faut pour le WiFi. On le trouve généralement sous forme de modules, dont il existe une quinzaine de variantes.

<!--
Pour les différentes versions de l’ESP, voir :
http://www.esp8266.com/wiki/doku.php?id=esp8266-module-family -->

![Modules ESP-01 et ESP-12](images/modules-esp8266.jpg "Modules ESP-01 et ESP-12"){ width=15cm }

Ces modules contiennent le SoC ESP8266 ainsi qu’une mémoire EEPROM qui contient son programme. L’antenne est intégrée directement sur le circuit imprimé. L’ESP8266 communique avec l’extérieur par une ligne série asynchrone. Il existe plusieurs manières de l’utiliser :

<!--
L’ESP8266 peut faire beaucoup plus que ce que tu décris car il contient un µcontrôleur assez performant :

32-bit Tensilica Xtensa LX106 à 80 MHz avec un “full WiFi stack”

ATTENTION, CE QUE JE DÉCRIS ICI EST VALABLE POUR LE MODÈLE ESP-12E. C’EST INCROYABLEMENT FASTIDIEUX DE VÉRIFIER SI CES INFOS SONT VRAIES POUR LES AUTRES MODÈLES !

Ce µcontrôleur peut être overclocké à 160 MHz, mais j’ai observé que les bibliothèques Arduino C se mélangeaient les pinceaux dans ce mode. Particulièrement la bibliothèque Tone.h qui permet de jouer des musiques sur buzzer.

Une erreur typique qu’on retrouve partout sur internet, c’est que les Makers n’ont pas compris que l’ESP intègre un µcontrôleur. Ils proposent tous des montages qui associent un ESP avec un Arduino et les deux communiquent via RS232. Mais le Tensilica Xtensa peut facilement concurencer un ATmega328P. Donc dans la grande majorité des cas, l’ESP peut être utilisé seul. Il offre quand même 13 GPIO, I²C, SPI, RS232, mais une seule entrée analogique 10 bits...

Il est possible que cet “oubli” du µcontrôleur intégré soit dû au fait qu’Espressif communique presque uniquement en chinois et que les modèles de base de l’ESP doivent être programmés avec une interface UART externe. De plus quand on regarde un ESP-01 on n’a pas l’impression qu’il contient un µcontrôleur à l’intérieur vu qu’il n’y a que 8 broches disponibles. Mais le SoC en a 18.

La mémoire flash qui contient les programmes des ESP est gigantesque comparée aux ATmega. Mes ESP-12E ont 1 Mo (1 044 464 octets) de flash par exemple et d’après Wikipedia, il peut supporter jusqu’à 16 Mo. Mais cet avantage est partiellement perdu par le fait qu’un programme sur ESP prend 13× plus de place que sur un ATmega328P. Par exemple, pour mon horloge à cycles ultradiens, voici les résultats de la compilation des deux programmes quasiment identiques :

# ESP-12E
Le croquis utilise 247 365 octets (23%) de l'espace de stockage de programmes. Le maximum est de 1 044 464 octets.
Les variables globales utilisent 33 676 octets (41%) de mémoire dynamique, ce qui laisse 48 244 octets pour les variables locales. Le maximum est de 81 920 octets.

# ATmega328P (Arduino Nano)
Le croquis utilise 19 346 octets (62%) de l'espace de stockage de programmes. Le maximum est de 30 720 octets.
Les variables globales utilisent 1 420 octets (69%) de mémoire dynamique, ce qui laisse 628 octets pour les variables locales. Le maximum est de 2 048 octets.

On voit aussi ci-dessus que l’ESP a 40× plus de RAM que l’ATmega328P...




 -->

* Par un jeu de commandes appelées “AT”, similaires à celles utilisées jadis avec les modems. Dans ce cas, on ne programme pas le microcontôleur interne, mais on communique avec l’ESP via le bus RS232.
* En écrivant complètement le programme en language C. Un environnement de développement est disponible pour cela : ESP-studio.
* Dans le mode Arduino C. Une bibliothèque similaire à la bibliothèque Arduino est alors utilisée. La compilation et le téléchargement du prorgramme peuvent être effectués avec l’IDE Arduino.
* En mode *NodeMCU*. La programmation s’effectue par des scripts écrits dans le langage *Lua*. C’est un langage de haut niveau interprété, similaire à Python, qui a l’avantage d’être peu gourmand en ressource.
* Avec le language *MicroPython* qui est une implémentation du language Python dédiée aux microcontrôleurs.
* Avec le language *BASIC*


<!--
Tu peux réorganiser la section ci-dessus de la manière suivante

On peut utiliser l’ESP8266 sans le programmer, mais en lui envoyant des commandes appelées “AT” via le bus RS232.

On peut également programmer son microcontrôleur interne avec les languages suivants :

- Language C. Avec le SDK (*Software Developpement Kit*) d’Espressif
- Language C. Avec les librairies Arduino.
- Lua. Avec le *firmware* NodeMCU.
- MicroPython
- BASIC

(Les programmes Lua ont la particularité de pouvoir être soit interprétés, soit compilés. Je ne sais pas si c’est le cas de MicroPython et de BASIC.)

 -->



<!-- OpenWRT ne propose qu’une couche logicielle alors que les exemples précédents sont plutôt des solutions hardware. Donc je me demande si c’est le bon endroit pour en parler...  -->
## OpenWRT ##

Une solution encore plus avancée est d’utiliser un environnement comportant assez de mémoire pour faire fonctionner une distribution Linux. La distribution OpenWRT est prévue pour les routeurs WiFi.


<!-- Là aussi, c’est plutôt du logiciel. -->
## Internet des objets ##

Du moment où une enseigne ou un afficheur dispose d’une capacité de communiquer sur le réseau internet, il devient un objet connecté. On parle d’*internet des objets* (IoT, *Internet of Things*). En plus de pouvoir recevoir de données pour son fonctionnement, comme par exemple les textes à afficher, il peut communiquer d’autres informations. En voici quelques exemples :

* Des données de maintenance du matériel, telles que les tension et courant des alimentations, la détection d’éventuelles pannes, les heures de fonctionnement.
* Des informations de surveillance, telles que des détections d’intrusions dans son périmètre, des images de son environnement ou de ce qu’il affiche.



<!--

Tu pourrais mentionner quelques autres possibilités, même si tu ne donnes pas de détails :

- GSM (natel)
- ZigBee
- nRF24
- LoRaWAN
...


-->

