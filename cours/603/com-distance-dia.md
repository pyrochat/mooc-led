<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Commande à distance</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Commande à distance
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Commande à distance</h1>
<div style="top:6.5cm; left:35cm; width:23cm; font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:14cm;">
* Infrarouge
* Modules radio
* Bluetooth
* WiFi
* Internet des objets
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Changer le comportement de l’enseigne ou de l’afficheur</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Changer le mode de fonctionnement d’une enseigne (allumer, éteindre, mode nuit)
<!-- 2345 -->* Changer les textes d’un afficheur
</div>
<!-- 345 --><div style="top:14cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 345 -->* Boutons-poussoirs, claviers
<!-- 45 -->* Sans fil ?
<!-- 345 --></div>
<!-- 5 --><div style="top:21cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 5 -->* Infrarouges
<!-- 5 -->* Radio
<!-- 5 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Infrarouge</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* LED infrarouge, signal modulé à 38 kHz
<!-- 2345 -->* Utilisation possible d’une télécommande de téléviseur
<!-- 345 -->* Récepteur avec phototransistor, réglage automatique de gain et filtre 38 kHz
</div>
<!-- 345 --><img src="./images/ir-receiver.png" style="top:19cm; left:44cm; width:8cm;" />
<!-- 45 --><img src="./images/signaux-ir.svg" style="top:16cm; left:3cm; width:30cm;" />
<!-- 5 --><div style="top:29cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 5 -->* Décodage par interruption et mesure des temps par un timer
<!-- 5 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Ondes radio (RF)</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Ondes électromagnétiques, de 3 kHz à 300 GHz
<!-- 23456 -->* Respecter la législation de chaque pays !
<!-- 3456 -->* Modules 433 MHz
</div>
<!-- 3456 --><img src="./images/radio433.jpg" style="top:9cm; left:42cm; width:13cm;" />
<!-- 456 --><div style="top:19cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 456 -->* Contraintes sur le signal modulant, utilisation de librairies
<!-- 56 -->* Modules plus complexes, gérant les collisions. Ex : modules nRF24L01+
<!-- 6 -->* Des portées de plusieurs km sans augmentation de la puissance : LoRa
<!-- 456 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Bluetooth</h1>
<img src="./images/bluetooth-logo.png" style="top:7cm; left:48cm; width:6cm;" />
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Disponible sur *smartphones*, tablettes et PC
<!-- 234567 -->* Économe en énergie
<!-- 34567 -->* Assure la confidentialité des données
</div>
<!-- 4567 --><img src="./images/bluetooth-module.jpg" style="top:17cm; left:32cm; width:16cm;" />
<!-- 4567 --><div style="top:18cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 4567 -->* Modules faciles à mettre en oeuvre
<!-- 4567 --></div>
<!-- 567 --><div style="top:23cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 567 -->* Nécessite une application
<!-- 67 -->* Sur PC : Windows, OS X, Linux
<!-- 7 -->* Sur *smartphones* : Android, Windows 10 (plus difficile sur iOS)
<!-- 567 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">WiFi</h1>
<img src="./images/wifi-logo.svg" style="top:7cm; left:48cm; width:6cm;" />
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Réseau sans fil, protocoles standards (TCP/IP, HTTP, ...)
<!-- 234567 -->* Utilisation d’un navigateur Internet (*web browser*)
<!-- 34567 -->* Pas besoin d’application spécifique
</div>
<!-- 4567 --><img src="./images/esp8266.jpg" style="top:14.5cm; left:47cm; width:7cm;" />
<!-- 4567 --><div style="top:16cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 4567 -->* Modules très populaire : ESP8266
<!-- 4567 -->* Programmation par commande “AT”, en mode Arduino, en Lua, ...
<!-- 4567 --></div>
<!-- 567 --><div style="top:22cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 567 -->* Modules plus puissants, avec Linux
<!-- 67 -->* LinkIt Smart, avec SoC 7688 de MediaTek
<!-- 7 -->* OpenWRT : avec compilateurs, serveurs, outils, ...
<!-- 567 --></div>
<!-- 67 --><img src="./images/linkit-smart.jpg" style="top:22.5cm; left:36.5cm; width:17cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">GSM</h1>
<img src="./images/gsm-logo.png" style="top:7cm; left:48cm; width:6cm;" />
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Réseau téléphonique
<!-- 23456 -->* Couverture universelle des zones habitées
<!-- 3456 -->* Carte SIM, facturation par l’opérateur
</div>
<!-- 456 --><img src="./images/neoway.jpg" style="top:17cm; left:32cm; width:9cm;" />
<!-- 456 --><div style="top:18cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 456 -->* Modules à faible coût
<!-- 56 -->* Envoi de SMS
<!-- 6 -->* Commandes “AT”
<!-- 456 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Internet des objets</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Les enseignes et afficheurs à LED deviennent des objet connecté !
</div>
<!-- 23456 --><div style="top:10cm; left:2.65cm; font-size:48pt; width:27cm; line-height: 1.2;">
<!-- 23456 -->Données de maintenance du matériel :
<!-- 23456 --></div>
<!-- 3456 --><div style="top:14cm; left:2.65cm; font-size:48pt; width:27cm; line-height: 1.2;">
<!-- 3456 -->* Tensions et courants des alimentations
<!-- 3456 -->* Détection de pannes
<!-- 3456 -->* Heures de fonctionnement
<!-- 3456 --></div>
<!-- 456 --><div style="top:10cm; left:32cm; font-size:48pt; width:27cm; line-height: 1.2;">
<!-- 456 -->Données de surveillance et de sécurité :
<!-- 456 --></div>
<!-- 56 --><div style="top:14cm; left:32cm; font-size:48pt; width:27cm; line-height: 1.2;">
<!-- 56 -->* Détections d’intrusions
<!-- 56 -->* Images de l’environnement
<!-- 56 --></div>
<!-- 6 --><div style="top:24cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 6 -->* Soigner la sécurité et le cryptage des données
<!-- 6 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Commande à distance</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Infrarouge
* Modules radio
* Bluetooth
* WiFi
* Internet des objets
</div>
</section>
