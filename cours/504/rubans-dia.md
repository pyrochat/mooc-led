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
<!-- A -->
<h1 class="en_tete">Rubans de LED</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Pierre-Yves Rochat
</div>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:11cm;">
* Rubans uniformes
* Rubans addressables
* Signaux de commande
* Programmation
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Plusieurs sortes de rubans de LED</h1>
<img src="./images/uniforme-bleu.png" style="top:7cm; left:7cm; width:22cm;" />
<img src="./images/diffus.png" style="top:1cm; left:22cm; width:22cm;" />
<img src="./images/adressable.png" style="top:7cm; left:44cm; width:22cm;" />
<img src="./images/ruban-ic.png" style="top:18cm; left:7cm; width:22cm;" />
<img src="./images/diffus.png" style="top:18cm; left:31cm; width:22cm;" />
</section>


<section>
<!-- A -->
<h1 class="en_tete">Rubans uniformes</h1>
<div style="font-size:52pt; left:3cm; width:46cm; top:7cm;">
* 32 x 32 pixels => 1024 sorties de registre
<!-- 234567 -->* 128 registres 8 bits 74HC595 et 1024 résistances
<!-- 34567 -->* Trois fois plus pour une matrice RGB !
<!-- 4567 -->* Registres 16 bits à sortie à courant constant SUM2016
<!-- 557 -->* 192 circuits intégrés et 192 résistances
</div>
<img src="./images/archi-uniforme.png" style="top:18cm; left:31cm; width:22cm;" />
</section>




<section>
<!-- A -->
<h1 class="en_tete">Programmer des animations</h1>
<div style="top: 6cm; left: 2.65cm; font-size: 36pt; line-height: 2; width:57.0cm;">
~~~~~~~ { .c .numberLines startFrom="1" }
    temps++; // comptage du temps

    // Clignotement des LED 0 et 30
    if (temps==500) {
        Ruban[30] = Ruban[0] = 0xFFFFFF;
    }
    if (temps==1000) {
        temps=0; Ruban[30] = Ruban[0] = 0;
    }
    // Changement progressif de la couleur de la LED 47
    Ruban[47]++;
~~~~~~~
</div>
</section>



