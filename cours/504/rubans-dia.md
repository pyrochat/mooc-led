<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Rubans de LED</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Rubans de LED
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Rubans de LED</h1>
<div style="top:6.5cm; left:39cm; width:23cm; font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div style="font-size:52pt; left:39cm; width:26.0cm; top:13cm; line-height: 1.4;">
* Rubans uniformes
* Rubans addressables
* Signaux de commande
* Programmation
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Plusieurs sortes de rubans de LED</h1>
<div style="font-size:50pt; left:3cm; width:46cm; top:7cm; line-height: 2;">
* Des formes très différentes
<!-- 2 -->* Uniformes ou adressables
</div>
<img src="./images/diffus.jpg" style="top:18cm; left:3cm; width:13cm;" />
<img src="./images/ruban-ic.png" style="top:21cm; left:20cm; width:19cm;" />
<img src="./images/ruban-ic2.png" style="top:18cm; left:42cm; width:14cm;" />
<!-- 2 --><img src="./images/adressable.png" style="top:7cm; left:25cm; width:14.7cm;" />
<!-- 2 --><img src="./images/uniforme-bleu.png" style="top:7cm; left:43cm; width:14cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Rubans uniformes</h1>
<div style="font-size:50pt; left:3cm; width:57cm; top:7cm;">
* une seule couleur un seule intensité à un instant-donné, pour toutes les LED
</div>
<img src="./images/archi-uniforme.svg" style="top:10cm; left:3cm; width:37cm;" />
<!-- 2 --><img src="./images/uniforme-ac.svg" style="top:23cm; left:3cm; width:30cm;" />
<!-- 2 --><div style="font-size:50pt; left:3cm; width:46cm; top:19.5cm;">
<!-- 2 -->* monochrome ou RGB (Rouge Vert Bleu)
<!-- 2 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Commande par transistors N-MOS</h1>
<img src="./images/nmos-ac.svg" style="top:7cm; left:10cm; width:34cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Rubans adressables</h1>
<div style="font-size:50pt; left:3cm; width:57cm; top:7cm;">
* Chaque LED est indépendante pour sa couleur et son intensité
<!-- 234 -->* Rubans adressables *(Addressable strips)*
</div>
<!-- 34 --><img src="./images/archi-adressable.svg" style="top:13.5cm; left:3cm; width:42cm;" />
<!-- 4 --><div style="font-size:50pt; left:3cm; width:46cm; top:24cm;">
<!-- 4 -->* Horloge asymétrique
<!-- 4 --></div>
<!-- 4 --><img src="./images/horloge-asym.svg" style="top:27cm; left:3cm; width:31cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèles</h1>
<div style="font-size:50pt; left:39cm; width:57cm; top:7cm;">
Chaque registre :

- garde la première donnée
- transmet les suivantes
</div>
<img src="./images/transmission-ws28.svg" style="top:7cm; left:3cm; width:32cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Génération des signaux</h1>
<div style="font-size:48pt; left:3cm; width:57cm; top:7cm; line-height: 1.2;">
* Le fabricant donne des contraintes sur le *timing* des signaux
<!-- 34 -->* Difficile de tenir les spécifications avec des processeurs dont l'horloge est à 16 MHz
<!-- 4 -->* Plus facile avec un processeurs dont l'horloge est de 48 MHz : **ARM**
</div>
<!-- 234 --><img src="./images/timing-asym.svg" style="top:18cm; left:3cm; width:32cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Bit banging</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 37pt; line-height: 1.5; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define WS2811_Pin GPIO_PIN_10
#define PORT_WS2811 GPIOA
#define BIT_WS2811 10
#define WS28On (PORT_WS2811->ODR|=(1<<BIT_WS2811))
#define WS28Off (PORT_WS2811->ODR&=~(1<<BIT_WS2811))

#define Un WS28On;WS28On;WS28On;WS28On;WS28On;WS28On;WS28On;WS28Off;
#define Zero WS28On;WS28Off;WS28Off;WS28Off;WS28Off;WS28Off;WS28Off;WS28Off

#define UnCourt WS28On;WS28On;WS28On;WS28On;WS28On;WS28On;WS28Off;
#define ZeroCourt WS28On;WS28Off;WS28Off;WS28Off;WS28Off;WS28Off;WS28Off;
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Initialisations et variables</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 37pt; line-height: 1.5; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="13" }
// Contenu du ruban :
#define LgRuban 50
uint32_t Ruban[LgRuban];

int main(void) {     // Programme principal
  HAL_Init();        // Initialisation de la librairie Hardware Level
  SystemClock_Config(); // Configure l'horloge système
  MX_GPIO_Init();    // Initialise les périphériques
  PORT_WS2811->MODER |= (0b01 << (BIT_WS2811*2)); // broche en sortie

  uint32_t i;
  volatile uint16_t j;
  uint32_t v, idx;
  uint32_t *pt;      // pointeur dans le tableau

  // Initialisation fixe des couleurs
  for (idx=0; idx<LgRuban; idx++) {
    Ruban[idx] = 1<<idx;
  }
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Boucle critique</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 37pt; line-height: 1.5; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="33" }
 while (1) { // boucle principale
    pt = Ruban;
    __ASM volatile ("cpsid i"); // interrupt OFF

    for (idx=0; idx<LgRuban; idx++) {
      v = *pt;
      if (v & (1<<23)) {Un;} else {Zero;}
      if (v & (1<<22)) {Un;} else {Zero;}
      if (v & (1<<21)) {Un;} else {Zero;}
      if (v & (1<<20)) {Un;} else {Zero;}
      if (v & (1<<19)) {Un;} else {Zero;}
      if (v & (1<<18)) {Un;} else {Zero;}
      if (v & (1<<17)) {Un;} else {Zero;}
      if (v & (1<<16)) {Un;} else {Zero;}
      if (v & (1<<15)) {Un;} else {Zero;}
      if (v & (1<<14)) {Un;} else {Zero;}
      if (v & (1<<13)) {Un;} else {Zero;}
      if (v & (1<<12)) {Un;} else {Zero;}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Boucle critique</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 37pt; line-height: 1.5; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="51" }
      if (v & (1<<11)) {Un;} else {Zero;}
      if (v & (1<<10)) {Un;} else {Zero;}
      if (v & (1<<9)) {Un;} else {Zero;}
      if (v & (1<<8)) {Un;} else {Zero;}
      if (v & (1<<7)) {Un;} else {Zero;}
      if (v & (1<<6)) {Un;} else {Zero;}
      if (v & (1<<5)) {Un;} else {Zero;}
      if (v & (1<<4)) {Un;} else {Zero;}
      if (v & (1<<3)) {Un;} else {Zero;}
      if (v & (1<<2)) {Un;} else {Zero;}
      if (v & (1<<1)) {UnCourt;} else {ZeroCourt;}
      pt++;
      if (v & (1<<0)) {UnCourt;} else {ZeroCourt;}
    }

    __ASM volatile ("cpsie i"); // interrupt ON
    for (j=0; j<500; j++) {     // reset
    }
  }
~~~~~~~
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programmer des animations</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 36pt; line-height: 1.5; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="71" }
    temps++; // comptage du temps

    // Clignotement des LED 0 et 30 :
    if (temps==500) {
        Ruban[30] = Ruban[0] = 0xFFFFFF;
    }
    if (temps==1000) {
        temps=0; Ruban[30] = Ruban[0] = 0;
    }
    // Changement progressif de la couleur de la LED 47 :
    Ruban[47]++;
  }
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Rubans de LED</h1>
<div style="font-size:52pt; left:39cm; width:26.0cm; top:9cm; line-height: 1.4;">
* Rubans uniformes
* Rubans addressables
* Signaux de commande
* Programmation
</div>
</section>

