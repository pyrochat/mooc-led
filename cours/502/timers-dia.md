<!-- DIAPORAMA -->


<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Les timers</div>
<img src="../../statiques/images/logo-inphb.png" style="top:26cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Dr. Yves Tiecoura</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Les timers</h1>
<!-- def A --><img src="../../statiques/images/logo-inphb.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** |  Les timers
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Dr. Yves Tiecoura
</div>
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Les timers</h1>
<div style="font-size:48pt; left:32cm; width:27.0cm; top:9cm;">
* Gestion précise du temps
* Timers : prédivision, logique de gestion registres de comparaison
* Mise en œuvre
* Timers du MSP430
</div>
</section>

<!-- Page Motivation, 9 arrivées-->
<section>
<!-- A -->
<h1 class="en_tete">Motivation des interruptions</h1>
<div style="font-size:55pt; left:2.65cm; top:5.5cm; width:55cm">
De manière générale un microcontrôleur doit être programmé pour :
</div>
<!-- 234567 --><div style="font-size:55pt; left:2.65cm; top:10.5cm; width:55cm">
<!-- 234567 -->* détecter des changements sur ses entrées
<!-- 34567 -->* agir en conséquence sur ses sorties
<!-- 234567 --></div>
<!-- 4567 --><div style="font-size:55pt; left:2.65cm; top:15.5cm;">
<!-- 4567 -->Dans les enseignes et afficheurs à LED :
<!-- 4567 --></div>
<!-- 567 --><div style="font-size:55pt; left:2.65cm; top:20.5cm;">
<!-- 567 -->* Le système n’a souvent que des sorties...
<!-- 67 -->* Dans certains cas, il doit réagir à des entrées (ex : télécommande)
<!-- 7 -->* Il doit exécuter des tâches à des instants précis (ex : matrices multiplexées)
<!-- 567 --></div>
</section>

<!-- Page définition, n images-->
<section>
<!-- A -->
<h1 class="en_tete">Définition</h1>
<div style="font-size:55pt; left:2.65cm; top:5.5cm; width:55cm">
On appelle interruption, l’arrêt temporaire d’un programme au profit d’un autre programme, jugé à cet instant plus important.
</div>
<!-- 23456 --><div style="font-size:55pt; left:2.65cm; top:14.5cm;">
<!-- 23456 -->Dans la vie courante :
<!-- 23456 --></div>
<!-- 3456 --><div style="font-size:55pt; left:2.65cm; top:20.5cm;">
<!-- 3456 -->* Je suis en train de travailler
<!-- 456 -->* Le téléphone sonne
<!-- 56 -->* Je vais répondre au téléphone
<!-- 6 -->* Après la conversation, je reprends mon travail là où je l’avais laissé.
<!-- 3456 --></div>
<!-- 3456 --><img src="./images/dring-allo-g1.png" style="top:11cm; left:30cm; width:27cm;" />
<!-- 456 --><img src="./images/dring-allo-g2.png" style="top:11cm; left:30cm; width:27cm;" />
<!-- 56 --><img src="./images/dring-allo-g3.png" style="top:11cm; left:30cm; width:27cm;" />
<!-- 6 --><img src="./images/dring-allo-g4.png" style="top:11cm; left:30cm; width:27cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une fin de conversion AD</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
 // Routine d'interruption associée à la fin de conversion ADC
 #pragma vector=ADC10_VECTOR
 __interrupt void ADC10_ISR(void) {

   uint16_t val = ADC10MEM; // lit le résultat de la conversion
   ADC10CTL0 |= ENC + ADC10SC; // lance la conversion suivante

   if (val > 511) { // La LED verte montre si la valeur dépasse Vcc/2
     P1OUT |= (1<<6); // LED verte On
   } else {
     P1OUT &=~(1<<6); // LED verte Off
   }
 }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Les timers</h1>
<div style="font-size:48pt; left:33cm; width:26.0cm; top:7cm;">
* Principe des interruptions
* Événements produisant des interruptions (externes ou internes)
* Mise en œuvre
* Deux exemples (interruption sur une entrée et sur une fin de conversion)
</div>
</section>






