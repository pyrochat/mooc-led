<!-- DIAPORAMA Registres série-parallèle-->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- Contenu : -->
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:19cm; left:5.65cm; font-size:70pt;font-family: Impact, sans-serif;">Registres série-parallèle</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Registres série-parallèle
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<div style="top: 7.5cm; left: 33.5cm; font-size: 53pt; line-height: 1.5;">
* Besoin de broches
* Registre série
* Registre série-parallèle
* Le circuit 74HC595
* Sorties à courant constant
* Programmation
</div>
</section>

<!-- Page besoin de broches, 5 arrivées -->
<section>
<!-- A -->
<h1 class="en_tete">Besoin de broches</h1>
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
* Beaucoup de LED...
<!-- 2345 -->* Beaucoup de broches !
<!-- 345 -->* Circuits logiques
<!-- 45 -->* Latch adressables (74HC259)
<!-- 5 -->* Registres série-parallèle (74HC595)
</div>
</section>

<!-- Page reg serie, 2 images-->
<section>
<!-- A -->
<h1 class="en_tete">Registres série</h1>
<img src="./images/reg-ser.png" style="top:11cm; left:5cm; width:50cm;" />
</section>

<section>
<!-- A -->
<h1 class="en_tete">Registres série</h1>
<img src="./images/reg-ser.png" style="top:7cm; left:31cm; width:27cm;" />
<img src="./images/reg-ser-timing.png" style="top:7cm; left:2.65cm; width:27cm;" />
</section>

<!-- Page demi écran-->
<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<img src="./images/reg-ser.png" style="top:7cm; left:31cm; width:27cm;" />
</section>

<!-- Page reg ser-par, 2 images-->
<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<img src="./images/reg-ser-par.png" style="top:11cm; left:5cm; width:50cm;" />
</section>

<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<img src="./images/reg-ser-par.png" style="top:7cm; left:35cm; width:23cm;" />
<img src="./images/reg-ser-par-timing.png" style="top:7cm; left:2cm; width:32cm;" />
</section>

<!-- Page comparaison timings -->
<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<img src="./images/reg-ser-timing.png" style="top:7cm; left:36cm; width:19cm;" />
<img src="./images/reg-ser-par-timing.png" style="top:7cm; left:2cm; width:32cm;" />
</section>

<!-- Page 74HC595, 2 + 1 images-->
<section>
<!-- A -->
<h1 class="en_tete">74HC595</h1>
<img src="./images/reg-595.png" style="top:11cm; left:2.56cm; width:35cm;" />
<!-- 2 --><img src="./images/pin-595-ti.png" style="top:11cm; left:42cm; width:15cm;" />
</section>

<!-- Page cascade : -->
<section>
<!-- A -->
<h1 class="en_tete">Registres en cascade</h1>
<img src="./images/reg-595-cascade.png" style="top:11cm; left:3cm; width:55cm;" />
</section>

<!-- Page constant, 4 arrivées-->
<section>
<!-- A -->
<h1 class="en_tete">Registres à sorties à courant constant</h1>
<img src="./images/reg-16bits-sc.png" style="top:5.5cm; left:5cm; width:50cm;" />
<!-- 234 --><div style="top: 24cm; left: 3cm; font-size: 48pt;">
<!-- 234 -->* TB62701, TLC5905, A6276...
<!-- 34 -->* SUM2016 !
<!-- 234 --></div>
<!-- 4 --><img src="./images/sum2016.png" style="top:22.5cm; left:23cm; width:18cm;" />
</section>

<!-- Page demi écran chinois-->
<section>
<!-- A -->
<h1 class="en_tete">Chinois...</h1>
<img src="./images/sum2016.png" style="top:8cm; left:38cm; width:20cm;" />
</section>

<!-- Page programmation, 3 pages-->
<section>
<!-- A -->
<h1 class="en_tete">Programmation</h1>
<div style="top:6.5cm; left:2cm; font-size:52pt;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define SortieSerieOn P1OUT |= (1<<0)
#define SortieSerieOff P1OUT &=~(1<<0)

#define ClockSerHaut P1OUT |= (1<<1)
#define ClockSerBas P1OUT &=~(1<<1)

#define ClockParHaut P1OUT |= (1<<2)
#define ClockParBas P1OUT &=~(1<<2)
~~~~~~~
<!-- retour au mode normal pour l’éditeur -->
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programmation</h1>
<div style="top:6.5cm; left:2cm; font-size:52pt; width:58cm;">
~~~~~~~ { .c .numberLines startFrom="10" }
void Envoie8bitsSerie (uint8_t valeur) {
  uint16_t i;
  for (i=0; i<8; i++) {
    if (valeur & (1<<i)) {
      SortieSerieOn;
    } else {
      SortieSerieOff;
    }
    ClockSerHaut; ClockSerBas;
  }
  ClockParHaut; ClockParBas;
}
~~~~~~~
<!-- retour au mode normal pour l’éditeur -->
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Programmation</h1>
<div style="top:6.5cm; left:2cm; font-size:52pt; width:58cm;">
~~~~~~~ { .c .numberLines startFrom="11" }
...
  for (i=0; i<8; i++) {
    if (valeur & (1<<0)) {
      SortieSerieOn;
    } else {
      SortieSerieOff;
    }
    ClockSerHaut; ClockSerBas;
    valeur = valeur >> 1;
...
~~~~~~~
<!-- retour au mode normal pour l’éditeur -->
</div>
</section>

<!-- Page conclusion demi-->
<section>
<!-- A -->
<h1 class="en_tete">Registres série-parallèle</h1>
<!-- Contenu : -->
<div style="top: 7.5cm; left: 33.5cm; font-size: 53pt; line-height: 1.5;">
* Besoin de broches
* Registre série
* Registre série-parallèle
* Le circuit 74HC595
* Sorties à courant constant
* Programmation
</div>
</section>




 

 
