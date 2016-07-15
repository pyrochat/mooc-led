% Commande à distance
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL et Nicolas Jeanmonod
% rév 2016/07/10


## Changer le comportement de l’enseigne ou de l’afficheur ##

Les enseignes et afficheurs fonctionnent généralement sans intervention humaine. Mais il est souvent utile de pouvoir modifier leur comportement. Pour une enseigne, on souhaitera par exemple :

* l’allumer et l’éteindre
* changer sa luminosité
* activer des informations exceptionnelles, par exemple : *Nouvel arrivage* ou *Pharmacie de garde*

Pour les afficheurs, on souhaitera en plus changer les textes qui défilent, les images, etc.

Dans certains cas, quelques boutons-poussoirs ou un clavier seront placés sur l’enseigne ou l’afficheur, mais souvent, on souhaite déporter le dispositif de commande. Dans ce cas, les données seront transférées par l’un des nombreux moyens existants pour communiquer avec un microcontrôleur : liaisons série asynchrone RS232 ou RS485, Ethernet, etc.

Mais les enseignes et afficheurs, pour qu’ils soient bien visibles, sont souvent placés à des endroits peu accessibles, par exemple en hauteur. Les différentes techniques de commande sans fils sont alors les solutions les plus pratiques. Nous évoquerons quelques solutions basées sur des transmissions de signaux infrarouges et radio.


## Infrarouge ##

Les LED infrarouges (IR), associées à des phototransistors, offrent une manière très simple d’envoyer des informations à un afficheur. On connaît les télécommandes des téléviseurs et autres climatiseurs.

Une simple LED IR peut être utilisée comme émetteur. Pour que la liaison fonctionne sans être perturbée par toutes sortes de rayonnements infrarouges, tels que les tubes fluorescents, les signaux d’une télécommande sont modulés à une fréquence bien précise, généralement 38 kHz. La réception se fait alors avec des circuits qui contiennent non seulement un phototransistor, mais également un filtre sélectif réglé sur cette fréquence de 38 kHz. Seul le signal de modulation est alors lu par le microcontrôleur.

![Signaux infrarouges](images/reception-ir.png "Signaux infrarouges"){ width=80% }

Plusieurs protocoles existent pour transmettre l’information, tels que le protocole RC-5 de Philips et protocole japonais appelé souvent protocole NEC. Une solution très simple pour envoyer des données à une enseigne ou un afficheur est alors d’utiliser une télécommande du commerce. Des bibliothèques existent pour lire ces signaux de ces télécommandes avec un Arduino.

Comment gérer la réception des signaux du récepteur infrarouge ? Alors que le microcontrôleur d’une enseigne ou d’un afficheur semble bien occupé par l’affichage des animations, est-il possible de lui confier en plus le décodage de ces signaux ? C’est possible, en utilisant des interruptions sur les flancs du signal sortant du détecteur, puis en mesurant avec un *timer* le temps entre ces flancs.

La portée d’un signal infrarouge peut aller jusqu’à quelques dizaines de mètres. Avec la modulation à 38 kHz, on peut obtenir une très bonne sensibilité, qui rend le système fonctionnel même si l’émetteur ne vise pas le récepteur, grâce à des réflexions sur l’environnement. <!-- Cependant, cette technologie ne doit être utilisée que si l’on peut s’assurer que l’émetteur et le récepteur sont en contact visuel. Ceci peut être une contrainte, puisque la distance est réduite, mais ça peut être un avantage du point de vue de la sécurité. -->

## Ondes radio (RF) ##

Les ondes radio (RF, *Radio Frequency*), sont des ondes électromagnétiques dont la gamme de fréquences s’étend de 3 kHz à 300 GHz. Elles peuvent aussi être utilisées pour communiquer avec une enseigne ou un afficheur à LED. Bien entendu, il faut alors respecter la législation en vigueur dans chaque pays.

En Europe, une bande de fréquence autour de 433 MHz est libre. Cette bande fait partie des bandes de fréquences librement utilisables appelées ISM (bandes Industrielles, Scientifiques et Médicales). Une puissance maximale ne doit pas être dépassée. On trouve des paires de petits modules émetteur-récepteur. Voici comment ils se présentent :

![Modules radio 433 MHz](images/modules-radio.jpg "Modules radio 433 MHz"){ width=80% }

La mise en œuvre des modules 433 MHz est très simple. L’émetteur et le récepteur doivent être alimentés. L’émetteur dispose d’une entrée qui active l’émission radio. Le récepteur offre simplement une sortie, qui correspond au signal reçu. Ce type de système n’est adapté que dans un environnement où il n’y a pas beaucoup d’autres émetteurs du même type car la gestion des collisions n’est pas intégrée au niveau du matériel. Elle doit être implémentée au niveau logiciel, ce qui est coûteux en ressources.

Si la liaison est bonne, le signal sortant du récepteur va être l’image du signal entrant dans l’émetteur. Mais des contraintes bien particulières doivent être imposées au signal pour que la transmission fonctionne : le signal ne doit pas avoir de composante continue et les durées des 0 et des 1 successifs doivent être contenues dans un intervalle limité. On utilisera donc souvent des bibliothèques spécialisées pour mettre en œuvre de tels modules, comme la bibliothèque *VirtualWire*. Bien que cette librairie ne soit plus officiellement maintenue, elle reste très populaire et parfaitement fonctionnelle. La librairie qui devrait la remplacer, *RadioHead*, est nettement plus complexe.

Les signaux radio dont la fréquence est autour de quelques centaines de mégahertz ne sont pas très directifs. Mais pour obtenir une portée dépassant quelques dizaines de mètres avec ces modules, il faut bien soigner la réalisation de l’antenne.

D’autres modules radio plus sophistiqués sont disponibles. C’est le cas des modules utilisant le circuit nRF24L01+ de Nordic Semiconductor, proposé à des prix particulièrement bas. Il s’agit d’un émetteur-récepteur dans la bande des 2.4 GHz, piloté par des signaux SPI. <!-- Ils présentent l’avantage d’intégrer un système de gestion des collisions au niveau matériel. -->

Il existe aussi la possibilité d’obtenir des portées de plusieurs kilomètres tout en respectant les normes de limitation des puissances d’émission. Comment est-ce possible ? Dans une telle transmission, l’émission utilise un spectre étendu et le récepteur pratique une extraction des signaux alors qu’ils ont un niveau inférieur au bruit. Le standard le plus connu est LoRa.


## Bluetooth ##

Le standard Bluetooth présente plusieurs avantages :

* C’est un standard disponible sur beaucoup de systèmes informatiques : *smartphones*, tablettes et PC.
* Il est économe en énergie, surtout dans la version Bluetooth 4 *Low Energy*. Mais cet avantage n’est pas déterminant pour une enseigne ou un afficheur, qui consomment eux-mêmes beaucoup de courant.
* La confidentialité des données est assurée par des mots de passe et le cryptage des données transmises.

Mais si la couche d’établissement de la communication et de la transmission des données est standardisée, le contenu des données est libre. Il est donc nécessaire de faire fonctionner un logiciel dédié sur le terminal utilisé (*smartphone*, tablette, ordinateur) .

Les systèmes d’exploitation d’ordinateurs (Windows, OS X, Linux...) et de périphériques mobiles (Android, iOS, Windows 10...) permettent tous d’écrire facilement des applications utilisant la communication Bluetooth. Le désavantage de cette approche est que les applications doivent être adaptées, voire complètement réécrites pour chaque système d’exploitation. Ce désavantage est un frein sérieux au développement des applications Bluetooth.


## WiFi ##

Le standard WiFi permet de manière générale de relier sans fil des ordinateurs en réseau avec la fonctionnalité du standard TCP/IP (le protocole de base d’Internet). Sa complexité et ses performances peuvent sembler dépasser les besoins d’une enseigne ou d’un afficheur. Mais l’avantage du WiFi est qu’il va permettre la connexion à un système informatique sans devoir le configurer de manière spécifique, en utilisant des protocoles standards comme le HTTP : il sera alors possible de dialoguer avec l’afficheur avec un simple navigateur Internet (*web browser*), disponible sur tous les systèmes d’exploitation. Cette solution présente l’avantage indéniable de l’interopérabilité entre les différents systèmes d’exploitation.

Des modules WiFi très peu coûteux sont apparus sur le marché depuis quelques années. Il est donc possible de rendre un afficheur paramétrable par WiFi avec un minimum d’efforts et de coûts. Examinons deux solutions possibles.


### ESP8266 ###

Le circuit ESP8266 du fabricant chinois Espressif Systems est un *System-on-Chip* (SoC) qui comporte tout ce qu’il faut pour le WiFi. On le trouve généralement sous forme de modules dont il existe une quinzaine de variantes.

![Modules ESP-01 et ESP-12](images/modules-esp8266.jpg "Modules ESP-01 et ESP-12"){ width=80% }

Ces modules contiennent le SoC (*System on Chip*) ESP8266 ainsi qu’une mémoire EEPROM qui contient son programme. L’antenne est intégrée directement sur le circuit imprimé. L’ESP8266 communique avec l’extérieur par une ligne série asynchrone. Il existe plusieurs manières de l’utiliser :

* Par un jeu de commandes appelées “AT”, similaires à celles utilisées jadis avec les modems. Dans ce cas, on ne programme pas le microcontrôleur interne, mais on communique avec l’ESP via la ligne série asynchrone.
* En écrivant complètement le programme en langage C. Un environnement de développement (SDK : *Software Developpement Kit*) est fourni par le fabricant Espressif.
* Dans le mode Arduino C. Une bibliothèque similaire à la bibliothèque Arduino est alors utilisée. La compilation et le téléchargement du programme peuvent être effectués avec l’IDE Arduino.
* En mode NodeMCU. La programmation s’effectue par des scripts écrits dans le langage Lua. C’est un langage de haut niveau interprété, similaire à Python, qui a l’avantage d’être peu gourmand en ressource. Des versions similaires utilisent des langages comme MicroPython, BASIC ou JavaScript.


### Modules utilisant le firmware OpenWRT ###

Une solution encore plus avancée est d’utiliser un module comportant assez de mémoire pour faire fonctionner une distribution Linux. C’est le cas des modules LinkIt Smart, qui utilisent le SoC 7688 de MediaTek.<!-- C’était aussi le cas de l’Arduino Yún. -->
<!-- Comme l’Arduino Yún n’est plus produit et qu’Arduino ne propose plus de solution OpenWRT (à ma connaissance), je pense que c’est mieux d’enlever cet exemple ou de le mettre au passé. -->

![Modules LinkIt Smart 7688](images/modules-7688.jpg "Modules LinkIt Smart 7688"){ width=80% }

La distribution la plus souvent utilisée est OpenWRT, qui est optimisée pour les routeurs WiFi. Elle est fournie avec tous les outils Linux de base <!-- Exemple d’outils ??? bash ? ssh ?... -->. Un serveur web est nativement disponible <!-- apache ?... -->. Il est par exemple extrêmement facile d’ajouter une caméra vidéo à un tel système <!-- est-ce que l’on peut utiliser les drivers de Ubuntu (ou d’un autre Linux de bureau) sur OpenWrt ??? si oui, c’est un avantage qu’il faut citer. -->.


## Réseau GSM ##

Les modules GSM ont baissé de prix de manière spectaculaires ces dernières années. Ils permettent de commander facilement à distance une enseigne ou un afficheur à LED. La commande peut se faire par l’envoi de SMS, par exemple pour modifier des textes. Il est aussi possible de communiquer sur le protocole TCP/IP, par le standard GPRS. Le GSM est une solution de choix quand les distances entre émetteur et récepteur sont grandes, car on peut relier pratiquement tous les lieux habités de notre planète, quelles que soient les distances qui les séparent.

Le module doit bien entendu contenir une carte SIM fournie par un opérateur GSM, qui facturera les frais de communication. La communication avec ces modules se fait généralement par une liaison série asynchrone, avec des commandes “AT”.


## Internet des objets ##

À partir du moment où une enseigne ou un afficheur dispose de la capacité de communiquer sur le réseau Internet, il devient un objet connecté. On parle alors d’*Internet des objets* (IoT, *Internet of Things*). En plus de pouvoir recevoir des données pour son fonctionnement, comme par exemple les textes à afficher, il peut communiquer d’autres informations. En voici quelques exemples :

* Des données de maintenance du matériel, telles que les tensions et courants des alimentations, la détection d’éventuelles pannes, les heures de fonctionnement.
* Des informations de surveillance, telles que des détections d’intrusions dans son périmètre, des images de son environnement ou de ce qu’il affiche.

Tout projet impliquant Internet doit être examiné avec grand soin concernant la sécurité et le cryptage des données.


