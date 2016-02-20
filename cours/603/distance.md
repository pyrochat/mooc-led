% Commande à distance
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2015/09/18


## Changer le comportement de l'enseigne ou de l'afficheur ###

Les enseignes et afficheurs fonctionnent généralement sans intervention humaine. Mais il est souvent utile de pouvoir modifier leur comportement. Pour une enseigne, on souhaitera par exemple :

* l'allumer et l'éteindre
* changer sa luminosité
* activer des informations exceptionnelles (exemple : Pharmacie de garde)

Pour les afficheurs, on souhaitera en plus changer les textes qui défilent, les images, etc.

Dans certains cas, quelques boutons-poussoirs ou un clavier sera placé sur l'enseigne ou l'afficheur. Souvent, on souhaite déporter le dispositif de commande. Dans ce cas, les données seront transférées par l'un des nombreux moyens qu'il existe pour communiquer avec un microcontrôleur : liaisons série asynchrone, I2C, etc.

Mais les enseignes et afficheurs, pour qu'ils soient bien visibles, sont souvent placés à des endroits peu accessibles, par exemple en hauteur. Les différentes techniques de commande sans fils sont alors les solutions les plus pratiques.

## Infra-rouge ##

Les LED infrarouges, associées à des phototransistors, offrent une manière très simple d'envoyer des informations à un afficheur. On connaît les télécommandes des téléviseurs et autres climatiseurs.

Une simple LED IR peut être utilisée comme émetteur. Mais pour que la liaison fonctionne sans être perturbée par toute sorte rayonnements infra-rouges, tels que les tubes fluorescents, les signaux d'une télécommande sont modulés à une fréquence bien précise. Il s'agit généralement de 38 kHz. La réception se fait alors avec de circuits qui contiennent non seulement un photo transistor, mais également un filtre très sélectif réglé sur cette fréquence de 38 kHz.

Voici un schéma pour une transmission par infrarouge :

![Transmission infrarouge](images/schema-ir.png "Transmission infrarouge"){ width=15cm }

## Radio ##

Les signaux radios peuvent aussi être utilisés pour communiquer avec un afficheur. Bien entendu, il faut alors respecter la législation en vigueur dans chaque pays.

En Europe, une bande de fréquence autour de 433 MHz est libre. Une puissance maximale ne soit pas dépassée. On trouve de petites paires de modules émetteur-récepteur. Voici comment ils se présentent :

![Modules radio 433 MHz](images/modules-radio.jpg "Modules radio 433 MHz"){ width=15cm }

La mise en œuvre semble très simple. L'émetteur et le récepteur doivent être alimentés. L'émetteur dispose d'une entrée qui active l'émission radio. Il dispose aussi d'une entrée. Le récepteur offre simplement une sortie. En principe, le signal sortant du récepteur doit être l'image du signal entrant dans l'émetteur.

Mais des contraintes bien particulières doivent être imposées au signal pour que la liaison fonctionne : le signal ne doit pas avoir de composante continue et les durées des 0 et des 1 successifs doivent être contenues dans un intervalle bien précis.

On utilisera donc souvent des librairies spécialisées pour mettre en œuvre de tels modules, comme la librairie *Virtual-Wire*.

## Bluetooth ##

Le standard Bluetooth présente plusieurs avantages :

* C'est un standard disponible sur beaucoup de systèmes informatique : smartphones, tablettes et PC.
* Il est économe en énergie, surtout en mode *Low energy*. Mais c'est avantage n'est pas déterminant pour une enseigne ou un afficheur, qui consomment eux-même beaucoup de courant.
* La confidentialité des données est assurée.

Mais si la couche d'établissement de la communication et de la transmission des données est standardisée, le contenu des données est libre. Il est donc nécessaire de faire fonctionner sur le terminal utilisé (Smartphone, tablette, PC) un logiciel spécialisé.

Le système d'exploitation *Android* permet d'écrire facilement des applications qui communiquent par Bluetooth. Mais ce

## WiFi ##

Le standard WiFi permet généralement de relier des ordinateurs en réseau. Sa complexité et ses performances peuvent sembler dépasser les besoins d'une enseigne ou d'un afficheur. Mais l'avantage du WiFi est qu'il va permettre la connexion à un système informatique sans devoir le configurer de manière spécifique, en utilisant des protocoles comme HTTP : il sera alors possible de dialoguer avec l'afficheur avec un simple navigateur Internet (*Web browser*).

Or des modules très peu coûteux sont apparus sur le marché il y a quelques années. Il est donc possible de rendre un afficheur paramétrable par WiFi avec un minimum d'effort et de coût.

## ESP8266 ##

Le circuit ESP8266 du fabricant chinois Espressif Systems est un System-on-Chip (SoC) qui comporte tout ce qu'il faut pour le WiFi. On le trouve généralement sous forme de modules, tels que le EP-01 ou le EP-12.

![Modules EP-01 et EP-12](images/modules-esp8266.jpg "Modules EP-01 et EP-12"){ width=15cm }

Ces modules contiennent le SoC ESP8266 ainsi qu'une mémoire EEPROM pour le programmer. L'antenne est gravée directement sur le circuit imprimé.

L'ESP8266 communique avec l'extérieur par une ligne série asynchrone. Un jeu de commandes similaires à celles utilisées jadis avec les Modems permet de le commander. Mais il peut aussi devenir autonome. Pour développer les programmes, un environnement de développement est disponible pour l'ESP8266.

## NodeMCU ##

Programmer soi-même un tel circuit est relativement complexe. Une manière beaucoup plus simple de le mettre en œuvre est de charger l'environnement Node-MCU. Cet environnement est *open-source*. Quelques manipulations simples permettent de le placer dans l'EEPROM du module.

Avec l'environnement Node-MCU, la programmation s'effectue par des scripts écrits dans le langage **Lua**. C'est un langage de haut niveau interprété, un peu similaire à Python. Il a l'avantage d'être peu gourmand en ressource.

Un programme appelé Esplorer permet de charger les scripts Lua et de visualiser le dialogue avec l'ESP8266.

Nous présenterons ici un script transformant le module ESP8266 en un *access point WiFi* autonome, sur lequel une serveur offre une page Web, par laquelle il est possible de modifier les textes d'un afficheur et le remettre à l'heure.


