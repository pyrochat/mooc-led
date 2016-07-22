<!-- DIAPORAMA -->


<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Les interruptions</div>
<img src="../../statiques/images/logo-inphb.png" style="top:26cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Dr. Yves Tiecoura</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Les interruptions</h1>
<!-- def A --><img src="../../statiques/images/logo-inphb.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** |  Les interruptions
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Dr. Yves Tiecoura
</div>
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Les interruptions</h1>
<div style="font-size:48pt; left:32cm; width:27.0cm; top:9cm;">
* Principe des interruptions
* Événements produisant des interruptions
* Mise en œuvre
* Deux exemples
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


<!-- Page routines, n images-->
<section>
<!-- A -->
<h1 class="en_tete">Routine</h1>
<img src="./images/inter-principe1.png" style="top:4.3cm; left:15cm; width:26cm;" />
<!-- 2 --><img src="./images/inter-principe5.png" style="top:4.3cm; left:15cm; width:26cm;" />
<!-- 3 --><img src="./images/inter-principe6.png" style="top:4.3cm; left:15cm; width:26cm;" />
<!-- 4 --><img src="./images/inter-principe7.png" style="top:4.3cm; left:15cm; width:26cm;" />
</section>

<section>
<!-- A -->
<h1 class="en_tete">Routine d’interruption</h1>
<img src="./images/inter-principe8.png" style="top:4.3cm; left:15cm; width:26cm;" />
<!-- 2 --><img src="./images/inter-principe9.png" style="top:4.3cm; left:15cm; width:26cm;" />
<!-- 3 --><img src="./images/inter-principe.png" style="top:4.3cm; left:15cm; width:26cm;" />
</section>

<!-- Page Evénements, 4 entrées-->
<section>
<!-- A -->
<h1 class="en_tete">Événements produisant des interruption</h1>
<div style="font-size:55pt; left:2.65cm; top:7cm; width:55cm">
Deux sortes d’événements produisant des interruptions :

<!-- 234 -->* Les événements __extérieurs__ au microcontrôleur
<!-- 34 -->* Les événements __intérieurs__ au microcontrôleur
<!-- 4 -->
<!-- 4 -->...dont les événements liées aux Timers.
</div>
</section>

<!-- Page Discrimination, 4 entrées-->
<section>
<!-- A -->
<h1 class="en_tete">Discrimination des sources d’interruption</h1>
<div style="font-size:55pt; left:2.65cm; top:7cm; width:55cm">
Il y a plusieurs sources d’interruptions sur un microcontrôleur

<!-- 234 -->Le système doit être capable d’en connaître la source
<!-- 234 -->
<!-- 34 -->* En consultant les fanions correspondant à chaque interruption
<!-- 4 -->* Grâce aux __vecteurs d’interruption__ *(interrupt vectors)*
</div>
</section>

<!-- Page vecteur -->
<section>
<!-- A -->
<h1 class="en_tete">Vecteurs d’interruption sur un MSP430G</h1>
<div style="font-size:48pt; left:2.65cm; top:8cm; width:55cm">
* 0xFFFE : Reset
* 0xFFFC : NMI
* 0xFFFA : Timer1 CCR0
* 0xFFF8 : Timer1 CCR1, CCR2, TAIFG
* 0xFFF6 : Comparator_A
* 0xFFF4 : Watchdog Timer
* 0xFFF2 : Timer0 CCR0
* 0xFFF0 : Timer0 CCR1, CCR2, TAIFG
</div>
<div style="font-size:48pt; left:32cm; top:8cm; width:55cm">
* 0xFFEE : USCI status
* 0xFFEC : USCI receive/transmit
* 0xFFEA : ADC10
* 0xFFE8 : -
* 0xFFE6 : Port P2
* 0xFFE4 : Port P1
</div>
</section>

<!-- Page Mise en oeuvre, 3 entrées + 1 image -->
<section>
<!-- A -->
<h1 class="en_tete">Mise en œuvre d’une interruption</h1>
<div style="font-size:55pt; left:2.65cm; top:4.5cm; width:55cm">
Trois étapes pour mettre en œuvre une interruption :
</div>
<div style="font-size:55pt; left:2.65cm; top:9.5cm; width:55cm">

<!-- 2345 -->* Autoriser l’interruption qui nous intéresse
<!-- 345 -->* Préciser comment cette interruption doit fonctionner
<!-- 45 -->* Autoriser globalement les interruptions
</div>
<!-- 5 --><img src="./images/decodage-inter.png" style="top:18.2cm; left:3cm; width:50cm;" />
</section>

<!-- Page syntaxe, entrée + soft-->
<section>
<!-- A -->
<h1 class="en_tete">Syntaxe des routines d’interruptions en C</h1>
<div style="font-size:55pt; left:2.65cm; top:7cm; width:55cm">
~~~~~~~ { .c }
 #pragma vector=NUMERO_DU_VECTEUR

 __interrupt void Nom_de_la_routine (void) {

  ...

 }
~~~~~~~
</div>
</section>

<!-- Page Inter In, 2 entrée + 2 soft-->
<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une entrée</h1>
<div style="font-size:55pt; left:2.65cm; top:7cm; width:55cm">
* **`P1DIR`** entrée ou sortie
* **`P1OUT`** valeur de sortie
* **`P1IN`** valeur des entrées *(lecture)*
* **`P1REN`** résistance de tirage *(pull-up ou pull-down)*
</div>
<!-- 2 --><div style="font-size:55pt; left:2.65cm; top:22cm; width:55cm">
<!-- 2 -->* **`P1IE`** *Interrupt Enable* : autorisation de l’interruption
<!-- 2 -->* **`P1IES`** *Interrupt Edge Select* : choix du flanc
<!-- 2 -->* **`P1IFG`** *Interrupt FlaG* : les **fanions d’interruption**
<!-- 2 --></div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une entrée</h1>
<img src="./images/decodage-inter.png" style="top:7.5cm; left:3cm; width:50cm;" />
<div style="font-size:55pt; left:2.65cm; top:22cm; width:55cm">
* **`P1IE`** *Interrupt Enable* : autorisation de l’interruption
* **`P1IES`** *Interrupt Edge Select* : choix du flanc
* **`P1IFG`** *Interrupt FlaG* : les **fanions d’interruption**
</div>>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une entrée</h1>
<div style="top:6.5cm; left:2cm; width: 5cm; font-size:45pt; width:57cm;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
 int main() {
   WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
   P1DIR |= (1<<6); // Led verte en sortie
   P1OUT |= (1<<3); P1REN |= (1<<3); //pull-up sur l’entrée P1.3

   P1IES |= (1<<3); // Sur le flanc descendant
   P1IE |= (1<<3); // Interruption P1 activée sur le bit 3
   P1IFG &=~(1<<3); // Fanion d’interruption remis à zéro
   __enable_interrupt(); // General Interrupt Enable

   while(1) { // il n’y a rien à faire dans la boucle principale !
   }
 }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une entrée</h1>
<div style="top:7.5cm; left:2cm; width: 5cm; font-size:45pt; width:50cm;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
 // Routine d’interruption associée au Port P1

 // Syntaxe spécifique pour les interruptions :
 #pragma vector=PORT1_VECTOR
 __interrupt void Port1_ISR(void) {

   // Fanion d’interruption correspondant au bit 3 remis à 0 :
   P1IFG &= ~(1<<3)

   P1OUT ^= (1<<6); // inverse P1.6 (LED verte)
 }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<!-- Page Inter In2-->
<section>
<!-- A -->
<h1 class="en_tete">Interruption sur deux entrées, avec discrimination</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
 int main() {
   ...
   P1IES &=~((1<<3)|(1<<4)); // Flancs montants
   P1IE |= (1<<3)|(1<<4); // Interruption activée sur 2 entrées
   P1IFG &=~((1<<3)|(1<<4)); // Fanions d’interruption remis à 0
   ...

 #pragma vector=PORT1_VECTOR
 __interrupt void Port1_ISR(void) {
   // discrimination des causes possible de l’interruption :
   if (P1IFG & (1<<3)) { P1IFG &= ~(1<<3); ... ;}
   if (P1IFG & (1<<4)) { P1IFG &= ~(1<<4); ... ;}
 }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<!-- Page ADC, 2 parties -->
<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une fin de conversion AD</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
 int main() {
   WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
   P1DIR |= (1<<6); P1OUT &=~(1<<6); // LED verte en sortie
   // Activation du convertisseur ADC 10 bits (ADC10) :
   ADC10CTL0 = ADC10SHT_2 + ADC10ON + ADC10IE; // Interrupt enable
   ADC10CTL1 = INCH_1; // Canal 1 = entrée A1 = P1.1
   ADC10AE0 |= (1<<1); // Autorisation de l’entrée A1
   __enable_interrupt(); // General Interrupt Enable
   ADC10CTL0 |= ENC + ADC10SC; // lance une première conversion

   while(1) { // il n’y a rien à faire dans la boucle principale !
   }
 }

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Interruption sur une fin de conversion AD</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
 // Routine d’interruption associée à la fin de conversion ADC
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
<!-- ******************** -->
<section>
<!-- A -->
<h1 class="en_tete">Les interruptions</h1>
<div style="font-size:48pt; left:33cm; width:26.0cm; top:7cm;">
* Principe des interruptions
* Événements produisant des interruptions (externes ou internes)
* Mise en œuvre
* Deux exemples (interruption sur une entrée et sur une fin de conversion)
</div>
</section>






