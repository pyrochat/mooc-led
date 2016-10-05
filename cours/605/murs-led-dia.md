<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Murs de LED</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Murs de LED
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Murs de LED</h1>
<div style="top:6.5cm; left:33cm; width:23cm; font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div class="liste_demi" style="font-size:48pt; left:33cm; width:26.0cm; top:14cm;">
* Témoins lumineux... écrans géants
* Millions de LED
* Écran composé de panneaux
* Panneaux composés de modules
* Standards pour les signaux
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Des témoins lumineux aux écrans géants</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* Dans les années 1960 et 1970, les LED étaient utilisées comme témoins lumineux
<!-- 23456 -->* Avec la baisse des prix, les premiers journaux lumineux sont apparus
<!-- 23456 --></div>
<!-- 23456 --><img src="./images/journal-lum.svg" style="top:12cm; left:4cm; width:37cm;" />
<!-- 3456 --><div style="top:19.5cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 3456 -->* Peu après, les LED vertes ont aussi été fabriquées en grandes séries
<!-- 456 -->* Mais les LED bleues ne sont arrivées que dans les années 1990
<!-- 3456 --></div>
<!-- 56 --><div style="top:26cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 56 -->* 3 LED : rouge, vert et bleu (LED RGB)
<!-- 6 -->* Toutes les couleurs possibles en variant l'intensité de chaque LED
<!-- 56 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Écrans géants</h1>
<img src="./images/benin-guinee-c.jpg" style="top:7cm; left:2.0cm; width:37cm;" />
<div style="top:11cm; left:41cm; font-size:48pt; width:57cm;">
<!-- 234 -->* Publicité
<!-- 34 -->* Spectacles
<!-- 4 -->* Manifestations sportives
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Des millions de LED</h1>
<div style="top:7cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
* _**Pitch**_ : distance entre deux pixels, en mm</div>
<!-- 23456789 --><div style="top:11cm; left:2.65cm; font-size:48pt; width:57cm;">
<!-- 23456789 -->Afficheur 16 par 9 mètres, pitch 6 mm :
<!-- 23456789 --></div>
<!-- 3456789 --><div style="top:13cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 3456789 -->* 1'000 / 6 = 166 pixels par mètre
<!-- 456789 -->* 166 × 166 = 27'556 pixels par mètre carré
<!-- 56789 -->* nombre de pixels pour l’afficheur : 16 × 9 × 27'556 = 3'968'064
<!-- 6789 -->* avec 3 LED par pixel (rouge, vert, bleu) : 3 × 3'968'064 = 11'904'192 LED
<!-- 3456789 --></div>
<!-- 789 --><div style="top:24.5cm; left:2.65cm; font-size:48pt; width:57cm; line-height: 1.2;">
<!-- 789 -->* Période de rafraîchissement : 1 / 100 Hz = 10 ms
<!-- 89 -->* Intensité la plus faible :  1 / 256 pour 8 bits
<!-- 9 -->* Durée d’affichage de l’intensité la plus faible : 10 ms / 256 = 39 μs
<!-- 789 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Des millions de LED</h1>
<div style="top:11cm; left:44cm; font-size:48pt; width:57cm;">
* Microcontrôleur ?
<!-- 23 -->* DMA
<!-- 3 -->* FPGA
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Écran composé de panneaux</h1>
<img src="./images/panneau0.svg" style="top:4.1cm; left:0cm; width:44cm;" />
<!-- 2345 --><div style="top:11cm; left:44cm; font-size:48pt; width:57cm; line-height: 1.4;">
<!-- 2345 -->* Ex : 64 × 64 pixels
<!-- 2345 -->* P12 : ~ 77 × 77 cm
<!-- 2345 -->* P10 : 64 × 64 cm
<!-- 2345 --></div>
<!-- 345 --><img src="./images/panneau1.svg" style="top:4.1cm; left:0cm; width:44cm;" />
<!-- 45 --><img src="./images/panneau2.svg" style="top:4.1cm; left:0cm; width:44cm;" />
<!-- 5 --><img src="./images/panneau3.svg" style="top:4.1cm; left:0cm; width:44cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Écran composé de panneaux</h1>
<img src="./images/panneaux-arriere.png" style="top:6cm; left:10cm; width:23.5cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Panneaux composés de modules</h1>
<img src="./images/module-p10-led-av.jpg" style="top:7cm; left:3cm; width:25cm;" />
<img src="./images/module-p10-led-ar.jpg" style="top:20cm; left:3cm; width:25cm;" />
<div style="top:8cm; left:34cm; font-size:48pt; width:57cm;">
* P10
<!-- 234 -->* 32 × 16 pixels
<!-- 34 -->* Multiplexé par 8
<!-- 4 -->* Registres 16 bits à courant constant
</div>
<!-- 4 --><img src="./images/p10-ic.png" style="top:20cm; left:35cm; width:17cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Panneaux composés de modules</h1>
<img src="./images/module1.svg" style="top:6cm; left:3cm; width:27cm;" />
<div style="top:11cm; left:38cm; font-size:48pt; width:57cm;">
* Exemple : 16 × 16 pixels
</div>
<!-- 2 --><img src="./images/module2.svg" style="top:6cm; left:3cm; width:27cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Panneaux composés de modules</h1>
<img src="./images/module-cabl1.svg" style="top:6cm; left:3cm; width:27cm;" />
<div style="top:11cm; left:38cm; font-size:48pt; width:57cm;">
* Exemple : 16 × 16 pixels
<!-- 23 -->* Alimentation : 5 V et Gnd
<!-- 23 -->* Modules en série
<!-- 3 -->* Groupes en parallèle
</div>
<!-- 23 --><img src="./images/module-cabl2.svg" style="top:6cm; left:3cm; width:27cm;" />
<!-- 3 --><img src="./images/module-cabl3.svg" style="top:6cm; left:3cm; width:27cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Standards pour les signaux</h1>
<!-- 23456 --><div style="top:7cm; left:2.6cm; font-size:48pt; width:57cm;">
<!-- 23456 -->* Signal pour les panneaux : Ethernet, RJ45
<!-- 23456 --></div>
<!-- 3456 --><img src="./images/rj45-male.png" style="top:11cm; left:15cm; width:6cm;" />
<!-- 3456 --><img src="./images/rj45-fem.png" style="top:11cm; left:25cm; width:6cm;" />
<!-- 456 --><div style="top:17cm; left:2.65cm; font-size:48pt; width:57cm;">
<!-- 456 -->* Signaux pour les modules :
<!-- 56 -->* Câbles plats, HUBxx
<!-- 456 --></div>
<!-- 56 --><img src="./images/pin16.png" style="top:23cm; left:6cm; width:7cm;" />
<!-- 6 --><div style="top:23cm; left:32cm; font-size:48pt; width:57cm;">
<!-- 6 -->* HUB75 :
<!-- 6 --></div>
<!-- 6 --><img src="./images/hub75.png" style="top:19cm; left:42cm; width:11cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Murs de LED</h1>
<div class="liste_demi" style="font-size:48pt; left:33cm; width:26.0cm; top:12cm;">
* Témoins lumineux... écrans géants
* Millions de LED : signaux rapides
* Écran composé de panneaux
* Panneaux composés de modules
* Standards pour les signaux : HUB75
</div>
</section>

