<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Afficheurs matriciels</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Affichages matriciels
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels</h1>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:8cm;">
* Notion de pixel
* Caractéristique des afficheurs
* Matrices de LED
* Commandes par registres
* Programmation
* Génération et rafraîchissement
</div>
</section>


<!-- Page bienvenue et nom, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels</h1>
<div style="top:6.5cm; left:34cm; width:23cm; text-align: left;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:13cm;">
* Notion de pixel
* Caractéristique des afficheurs
* Matrices de LED
* Commandes par registres
* Programmation
* Génération et rafraîchissement
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Notion de pixel</h1>
<div style="top: 7cm; left: 2.65cm; font-size: 53pt; line-height: 1.3; width:44cm;">
* **Afficheur** : dispositif électronique permettant de présenter visuellement des données<br/><br/><br/>
<!-- 23456 -->* Affichages matriciels : grille orthonormée
<!-- 3456 -->* Ensemble de **pixels**
<!-- 456 -->* **Résolution** : distance entre un pixel et son plus proche voisin
<!-- 56 -->* *Pitch*. Exemple : **P6** = 6 mm entre chaque pixel
<!-- 6 -->* **Densité** : nombre de pixels par unité de surface
</div>
<!-- 23456 --><img src="./images/afficheur-10x24-300dpi.png" style="top:11cm; left:33.0cm; width:25.5cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Afficheurs à LED</h1>
<img src="./images/afficheur-10x24-300dpi.png" style="top:8cm; left:10cm; width:34cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Commande des LED par des registres</h1>
<img src="./images/afficheur-8x16-200dpi.png" style="top:6cm; left:6cm; width:36cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programme de commande</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define SerClockOn P1OUT |= (1<<4)
#define SerClockOff P1OUT &=~(1<<4)
#define ParClockOn P1OUT |= (1<<5)
#define ParClockOff P1OUT &=~(1<<5)

int main() {
  init(); // initialisations...
  uint8_t i;

  for (i=0; i<16; i++) { // envoie 1 colonne avec 1 pixel allumé
    P2OUT = (1<<(i&7)); // 1 col de 8 px, 1 seul allumé
    SerClockOn; SerClockClear; // envoie un coup d'horloge série
  }
  ParCloclOn; ParClockClear; // envoie un coup d'horloge

  while (1) { // attente infinie
  }
}
~~~~~~~
</div>
<!-- 2 --><img src="./images/reg-ser-par-timing-s-200dpi.png" style="top:10cm; left:29cm; width:30cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Programme de commande</h1>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Générateur de caractères</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2;">
~~~~~~~ { .c .numberLines startFrom="1" }
const uint8_t GenCar [] { // tableau des pixels des caractères
  0b01111110, // caractère 'A'
  0b00001001, // Il faut pencher la tête à droite
  0b00001001, // pour voir sa forme !
  0b00001001,
  0b01111110,

  0b01111111, // caractère 'B'
  0b01001001, // Les caractères forment
  0b01001001, // une matrice de 5x7
  0b01001001,
  0b00110110,

  0b00111110, // caractère 'C'
  0b01000001, // Les caractères ont ici
  0b01000001, // une chasse fixe, c'est-à-dire
  0b01000001, // que tous les caractères ont
  0b01000001  // la même largeur en pixels
};
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Affichage d’un texte</h1>
<div style="top: 6cm; left: 4cm; font-size: 42pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
char *Texte = "ABC\0"; // texte, terminé par le caractère nul
const char *ptTexte; // pointeur vers le texte à afficher

~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Affichage d’un texte</h1>
<div style="top: 5.2cm; left: 2.65cm; font-size: 36pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="3" }
int main(void) {
  init(); // initialisations...
  while(1) { // le texte défile sans fin
    ptTexte = Texte;
    while (*ptTexte!='\0') { // boucle des caractères du texte
      caractere = *ptTexte; // le caractère à afficher
      idxGenCar = (caractere-'A') * 5; // conversion ASCII à index GenCar[]
      for (i=0; i<5; i++) { // envoie les 5 colonnes du caractère
        P2OUT = ~GenCar[idxGenCar++]; // 1 colonne du caractère (actif à 0)
        SerClockSet; SerClockClear; // coup d'horloge série
        ParClockSet; ParClockClear; // coup d'horloge parallèle
        AttenteMs (delai);
      }
      ptTexte++; // passe au caractère suivant
      P2OUT = ~0; // colonne vide, séparant les caractères
      SerClockSet; SerClockClear; // coup d'horloge série
      ParClockSet; ParClockClear; // coup d'horloge parallèle
      AttenteMs (delai);
    }
  }
}
~~~~~~~
</div>
</section>
<!-- Page séparer gen-raf, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Séparer génération et rafraîchissement</h1>
<div style="font-size:48pt; left:33cm; width:26.0cm; top:8cm;">
* Géométrie pas toujours idéale
<!-- 23 -->* Afficheurs multiplexés
<!-- 3 -->* Génération et rafraîchissement séparés
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Mémorisation des pixels</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 40pt; line-height: 2; width:54cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define NbLignes 8
uint16_t Matrice[NbLignes]; // mots de 16 bits, correspondant à une ligne
~~~~~~~
</div>
<img src="./images/organisation-afficheur-8x16-120dpi.png" style="top:15cm; left:6cm; width:34cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Dessin des points</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2; width:55cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
void AllumePoint(int16_t x, int16_t y) {
  Matrice[y] |= (1<<x); // set bit
}

void EteintPoint(int16_t x, int16_t y) {
  Matrice[y] &=~(1<<x); // clear bit
}

#define MaxX 16
#define MaxY NbLignes

void Diagonale() {
  int16_t i;
  for (i=0; i<MaxY; i++) {
    AllumePoint(i*MaxX/MaxY, i);
  }
}
~~~~~~~
</div>
<!-- 2 --><img src="./images/organisation-afficheur-8x16-120dpi.png" style="top:16cm; left:29cm; width:30cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Affichage de la matrice</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2;">
~~~~~~~ { .c .numberLines startFrom="1" }
void AfficheMatrice() {
  for (uint16_t x=0; x<MaxX; x++) {
    // Préparation des valeurs qui doivent être envoyées aux 8 registres:
    for (uint16_t y=0; y<MaxY; y++)  {
      if (Matrice[y]&(1<<x)) P2OUT &=~(1<<y); else P2OUT |= (1<<y);
    }
    SerClockSet; SerClockClear; // envoie un coup d'horloge série
  }
  ParClockSet; ParClockClear; // envoie les valeurs sur les LED
}
~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Affichage de la matrice</h1>
</section>


<!-- + simple -->
<section>
<!-- A -->
<h1 class="en_tete">Mémorisation des pixels, autre organisation</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2; width:54cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define NbColonnes 16
uint8_t Matrice[NbColonnes]; // mots de 8 bits, correspondant à une colonne

~~~~~~~
</div>
<img src="./images/organisation-afficheur-8x16-byte-120dpi.png" style="top:11cm; left:6cm; width:28cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Affichage de la matrice</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 38pt; line-height: 2; width:54cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
#define NbColonnes 16
uint8_t Matrice[NbColonnes]; // mots de 8 bits, correspondant à une colonne

void AfficheMatrice() {
  // pour chaque colonne :
  for (uint16_t x=0; x<MaxX; x++) {
    P2OUT = ~Matrice[x]; // une colonne
    // envoie un coup d'horloge série :
    SerClockSet; SerClockClear;
  }
  // envoie les valeur sur les LED :
  ParClockSet; ParClockClear;
}
~~~~~~~
</div>
<!-- 2 --><img src="./images/organisation-afficheur-8x16-byte-120dpi.png" style="top:12cm; left:33cm; width:25cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Animations</h1>
<div style="top: 8cm; left: 6cm; font-size: 53pt; line-height: 1.5; width:44cm;">
* préparer une image en mémoire
<!-- 2345 -->* envoyer son contenu sur l'afficheur
<!-- 345 -->* attendre le temps nécessaire
<!-- 45 -->* préparer une autre image
<!-- 5 -->* ...
</div>
</section>

<!-- Ping -->
<section>
<!-- A -->
<h1 class="en_tete">Ping !</h1>
<div style="top: 6cm; left: 4cm; font-size: 38pt; line-height: 2; width:55cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
void Ping() {
  int16_t x=0;
  int16_t y=0;
  int8_t sensX=1;
  int8_t sensY=1;
  do {
    AllumePoint(x,y);
    AfficheMatrice();
    AttenteMs(DELAI);
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


<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Afficheurs matriciels</h1>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:8cm;">
* Notion de pixel
* Caractéristique des afficheurs
* Matrices de LED
* Programmation
* Génération et rafraîchissement
</div>
</section>






