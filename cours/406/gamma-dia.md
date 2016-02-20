<!-- DIAPORAMA -->

<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:20cm; left:5.65cm; font-size:70pt; font-family: Impact, sans-serif;">La correction Gamma</div>
<img src="../../statiques/images/logo-enspy.png" style="top:26cm; left:5.65cm; width:4.34cm" />
<div style="top:27.7cm; left:10.8cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Prof. Alain Tiedeu</div>
</section>


<!-- Page bienvenue plein écran-->
<section>
<!-- I -->
<h1 class="en_tete">La correction Gamma</h1>
<!-- def A --><img src="../../statiques/images/logo-enspy.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** |  La correction Gamma
<!-- def A --></div>
<!-- A -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Prof. Alain Tiedeu
</section>

<!-- Page bienvenue, demi-->
<section>
<!-- A -->
<h1 class="en_tete">La correction Gamma</h1>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:8cm;">
* Système de formation d’images
* Nécessité de la correction Gamma
* Technique de correction Gamma
* Exemple visuel
</div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Système de formation d’images</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.2; width:35cm">
* Une bonne image est bien **contrastée** et bien **illuminée**
</div>
<!-- 234 --><div style="font-size:45pt; left:2.65cm; top:10cm; line-height:1.2; width:35cm">
<!-- 234 -->* Le contraste permet à l’œil humain de bien<br> **discerner les détails** de l’image
<!-- 234 --></div>
<!-- 34 --><div style="font-size:45pt; left:2.65cm; top:15cm; line-height:1.2; width:35cm">
<!-- 34 -->* L’illumination correcte permet d’avoir une image<br> **ni trop sombre ni trop claire**
<!-- 34 --></div>
<!-- 34 --><img src="./images/syst-image-100dpi.png" style="top:6.5cm; left:45cm; width:10.0cm" />
<!-- 4 --><div style="font-size:45pt; left:2.65cm; top:20cm; line-height:1.2; width:35cm">
<!-- 4 -->* Schéma bloc d’un système  de formation et d’affichage :<br>
<!-- 4 --> Le faisceau lumineux provient de l’objet à imager 
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Nécessité de la correction Gamma</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.2; width:35cm">
* Par sa nature, l’oeil humain distingue mieux les détails de l’objet à imager s’il existe une **relation linéaire** entre la luminance du faisceau lumineux et celle de l’écran d’affichage. 
</div>
<img src="./images/faisceau-ecran-60dpi.png" style="top:10cm; left:40cm; width:15cm" />
<!-- 2 --><div style="font-size:45pt; left:2.65cm; top:17cm; line-height:1.2; width:35cm">
<!-- 2 -->* Ce n’est malheureusement souvent pas le cas
<!-- 2 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Mécanisme de la déformation Gamma</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.0; width:32cm">
*  Le capteur fournit bien souvent une relation **linéaire** entre la luminance du faisceau et la tension générée 
</div>
<img src="./images/faisceau-tension-60dpi.png" style="top:6.0cm; left:37cm; width:11.0cm" />
<!-- 234 --><div style="font-size:45pt; left:2.65cm; top:12cm; line-height:1.0; width:32cm">
<!-- 234 -->* Mais le système d’affichage fournit une relation **non-linéaire** entre la luminance de l’écran et la tension reçue 
<!-- 234 --></div>
<!-- 234 --><img src="./images/ecran-tension-60dpi.png" style="top:6.0cm; left:49cm; width:11.0cm" />
<!-- 34 --><div style="font-size:45pt; left:2.65cm; top:19cm; line-height:1.0; width:32cm">
<!-- 34 -->* Et finalement la relation entre la luminance du faisceau et celle de l’écran est **non-linéaire** 
<!-- 34 --></div>
<!-- 34 --><div style="font-size:45pt; left:2.65cm; top:23.5cm; line-height:1.0; width:32cm">
<!-- 34 -->* Ceci n’est pas bon pour la perception visuelle
<!-- 34 --></div>
<!-- 34 --><img src="./images/ecran-faisceau-60dpi.png" style="top:19.0cm; left:37cm; width:11.0cm" />
<!-- 4 --><div style="font-size:45pt; left:2.65cm; top:27cm; line-height:1.0; width:35cm">
<!-- 4 -->* Il faut corriger : c'est la <span style="color: #f00;">CORRECTION GAMMA</span>
<!-- 4 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Déformation Gamma : expression mathématique et effets</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.1; width:35cm">
* L’expression mathématique de la déformation apportée<br>sur l’image est de la forme :
</div>
<img src="./images/form-lum.png" style="top:10.0cm; left:22cm; width:9cm" />
<div style="font-size:45pt; left:2.65cm; top:12.5cm; line-height:1.2; width:55cm">
L~i~ : Luminance initiale, L~f~ : Luminance finale, γ : facteur de déformation
</div>
<!-- 23 --><div style="font-size:45pt; left:2.65cm; top:17.8cm; line-height:1.2; width:35cm">
<!-- 23 -->* La valeur de gamma dépend du système d’affichage
<!-- 23 --></div>
<!-- 3 --><div style="font-size:45pt; left:2.65cm; top:22cm; line-height:1.2; width:35cm">
<!-- 3 -->* Effets de la déformation Gamma
<!-- 3 -->	- Assombrissement de l’image
<!-- 3 -->	- Contraste atténué
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Correction Gamma: définition</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.2; width:55cm">
* La correction gamma est un procédé qui permet simplement de compenser dans le système de formation de l’image, ces effets non désirés
</div>
<!-- 23 --><div style="font-size:45pt; left:2.65cm; top:12.0cm; line-height:1.2; width:55cm">
<!-- 23 -->* La courbe inverse gamma (ou courbe de transfert) appliquée aux images va donc éclaircir 
<!-- 23 -->et étaler la gamme tonale de façon à produire une image plus ou moins linéaire visuellement
<!-- 23 --></div>
<!-- 23 --><img src="./images/form-lum-inv.png" style="top:16.0cm; left:15cm; width:9cm" />
<!-- 23 --><div style="font-size:45pt; left:4cm; top:19.0cm; line-height:1.2; width:55cm">
<!-- 23 -->L~c~ : luminance corrigée, L~i~ : luminance initiale et γ : facteur de correction
<!-- 23 --></div>
<!-- 3 --><div style="font-size:45pt; left:2.65cm; top:24.5cm; line-height:1.2; width:55cm">
<!-- 3 -->* L’image de départ est linéaire par rapport à la luminance captée
<!-- 3 --></div>
<!-- 3 --><div style="font-size:45pt; left:2.65cm; top:27.5cm; line-height:1.2; width:55cm">
<!-- 3 -->* L’image finale est linéaire par rapport à la luminosité perçue
<!-- 3 --></div>
</section>


<section>
<!-- A -->
<h1 class="en_tete">Correction Gamma : Méthode</h1>
<div style="font-size:45pt; left:2.65cm; top:7cm; line-height:1.0; width:55cm">
* Connaissant le facteur Gamma, la correction est effectuée<br> avant l’affichage de l’image
</div>
<div style="font-size:45pt; left:2.65cm; top:11.5cm; line-height:1.0; width:55cm">
* Dans le dispositif de formation d’images, on insère un correcteur<br>
 qui permet de redresser les valeurs avant de les afficher
</div>
<img src="./images/syst-gamma-100dpi.png" style="top:6.5cm; left:46cm; width:10.0cm" />
<!-- 234 --><div style="font-size:45pt; left:2.65cm; top:16.5cm; line-height:1.1; width:55cm">
<!-- 234 -->* La fonction de transfert du correcteur<br> est de forme concave :
<!-- 234 --></div>
<!-- 234 --><img src="./images/entree-sortie-60dpi.png" style="top:15.5cm; left:31cm; width:13.0cm" />
<!-- 34 --><div style="font-size:45pt; left:2.65cm; top:21.0cm; line-height:1.0; width:35cm">
<!-- 34 -->* Lorsque le système est numérique, on utilise<br> souvent des tables de transcodage<br> *(**LUT** = Look Up Table)*
<!-- 34 --></div>
<!-- 4 --><div style="font-size:45pt; left:2.65cm; top:27.0cm; line-height:1.0; width:35cm">
<!-- 4 -->* <span style="color: #f00;">Systématiquement utilisée avec les afficheurs<br> matriciels à **LED** qui affichent des images</span>
<!-- 4 --></div>
</section>

 
<section>
<!-- A -->
<h1 class="en_tete">Exemple de correction Gamma : Niveau de gris</h1>
<img src="./images/UNCORRECTED.jpg" style="top:6.0cm; left:6cm; width:19.3cm" />
<!-- 2 --><img src="./images/CORRECTED.jpg" style="top:6.0cm; left:33cm; width:19.3cm" />
</section>


<!-- Page conclusion, demi-->
<section>
<!-- A -->
<h1 class="en_tete">La correction Gamma</h1>
<div style="font-size:52pt; left:34cm; width:26.0cm; top:8cm;">
* Système de formation d’images
* Nécessité de la correction Gamma
* Technique de correction Gamma
* Exemple visuel
</div>
</section>



