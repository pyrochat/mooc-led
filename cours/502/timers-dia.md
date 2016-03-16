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
<div style="font-size:48pt; left:33cm; width:25.0cm; top:9cm;">
* Gestion du temps
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:12cm;">
* Timers, prédivision, logique de gestion 
</div>
<div style="font-size:48pt; left:34.5cm; width:25.0cm; top:12.5cm;">
et registres de comparaison
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:17cm;">
* Mise en œuvre : exemple du MSP430
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:20cm;">
* Interruptions des timers
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Gestion précise du temps</h1>
<div style="font-size:50pt; left:2.65cm; top:6.5cm; width:55cm">
* Gérer le temps en jouant avec le temps d'exécution des instructions est compliqué
<!-- 23 -->* Des circuits spécialisés vont nous aider
<!-- 3 -->* Par exemple pour générer un PWM :
</div>
<!-- 3 --><img src="./images/compteur-pwm-300dpi.png" style="top:15cm; left:15cm; width:29cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Compteur binaire</h1>
<div style="font-size:50pt; left:2.65cm; top:6.5cm; width:55cm">
* La base d'un timer est un compteur binaire :
</div>
<img src="./images/div2-150dpi.png" style="top:11cm; left:10cm; width:39cm;" />
<!-- 23 --><img src="./images/div2n-150dpi.png" style="top:22cm; left:2.65cm; width:25cm;" />
<!-- 3 --><img src="./images/chrono-compteur-300dpi.png" style="top:22cm; left:32cm; width:23cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les timers</h1>
<img src="./images/timer-base-300dpi.png" style="top:10cm; left:10cm; width:42cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Prédivision</h1>
<img src="./images/timer-base-150dpi.png" style="top:7cm; left:36cm; width:22cm;" />
<img src="./images/pre-div-300dpi.png" style="top:14cm; left:3cm; width:33cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Logique de gestion</h1>
<img src="./images/timer-base-150dpi.png" style="top:7cm; left:36cm; width:22cm;" />
<img src="./images/logique-timer-300dpi.png" style="top:19cm; left:3cm; width:45cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Registres de comparaison</h1>
<img src="./images/registre-comp-300dpi.png" style="top:9cm; left:10cm; width:40cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les timers de microcontrôleurs</h1>
<div style="font-size:48pt; left:32cm; width:27.0cm; top:9cm;">
* Intel 8253 comme complément aux microprocesseurs
</div>
<div style="font-size:48pt; left:32cm; width:27.0cm; top:14cm;">
* Le timer très simple des premiers PIC
* Les AVR et leurs timers 8 et 16 bits
* Des timers 32 bits très complexes sur les ARM
* Timers 16 bits du MSP430
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le timer A du MSP430</h1>
<img src="./images/timer-a.jpg" style="top:6cm; left:10cm; width:26.5cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le timer A du MSP430</h1>
<img src="./images/timer-a1.jpg" style="top:12cm; left:5cm; width:50cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Le registre de contrôle</h1>
<img src="./images/tactl-1.jpg" style="top:6cm; left:6cm; width:43cm;" />
<img src="./images/tactl-2.jpg" style="top:15.5cm; left:6cm; width:50cm;" />
</section>


<section>
<h1 class="en_tete">Le registre de contrôle</h1>
<img src="./images/tactl-1.jpg" style="top:6cm; left:6cm; width:43cm;" />
<img src="./images/tactl-3.jpg" style="top:15.5cm; left:6cm; width:50cm;" />
<!-- A -->
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programme de mise en oeuvre</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="1"}
int main() {
  WDTCTL = WDTPW + WDTHOLD; // Watchdog hors service
  BCSCTL1 = CALBC1_1MHZ;
  DCOCTL = CALDCO_1MHZ;     // Fréquence CPU
  P1DIR |= (1<<0); // P1.0 en sortie pour la LED
  TACTL0 = TASSEL_2 + ID_3 + MC_2;
  while (1) {               // Boucle infinie
    if (TACTL0 & TAIFG) {
      TACTL0 &= ~TAIFG;
      P1OUT ^= (1<<0);      // Inversion LED
    }
  }
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les registres de comparaison</h1>
<img src="./images/timer-a2.jpg" style="top:7cm; left:8cm; width:36cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les registres de comparaison</h1>
<img src="./images/tacctl-1.jpg" style="top:6cm; left:10cm; width:30cm;" />
<img src="./images/tacctl-4.jpg" style="top:15.5cm; left:6cm; width:50cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les registres de comparaison</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
int main() {
  ...
  TACCR0 = 62500; // 62500 * 8 us = 500 ms
  while (1) {     // Boucle infinie
    if (TACCTL0 & CCIFG) {
      TACCTL0 &= ~CCIFG;
      TACCR0 += 62500;
      P1OUT ^= (1<<0); // Inversion LED
    }
  }
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les interruptions associées aux timers</h1>
<div style="font-size:48pt; left:2.65cm; width:57.0cm; top:9cm;">
* Les timers deviennent très intéressant lorsqu'ils sont associés à des interruptions
<!-- 234 -->* Une interruption peur être générée au dépassement de capacité du compteur
<!-- 34 -->* Des interruptions peuvent se produire par les registres de comparaison
<!-- 4 -->* Bien d'autres modes sont disponibles
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">L'interruptions de dépassement de capacité</h1>
<div style="top:5.3cm; left:1.5cm; width: 56cm; font-size:38pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
int main() {
  ...
  TACTL |= TAIE; // Interruption de l'overflow
  _BIS_SR (GIE); // Autorisation générale des interruptions
  while (1) {    // Boucle infinie vide
  }
}
// Timer_A1 Interrupt Vector (TAIV) handler
#pragma vector=TIMER0_A1_VECTOR
__interrupt void Timer_A1 (void) {
  switch (TAIV) {    // discrimination des sources d'interruption
  case  2:           // CCR1 : not used
    break;
  case  4:           // CCR2 : not used
    break;
  case 10:           // Overflow
    P1OUT ^= (1<<0); // Inversion LED
    break;
  }
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">L'interruption de comparaison</h1>
<div style="top:6.5cm; left:1.5cm; width: 56cm; font-size:45pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
int main() {
  ...
  TACCTL0 |= CCIE; // Interruption de la comparaison
  _BIS_SR (GIE);   // Autorisation générale des interruptions
  while (1) {      // Boucle infinie vide
  }
}
#pragma vector=TIMER0_A0_VECTOR
__interrupt void Timer_A0 (void) {
  CCR0 += 62500;
  P1OUT ^= (1<<0); // Inversion LED
}

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">PWM par interruption</h1>
<div style="top:5.3cm; left:1.5cm; width: 56cm; font-size:31pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines startFrom="14"}
int main() {
  ...
  TACTL |= TAIE;   // Interruption de l'overflow
  TACCTL0 |= CCIE; // Interruption de la comparaison
  _BIS_SR (GIE);   // Autorisation générale des interruptions
  while (1) {      // Boucle infinie vide
  }
}
#pragma vector=TIMER0_A1_VECTOR
__interrupt void Timer_A1 (void) {
  switch (TAIV) {    // discrimination des sources d'interruption
  case  2:           // CCR1 : not used
    break;
  case  4:           // CCR2 : not used
    break;
  case 10:           // Overflow
    P1OUT |= (1<<0); // Activer le signal au début du cycle
    break;
  }
}
#pragma vector=TIMER0_A0_VECTOR
__interrupt void Timer_A0 (void) {
  P1OUT &=~(1<<0); // Désactiver le signal au moment donné 
}                  // par le registre de comparaison
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les timers</h1>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:9cm;">
* Gestion du temps
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:12cm;">
* Timers, prédivision, logique de gestion 
</div>
<div style="font-size:48pt; left:34.5cm; width:25.0cm; top:12.5cm;">
et registres de comparaison
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:17cm;">
* Mise en œuvre : exemple du MSP430
</div>
<div style="font-size:48pt; left:33cm; width:25.0cm; top:20cm;">
* Interruptions des timers
</div>
</section>

