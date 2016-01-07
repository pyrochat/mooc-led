<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Programmation en matrice</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Programmation en matrice
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Programmation en matrice</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs</h1>
<div class="liste_demi"; style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Caractéristique des afficheurs
* Matrices de LED
* Programmation
* Génération et rafraîchissement
</div>
</section>

<!-- 3 significations-->
<section>
<!-- A -->
<h1 class="en_tete">Significations du mot Arduino</h1>
<div style="top: 5cm; left: 6cm; font-size: 53pt; line-height: 1.5;">
L'Arduino a participé à rendre populaires les microcontrôleurs de manière extraordinaire.
<!-- 2345 --><br/>Qu'est-ce qui se cache derrière ce nom ?
</div>
<!-- 345 --><div style="top: 18cm; left: 6cm; font-size: 53pt; line-height: 1.5;">
<!-- 345 -->* une carte à microcontrôleurs
<!-- 45 -->* un environnement de développement
<!-- 5 -->* une librairie pour microcontrôleurs (un ensemble de procédures)
<!-- 234 --></div>
</section>


<!-- Blink -->
<section>
<!-- A -->
<h1 class="en_tete">Programme *Blink*</h1>
<div style="top: 6cm; left: 4cm; font-size: 53pt; line-height: 2;">
~~~~~~~ { .c .numberLines startFrom="1" }
void setup() {
  pinMode(P1_0, OUTPUT);
}

void loop() {
  digitalWrite(P1_0, 1);
  delay(500);
  digitalWrite(P1_0, 0);
  delay(500);
}
~~~~~~~
</div>
<!-- 2 --><img src="./images/chrono-blink-300dpi.png" style="top:24.5cm; left:17cm; width:41cm;" />
</section>

<!-- Page conclusion + librairies, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Programmation en matrice</h1>
<img src="./images/Uno.jpg" style="top:6cm; left:35cm; width:10cm;" />
<img src="./images/coin-ide.png" style="top:6.5cm; left:47cm; width:7cm;" />
<div class="liste_demi"; style="font-size:48pt; left:35cm; width:26.0cm; top:13cm;">
* Caractéristique des afficheurs
* Matrices de LED
* Programmation
* Génération et rafraîchissement
</div>
<!-- 2 --><div class="liste_demi"; style="font-size:48pt; left:35cm; width:26.0cm; top:27cm;">
<!-- 2 -->* De nombreuses librairies !
<!-- 2 --></div>
</section>



 

 
