<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Le microcontrôleur</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Le microcontrôleur
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Le microcontrôleur</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le microcontrôleur</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Système informatique
* Le microcontrôleur
* De nombreuses familles
* Schéma de mise en œuvre
* Programmation
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Système informatique</h1>
<img src="./images/architecture-sys-info.svg" style="top:7cm; left:10cm; width:40cm; ">
<div style="top: 22cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* Un processeur
<!-- 234 -->* Une mémoire morte (ROM)
<!-- 34 -->* Une mémoire vive (RAM)
<!-- 4 -->* Des entrées-sorties (I/O)
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le microcontrôleur</h1>
<img src="./images/uC-sys-info.svg" style="top:7cm; left:11cm; width:38cm; ">
<div style="top: 26cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 2 -->* Un microcontrôleur est un circuit intégré contenant un système informatique
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">De nombreuses familles de microcontrôleurs</h1>
<div style="top: 8cm; left: 3cm; font-size: 48pt;">
* De nombreux fabricants
</div>
<!-- 234567 --><img src="./images/microchip-atmel-logo.png" style="top:11cm; left:3cm; width:19cm; ">
<!-- 234567 --><img src="./images/nxp-logo.png" style="top:11.7cm; left:20cm; width:5cm; ">
<!-- 234567 --><img src="./images/stmicro-logo.png" style="top:9.5cm; left:26.0cm; width:10cm; ">
<!-- 234567 --><img src="./images/ti-logo.png" style="top:9.2cm; left:36cm; width:11cm; ">
<!-- 234567 --><img src="./images/cypress-logo.png" style="top:10.8cm; left:49cm; width:8cm; ">
<!-- 34567 --><div style="top: 16.5cm; left: 3cm; font-size: 48pt; line-height: 1.3;">
<!-- 34567 -->* Mémoire morte de 1 ko à des Mo
<!-- 4567 -->* Mémoire vive de quelques octets à des centaines de ko
<!-- 567 -->* De quelques broches à des centaines de broches d’entrées-sorties
<!-- 34567 --></div>
<!-- 67 --><img src="./images/dil14.png" style="top:25.0cm; left:7cm; width:9cm; ">
<!-- 67 --><img src="./images/smd16.png" style="top:25.0cm; left:19cm; width:7cm; ">
<!-- 67 --><img src="./images/mlp28.svg" style="top:26.0cm; left:30cm; width:2cm; ">
<!-- 7 --><img src="./images/mlp28.svg" style="top:25.0cm; left:35cm; width:8cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Un exemple de microcontrôleur : le MSP430G2553</h1>
<img src="./images/pinout-msp430-20pin.svg" style="top:7.0cm; left:25cm; width:20cm; ">
<img src="./images/dil20.jpg" style="top:9.0cm; left:4cm; width:14cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Mise en œuvre matérielle et logicielle</h1>
<div style="top: 8cm; left: 3cm; font-size: 48pt;">
* Un composant électronique
<!-- 23456 -->* ⇒ mise en œuvre matérielle
<!-- 3456 -->* ⇒ compétence d’un électronicien !
</div>
<!-- 456 --><div style="top: 20cm; left: 3cm; font-size: 48pt;">
<!-- 456 -->* Un système informatique programmable
<!-- 56 -->* ⇒ mise en œuvre logicielle
<!-- 6 -->* ⇒ compétence d’un informaticien !
<!-- 456 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Schéma de mise en œuvre</h1>
<img src="./images/schema-msp430.svg" style="top:7.0cm; left:17cm; width:30cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Exemple de montage</h1>
<img src="./images/MSP-2231-LED.svg" style="top:10.0cm; left:4cm; width:52cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Exemple de montage</h1>
<img src="./images/MSP-2231-LED-c.svg" style="top:9.0cm; left:3cm; width:26cm; ">
<img src="./images/schema-msp430.svg" style="top:9.0cm; left:30cm; width:25cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programmation d’un microcontrôleur</h1>
<img src="./images/pc-prog.svg" style="top:9.0cm; left:5cm; width:13cm; ">
<!-- 23 --><img src="./images/launchpad.jpg" style="top:9.0cm; left:20cm; width:17cm; ">
<!-- 3 --><img src="./images/Uno.jpg" style="top:12.0cm; left:39cm; width:19cm; ">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le microcontrôleur</h1>
<div class="liste_demi" style="font-size:48pt; left:36cm; width:26.0cm; top:8cm;">
* Système informatique
* Le microcontrôleur
* De nombreuses familles
* Schéma de mise en œuvre
* Programmation
</div>
</section>

