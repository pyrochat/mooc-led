<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Langages interprétés spécialisés</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Langages interprétés spécialisés
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Langages interprétés spécialisés</h1>
<div style="top:6.5cm; left:35cm; width:23cm; font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:15cm;">
* Motivation pour inventer un langage
* Instructions dans un tableau
* Interpréteur du langage
* Langages graphiques
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Motivation pour inventer un langage</h1>
<div style="font-size:52pt; left:3cm; width:56cm; top:7cm;">
* Animer une enseigne à LED = suite d’opérations sur les groupes des LED
<!-- 234567 -->* Animer un afficheur matriciel = envoyer des séquences graphiques
<!-- 34567 -->* Les animations deviennent souvent longues
<!-- 4567 -->* Difficile à lire
<!-- 567 -->* Beaucoup de place en mémoire
</div>
<!-- 67 --><div style="font-size:52pt; left:3cm; width:46cm; top:21cm;">
<!-- 67 -->* **Inventer** un langage
<!-- 7 -->* Décrire les animations dans ce langage
<!-- 67 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">En Arduino</h1>
<div style="top:5.2cm; left:2cm; font-size:39pt; width:50cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
loop() {
  digitalWrite (P2_0, 1); delay (100);
  digitalWrite (P2_1, 1); delay (100);
  digitalWrite (P2_2, 1); delay (100);
  digitalWrite (P2_3, 1); delay (100);
  digitalWrite (P2_4, 1); delay (100);
  digitalWrite (P2_5, 1); delay (100);
  digitalWrite (P2_6, 1); delay (100);
  digitalWrite (P2_7, 1); delay (200);
  digitalWrite (P2_7, 0); delay (100);
  digitalWrite (P2_6, 0); delay (100);
  digitalWrite (P2_5, 0); delay (100);
  digitalWrite (P2_4, 0); delay (100);
  digitalWrite (P2_3, 0); delay (100);
  digitalWrite (P2_2, 0); delay (100);
  digitalWrite (P2_1, 0); delay (100);
  digitalWrite (P2_0, 0); delay (300);
}
~~~~~~~~~~~~~~~~
</div>
<!-- 234 --><div style="font-size:47pt; left:36cm; width:23.5cm; top:12cm;">
<!-- 234 -->* `digitalWrite()` : 8 octets
<!-- 34 -->* `delay()` : 10 octets
<!-- 234 --></div>
<!-- 4 --><div style="font-size:47pt; left:36cm; width:23.5cm; top:19cm;">
<!-- 4 -->* `P1OUT |= (1<<0);` : 4 octets
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Instructions dans un tableau</h1>
<div style="top:5.2cm; left:2cm; font-size:39pt; width:50cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
uint8_t Animation[] = {
  Sortie0+On, Attente+10,
  Sortie1+On, Attente+10,
  Sortie2+On, Attente+10,
  Sortie3+On, Attente+10,
  Sortie4+On, Attente+10,
  Sortie5+On, Attente+10,
  Sortie6+On, Attente+10,
  Sortie7+On, Attente+20,
  Sortie7+Off, Attente+10,
  Sortie6+Off, Attente+10,
  Sortie5+Off, Attente+10,
  Sortie4+Off, Attente+10,
  Sortie3+Off, Attente+10,
  Sortie2+Off, Attente+10,
  Sortie1+Off, Attente+10,
  Sortie0+Off, Attente+30,
  Fin
}
~~~~~~~~~~~~~~~~
</div>
<!-- 234 --><div style="font-size:47pt; left:28cm; width:23.5cm; top:6.5cm; line-height: 1.0;">
<!-- 234 -->* Mettre une *intentité*
<!-- 234 -->* sur une *sortie*
<!-- 234 --></div>
<!-- 34 --><div style="font-size:47pt; left:28cm; width:23.5cm; top:11cm;">
<!-- 34 -->* Attendre une certaine *durée*
<!-- 34 --></div>
<!-- 4 --><div style="top:13cm; left:28cm; font-size:39pt; width:23.5cm; line-height: 0.9;">
<!-- 4 -->~~~~~~~~~~~~~~~~ {.C  .numberLines}
<!-- 4 --> #define On 0b01000000
<!-- 4 --> #define Off 0b00000000
<!-- 4 --> #define Sortie0 0
<!-- 4 --> #define Sortie1 1
<!-- 4 --> #define Sortie2 2
<!-- 4 --> #define Sortie3 3
<!-- 4 --> #define Sortie4 4
<!-- 4 --> #define Sortie5 5
<!-- 4 --> #define Sortie6 6
<!-- 4 --> #define Sortie7 7
<!-- 4 --> #define Attente 0b10000000
<!-- 4 --> #define Fin 0b1111111
<!-- 4 -->~~~~~~~~~~~~~~~~
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Langage binaire</h1>
<div style="top:5.2cm; left:2cm; font-size:39pt; width:50cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
 // Description des instructions :
 // b7 b6 b5 b4 b3 b2 b1 b0  : instructions sur 8 bits
 // -----------------------
 //  0 i0 s5-s4-s3-s2-s1-s0  : met une intensité sur une sortie
 //  1 d6-d5-d4-d3-d2-d1-d0  : attente
 // -----------------------
 //
 // Sorties sur 6 bits (maximum 64 sorties)
 // Intensité sur 1 bit (On ou OFF)
 // Durée sur 7 bits, exprimée en dixième de seconde (0 à 12.6 secondes)
}
~~~~~~~~~~~~~~~~
</div>
<!-- 2 --><div style="top:21cm; left:28cm; font-size:39pt; width:23.5cm; line-height: 0.9;">
<!-- 2 -->~~~~~~~~~~~~~~~~ {.C  .numberLines}
<!-- 2 --> #define On 0b01000000
<!-- 2 --> #define Off 0b00000000
<!-- 2 --> #define Sortie0 0
<!-- 2 --> #define ...
<!-- 2 --> #define Attente 0b10000000
<!-- 2 --> #define Fin 0b1111111
<!-- 2 -->~~~~~~~~~~~~~~~~
<!-- 2 --></div>
</section>



<section>
<!-- A -->
<h1 class="en_tete">Interpréteur</h1>
<div style="top:5.2cm; left:2cm; font-size:39pt; width:50cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
void Exec () {
  uint8_t instr = Programme[pc++]; // lit l'instruction
  if (instr==Fin) { // gère la fin du programme
    pc = 0;
  } else {
    if (instr & 0x8000) {  // attente
      AttenteMs(10 * (instr & 0x7F));
    } else {               // set intensité
      if (instr & 0x40) {
        Allume(instr & 0x3F);
      } else {
        Eteint(instr & 0x3F);
      }
    }
  }
}
~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Langages plus complexes</h1>
<div style="font-size:52pt; left:3cm; width:56cm; top:8cm; line-height: 1.5;">
* Gestion de l'intensité des LED par BCM (*Binary Coded Modulation*)
<!-- 23 -->* Agir sur des groupes de LED
<!-- 3 -->* Programmes en parallèle
</section>


<section>
<!-- A -->
<h1 class="en_tete">Langage graphique</h1>
<div style="top:7cm; left:2cm; font-size:39pt; width:57.5cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
 #define DrH 0x30     // + dx (4 bits) : droite horizontale depuis le curseur
 #define DrV 0x40     // + dy (4 bits) : droite verticale, depuis le curseur
 #define PlusX 0x50   // + dx (4 bits) : avance le curseur en X
 #define PlusY 0x60   // + dy (4 bits) : avance le curseur en Y
 #define MoinsX 0x70  // + dx (4 bits) : recule le cureur en X
 #define MoinsY 0x80  // + dy (4 bits) : recule le curseur en Y
 #define Repete 0x90  // + 4 bits : préfixe de répétition pour l’instr. suivante
 #define Delai 0xA0   // + 4 bits : Attente, valeur exposant de 2
 #define SetAccu 0xB0 // + 4 bits : Charge l’accumulateur (utilisé pour Intens)
 #define Label 0xC0   // + 5 bits (32 routines max)
 #define Call 0xE0    // + 5 bits
 #define Fin 0        // fin du programme
~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Langage graphique</h1>
<div style="top:7cm; left:2cm; font-size:39pt; width:57cm; line-height: 0.9;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
 #define Vide 1       // efface l’écran
 #define Ret 2        // retour de sous-routine (saut à l’adresse sur la pile)
 #define Origine 3    // place le curseur à 0,0
 #define ZeroX 4      // met à zéro X
 #define Intens 5     // détermine l’intensité selon la valeur de l’accumulateur
 #define Mask 0x9     // 
 #define InvMask 0xA  // inverse le masque courant
 #define SetDel 0xB   // définit délai utilisé entre l’affichage de chaque point
 #define SetDel0 0xC  // définit la valeur du délai 0
 #define Effet 0xD    // Exécute un effet programmé
 #define Libre1 0xE   // instructions non utilisées
 #define Libre2 0xF
~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Langages interprétés spécialisés</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Motivation pour inventer un langage
* Instructions dans un tableau
* Interpréteur du langage
* Langages graphiques
</div>
</section>


