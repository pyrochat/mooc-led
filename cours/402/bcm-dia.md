<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">BCM : la modulation codée binaire</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | BCM : la modulation codée binaire
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">BCM : la modulation codée binaire</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">BCM : la modulation codée binaire</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* PWM sur une matrice
* Tolérance sur la forme
* Principe du BCM
* Avantages et limites du BCM
* Programmation de signaux BCM
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">PWM sur une matrice</h1>
<img src="./images/pwm.svg" style="top:6cm; left:10cm; width:40cm; ">
<div style="top: 17cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* Le **PWM** est généralement utilisé pour faire varier l’intensité d’une LED
<!-- 234 -->* Sur un afficheur matriciel, l’intensité de chaque LED doit être **indépendante**
<!-- 34 -->* Pour changer l’état d’une LED, il faut renvoyer l’état de **toutes** les LED
</div>
<!-- 4 --><div style="top: 27cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 4 -->* Fréquence de rafraîchissement : F~raf~ = F~pwm~ × N~intens~
</section>


<section>
<!-- A -->
<h1 class="en_tete">Tolérance sur la forme</h1>
<!-- 23 --><img src="./images/forme-dif.svg" style="top:12cm; left:10cm; width:30cm; ">
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* L’intensité perçue par l’œil ne dépend pas de la forme du signal
</div>
<!-- 3 --><div style="top: 27cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 3 -->* Ces deux signaux donnent la même impression visuelle
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Principe du BCM</h1>
<!-- 23 --><img src="./images/bcm.svg" style="top:9.5cm; left:10cm; width:25cm; ">
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* Découper la période du signal en tranches dont les durées sont les **poids binaires**
</div>
<!-- 3 --><div style="top: 28.5cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 3 -->* Modulation Codée Binaire (*Binary Coded Modulation* BCM)
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Exemples</h1>
<img src="./images/bcm-3per.svg" style="top:7cm; left:6cm; width:45cm; ">
<div style="top: 28.5cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* Signaux représentés sur 3 périodes
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Avantages et limites du BCM</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* En PWM, pour une résolution de b bits, il faut 2^b^ raffraîchissements des états des LED
<!-- 345 -->* En BCM, il en faut seulement b.
</div>
<img src="./images/bcm-change1.svg" style="top:12.5cm; left:6cm; width:30cm; ">
<!-- 345 --><img src="./images/bcm-change2.svg" style="top:12.5cm; left:6cm; width:30cm; ">
<!-- 45 --><div style="top: 26cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 45 -->* Le temps minimum entre deux raffraîchissements est le même
<!-- 5 -->* Du temps libre se dégage sur les bits de poids fort, utilisable pour calculer l’état suivant
<!-- 45 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programmation de signaux BCM</h1>
<div style="top: 5.2cm; left: 1.5cm; font-size: 38pt; line-height: 1.6; width:58cm;">
~~~~~~~ { .c .numberLines startFrom="8" }
uint8_t Intens[8] = {0, 0, 0, 0, 0, 0, 128, 0};
uint8_t n, b;
uint8_t t = 0;

int main() {
  WDTCTL = WDTPW+WDTHOLD; // stoppe le WatchDog
  BCSCTL1 = CALBC1_16MHZ; DCOCTL = CALDCO_16MHZ;
  P1DIR = 0xFF; // P1 tout en sortie

  while (1) { // Boucle infinie :
    for (n=0; n<BITS_BCM; n++) { // pour une période du BCM
      for (b=0; b<8; b++) { // pour chaque bit de sortie
        if (Intens[b] & (1<<n)) P1OUT|=(1<<b); else P1OUT&=~(1<<b);
      }
      Attente(1<<n);
    }
    // ...calcul des prochaines valeurs des intensités
  }
}
~~~~~~~
</div>
<div style="top: 5.3cm; left: 40cm; font-size: 36pt; line-height: 1.6; width:26cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define BITS_BCM 8

void Attente(uint16_t dur) {
  volatile uint16_t i;
  for (i=0; i<(dur*64); i++) {
  }
}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">BCM : la modulation codée binaire</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* PWM sur une matrice
* Tolérance sur la forme
* Principe du BCM
* Avantages et limites du BCM
* Programmation de signaux BCM
</div>
</section>


