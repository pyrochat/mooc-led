<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Afficheurs matriciels multiplexés</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Affichages matriciels
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels multiplexés</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels multiplexés</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:11cm;">
* Augmentation du nombre de LED
* Usage du multiplexage temporel
* Conséquence sur la luminosité
* Programmation
</div>
</section>


<!-- Option : Page bienvenue et nom, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels multiplexés</h1>
<div style="top:6.5cm; left:34cm; width:23cm; text-align: left;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:13cm;">
* Augmentation du nombre de LED
* Usage du multiplexage temporel
* Conséquence sur la luminosité
* Programmation
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Schéma d’un afficheur matriciel</h1>
<img src="./images/aff-8x16.svg" style="top:7cm; left:1cm; width:35cm;" />
<!-- 2 --><img src="./images/reg-ser-par-timing-s.svg" style="top:17cm; left:37cm; width:22cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Conséquence de l’augmentation du nombre de LED</h1>
<div style="font-size:52pt; left:3cm; width:46cm; top:7cm;">
* 32 x 32 pixels => 1024 sorties de registre
<!-- 234567 -->* 128 registres 8 bits 74HC595 et 1024 résistances
<!-- 34567 -->* Trois fois plus pour une matrice RGB !
<!-- 4567 -->* Registres 16 bits à sortie à courant constant SUM2016
<!-- 557 -->* 192 circuits intégrés et 192 résistances
</div>
<!-- 67 --><div style="font-size:52pt; left:3cm; width:46cm; top:21cm;">
<!-- 67 -->* Peut-on obtenir des schémas plus simples ?
<!-- 7 -->* Avec le multiplexage temporel !
<!-- 67 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Regroupement des anodes et des cathodes par direction</h1>
<img src="./images/matrice-mux-4x8.svg" style="top:7cm; left:8cm; width:40cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Multiplexage temporel</h1>
<img src="./images/timing-8x4.svg" style="top:11cm; left:1cm; width:56cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Schéma d’un afficheur matriciel multiplexé</h1>
<img src="./images/aff-4x8-mux.svg" style="top:6cm; left:4cm; width:35cm;" />
<!-- 234 --><div style="font-size:52pt; left:40cm; width:18cm; top:8cm;">
<!-- 234 --> Courants ?
<!-- 234 --></div>
<!-- 34 --><div style="font-size:52pt; left:40cm; width:18cm; top:13cm;">
<!-- 34 -->* n anodes
<!-- 4 -->* 1 cathode
<!-- 34 --></div>
</section>



<section>
<!-- A -->
<h1 class="en_tete">Démultiplexeur ou décodeur</h1>
<img src="./images/mux-138.svg" style="top:6cm; left:15cm; width:10cm;" />
<!-- 2 --><div style="font-size:52pt; left:40cm; width:18cm; top:13cm;">
<!-- 2 -->* 74HC138
<!-- 2 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Courant nominal et courant maximal</h1>
<div style="font-size:52pt; left:3cm; width:48cm; top:7cm;">
* Un courant **nominal** est donné par le fabricant
<!-- 23 -->* Le courant **maximal** est supérieur, mais ne peut pas être permanent
</div>
<!-- 3 --><div style="font-size:52pt; left:3cm; width:46cm; top:21cm;">
<!-- 3 -->* Souvent : 150 % du courant nominal
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Comparaisons des architectures</h1>
<div style="font-size:52pt; left:3cm; width:56cm; top:7cm;">
* Multiplexage par 2 :
<!-- 2345 -->* Multiplexage par 4 : compromis intéressant
<!-- 345 -->* Multiplexage par 8 et 16 : afficheurs d’intérieur
</div>
<!-- 45 --><div style="font-size:52pt; left:3cm; width:56cm; top:16cm;">
<!-- 45 -->* Facteurs de multiplexage plus importants : trop peu de luminosité
<!-- 45 --></div>
<!-- 5 --><div style="font-size:52pt; left:3cm; width:56cm; top:21cm;">
<!-- 5 -->* Panne d’une LED peut entraîner des perturbations sur les LED voisines
<!-- 5 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programme de commande</h1>
<div style="font-size:52pt; left:3cm; width:56cm; top:7cm;">
* Similaire à un afficheur non multiplexé
<!-- 23 -->* Procédure pour un cycle d’affichage
<!-- 3 -->* Base de temps donné par cette procédure
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Cycle d’affichage</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 36pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
uint8_t matrice[4];

void CyclesMatrice(uint16_t nbCycles) {
  uint16_t n, x, y;
  for (n=0; n<nbCycles; n++) {
    for (y=0; y<4; y++) {           // envoi et affichage des 4 lignes
      for (x=0; x<8; x++) {         // envoi des 8 bits d'une ligne
        if (matrice[y] & (1<<x) {
          DataClear;
        } else {
          DataSet;
        }
        SerClockSet; SerClockClear; // envoie un coup d'horloge série
      }
      ParClockSet; ParClockClear;   // envoie un coup d'horloge parallèle
      AttenteLigne();               // affichage de la ligne durant 25 ms
    }
  }
}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Modification du programme de commande</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 36pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
void Ping() {
  int16_t x=0;
  int16_t y=0;
  int8_t sensX=1;
  int8_t sensY=1;
  do {
    AllumePoint(x,y);
    AfficheMatrice();
    Attente(DELAI);
    EteintPoint(x,y);
    x+=sensX;
    if(x==(MaxX-1)) sensX=(-1);
    if(x==0) sensX=1;
    y+=sensY;
    if(y==(MaxY-1)) sensY=(-1);
    if(y==0) sensY=1;
  } while (!((x==0)&&(y==0)));
}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">La procédure de cycle donne la base de temps</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 36pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
void Ping() {
  int16_t x=0;
  int16_t y=0;
  int8_t sensX=1;
  int8_t sensY=1;
  do {
    AllumePoint(x,y);
    CyclesMatrice(DELAI); // l'affichage fait office de délai

    EteintPoint(x,y);
    x+=sensX;
    if(x==(MaxX-1)) sensX=(-1);
    if(x==0) sensX=1;
    y+=sensY;
    if(y==(MaxY-1)) sensY=(-1);
    if(y==0) sensY=1;
  } while (!((x==0)&&(y==0)));
}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels multiplexés</h1>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:8cm;">
* Augmentation du nombre de LED
* Usage du multiplexage temporel
* Conséquence sur la luminosité
* Programmation
</div>
</section>









