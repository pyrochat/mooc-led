% Commande à distance
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/07/10


## Changer le comportement de l’enseigne ou de l’afficheur ##

Les enseignes et afficheurs fonctionnent généralement sans intervention humaine. Mais il est souvent utile de pouvoir modifier leur comportement. Pour une enseigne, on souhaitera par exemple :

* l’allumer et l’éteindre
* changer sa luminosité
* activer des informations exceptionnelles (exemple : Nouvel arrivage, Pharmacie de garde)

Pour les afficheurs, on souhaitera en plus changer les textes qui défilent, les images, etc.

Dans certains cas, quelques boutons-poussoirs ou un clavier sera placé sur l’enseigne ou l’afficheur. Souvent, on souhaite déporter le dispositif de commande. Dans ce cas, les données seront transférées par l’un des nombreux moyens qu’il existe pour communiquer avec un microcontrôleur : liaisons série asynchrone, I²C, etc.

Mais les enseignes et afficheurs, pour qu’ils soient bien visibles, sont souvent placés à des endroits peu accessibles, par exemple en hauteur. Les différentes techniques de commande sans fils sont alors les solutions les plus pratiques. Nous évoquerons quelques solutions basées sur des transmissions infrarouges et radio.


## Infra-rouge ##

Les LED infrarouges, associées à des phototransistors, offrent une manière très simple d’envoyer des informations à un afficheur. On connaît les télécommandes des téléviseurs et autres climatiseurs.

Une simple LED IR peut être utilisée comme émetteur. Mais pour que la liaison fonctionne sans être perturbée par toute sorte rayonnements infra-rouges, tels que les tubes fluorescents, les signaux d’une télécommande sont modulés à une fréquence bien précise, généralement 38 kHz. La réception se fait alors avec de circuits qui contiennent non seulement un photo transistor, mais également un filtre sélectif réglé sur cette fréquence de 38 kHz. Seul le signal de modulation est alors lu par le microcontrôleur.

![Réception de sigaux infrarouges](images/sreception-ir.png "Réception de sigaux infrarouges"){ width=80% }

Plusieurs protocoles existent pour transmettre l'information. Le protocole RC-5 de Philips :

![Protocole RC-5](images/sreception-ir.png "Protocole RC-5"){ width=80% }

Le protocole japonais, appelé souvent protocole NEC :

![Protocole NEC](images/sreception-ir.png "Protocole NEC"){ width=80% }

Alors que le microcontrôleur d'une enseigne ou d'un afficheur est bien occupé par l'affichage des animations, est-il possible de lui confier encore le décodage des signaux du récepteur infrarouge ? C'est possible, en utilisant des interruptions sur les flancs du signal sortant du détecteur, puis en mesurant avec un Timer le temps entre ces flancs. Des librairies existent pour l'Arduino.


## Radio ##

Les signaux radios peuvent aussi être utilisés pour communiquer avec une enseigne ou un afficheur à LED. Bien entendu, il faut alors respecter la législation en vigueur dans chaque pays.

En Europe, une bande de fréquence autour de 433 MHz est libre. Une puissance maximale ne doit pas dépassée. On trouve des paires de petits modules émetteur-récepteur. Voici comment ils se présentent :

![Modules radio 433 MHz](images/modules-radio.jpg "Modules radio 433 MHz"){ width=15cm }

La mise en œuvre semble très simple. L’émetteur et le récepteur doivent être alimentés. L’émetteur dispose d’une entrée qui active l’émission radio.  Le récepteur offre simplement une sortie, qui correspond au signal reçu.

En principe, le signal sortant du récepteur va être l’image du signal entrant dans l’émetteur, si la liaison est bonne. Mais des contraintes bien particulières doivent être imposées au signal pour que la transmission fonctionne : le signal ne doit pas avoir de composante continue et les durées des 0 et des 1 successifs doivent être contenues dans un intervalle limité. On utilisera donc souvent des librairies spécialisées pour mettre en œuvre de tels modules, comme la librairie *Virtual-Wire*.


## Bluetooth ##

Le standard Bluetooth présente plusieurs avantages :

* C’est un standard disponible sur beaucoup de systèmes informatique : smartphones, tablettes et PC.
* Il est économe en énergie, surtout en mode *Low energy*. Mais c’est avantage n’est pas déterminant pour une enseigne ou un afficheur, qui consomment eux-même beaucoup de courant.
* La confidentialité des données est assurée par des mots de passe et le cryptage des données transmises.

Mais si la couche d’établissement de la communication et de la transmission des données est standardisée, le contenu des données est libre. Il est donc nécessaire de faire fonctionner un logiciel dédié sur le terminal utilisé (Smartphone, tablette, ordinateur) .

Le système d’exploitation *Android* permet d’écrire facilement des applications qui communiquent par Bluetooth. L'application doit alors être installée avant de pouvoir communiquer. Pour être d'usage plus général, il faudrait adapter l'application aux différents systèmes d'exploitation : Android, iOS, Windows, Linux, MacOS, etc.


## WiFi ##

Le standard WiFi permet de manière génrale de relier des ordinateurs en réseau. Sa complexité et ses performances peuvent sembler dépasser les besoins d’une enseigne ou d’un afficheur. Mais l’avantage du WiFi est qu’il va permettre la connexion à un système informatique sans devoir le configurer de manière spécifique, en utilisant des protocoles standards comme le HTTP : il sera alors possible de dialoguer avec l’afficheur avec un simple navigateur Internet (*Web browser*), disponible sir tous les systèmes d'exploitation.

Des modules WiFi très peu coûteux sont apparus sur le marché depuis quelques années. Il est donc possible de rendre un afficheur paramétrable par WiFi avec un minimum d’effort et de coût. Examinons quelques solutions possibles.


## ESP8266 ##

Le circuit ESP8266 du fabricant chinois Espressif Systems est un System-on-Chip (SoC) qui comporte tout ce qu’il faut pour le WiFi. On le trouve généralement sous forme de modules, tels que le EP-01 ou le EP-12.

![Modules EP-01 et EP-12](images/modules-esp8266.jpg "Modules EP-01 et EP-12"){ width=15cm }

Ces modules contiennent le SoC ESP8266 ainsi qu’une mémoire EEPROM qui contient son programme. L’antenne est gravée directement sur le circuit imprimé. L’ESP8266 communique avec l’extérieur par une ligne série asynchrone. Il existe plusieurs manières de l'utiliser :

* Par un jeu de commandes commençant par les caractères "AT", similaires à celles utilisées jadis avec les Modems.
* En écrivant complètement le programme. Un environnement de développement est disponible pour cela : ESP-studio.
* Dans le mode Arduino. Une librairie similaire à la librairie Arduino est alors utilisée, avec un environnement similaire au programme Arduino.
* En mode **NodeMCU**. La programmation s’effectue par des scripts écrits dans le langage **Lua**. C’est un langage de haut niveau interprété, un peu similaire à Python, qui a l’avantage d’être peu gourmand en ressource.

## OpenWRT ##

Une solution encore plus avancée est d'utiliser un environnement comportant assez de mémoire pour faire fonctionner une distribution Linux. La distribution OpenWRT est prévue pour les routeurs WiFi. 


## Internet des objets ##

Du moment où une enseigne ou un afficheur dispose d'une capacité de communiquer sur le réseau Internet, il devient un objet connecté. On parle d'Internet des Objest, **IoT** *Internet of Things*. En plus de pouvoir recevoir de données pour son fonctionnement, comme par exemple les textes à afficher, il peut communiquer d'autres informations. En voici quelques exemples :

* Des données de maintenance du matériel, telles que les tension et courant des alimentations, la détection d'éventuelles pannes, les heures de fonctionnement.
* Des informations surveillance, telles que des détection d'intrusions dans son périmètre, des images de son environnement ou de ce qu'il affiche.


