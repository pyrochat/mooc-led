<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e20014; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Mémoires permanentes</div>
<img src="../../statiques/images/epfl-logo-pp.png" style="top:27.69cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Pierre-Yves Rochat</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<h1 class="en_tete">Mémoires permanentes</h1>
<!-- def A --><img src="../../statiques/images/epfl-logo-pp.png" style="top:1.49cm; left:54.41cm; width:4.15cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Mémoires permanentes
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
</section>

<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Mémoires permanentes</h1>
<div class="liste_demi">
* Type de mémoires sur les microcontrôleurs
* EEPROM
* Programmation des mémoires Flash
* Mémoires externes
</div>
</section>

<!-- Page Type mém-->
<section>
<!-- A -->
<h1 class="en_tete">Types de mémoires</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;">
* Principalement deux mémoires dans un microcontrôleur :
</div>
<!-- 234 --><div style="top:11cm; left:3.65cm; line-height:1.2; font-size:50pt;">
<!-- 234 -->`1.` Mémoire Flash, pour les programmes<br/>
<!-- 34 -->`2.` Mémoire vive (RAM) pour les données
<!-- 234 --></div>
<!-- 4 --><div style="top:20cm; left:2.65cm; line-height:1.2; font-size:50pt;">
<!-- 4 -->* Comment conserver des données ?<br/> Par exemple les textes défilant sur un afficheur à LED...
<!-- 4 --></div>
</section>

<!-- Page EEPROM-->
<section>
<!-- A -->
<h1 class="en_tete">EEPROM</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;">
* Certains microcontrôleurs disposent d’une mémoire du type EEPROM
<br/>*Electrically-Erasable Programmable Read-Only Memory*
<br/><br/>
<!-- 23 -->* Par exemple, l’ATmega328<br/> dispose de 1 kB d’EEPROM
</div>
<!-- 3 --><img src="./images/eeprom-avr.png" style="top:15cm; left:30cm; width:15cm;" />
</section>

<!-- Page progr EEPROM-->
<section>
<!-- A -->
<h1 class="en_tete">EEPROM : programmation</h1>
<div style="top:7cm; left:2cm; font-size:36pt; width:57cm">
~~~~~~~ { .c .numberLines startFrom="1" }
  // Lecture en EEPROM :
  EEAR = adresse; // l'adresse est donnée
  EECR = (1<<EERE); // le fanion de lecture est activé
  valeur = EEDR; // lecture de la valeur

  // Ecriture en EEPROM :
  while (EECR & (1<<EEPE)) {} // attente de la fin d'une éventuelle écriture précédente
  EEAR = adresse; // l'adresse est donnée
  EEDR = valeur; // la valeur est donnée
  EECR = (1<<EEMPE); // autorise une écriture (Master Write Enable)
  EECR = (1<<EEPE); // lance le cycle d'écriture (Write Enable)
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->
</div>
</section>

<!-- Page FLASH, 4 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">FLASH</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt; width:53cm">
* Il est généralement possible d’accéder à la mémoire flash d’un microcontrôleur
<!-- 234 --><br/>... en faisant attention à ne pas détruire le programme !
<!-- 34 --><br/><br/>
<!-- 34 -->* C’est un peu plus difficile sur des microcontrôleurs dont l’architecture n’est pas du type Von Neumann
<!-- 4 --><br/><br/>
<!-- 4 -->* Dans tous les cas, l’effacement s’effectue par bloc
</div>
</section>

<!-- Page progr FLASH-->
<section>
<!-- A -->
<h1 class="en_tete">FLASH : programmation</h1>
<div style="top:7cm; left:2cm; font-size:36pt; width:57cm">
~~~~~~~ { .c .numberLines startFrom="1" }
  // Lecture en Flash :
  uint8_t *pointeur; // pointeur dans la Flash
  pointeur = (uint8_t *) 0x1040; //place l'adresse dans le pointeur
  uint8_t valeur = *pointeur;

  // Ecriture en Flash :
  FCTL3 = FWKEY; // Clear Lock bit
  *pointeur = valeur; // écrit la valeur dans la Flash
  FCTL3 = FWKEY + LOCK; // Set LOCK bit

  // Effacement d'un bloc de la mémoire Flash
  FCTL1 = FWKEY + ERASE; // Set Erase bit
  FCTL3 = FWKEY; // Clear Lock bit
  *pointeur = 0; // lance un cycle d'effacement du bloc, la valeur donnée n'a pas d'importance
  FCTL3 = FWKEY + LOCK; // Set LOCK bit
  FCTL1 = FWKEY; // Clear WRT bit
~~~~~~~
<!-- retour au mode normal pour l'éditeur -->
</div>
</section>

<!-- Page limite cycles, 3 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Limite du nombre de cycles d’écriture</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;line-height: 1.5;">
* Pour chaque type de mémoire non-volatile, un nombre de cycles limité
<!-- 23 -->* Typiquement 10’000 pour une FLASH
<!-- 3 -->* 100’000 pour une EEPROM
</div>
</section>

<!-- Page mem externes, 6 entrées, 2 pages -->
<section>
<h1 class="en_tete">Mémoires externes</h1>
<div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
**Enseignes et afficheurs à LED** | Mémoires permanentes
</div>
<!-- Contenu : -->
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;line-height: 1.5;">
* Il est possible d’ajouter des mémoires non-volatiles externes :
<!-- 234 -->* RAM secourues
<!-- 34 -->* EEPROM série (I2C ou SPI)
</div>
<div>
<!-- 4 --><img src="./images/m95256.png" style="top:13cm; left:26cm; width:28cm;" />
</div>
</section>

<section>
<h1 class="en_tete">Mémoires externes</h1>
<div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
**Enseignes et afficheurs à LED** | Mémoires permanentes
</div>
<!-- Contenu : -->
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;line-height: 1.5;">
* Il est possible d’ajouter des mémoires non-volatiles externes :
* RAM secourues
* EEPROM série
* Cartes SD
</div>
<!-- 2 --><img src="./images/sd-microsd.png" style="top:15cm; left:26cm; width:25cm;" />
</section>

<!-- Page file system, 4 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Système de fichier</h1>
<div style="top:9cm; left:2.65cm; line-height:1.2; font-size:50pt;line-height: 1.5;">
* Compliqué de gérer les données d’une carte SD
<!-- 234 -->* Pratique d’utiliser un système de fichier : par exemple FAT 32
<!-- 34 -->* Des librairies sont disponibles
<!-- 4 --><br/>PetitFat :
<!-- 4 --></div>
<!-- 4 --><div style="top:15cm; left:13cm; line-height:1.2; font-size:40pt;line-height: 1;">
<!-- 4 --><br/><br/>
<!-- 4 -->*Procédure*<br/>
<!-- 4 -->`pf_mount:`<br/>
<!-- 4 -->`pf_open:`<br/>
<!-- 4 -->`pf_read:`<br/>
<!-- 4 -->`pf_write:`<br/>
<!-- 4 -->`pf_lseek:`<br/>
<!-- 4 -->`pf_opendir:`<br/>
<!-- 4 -->`pf_readdir:`
<!-- 4 --></div>
<!-- 4 --><div style="top:15cm; left:23cm; line-height:1.2; font-size:40pt;line-height: 1;">
<!-- 4 --><br/><br/>
<!-- 4 -->*Rôle*<br/>
<!-- 4 -->`Monter un volume`<br/>
<!-- 4 -->`Ouvrir un fichier`<br/>
<!-- 4 -->`Lire des données dans un fichier`<br/>
<!-- 4 -->`Écrire des données dans un fichier`<br/>
<!-- 4 -->`Déplacer le pointeur de lecture ou d’écriture`<br/>
<!-- 4 -->`Ouvrir un dossier`<br/>
<!-- 4 -->`Lire le contenu d’un dossier`
</div>
</section>

<!-- Page de conclusion -->
<section>
<!-- A -->
<h1 class="en_tete">Mémoires permanentes</h1>
<img src="./images/microsd.png" style="top:5cm; left:26cm;" />
<div class="liste_demi">
* Type de mémoires sur les microcontrôleurs
* EEPROM
* Programmation des mémoires Flash
* Mémoires externes
</div>
</section>






