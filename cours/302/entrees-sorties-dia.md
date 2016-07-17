<!-- DIAPORAMA -->

<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Les entrées-sorties</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>


<section>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Les entrées-sorties
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Les entrées-sorties</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les entrées-sorties</h1>
<div class="liste_demi" style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Rôle des broches en entrée OU en sorties
* Ports et registres sur AVR et MSP430
* Opérations logiques sur champs de bits
* Écritures des constantes
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Broches en entrée OU en sorties</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt;">
* GPIO : _**G**eneral **P**urpose **I**nput **O**utput_
</div>
<!-- 23456 --><div style="top: 11cm; left: 3cm; font-size: 48pt;">
<!-- 23456 -->* Arduino : choix par `pinMode()`
<!-- 23456 -->* Lecture par `digitalRead()`
<!-- 23456 -->* Écriture par `digitalWrite()`
<!-- 3456 -->* Simple... mais pas toujours optimal
<!-- 23456 --></div>
<!-- 456 --><div style="top: 23cm; left: 3cm; font-size: 48pt;">
<!-- 456 -->* Accès à une seule broche à la fois
<!-- 56 -->* Temps d’exécution important
<!-- 6 -->* Taille mémoire peu optimale
<!-- 456 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Rôle des broches</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
* Entrée à haute impédance
<!-- 23456 -->* Entrée avec une résistance de tirage vers le haut : *pull-up*
<!-- 456 -->* Entrée avec une résistance de tirage vers le bas : *pull-down*
</div>
<!-- 3456 --><img src="./images/poussoir-tirage.svg" style="top:20cm; left:3cm; width:39cm;">
<!-- 56 --><div style="top: 15cm; left: 3cm; font-size: 48pt; line-height: 1.2;">
<!-- 56 -->* Sortie à *0*
<!-- 6 -->* Sortie à *1*
<!-- 56 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les ports et leurs registres</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* Les broches sont regroupées par **ports**
<!-- 2345678 -->* Les ports ont souvent 8 bits, parfois 16 ou 32 bits
<!-- 345678 -->* Un port peut être incomplet sur un modèle donné de microcontrôleur
<!-- 45678 -->* Les noms des ports dépendent des familles de microcontrôleurs
</div>
<!-- 5678 --><div style="top: 18cm; left: 3cm; font-size: 48pt;">
<!-- 5678 -->* On accède aux broches et à leur rôle par des **registres**
<!-- 678 -->* **PIC** : PORTA — TRIS
<!-- 78 -->* **AVR** : PORTA — DDRA — PINA
<!-- 8 -->* **MSP430** : P1DIR — P1OUT — P1IN — P1REN
<!-- 5678 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les registres sur les AVR</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* Sur les AVR, les ports s’appellent PORTA, PORTB, ...
<!-- 23456 -->* Les 8 broches du PORTA s’appellent PA0, PA1... PA7
</div>
<!-- 3456 --><div style="top: 12cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 3456 -->3 registres sont utilisés pour piloter chaque port :
<!-- 3456 --></div>
<!-- 3456 --><div style="top: 17cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 3456 -->* **DDRA** _**D**ata **D**irection **R**egister_
<!-- 456 -->* **PORTA** : registre de sortie
<!-- 56 -->* **PINA** : donne l’état de chaque broche
<!-- 3456 --></div>
<!-- 6 --><img src="./images/table-fonc-avr.svg" style="top:13cm; left:30cm; width:28.5cm;">
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les registres sur les MSP430</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* Sur les AVR, les ports s’appellent P1, P2, ...
<!-- 234567 -->* Les 8 broches de P1 s’appellent P1.0, P1.1... P1.7
</div>
<!-- 34567 --><div style="top: 12cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 34567 -->4 registres sont utilisés pour piloter chaque port :
<!-- 34567 --></div>
<!-- 34567 --><div style="top: 17cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 34567 -->* **P1DIR** _**D**ata **D**irection **R**egister_
<!-- 4567 -->* **P1OUT** : registre de sortie
<!-- 567 -->* **P1IN** : donne l’état de chaque broche
<!-- 67 -->* **P1REN** : enclenche une résistance de tirage
<!-- 34567 --></div>
<!-- 7 --><img src="./images/table-fonc-msp.svg" style="top:16cm; left:34cm; width:24cm;">
</section>



<section>
<!-- A -->
<h1 class="en_tete">Lecture et écriture sur un port</h1>
<div style="top: 7cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* Initialisations : `P1DIR = 0b01000001;`
<!-- 2345678 -->* Lecture : `variable = P1IN;`
<!-- 345678 -->* Écriture : `P1OUT = valeur;`
</div>
<!-- 45678 --><div style="top: 15cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 45678 -->* Comment agir sur un bit à la fois ?
<!-- 5678 -->* Grâce aux opérateurs logique du C !
<!-- 45678 --></div>
<!-- 678 --><div style="top: 22cm; left: 3cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 678 -->* Le **OU** logique : **|**
<!-- 78 -->* Le **ET** logique :  **&**
<!-- 8 -->* L’**inversion** logique : **~**
<!-- 678 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Mise à un de bits</h1>
<div style="top: 7cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* `P1OUT |= 0b01000000;`
</div>
<!-- 23 --><img src="./images/set-bit.svg" style="top:11cm; left:7cm; width:40cm;">
<!-- 3 --><div style="top: 27cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 3 -->* Également sur plusieurs bits : `P1OUT |= 0b01000001;`
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Mise à zéro de bits</h1>
<div style="top: 7cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* `P1OUT &= 0b10111111;`
</div>
<!-- 23 --><img src="./images/clear-bit.svg" style="top:11cm; left:7cm; width:40cm;">
<!-- 3 --><div style="top: 27cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 3 -->* Également sur plusieurs bits : `P1OUT &= 0b10111101;`
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Écriture plus lisibles des constantes</h1>
<div style="top: 7cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
* `P1OUT |= 64;`
<!-- 23456 -->* `P1OUT |= 0x40;`
<!-- 3456 -->* `P1OUT |= 0b01000000;`
<!-- 456 -->* `P1OUT |= (1<<6);`
</div>
<!-- 56 --><div style="top: 18cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 56 -->* Avec l’opérateur d’inversion : `P1OUT &=~(1<<6);`
<!-- 56 --></div>
<!-- 6 --><div style="top: 25cm; left: 7cm; font-size: 48pt; line-height: 1.2; width:58cm;">
<!-- 6 -->* **_Set bit_** : `P1OUT |= (1<<6);`
<!-- 6 -->* **_Clear bit_** : `P1OUT &=~(1<<6);`
<!-- 6 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Inversion d’un bit par OU exclusif</h1>
<div style="top: 7cm; left: 7cm; font-size: 48pt; line-height: 2; width:58cm;">
* Le C offre un opérateur pour le OU exclusif : `^`
<!-- 2 -->* `P1OUT ^= (1<<6);` : inverse le bit 6
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Utilisations de <code>#define</code></h1>
<div style="top:6.5cm; left:2cm; font-size:48pt; width:58cm; line-height: 1.8;">
~~~~~~~~~~~~~~~~ {.C  .numberLines}
 #define ClockSet P1OUT |= (1<<5)
 #define ClockClear P1OUT &=~(1<<5)

 #define LedRougeOn P1OUT |= (1<<0)
 #define LedRougeOff P1OUT &=~(1<<0)
 #define LedRougeToggle P1OUT ^= (1<<0)
~~~~~~~~~~~~~~~~
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Les entrées-sorties</h1>
<div class="liste_demi" style="font-size:48pt; left:31cm; width:28cm; top:8cm; line-height: 1.8;">
* Rôle des broches en entrée **ou** en sortie
* Ports et registres sur AVR et MSP430
* Opérations logiques sur champs de bits
* Écritures des constantes
</div>
</section>



