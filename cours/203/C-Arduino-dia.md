<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Programmation en C-Arduino</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Programmation en C-Arduino
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Programmation en C-Arduino</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programmation en C-Arduino</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Les 3 significations du mot Arduino
* Structure d’un programme
* Entrées-sorties
* Gestion du temps
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Significations du mot Arduino</h1>
<!-- 2345 --><div style="top: 7cm; left: 6cm; font-size: 53pt; line-height: 1.5;">
<!-- 2345 -->* L’Arduino a participé à rendre populaires les microcontrôleurs.
<!-- 2345 -->* Qu’est-ce qui se cache derrière ce nom ?
<!-- 2345 --></div>
<!-- 345 --><div style="top: 18cm; left: 9cm; font-size: 53pt; line-height: 1.5;">
<!-- 345 -->* une carte à microcontrôleur
<!-- 45 -->* un environnement de développement
<!-- 5 -->* une librairie pour microcontrôleurs (un ensemble de procédures)
<!-- 345 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les cartes Arduino</h1>
<img src="./images/Uno.jpg" style="top:6cm; left:4cm; width:34cm;" />
<!-- 234 --><div style="top: 7.5cm; left: 43cm; font-size: 48pt; line-height: 1.2;">
<!-- 234 -->* AVR (ATmega328)
<!-- 234 -->* Connecteur normalisé
<!-- 234 -->* USB (liaison série)
<!-- 234 --></div>
<!-- 34 --><div style="top: 18cm; left: 43cm; font-size: 48pt; line-height: 1.5;">
<!-- 34 -->* Matériel libre
<!-- 34 --></div>
<!-- 4 --><div style="top: 22.5cm; left: 43cm; font-size: 48pt; line-height: 1.5;">
<!-- 4 -->* Nombreux *shields*
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le logiciel Arduino</h1>
<img src="./images/arduino-ide.png" style="top:6cm; left:3cm; width:34cm;" />
<!-- 2345 --><div style="top: 6.5cm; left: 41cm; font-size: 48pt; line-height: 1.0;">
<!-- 2345 -->* Ecrit en Java
<!-- 2345 -->* Utilise le compilateur GCC
<!-- 2345 --></div>
<!-- 345 --><div style="top: 12.0cm; left: 41cm; font-size: 48pt; line-height: 1.0;">
<!-- 345 -->* Windows
<!-- 345 -->* Linux
<!-- 345 -->* MacOS
<!-- 345 --></div>
<!-- 45 --><div style="top: 19.5cm; left: 41cm; font-size: 48pt;">
<!-- 45 -->* Logiciel libre (Open source)
<!-- 45 --></div>
<!-- 5 --><div style="top: 23.0cm; left: 41cm; font-size: 48pt;">
<!-- 5 -->* Version pour d'autres microcontrôleurs
<!-- 5 --></div>
<!-- 5 --><div style="top: 27.5cm; left: 41cm; font-size: 48pt;">
<!-- 5 -->* Energia pour les MSP430
<!-- 5 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">La librairie Arduino</h1>
<!-- 2345 --><div style="top: 7.5cm; left: 4cm; font-size: 48pt; line-height: 1.3;">
<!-- 2345 -->* Un ensemble de procédures (librairie) écrites en C (ou C++)
<!-- 2345 -->* *Wiring*
<!-- 345 -->* Cacher la complexité du microcontrôleur
<!-- 45 -->* Apporter une certaine compatibilité entre différents microcontôleurs
<!-- 2345 --></div>
<!-- 5 --><div style="top: 21cm; left: 4cm; font-size: 48pt; line-height: 1.3;">
<!-- 5 -->* La structure générale d’un programme
<!-- 5 -->* Les entrées-sorties
<!-- 5 -->* La gestion du temps
<!-- 5 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Structure générale d’un programme</h1>
<div style="top: 9cm; left: 4cm; font-size: 53pt; line-height: 2;">
* *pas de* procédure &nbsp; `main()`
<!-- 234 -->* `void setup()`
<!-- 34 -->* `void loop()`
</div>
<!-- 4 --><div style="top: 9cm; left: 35cm; font-size: 53pt; line-height: 2; width:25cm;">
<!-- 4 -->~~~~~~~ { .c .numberLines startFrom="1" }
<!-- 4 --> void setup() {
<!-- 4 --> }
<!-- 4 -->
<!-- 4 --> void loop() {
<!-- 4 --> }
<!-- 4 -->~~~~~~~
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Organigramme d’un programme Arduino</h1>
<img src="./images/organi-arduino-1-300dpi.png" style="top:6cm; left:6cm; width:34cm;" />
<!-- 1 --><img src="./images/organi-arduino-12-300dpi.png" style="top:6cm; left:6cm; width:34cm;" />
</section>



<section>
<!-- A -->
<h1 class="en_tete">Entrées-sorties</h1>
<div style="top: 9cm; left: 4cm; font-size: 53pt; line-height: 2;  width:45cm;">
* `void pinMode(pin, mode)`
<!-- 23 -->* `void digitalWrite(pin, value)`
<!-- 3 -->* `boolean digitalRead(pin)`
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Exemple de programme</h1>
<div style="top: 9cm; left: 4cm; font-size: 53pt; line-height: 2; width:45cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
 void setup() {
   pinMode(P1_0, OUTPUT);
   pinMode(P1_3, INPUT);
 }

 void loop() {
   digitalWrite(P1_0, (digitalRead(P1_3));
 }
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Gestion du temps</h1>
<div style="top: 9cm; left: 4cm; font-size: 53pt; line-height: 2;">
* `int delay(ms)`
</div>
<!-- 23 --><div style="top: 5.3cm; left: 32cm; font-size: 50pt; line-height: 1.8; width:27cm;">
<!-- 23 -->~~~~~~~ { .c .numberLines startFrom="1" }
<!-- 23 --> void setup() {
<!-- 23 -->   pinMode(P1_0, OUTPUT);
<!-- 23 --> }
<!-- 23 -->
<!-- 23 --> void loop() {
<!-- 23 -->   digitalWrite(P1_0, 1);
<!-- 23 -->   delay(500);
<!-- 23 -->   digitalWrite(P1_0, 0);
<!-- 23 -->   delay(500);
<!-- 23 --> }
<!-- 23 -->~~~~~~~
<!-- 23 --></div>
<!-- 3 --><img src="./images/chrono-blink-300dpi.png" style="top:25.1cm; left:4cm; width:41cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programmation en C-Arduino</h1>
<img src="./images/Uno.jpg" style="top:6cm; left:35cm; width:10cm;" />
<img src="./images/coin-ide.png" style="top:6.5cm; left:47cm; width:7cm;" />
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:13cm;">
* Les 3 significations du mot Arduino
* Structure d’un programme
* Entrées-sorties
* Gestion du temps
</div>
<!-- 2 --><div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:24.5cm;">
<!-- 2 -->et de nombreuses librairies !
<!-- 2 --></div>
</section>






