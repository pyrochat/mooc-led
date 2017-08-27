<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e20014; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Multiplexage temporel</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Multiplexage temporel</h1>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Multiplexage temporel
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>

</section>

<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Multiplexage temporel</h1>
<div class="liste_demi"> >
Étude du multiplexage temporel
à partir de 3 exemples simples :

* Deux LED commandées par <br/>une seule broche
* Charlieplexing
* Afficheurs 7 segments
</div>
</section>

<!-- Page : 2 led 1 broche, 5 arrivées-->
<section>
<!-- A -->
<h1 class="en_tete">Commander 2 LED avec 1 broche</h1>
<img src="./images/led2-patte1-300dpi.png" style="top:8cm; left:2.65cm; width:25cm;" />
<div style="top:9cm; left:32cm; line-height:2; font-size:50pt;">
<!-- 2345 -->* Allumer LED1
<!-- 345 -->* Allumer LED2
<!-- 45 -->* Éteindre LED1 et LED2
<!-- 5 -->* Allumer _alternativement_ LED1 et LED2 !
</div>
</section>

<!-- Page : 2 led 1 broche, programme, def + 2 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Commander 2 LED avec 1 broche</h1>
<div style="top:7cm; left:2cm; width: 57.8cm; font-size:47pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
 #define SORTIE_1 pinMode(P1_4, OUTPUT); digitalWrite(P1_4, 1)
 #define SORTIE_0 pinMode(P1_4, OUTPUT); digitalWrite(P1_4, 0)
 #define SORTIE_HI_Z pinMode(P1_4, INPUT)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Commander 2 LED avec 1 broche</h1>
<div style="top:7cm; left:2cm; width: 57.8cm; font-size:47pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C .numberLines startFrom="4"}
void loop() {
  uint8_t i;
  SORTIE_HI_Z ; delay (1000); // LED1 et 2 éteintes pendant 1s
  SORTIE_1 ; delay (1000); // LED1 allumée pendant 1s
  SORTIE_0 ; delay (1000); // LED2 allumée pendant 1s

  for (i=0; i<250; i++) { // 250 x 4ms = 1 s
    SORTIE_1; delay (2); // LED1 allumée
    SORTIE_0; delay (2); // LED2 allumée
  }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
<!-- 2 --><div style="top:21.0cm; left:42cm; font-size:48pt; color:#e2001a">←  *intensité plus faible*</div>
</section>

<!-- Page demi, 3 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Commander 2 LED avec 1 broche</h1>
<div class="liste_demi"> >
* Utile ?
<!-- 234 -->* Sauver un projet où il manque une broche...
<!-- 34 -->* Petits microcontrôleurs<br/> (PIC, AVR, …)
<!-- 4 -->* ATtiny85
</div>
</section>

<!-- Page Charlieplexing, plein écran + -->
<section>
<!-- A -->
<h1 class="en_tete">Charlieplexing</h1>
<img src="./images/charlie-3pattes-300dpi.png" style="top:7cm; left:2.65cm; width:40cm;" />
<!-- 23 --><div style="top:5cm; left:35cm; font-size:40pt;">
<!-- 23 -->__Charlie Allen__ de la société Maxim Integrated
<!-- 23 --></div>
<!-- 3 --><div style="top:24cm; left:15cm; font-size:50pt;">
<!-- 3 -->* Anode à 1
<!-- 3 -->* Cathode à 0
<!-- 3 -->* Autre broche en entrée
<!-- 3 --></div>
</section>

<!-- Page Charlieplexing, 2 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Charlieplexing</h1>
<img src="./images/charlie-3pattes-300dpi.png" style="top:7cm; left:2.65cm; width:40cm;" />
<div style="top:24cm; left:15cm; font-size:50pt;">
* Anode à 1
* Cathode à 0
* Autre broche en entrée
</div>
<!-- 2 --><div style="top:24cm; left:35cm; font-size:50pt;">
<!-- 2 -->* **Multiplexage temporel**
<!-- 2 -->* 1 / 6 du temps
<!-- 2 -->* 1 / 6 de l’intensité lumineuse
<!-- 2 --></div>
</section>

<!-- Page Timing, grand -->
<section>
<!-- A -->
<h1 class="en_tete">Charlieplexing</h1>
<img src="./images/chrono-charlie-300dpi.png" style="top:7cm; left:2.65cm; width:40cm;" />
<div style="top:24cm; left:35cm; font-size:50pt;">
* Multiplexage temporel
* 1 / 6 du temps
* 1 / 6 de l’intensité lumineuse
</div>
</section>

<!-- Page Timing, demi -->
<section>
<!-- A -->
<h1 class="en_tete">Charlieplexing</h1>
<img src="./images/chrono-charlie.png" style="top:7cm; left:35cm; width:23cm; height:12cm" />
</section>

<!-- Page 7 segments, plein écran + 2 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs à 7 segments</h1>
<!-- 234 --><img src="./images/segment7-300dpi.png" style="top:7.5cm; left:2.65cm; width:50cm;" />
<!-- 34 --><div style="top:25cm; left:8cm; font-size:50pt;">
<!-- 34 -->* Anodes communes
<!-- 4 -->* __*ou*__ cathodes communes
<!-- 34 --></div>
</section>

<!-- Page 7 segments mux -->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs à 7 segments multiplexés</h1>
<img src="./images/segment7x4-300dpi.png" style="top:7.5cm; left:2.65cm; width:52cm;" />
<div style="top:25cm; left:8cm; font-size:50pt;">
* Anodes communes
* __*ou*__ cathodes communes
* 1 ou plusieurs digits
</div>
</section>

<!-- Page 7 segments mux, timing -->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs à 7 segments multiplexés</h1>
<img src="./images/chrono7x4-300dpi.png" style="top:7.5cm; left:4cm; width:31cm;" />
</section>

<!-- Page 7 segments mux, schéma -->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs à 7 segments multiplexés</h1>
<img src="./images/schema7x4-300dpi.png" style="top:7.5cm; left:4cm; width:27cm;" />
</section>

<!-- Page conclusion demi, 2 arrivées-->
<section>
<!-- A -->
<h1 class="en_tete">Multiplexage temporel</h1>
<div class="liste_demi" style="font-size:42pt; width:23.0cm; top:8cm;">
* 2 LED commandées par une broche
* Charlieplexing
* Afficheurs 7 segments
</div>
<!-- 2 --><div class="liste_demi" style="font-size:42pt; width:23.0cm; top:16cm;">
<!-- 2 -->* … dans le but de comprendre le principe du **multiplexage temporel**, qui sera utilisé intensivement sur les afficheurs matriciels à LED.
<!-- 2 --></div>
</section>






