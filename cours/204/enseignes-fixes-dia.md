<!-- DIAPORAMA Enseignes à motifs fixes-->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- Contenu : -->
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:19cm; left:5.65cm; font-size:70pt;font-family: Impact, sans-serif;">Enseignes à motifs fixes</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Enseignes à motifs fixes</h1>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Enseignes à motifs fixes
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Enseignes à motifs fixes</h1>
<div style="top: 7.5cm; left: 30cm; font-size: 53pt; line-height: 1.5;">
* Principe des enseignes à motifs fixes
* Découpage en segments
* Schémas de commande à transistor
* Montages série et parallèle
* Programmation des animations
</div>
</section>

<!-- Page images ens., 2 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Enseignes à motifs fixes</h1>
<img src="./images/hotel.png" style="top:15cm; left:3cm; width:28cm;" />
<!-- 2 --><img src="./images/croix-pharma.png" style="top:10cm; left:36cm; width:20cm;" />
</section>

<!-- Page segments, 2 arrivées    -->
<section>
<!-- A -->
<h1 class="en_tete">Enseignes à motifs fixes</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
Regrouper les LED en motifs.
</div>
<img src="./images/hotel.png" style="top:15cm; left:3cm; width:28cm;" />
<img src="./images/croix-pharma.png" style="top:10cm; left:36cm; width:20cm;" />
<!-- 2 --><img src="./images/croix-pharma-seg.png" style="top:10cm; left:36cm; width:20cm;" />
</section>

<!-- Page commande segments, 2 arrivées, 1 image -->
<section>
<!-- A -->
<h1 class="en_tete">Commande des LED</h1>
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
* Une LED consomme 10 mA
<!-- 23 -->* Un microcontrôleur peut fournir<br/> environ 10 à 20 mA
<!-- 3 -->* Utilisation d’un transistor
</div>
<!-- 3 --><img src="./images/transistor-res-leds.png" style="top:8cm; left:26cm; width:32cm;" />
</section>

<!-- Page commande série, 2 images-->
<section>
<!-- A -->
<h1 class="en_tete">Montage en série</h1>
<img src="./images/transistor-3-5led-0.png" style="top:6cm; left:4cm; width:36cm;" />
<!-- 23 --><div style="top: 7.5cm; left: 35cm; font-size: 53pt; line-height: 1.5;">
<!-- 23 -->BC337 : 500 mA
<!-- 3 --><br/>50 × 5 LED
<!-- 23 --></div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Montage en série</h1>
<img src="./images/transistor-3-5led.png" style="top:6cm; left:4cm; width:36cm;" />
</section>

<!-- Page commande courant, 2 entrées-->
<section>
<!-- A -->
<h1 class="en_tete">Courant importants</h1>
<!-- Contenu : -->
<img src="./images/transistor-courants.png" style="top:11cm; left:1.5cm; width:57cm;" />
</section>

<!-- Page animations, entrées-->
<section>
<!-- A -->
<h1 class="en_tete">Programmation des animations</h1>
<div style="top:5.5cm; left:2cm; font-size:36pt;">
~~~~~~~ { .c .numberLines startFrom="1" }
void setup() {
  P2DIR |= 0xFF; // P2.0 à P2.7 en sortie
}

void loop() { // Boucle infinie, correspond à toute l'animation
  P2OUT = 0; // éteint toutes les LED
  P2OUT |= (1<<0); delay(200); // allume la première LED
  P2OUT |= (1<<1); delay(200); // allume successivement chaque LED...
  P2OUT |= (1<<2); delay(200);
  P2OUT |= (1<<3); delay(200);
  P2OUT |= (1<<4); delay(200);
  P2OUT |= (1<<5); delay(200);
  P2OUT |= (1<<6); delay(200);
  P2OUT |= (1<<7); delay(1000); // attend un peu après la dernière LED
  P2OUT = 0; delay(500); // éteint toutes les LED pendant 1/2 seconde
  P2OUT = 0xFF; delay(500); // allume toutes les LED
  P2OUT = 0; delay(500); // répète...
  P2OUT = 0xFF; delay(1000);
  P2OUT = 0; delay(500); // pause avant la reprise de l'animation
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programmation des animations</h1>
<div style="top:7cm; left:2cm; font-size:36pt;">
~~~~~~~ { .c .numberLines startFrom="1" }
void ChenillardAjoute(uint16_t attente) {
  unit16_t i;
  for (i=0; i<8; i++) {
    P2OUT |=(1<<i);
    delay(attente);
  }
}
...
void loop() { // Boucle infinie, correspond à toute l'animation
  ChenillardAjoute(200);
  delay(800); // attend un peu après la dernière LED
  P2OUT = 0; delay(500); // éteint toutes les LED pendant 1/2 seconde
  ...
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->
</div>
</section>


<!-- Page programmation avancés, entrées-->
<section>
<!-- A -->
<h1 class="en_tete">Programmation des animations</h1>
<div style="top: 8cm; left: 2.65cm; font-size: 53pt; line-height: 1.2;">
* Les programmes peuvent devenir très longs, peu lisibles
<!-- 234 --><br/> ... et dépasser même la taille mémoire du microcontrôleur
</div>
<!-- 34 --><div style="top: 15cm; left: 2.65cm; font-size: 53pt;">
<!-- 34 -->* Langages spécifiques, qu’il faudra interpréter
<!-- 34 --></div>
<!-- 4 --><div style="top: 20cm; left: 2.65cm; font-size: 53pt;">
<!-- 4 -->* Intensité variable des LED : PWM, BCM
<!-- 4 --></div>
</section>

<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Enseignes à motifs fixes</h1>
<div style="top: 7.5cm; left: 30cm; font-size: 53pt; line-height: 1.5;">
* Principe des enseignes à motifs fixes
* Découpage en segments
* Schémas de commande à transistor
* Montages série et parallèle
* Programmation des animations
</div>
</section>







