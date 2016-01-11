<!-- DIAPORAMA -->
<!-- version originale : 29'989 octets -->
<!-- version 2015/12/25 avec Pre-DIA : 9'331 octets -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:13cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">Nombres et champs de bits</div>
<img src="../../statiques/images/logo-inphb.png" style="top:26cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Dr. Yves Tiecoura</div>
</section>

<!-- Page bienvenue plein écran-->
<section>
<!-- def A --><img src="../../statiques/images/logo-inphb.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Nombres et champs de bits
<!-- def A --></div>
<!-- A -->
<h1 class="en_tete">Nombres et champs de bits</h1>
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Dr. Yves Tiecoura
</div>
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Nombres et champs de bits</h1>
<div class="liste_demi"; style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Symboles binaires
* Numération binaire
* Arithmétique modulaire
* Nombres signés
* Types en C
* Hexadécimal
* Codage des caractères 
</div>
</section>

<!-- Page BITS -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres et champs de bits</h1>
<div class="liste_demi"; style="font-size:48pt; left:2.65cm; width:26.0cm; top:7cm;">
<!-- 12345 -->* LED éteinte ou allumée
<!-- 2345 -->* Faux ou Vrai
<!-- 345 -->* 0 ou 1
<!-- 45 -->* 0 V ou + 5 V 
</div>
<!-- 5 --><div class="liste_demi"; style="font-size:48pt; left:2.65cm; width:26.0cm; top:21cm;">
<!-- 5 -->* Ex :  1 0 0 1 0 0 1 0 
<!-- 5 --></div>
</section>

<!-- Page Numération, 2 images ++ -->
<section>
<h1 class="en_tete">Numération binaire</h1>
<!-- A -->
<!-- 1 --><img src="./images/numeration-bin-0.png" style="top:5.5cm; left:2.65cm; width:32cm;" />
<!-- 23 --><img src="./images/numeration-bin.png" style="top:5.5cm; left:2.65cm; width:32cm;" />
<!-- 3 --><div class="liste_demi"; style="font-size:48pt; left:20cm; width:26.0cm; top:10cm; text-align: right; ">
<!-- 3 -->2<br>1 6<br>6 4<br>1 2 8<br>1 0 2 4<br>_____<br>1 0 0 1 1 0 1 0 0 1 0 b = 1 2 3 4
<!-- 3 --></div>
</section>

<!-- Page demi, modulaire -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres de taille limitée</h1>
<div class="liste_demi"; style="font-size:48pt; left:32cm; width:26.0cm; top:7cm; line-height:1.2">
<!-- 123 -->* Les mathématiciens travaillent avec des nombre arbitrairement grands.<br><br>
<!-- 23 -->* Les circuits électroniques ont toujours une taille limitée !<br><br>
<!-- 3 -->* Quelle sont les contraintes liées à cette limite de taille ?
</section>

<!-- Page modulaires, x images ++ -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/numeration-bin-mod.png" style="top:5.5cm; left:2.65cm; width:33cm;" />
<!-- 2345 --><div class="liste_demi"; style="font-size:40pt; left:18cm; width:13cm; top:8.4cm; line-height:1.2; border-width: 0.8mm; border-style: solid;">
<!-- 2345 -->&nbsp;&nbsp;&nbsp;&nbsp;Table de l'addition :<br>
<!-- 2345 -->&nbsp;&nbsp;&nbsp;&nbsp;0 + 0 = 0, retenue 0<br>
<!-- 2345 -->&nbsp;&nbsp;&nbsp;&nbsp;0 + 1 = 1, retenue 0<br>
<!-- 2345 -->&nbsp;&nbsp;&nbsp;&nbsp;1 + 0 = 1, retenue 0<br>
<!-- 2345 -->&nbsp;&nbsp;&nbsp;&nbsp;1 + 1 = 0, retenue 1
<!-- 2345 --></div>
<!-- 3 --><img src="./images/oper-3bits-pos-1-0.png" style="top:7cm; left:33cm; width:27cm;" />
<!-- 45 --><img src="./images/oper-3bits-pos-2-0.png" style="top:7cm; left:33cm; width:27cm;" />
<!-- 5 --><div class="liste_demi"; style="font-size:48pt; left:43cm; width:19cm; top:13cm; color:red">
<!-- 5 --><br>Dépassement de capacité
<!-- 5 --></div>
</section>

<!-- Page roue pos -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/nombres-pos-cercle.png" style="top:7cm; left:2.65cm; width:56cm;" />
<!-- 2 --><img src="./images/nombres-pos.png" style="top:7cm; left:2.65cm; width:56cm;" />
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/nombres-pos-cercle.png" style="top:7cm; left:2.65cm; width:56cm;" />
<img src="./images/oper-3bits-pos-2-0.png" style="top:7cm; left:28cm; width:26cm;" />
<!-- 2 --><img src="./images/oper-3bits-pos-2-2.png" style="top:7cm; left:28cm; width:26cm;" />
</div>
</section>

<!-- Page taille limitée, demi -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres de taille limitée</h1>
<div class="liste_demi"; style="font-size:48pt; left:28cm; width:31.0cm; top:7cm; line-height:1.2">
* Peut-on représenter des nombres négatifs ?
</div>
</section>

<!-- Page roue pos-neg -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/nombres-pos-neg-cercle.png" style="top:7cm; left:2.65cm; width:56cm;" />
</section>

<!-- Page roue pos-neg -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/nombres-pos-neg.png" style="top:7cm; left:2.65cm; width:56cm;" />
</section>

<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<img src="./images/nombres-pos-neg-cercle.png" style="top:7cm; left:2.65cm; width:56cm;" />
<img src="./images/oper-3bits-pos-neg-2-0.png" style="top:7cm; left:28cm; width:26cm;" />
<!-- 2 --><img src="./images/oper-3bits-pos-neg-2-2.png" style="top:7cm; left:28cm; width:26cm;" />
</section>

<!-- Page C -->
<section>
<!-- A -->
<h1 class="en_tete">Types en C</h1>
<div class="liste_demi"; style="font-size:48pt; left:2.65cm; width:26.0cm; top:5cm; line-height:1.2">
*Type :*<br><br>
char  :<br>
signed char  :<br>
unsigned char :<br>
int :<br>
signed int :<br>
unsigned int :<br>
long int :<br>
signed long int :<br>
unsigned long int :
</div>
<div class="liste_demi"; style="font-size:48pt; left:15cm; width:44.0cm; top:5cm; line-height:1.2">
<br><br>
nombre de 8 bits (signé ou non, selon les réglages du compilateur)<br>
nombre de 8 bits signé<br>
nombre de 8 bits positif<br>
nombre généralement de 16 bits (signé ou non)<br>
nombre de 16 bits signé<br>
nombre de 16 bits positif<br>
nombre généralement de 32 bits (signé ou non)<br>
nombre de 32 bits signé<br>
nombre de 32 bits positif
</div>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Types en C, version C99</h1>
<div class="liste_demi"; style="font-size:52pt; left:2.65cm; width:26.0cm; top:7cm; line-height:1.2">
*Type :*<br><br>
uint8_t  :<br>
int8_t  :<br>
uint16_t :<br>
int16_t :<br>
uint32_t :<br>
int32_t :
</div>
<div class="liste_demi"; style="font-size:52pt; left:11cm; width:26.0cm; top:7cm; line-height:1.2">
<br><br>
nombre de 8 bits positifs<br>
nombre de 8 bits signé<br>
nombre de 16 bits positif<br>
nombre de 16 bits signé<br>
nombre de 32 bits positif<br>
nombre de 32 bits signé
</div>
<div class="liste_demi"; style="font-size:52pt; left:31cm; width:26.0cm; top:7cm; line-height:1.2">
*Magnitude :*<br><br>
0 … 255<br>
-128 … +127<br>
0 … 65'635<br>
-32'768 … +32'767<br>
0 … 4'294'967'295<br>
-2'147'483'648 … +2'147'483'647 
</div>
</section>

<!-- Page hexa, demi -->
<section>
<!-- A -->
<h1 class="en_tete">Hexadécimal</h1>
<div class="liste_demi"; style="font-size:48pt; left:28cm; width:31.0cm; top:7cm; line-height:1.2">
* Le binaire est parfait pour les machines
<!-- 23 -->* …mais malcommode pour les humains !
<!-- 3 -->* L'hexadécimal est plus pratique.
</div>
</section>

<!-- Page hexa exemple -->
<section>
<!-- A -->
<h1 class="en_tete">Nombres entiers modulaires</h1>
<div class="liste_demi"; style="font-size:50pt; left:2.65cm; width:31.0cm; top:7cm;">
Le nombre décimal 23456 :
</div>
<!-- 2345 --><img src="./images/Hexa-def.png" style="top:7cm; left:46cm; width:11cm;" />
<!-- 12 --><img src="./images/Hexa0-5BA0.png" style="top:14cm; left:2.65cm; width:42cm;" />
<!-- 3 --><img src="./images/Hexa1-5BA0.png" style="top:14cm; left:2.65cm; width:42cm;" />
<!-- 45 --><img src="./images/Hexa-5BA0.png" style="top:14cm; left:2.65cm; width:42cm;" />
<!-- 5 --><div class="liste_demi"; style="font-size:50pt; left:2.65cm; width:31.0cm; top:23cm; color:blue;">
<!-- 5 -->Notation du langage C :  **0x5BA0**
<!-- 5 --></div>
</section>

<!-- Page ASCII -->
<section>
<!-- A -->
<h1 class="en_tete">Codage des caractères</h1>
<img src="./images/ASCII-code.png" style="top:5cm; left:3cm; width:48cm;" />
</section>

<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">Nombres et champs de bits</h1>
<div class="liste_demi"; style="font-size:48pt; left:35cm; width:26.0cm; top:8cm;">
* Symboles binaires
* Numération binaire
* Arithmétique modulaire
* Nombres signés
* Types en C
* Hexadécimal
* Codage des caractères 
</div>
</section>



 

 
