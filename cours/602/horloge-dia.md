<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e20014; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Horloges temps réel</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Horloges temps réel</h1>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Horloges temps réel
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Horloges temps réel</h1>
<div style="font-size:45pt; left:33cm; width:26.0cm; top:8cm;">
* Principe d’une horloge électronique
* Alimentation permanente
* Programmation avec un microcontrôleur
* Circuits spécialisés
* Horloges internes
</div>
</section>

<!-- Page base temps -->
<section>
<!-- A -->
<h1 class="en_tete">Base de temps et division</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;">
* Les montres mécaniques utilisent un **mouvement oscillant** aussi stable que possible
<!-- 23456 -->* Des **engrenages** permettent ensuite d’obtenir les secondes, les minutes et les heures
</div>
<!-- 3456 --><div style="top:17cm; left:2.65cm; line-height:1.2; font-size:50pt;">
<!-- 3456 -->* Une montre électronique utilise un oscillateur à **quartz** comme base de temps
<!-- 456 -->* Généralement à 32’768 Hz
<!-- 3456 --></div>
<!-- 56 --><img src="./images/quartz.png" style="top:21cm; left:27cm; width:12cm;" />
<!-- 6 --><div style="top:27cm; left:2.65cm; line-height:1.2; font-size:50pt;">
<!-- 6 -->* 15 diviseurs par 2 vont permettre d’obtenir un signal de 1 Hz
<!-- 6 --></div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Base de temps et division</h1>
<!-- 1 --><img src="./images/div2.png" style="top:15cm; left:3cm; width:51cm;" />
<!-- 2 --><img src="./images/horloge-32k-div.png" style="top:15cm; left:3cm; width:54cm;" />
</section>

<!-- Page alim -->
<section>
<!-- A -->
<h1 class="en_tete">Alimentation</h1>
<div style="top:7cm; left:2.65cm; line-height:2.5; font-size:50pt;">
* Une alimentation doit être prévue lorsque le dispositif n’est pas sous tension
<!-- 234567 -->* On utilise souvent des piles au Lithium
<!-- 576 -->* Des super-condensateurs *Supercap* peuvent aussi être utilisés
</div>
<!-- 34 --><img src="./images/Battery-lithium-cr2032.jpg" style="top:13cm; left:37cm; width:8cm;" />
<!-- 4 --><img src="./images/support.jpg" style="top:13cm; left:48cm; width:8cm;" />
<!-- 67 --><img src="./images/supercap.jpg" style="top:23cm; left:7cm; width:10cm;" />
<!-- 7 --><img src="./images/supercap-int.png" style="top:22cm; left:23cm; width:8cm;" />
</section>

<!-- Page progr -->
<section>
<!-- A -->
<h1 class="en_tete">Programmation sur un microcontrôleur</h1>
<div style="top:9cm; left:2.65cm; line-height:2.5; font-size:50pt;">
* Beaucoup de microcontrôleurs prévoient l’usage d’un **quartz à 32 kHz**
<!-- 23 -->* Il va falloir mettre le microcontrôleur **en veille** un maximum de temps
<!-- 3 -->* Le code va fortement dépendre de la **famille** du microcontrôleur utilisé
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programme pour un AVR</h1>
<div style="top:5.5cm; left:2cm; font-size:30pt; width:57cm">
~~~~~~~ { .c .numberLines startFrom="1" }
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

volatile uint8_t secondes;

// Il faut un quartz 32 khz sur les broches TOSC1 et TOSC2
ISR (TIMER2_OVF_vect) {
	secondes++;
    ...
}

int main () {
  Temps=0;
  ASSR=(1<<AS2); // oscillateur quartz 32 khz
  TCCR2B=0b101; // prédivision par 128
  TIMSK2=(1<<TOIE2); // interruption Timer2 Overflow autorisée
  sei(); // toutes les interruptions autorisées
  while (1) { // boucle correspondant à tous les réveils dus à l’interruption
    set_sleep_mode(SLEEP_MODE_PWR_SAVE); // mise en veille
    sleep_enable();
    sleep_mode(); // mode normal après un réveil
    sleep_disable();
  }
}
~~~~~~~
<!-- retour au mode normal -->
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programme pour un AVR</h1>
<div style="top:8cm; left:2cm; font-size:30pt; width:57cm">
~~~~~~~ { .c .numberLines startFrom="8" }
    ...
	secondes++;
    if (secondes == 60) {
      secondes = 0;
      minutes++;
      if (minutes == 60) {
        minutes = 0;
        heures++;
      if (heures == 24) {
        heures = 0;
        ...
      }
    }
    ...
~~~~~~~
<!-- retour au mode normal -->
</div>
</section>

<!-- Page RTC -->
<section>
<!-- A -->
<h1 class="en_tete">Circuits intégrés spécialisés</h1>
<div style="top:6.5cm; left:2.65cm; line-height:1.5; font-size:48pt;">
* Il existe de nombreux circuits intégrés qui réalisent une horloge temps réel
<!-- 23 -->* DS1307, PCF8523, PCF8563, bq32000, ...
</div>
<!-- 3 --><img src="./images/bq32000.png" style="top:16cm; left:6cm; width:40cm;" />
</section>


<!-- Page RTC interne-->
<section>
<!-- A -->
<h1 class="en_tete">Horloge temps réel interne</h1>
<div style="top:6.5cm; left:2.65cm; line-height:2.5; font-size:44pt;">
* Certains microcontrôleurs intègrent une **zone séparée** prévue pour une horloge temps réel
</div>
<!-- 2 --><img src="./images/STM32F051-RTC.png" style="top:11.5cm; left:6cm; width:33cm;" />
</section>

<!-- Page Conclusion demi-->
<section>
<!-- A -->
<h1 class="en_tete">Horloges temps réel</h1>
<div style="font-size:45pt; left:33cm; width:26.0cm; top:8cm;">
* Principe d’une horloge électronique
* Alimentation permanente
* Programmation avec un microcontrôleur
* Circuits spécialisés
* Horloges internes
</div>
</section>
