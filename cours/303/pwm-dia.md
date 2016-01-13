<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">PWM : Modulation de Largeur d’Impulsion</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** |  PWM
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">PWM : Modulation de Largeur d’Impulsion</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">PWM : Modulation de Largeur d’Impulsion</h1>
<div class="liste_demi"; style="font-size:48pt; left:33cm; width:26.0cm; top:8cm;">
* Principe
* Fréquence
* Programmer un PWM
* Convertisseur numérique-analogique
* Réalisation par des circuits logiques
</div>
</section>

<!-- Page variation, 3 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Intensité variable</h1>
<div style="font-size:60pt; left:2.65cm; top:6cm;">
Comment faire varier l’intensité d’une LED ?
</div>
<img src="./images/intens-3led-100dpi.png" style="top:13cm; left:6cm; width:31cm;" />
</section>

<section>
<!-- A -->
<h1 class="en_tete">Intensité variable</h1>
<div style="font-size:60pt; left:2.65cm; top:6cm;">
Comment faire varier l’intensité d’une LED ?
</div>
<img src="./images/varie-intens-300dpi.png" style="top:13cm; left:6cm; width:31cm;" />
</section>

<!-- Page pleine-->
<section>
<!-- A -->
<h1 class="en_tete">Autre solution ?</h1>
</section>

<!-- Page clignotement, 2 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Intensité variable</h1>
<div style="font-size:60pt; left:6cm; top:6cm;">
Clignotement
</div>
<img src="./images/clign-vite-a-300dpi.png" style="top:12cm; left:6cm; width:35cm;" />
<!-- 2 --><img src="./images/clign-vite-b-300dpi.png" style="top:12cm; left:6cm; width:35cm;" />
<!-- 2 --><div style="font-size:60pt; left:6cm; top:15cm;">
<!-- 2 -->... plus rapide
<!-- 2 --></div>
</section>

<!-- Page : principe -->
<section>
<!-- A -->
<h1 class="en_tete">PWM : principe</h1>
<img src="./images/pwm-300dpi.png" style="top:12cm; left:3cm; width:54cm;" />
<!-- 2 --><div style="font-size:48pt; left:5cm; top:25cm; width:55cm">
<!-- 2 -->_**P**ulse **W**idth **M**odulation_ = Modulation de Largeur d’Impulsion
<!-- 2 --></div>
</section>

<!-- Page fréquences, 4 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Quelle fréquence ?</h1>
<div style="font-size:61pt; left:2.65cm; top:8cm; width:55cm">
* Selon les applications du PWM, les fréquences sont très différentes, de quelques Hz à des dizaines de MHz.
</div>
<!-- 2345 --><div style="font-size:60pt; left:2.65cm; top:14cm;">
<!-- 2345 -->Pour des applications visuelles :
<!-- 2345 -->
<!-- 345 -->* L’œil a une fréquence limite de perception du clignotement
<!-- 45 -->* On ne voit pas clignoter un tube fluorescent, à 100 Hz (2 x 50 Hz)
<!-- 5 -->* Les cônes et les bâtonnets n’ont pas la même fréquence limite
<!-- 2345 --></div>
</section>

<!-- Page programmation, demi, 3 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Programmation d’un signal PWM</h1>
<div class="liste_demi"; style="font-size:56pt; left:36cm; width:21.0cm; top:6cm; line-height: 1.2;">
Comment programmer des signaux PWM avec un microcontrôleur ?
</div>
<!-- 234 --><div class="liste_demi"; style="font-size:56pt; left:36cm; width:21.0cm; top:18cm;">
<!-- 234 -->* Allumer – attendre
<!-- 34 -->* éteindre – attendre
<!-- 234 --></div>
<!-- 4 --><div class="liste_demi"; style="font-size:56pt; left:36cm; width:21.0cm; top:25.0cm; color: #e2001a;">
<!-- 4 -->* et répéter !
<!-- 4 --></div>
</section>

<!-- Page programme par période -->
<section>
<!-- A -->
<h1 class="en_tete";>Programmation par période</h1>
<div style="top:6.5cm; left:2cm; width: 5cm; font-size:41pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
#define LedOn digitalWrite(P1_0, 1)
#define LedOff digitalWrite(P1_0, 0)
uint16_t pwmLed; // valeur du PWM, 0 à 100

void setup() { // Initialisations
  pinMode(P1_0, OUTPUT); // LED en sortie
  pwmLed = 25; // valeur du PWM.
}

void loop() { // Boucle infinie, durée 10ms => un cycle du PWM à 100 Hz
  LedOn;
  delayMicrosecond(100*pwmLed); // durée de l'impulsion
  LedOff;
  delayMicrosecond(100*(100-pwmLed); // solde de la période
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<!-- Page plusieurs PWM, 3 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Programmer plusieurs PWM</h1>
<div style="font-size:61pt; left:2.65cm; top:8cm; width:55cm">
Comment programmer plusieurs signaux PWM en même temps ?

<!-- 23 -->* Difficile si la boucle principale dure une période complète du PWM
<!-- 3 -->* Plus facile si la boucle principale dure le temps de la plus courte impulsion possible du PWM
</div>
</section>

<!-- Page programme plusieurs PWM -->
<section>
<!-- A -->
<h1 class="en_tete";>Programmer plusieurs PW</h1>
<div style="top:6.5cm; left:2cm; width: 5cm; font-size:41pt;">

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
uint8_t pwmLed; // valeur du PWM, 0 à 255 (8 bits)
uint8_t cptPwm; // compteur du PWM

void setup() { // Initialisations
  pinMode(P1_0, OUTPUT); // LED en sortie
  pwmLed = 64; // valeur du PWM. Elle est ici fixe, mais pourrait changer
               // à tout moment en complétant le programme.
  cptPwm = 0; // compteur du PWM
}

void loop() { // Boucle infinie, durée 39us (256 * 39us = ~10ms)
  if ((cptPwm==0) && (pwmLed>0)) LedOn; // seulement pour une valeur positive
  if (cptPwm==pwmLed) LedOff;

  cptPwm++; // passe automatiquement de 255 à 0 (overflow)
  delayMicroseconds(39);
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<!-- Page séquences, demi, 3 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Séquences en PWM</h1>
<div class="liste_demi"; style="font-size:52pt; left:33cm; width:23.0cm; top:8cm;">
* Comment utiliser ce PWM ?
<!-- 23 -->* Sur des enseignes et afficheurs, on peut créer des séquences.
</div>
<!-- 3 --><div class="liste_demi"; style="font-size:52pt; left:33cm; width:26.0cm; top:19cm;">
<!-- 3 -->* Exemple : LED imitant le repos.
<!-- 3 --></div>
</section>

<!-- Page séquences, 3 grandes imagess -->
<section>
<!-- A -->
<h1 class="en_tete">Séquences en PWM</h1>
<img src="./images/chrono-repos-300dpi.png" style="top:12cm; left:3cm; width:54cm;" />
<!-- 2 --><img src="./images/chrono-repos-3c-300dpi.png" style="top:12cm; left:3cm; width:54cm;" />
<!-- 3 --><img src="./images/chrono-repos-5c-300dpi.png" style="top:12cm; left:3cm; width:54cm;" />
<div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
**Enseignes et afficheurs à LED** |  PWM
</div>
</section>

<!-- Page séquence PWM -->
<section>
<!-- A -->
<h1 class="en_tete";>Séquences en PWM</h1>
<div style="top:5.4cm; left:2cm; width: 5cm; font-size:38pt;">
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ {.C  .numberLines}
uint16_t pwmLed; // valeur du PWM, 0 à 255 (8 bits,16 bits pour les calculs)
uint16_t cpt10ms = 0; // compteur des cycles, de 0 à 400 (par 10ms, total 4s)
void loop() { // Boucle infinie, durée 39us (256 * 39us = ~10ms)
  if (cptPwm==0) {
    cpt10ms++;
    if (cpt10ms<100) { //première seconde
      pwmLed = cpt10ms * 256 / 100; // droite montante
    } else if (cpt10ms<200) { // deuxième seconde
      pwmLed = 256 - ((cpt10ms-100) * 256 / 100); // droite descendante
    } else {
      pwmLed = 0;
      if ( cpt10ms==400) cpt10ms = 0; // fin des 4 secondes
    }
  }
  if ((cptPwm==0) && (pwmLed>0)) LedOn; // LED allumée si la valeur est positive
  if (cptPwm==pwmLed) LedOff;
  cptPwm++; // passe automatiquement de 255 à 0 (overflow)
  delayMicroseconds(39);
}
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
</div>
</section>

<!-- Page pleine ADC-->
<section>
<!-- A -->
<h1 class="en_tete">Convertisseur numérique-analogique en PWM</h1>
<div class="liste_demi"; style="font-size:52pt; left:33cm; width:25.0cm; top:8cm; line-height: 1.2;">
* Transmettre une information variable vers l’extérieur
</div>
<!-- 2 --><div class="liste_demi"; style="font-size:52pt; left:33cm; width:25.0cm; top:15cm; line-height: 1.2;">
<!-- 2 -->* Conversion Numérique-Analogique DAC  Digital to Analog Converter
<!-- 2 --></div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Convertisseur numérique-analogique en PWM</h1>
<img src="./images/pwm-adc.png" style="top:9cm; left:3cm; width:54cm;" />
</section>

<!-- Page logique, demi, 2 arrivées -->
<section>
<h1 class="en_tete">PWM réalisé avec des circuits logiques</h1>
<div class="liste_demi"; style="font-size:52pt; left:31cm; width:28.0cm; top:8cm; line-height: 1.2;">
* Comment soulager le microcontrôleur de la génération du PWM ?
</div>
<!-- 2 --><div class="liste_demi"; style="font-size:52pt; left:31cm; width:28.0cm; top:16cm; line-height: 1.2;">
<!-- 2 -->* En utilisant des circuits logiques spécialisés !
<!-- 2 --></div>
</section>

<!-- Timer, 2 arrivées images -->
<section>
<!-- A -->
<h1 class="en_tete">PWM réalisé avec des circuits logiques</h1>
<img src="./images/compteur-pwm-300dpi.png" style="top:7cm; left:3cm; width:32cm;" />
<!-- 2 --><img src="./images/chrono-timer-pwm-300dpi.png" style="top:15.5cm; left:34cm; width:24.5cm;" />
</section>

<!-- Page pleine Timer uC, petite image -->
<section>
<!-- A -->
<h1 class="en_tete">C’est le Timer d’un microcontrôleur</h1>
<img src="./images/compteur-pwm-300dpi.png" style="top:7cm; left:36cm; width:21cm;" />
</section>

<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">PWM : Modulation de Largeur d’Impulsion</h1>
<div class="liste_demi"; style="font-size:43pt; width:23.0cm; top:7.5cm;">
* Principe :
* Fréquence :    > 100 Hz pour l’oeil
* Programmer un PWM (occupe le proc.)
* Convertisseur DAC (+ filtre)
* Réalisation par des circuits logiques, inclus dans les microcontrôleurs
</div>
<img src="./images/pwm-simple.png" style="top:7.0cm; left:42.0cm; width:15cm;" />
</section>






