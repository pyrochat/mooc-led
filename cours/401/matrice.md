% Afficheurs matriciels
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2015/09/16


## Afficheurs et écrans ##

Voici une définition du mot afficheur : dispositif électronique permettant de présenter visuellement des données. Cette définition correspond aussi très bien à ce qu'on appelle un écran. Ce terme écran vient de la technique des tubes cathodiques, qui comportaient un *écran* de phosphore, capable de transformer le faisceau d'électrons en une tache lumineuse.

Depuis plusieurs décennies, les LCD (Liquid Cristal Display) dominent ce domaine, tant pour de petits afficheurs que pour des écrans de taille respectable. On parle parfois par abus de langage d'écrans à LED pour désigner des écrans LCD rétro-éclairés par des LED. Il ne faut pas les confondre avec les écrans à O-LED (LED organiques), qui commencent à prendre une part du marché de plus en plus importante.

Ces domaines ne sont pas le sujet de notre cours. Nous allons nous concentrer sur les dispositifs réalisés avec des LED indépendantes.

## Notion de pixel ##

Chaque point d'un afficheur ou d'un écran est appelé un *pixel*. Il peut être d'une seule couleur (monochrome) ou capable de prendre plusieurs couleurs.

Un afficheur peut être caractérisé par plusieurs paramètres, qui nous embrouillent parfois. Celui qui, à mon sens, est le plus important, est le nombre de pixels. On donne souvent le nombre de ligne et le nombre de points par lignes.

Dans le domaine des écrans, les écrans VGA des années 1980 avaient déjà 480 lignes de 640 points. Aujourd'hui, l'écran d'un ordinateur portable à faible coût a déjà 800 lignes de 1'280 pixels. Une image vidéo *Full HD* a 1'080 lignes de 1'920 pixels.

La taille de l'afficheur est évidemment aussi un paramètre important, sa *hauteur* (on part de l'idée que l'écran est vertical) et sa largeur.

A partir de la taille et du nombre de pixels, on peut tirer deux autres caractéristiques d'un afficheur :

* Sa résolution. C'est la distance entre un pixel et son plus proche voisin. On l'exprime généralement en mm. Les fabricants donnent souvent une expression comme P6 ou P10. La lettre P vient du mot *Pitch* (le pas). Il s'agit bien de la distance entre chaque pixels, en mm.
* Sa densité. C'est le nombre de pixels par unité de surface. L'unité est généralement exprimée en pixels par mètres carrés.

Prenons l'exemple d'un afficheur P6. La distance entre chaque pixel est de 6mm. On peut donc aligner environ 167 LED sur un mètre. Il faut donc plus de 27'800 LED pour remplir un mètre carré !


## Afficheurs à LED ##

Un afficheur à LED est donc un ensemble de LED dont il est possible de choisir l'état de chacune indépendamment des autres.

Les LED sont généralement disposées en ligne et en colonne : on obtient un afficheur orthogonal. 

![Afficheur de 10x24 LED](images/aff-10x24-120dpi.png "Afficheur de 10x24 LED")

Si la distance est la même horizontalement et verticalement (en x et y), l'afficheur est orthonormé. La nature des LED permet de réaliser toute sorte d'afficheurs, sans se limiter à une grille orthonormée. On peut par exemple imaginer des afficheurs cylindriques, sphériques ou en forme de pyramide ! Plus couramment, on trouve des afficheurs qui prennent une forme dont la signification est connue, comme par exemple les afficheurs en forme de croix de pharmacie, très répandus depuis quelques années.

La taille des afficheurs à LED varie de manière considérable : on trouve de petits journaux lumineux sur certains médaillons de ceinture, mais il existe aussi des afficheurs vidéos d'une surface de plusieurs dizaines de mètres carrés.


## Commande des LED par des registres ##

Il est clair que le nombre de LED d'un afficheur matriciel, même de petite taille, ne permet généralement pas une commande de chaque LED par une broche d'un microcontrôleur. C'est seulement le cas pour de petits afficheurs commandés par _multiplexage temporel_, sujet qui sera abordé plus tard. Dans tous les autres cas, des registres sont utilisés pour commander les LED.

Prenons comme exemple un afficheur de 8 lignes de 16 LED. Il va utiliser un registre série-parallèle de 16 bits pour chaque ligne, soit 8 registres. Tout naturellement, les entrées séries de chaque registre vont être connectées à des broches du microcontrôleur. Les horloges série et parallèles peuvent être connectées ensemble : les données vont être injectées dans les registres série en même temps et c'est aussi en même temps que les valeurs décalées vont être envoyées sur les LED par le registre parallèle. Voici donc le schéma :

![Schéma d'un afficheur comportant 8 lignes de 16 LED](images/aff-8x16-120dpi.png "Schéma d'un afficheur comportant 8 lignes de 16 LED")

Remarquez que les LED n'ont pas de résistances série. Les registres utilisés contiennent des sources de courants, ajustables par une seule résistance pour tout le registre.

## Programmation ##

Comment écrire le programme qui contrôle ce montage ? On souhaite par exemple faire défiler un texte, pour faire un journal lumineux. La première idée qui vient à l'esprit est d'utiliser les propriétés du registre pour introduire successivement les colonnes de pixels qui forment chaque caractères . Voici un programme qui pourrait fonctionner. Il se limite pour le moment d'envoyer un motif en _dent de scie_ :

~~~~~~~ { .c .numberLines startFrom="1" }
int main() {
  // initialisations...
  uint8_t i;
  while (1) {
    for (i=0; i<16; i++) { // envoie une colonne avec un seul pixel allumé
      P1OUT = (1<<(i&7)); // une colonne de 8 pixels, un seul allumé
      SerClockOn; SerClockOff; // envoie un coup d'horloge série
    }
      ParCloclOn; ParClockOff; // envoie un coup d'horloge parallèle
  }
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Pour gérer des caractères, il faut disposer d'une table décrivant les pixels des différents caractères.
Voici une manière de les représenter :

~~~~~~~ { .c .numberLines startFrom="1" }
const uint8_t GenCar [] { // tableau des pixels des caractères
  0b01111110, // caractère 'A'
  0b00001001, // Il faut pencher la tête à droite
  0b00001001, // pour voire sa forme !
  0b00001001,
  0b01111110,

  0b01111111, // caractère 'B'
  0b01001001, // Les caractères forment une
  0b01001001, // une matrice de 5x7
  0b01001001,
  0b00110110,

  0b00111110, // caractère 'C'
  0b01000001, // Les caractères ont ici
  0b01000001, // une "chasse" fixe
  0b01000001, // (un même nombre de pixel
  0b01000001  // quelque soit le caractère)
};
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Voici un programme qui affiche un texte :

~~~~~~~ { .c .numberLines startFrom="1" }
char *Texte = "ABC\0"; // texte, terminé par le caractère nul
const char *ptTexte; // pointeur au texte à afficher

int main(void) {
  ... initialisations

  while(1) { // le texte défile sans fin
    ptTexte = Texte;
    while (*ptTexte!='\0') { // boucle des caractères du texte
      caractere = *ptTexte; // le caractère à afficher
      idxGenCar = (caractere-'A') * 5; // index dans le générateur
      for (i=0; i<5; i++) { // envoie les 5 colonnes du caractère
        P2OUT = ~GenCar[idxGenCar++]; // une colonne du caractère (actif à 0)
        SerClockOn; SerClockOff; // coup d'horloge série
        ParClockOn; ParClockOff; // coup d'horloge parallèle
        AttenteMs (delai); // la nouvelle colonne sera visible
      }
      ptTexte++; // passe au caractère suivant
      P2OUT = ~0; // colonne vide, séparant les caractères
      SerClockOn; SerClockOff; // coup d'horloge série
      ParClockOn; ParClockOff; // coup d'horloge parallèle
      AttenteMs (delai);
    }
  }
}

	

~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Pour cet exemple simple, le texte à afficher a été placé comme un tableau. Le mot `const` indique au compilateur qu'il peut être placé directement en mémoire de programme. Pour accéder aux caractère de ce texte, un pointeur est utilisé. La déclaration du pointeur s'écrit : `const char *ptTexte;`. Le symbole * indique qu'il s'agit d'un pointeur.

Cette manière d'envoyer les caractères fonctionne, mais présente tellement de limitations qu'elle ne sera jamais utilisée. Par exemple, elle ne peut pas fonctionner si l'ordre des LED est inversé : le texte ne pourra pas se décaler correctement de droite à gauche. Elle est aussi incompatible avec les afficheurs multiplexés.

## Génération et rafraîchissement séparés ##

La bonne manière de programmer un afficheur est de **séparer** complètement la génération de l'image à afficher et l'envoi de cette image sur l'afficheur. La valeur courante de chaque pixel sera placée dans une **mémoire**. La partie du logiciel qui prépare les images va **écrire** dans cette mémoire. Les procédures qui vont envoyer les informations à l'afficheur vont **lire** dans cette mémoire.

Dans notre exemple, l'afficheur a 8 lignes de 16 pixels. Un mot de 16 bit pourra donc mémoriser une ligne. Voici comment réserver la zone mémoire pour les pixels :

~~~~~~~ { .c }
#define NbLignes 8
uint16_t Matrice[NbLignes]; // mots de 16 bits, correspondant à une ligne
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Nous choissons de placer les axes x et y de la manière suivante :

![Organisation de l'afficheur 8x16 pixels](images/organisation-aff-8x16-120dpi.png "Organisation de l'afficheur 8x16 pixels")

Les procédures permettant d'allumer et d'éteindre un pixel, désigné par ses coordonnées, sont particulièrement simples dans ce cas :

~~~~~~~ { .c .numberLines startFrom="1" }
void AllumePoint(int16_t x, int16_t y) {
  Matrice[y] |= (1<<x); // set bit
}

void EteintPoint(int16_t x, int16_t y) {
  Matrice[y] &=~(1<<x); // clear bit
}

~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Voici une procédure pour afficher une diagonale en travers de l'afficheur :

~~~~~~~ { .c .numberLines startFrom="1" }
#define MaxX 16
#define MaxY NbLignes

void Diagonale() {
  int16_t i;
  for (i=0; i<MaxY; i++) {
    AllumePoint(i*MaxX/MaxY, i);
  }
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Mais toutes ces procédures ne vont rien afficher sur les LED ! Il faut encore une procédure qui va placer chaque pixel sur la LED correspondante. Pour l'écrire, il faut garder en mémoire l'organisation matérielle de notre matrice, avec les 8 registres série-parallèles de 16 bits.

~~~~~~~ { .c .numberLines startFrom="1" }
void AfficheMatrice() {
  for (uint16_t x=0; x<MaxX; x++) {
    // Préparation des valeurs qui doivent être envoyées aux 8 registres:
    for (uint16_t y=0; y<MaxY; y++)  { 
      if (Matrice[y]&(1<<x)) P2OUT &=~(1<<y); else P2OUT |= (1<<y);
    }
    SerClockOn; SerClockOff; // envoie un coup d'horloge série
  }
  ParClockOn; ParClockOff; // envoie les valeur sur les LED
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Cette procédure semble compliquée. Une autre organisation des données en mémoire pourrait conduire une procédure beaucoup plus simple :

![Organisation plus optimale des pixels en mémoire](images/organisation-aff-8x16-byte-120dpi.png "Organisation plus optimale des pixels en mémoire")

Voici la définition et le procédure correspondante :

~~~~~~~ { .c .numberLines startFrom="1" }
#define NbColonnes 16
uint8_t Matrice[NbColonnes]; // mots de 8 bits, correspondant à une colonne

void AfficheMatrice() {
  for (uint16_t x=0; x<MaxX; x++) {
    P2OUT = ~Matrice[x];
    SerClockOn; SerClockOff; // envoie un coup d'horloge série
  }
  ParClockOn; ParClockOff; // envoie les valeur sur les LED
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->

Non seulement la procédure `AfficheMatrice()` est beaucoup plus simple, mais en plus elle va prendre moins de temps pour son exécution. Dans notre cas, la vitesse ne pose pas de problème. Mais dès que les afficheurs deviennent plus grands, cette question devient cruciale.

De manière générale, on va donc chercher à optimiser l'organisation des pixels en mémoire en vue de simplifier et de rendre plus rapide l'envoi des pixels sur les LED, quitte à compliquer un peu les procédures qui créent les images.

## Programmer des animations ##

Pour générer des animations sur l'afficheur, il faut :

* préparer une image en mémoire,
* envoyer son contenu sur l'afficheur,
* attendre le temps voulu,
* préparer une autre image

et ainsi de suite.



Voici un programme complet qui génère une animation graphique sur notre afficheur :

~~~~~~~ { .c .numberLines startFrom="1" }
// Afficheur didactique 16x8
// Les 8 bits sont sur P2
// Usage d'une matrice en byte
// Ping !

#include <msp430g2553.h>

#define DELAI 100

#define SerClockOn P1OUT|=(1<<5)
#define SerClockOff P1OUT&=~(1<<5)

#define ParClockOn P1OUT|=(1<<4)
#define ParClockOff P1OUT&=~(1<<4)

void AttenteMs (uint16_t duree) {
  for (uint16_t i=0; i<duree; i++) {
    for (volatile uint16_t j=0; j<500; j++) {
    }
  }
}

#define NbColonnes 16
uint8_t Matrice[NbColonnes]; // mots de 8 bits, correspondant à une colonne

#define MaxX NbColonnes
#define MaxY 8

void AllumePoint(int16_t x, int16_t y) {
  Matrice[x] |= (1<<y); // set bit
}

void EteintPoint(int16_t x, int16_t y) {
  Matrice[x] &=~(1<<y); // clear bit
}

void AfficheMatrice() {
  for (uint16_t x=0; x<MaxX; x++) {
    P2OUT = ~Matrice[x];
    SerClockOn; SerClockOff; // envoie un coup d'horloge série
  }
  ParClockOn; ParClockOff; // envoie les valeur sur les LED
}

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

int main(void) {
  WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
  BCSCTL1 = CALBC1_16MHZ; DCOCTL = CALDCO_16MHZ; // Horloge à 16 MHz
  P1DIR = (1<<4)|(1<<5); P2DIR = 0xFF; P2SEL = 0;

  for (uint16_t i=0; i<NbColonnes; i++) { // initialise la matrice
    Matrice[i]=0x0; 
  }
  
  while(1) { 
    Ping();
  }
}
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->
