<!-- DIAPORAMA -->


<!-- Page de titre -->
<section class="page_de_garde">
<img src="../../statiques/images/epfl-logo-pp.png" style="top:1.05cm; left:1.95cm; width:5.87cm" />
<img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- Contenu : -->
<div style="top:11cm; left:5.65cm; font-size:50pt; font-family: Arial Narrow, sans-serif; color: #e2001a; ">Enseignes et afficheurs à LED</div>
<div style="top:19cm; left:5.65cm; font-size:70pt;font-family: Impact, sans-serif;">Synthèse de circuits combinatoires</div>
<img src="./images/ucad-logo.png" style="top:24.5cm; left:5.65cm; width:6.5cm" />
<div style="top:26.7cm; left:14cm; font-size:47pt; font-family: Arial Narrow, sans-serif;">Dr. Mamadou Lamine Ndiaye</div>
</section>


<!-- Page bienvenue plein écran-->
<section>
<!-- I -->
<h1 class="en_tete">Synthèse de circuits combinatoires</h1>
<!-- def A --><img src="../../statiques/images/logo-esp.png" style="top:0.8cm; left:54.41cm; width:3.6cm" />
<!-- def A --><img src="../../statiques/images/rescif-trait.png" style="top:5.07cm; left:0cm; width:60.02cm; height:0.23cm" />
<!-- def A --><div style="top:31.26cm; left:35cm; width:23cm; text-align: right;  font-size:21pt; font-family: Arial Narrow, sans-serif; color:#555555;">
<!-- def A -->**Enseignes et afficheurs à LED** | Synthèse de circuits combinatoires
<!-- def A --></div>
<!-- A -->
<!-- Contenu : -->
<div style="top:6.5cm; left:35cm; width:23cm; text-align: right;  font-size:48pt; font-family: Impact, sans-serif;">
Dr. Mamadou Lamine Ndiaye
</div>
</section>


<!-- Page bienvenue demi-->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse de circuits combinatoires</h1>
<div style="top: 7.5cm; left: 32.0cm; font-size: 53pt; line-height: 1.6;">
* Simplification des fonctions logiques :
</div>
<div style="top: 11cm; left: 34.0cm; font-size: 53pt; line-height: 1;">
* Simplification algébrique
* Simplification par tableau de KARNAUGH
</div>
<div style="top: 18cm; left: 32.0cm; font-size: 53pt; line-height: 1.6;">
* Diagramme temporel
* Synthèse d'un décodeur 7 segments
</div>
</section>


<!-- Page Système combinatoire -->

<section>
<!-- A -->
<h1 class="en_tete">Système combinatoire</h1>
<img src="./images/fonction-logique-300dpi.png" style="top:10cm; left:6cm; width:40cm;" />
</section>


<!-- Page Méthodologie -->
<section>
<!-- A -->
<h1 class="en_tete">Méthodologie de synthèse</h1>
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.6;">
* Analyse du cahier des charges
<!-- 23456 -->* Identification des variables d’entrées et de sorties
<!-- 3456 -->* Représentation du problème sous forme de table de vérité
<!-- 456 -->* Établissement de la ou des fonctions résultantes
<!-- 56 -->* Simplification et établissement de logigramme
<!-- 6 -->* Prototypage d’essai et réalisation finale
</div>
</section>

<!-- Page Simplification, 4 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification des fonctions logiques</h1>
</section>

<section>
<!-- A -->
<h1 class="en_tete">Simplification des fonctions logiques</h1>
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
**Simplification algébrique**

* Regroupement des termes ayant des variables communes et mises en facteur
<!-- 23 -->* Réplication de termes existants
<!-- 3 -->* Suppression de termes superflus
</div>
</section>


<!-- Page Simplification, 2 images -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification algébrique</h1>
<img src="./images/exemple-synthese-q.png" style="top:8cm; left:5cm; width:35cm;" />
<!-- 2 --><img src="./images/exemple-synthese-r.png" style="top:14cm; left:5cm; width:35cm;" />
</section>


<!-- Page KARNAUGH,  8 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification par Tableau de KARNAUGH</h1>
<img src="./images/kar-3-300dpi.png" style="top:7cm; left:34cm; width:22cm;" />
<div style="top: 7cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
* Forme particulière de la table de vérité
</div>
<!-- 2345678 --><div style="top: 15.8cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
<!-- 2345678 -->* Recherche de groupements :
<!-- 2345678 --></div>
<!-- 345678 --><div style="top: 19.3cm; left: 4cm; font-size: 40pt; line-height: 1.2;">
<!-- 345678 -->* regrouper les cases adjacentes successivement contenant des 1
<!-- 45678 -->* la taille d’un groupe est une puissance de 2 : (1, 2, 4, 8, ...)
<!-- 5678 -->* on cherche toujours le groupement maximal
<!-- 678 -->* le résultat d’un groupement est le produit des variables constantes
<!-- 78 -->* le résultat final est la somme des résultats des groupements
<!-- 8 -->* une même case peut appartenir à deux groupements différents
<!-- 345678 --></div>
</section>


<!-- Page KARNAUGH sp,  3 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification par Tableau de KARNAUGH</h1>
<img src="./images/kar-3-300dpi.png" style="top:7.0cm; left:34cm; width:22cm;" />
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
* Somme des produits
</div>
<!-- 23 --><img src="./images/kar-3-s1-300dpi.png" style="top:7.0cm; left:34cm; width:22cm;" />
<!-- 23 --><img src="./images/exp-sp-300dpi.png" style="top:11.0cm; left:2.56cm; width:17cm;" />
<!-- 3 --><img src="./images/schema-kar1.png" style="top:18cm; left:2.65cm; width:23cm;" />
</section>


<!-- Page KARNAUGH sp,  3 entrées -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification par Tableau de KARNAUGH</h1>
<img src="./images/kar-3-300dpi.png" style="top:7.0cm; left:34cm; width:22cm;" />
<div style="top: 7.5cm; left: 2.65cm; font-size: 53pt; line-height: 1.5;">
* Produit des sommes
</div>
<!-- 23 --><img src="./images/kar-3-s0-300dpi.png" style="top:7.0cm; left:34cm; width:22cm;" />
<!-- 23 --><img src="./images/exp-ps-300dpi.png" style="top:11.0cm; left:3.5cm; width:21cm;" />
<!-- 3 --><img src="./images/schema-kar2.png" style="top:18cm; left:2.65cm; width:23cm;" />
</section>


<!-- Page KARNAUGH sp + ps  -->
<section>
<!-- A -->
<h1 class="en_tete">Simplification par Tableau de KARNAUGH</h1>
<div style="top: 7cm; left: 2.65cm; font-size: 53pt;">
* Somme des produits
</div>
<img src="./images/schema-kar1-300dpi.png" style="top:12cm; left:2.65cm; width:23cm;" />
<img src="./images/exp-sp-300dpi.png" style="top:25.0cm; left:2.0cm; width:17.5cm;" />
<div style="top: 7cm; left: 30cm; font-size: 53pt;">
* Produit des sommes
</div>
<img src="./images/schema-kar2-300dpi.png" style="top:12cm; left:30cm; width:23cm;" />
<img src="./images/exp-ps-300dpi.png" style="top:25.0cm; left:30cm; width:21cm;" />
</section>

<!-- Page Diagramme temporel, 2 images  -->
<section>
<!-- A -->
<h1 class="en_tete">Diagramme temporel</h1>
<img src="./images/diagr-schema.png" style="top:7cm; left:4cm; width:50cm;" />
<!-- 2 --><img src="./images/diagr-temp.png" style="top:15cm; left:30cm; width:26cm;" />
</section>


<!-- Page 7 segments vide  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un  décodeur 7 segments</h1>
</section>


<!-- Page 7 segments 1  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un  décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:9cm; left:3cm; width:10cm;" />
</section>


<!-- Page 7 segments 1  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un  décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:9cm; left:3cm; width:10cm;" />
<img src="./images/seg-0-9.png" style="top:7cm; left:20cm; width:35cm;" />
</section>


<!-- Page formules  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:10.5cm; left:3cm; width:7cm;" />
<img src="./images/deco-verite-300dpi.png" style="top:6cm; left:14cm; width:19cm;" />
<!-- 2 --><img src="./images/deco-verite-r-300dpi.png" style="top:6cm; left:14cm; width:19cm;" />
</section>



<!-- Page 7 segments ABCD  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un  décodeur 7 segmentss</h1>
<img src="./images/segment-7.png" style="top:10.5cm; left:3cm; width:7cm;" />
<img src="./images/kar-4a-300dpi.png" style="top:6.5cm; left:14cm; width:17cm;" />
<img src="./images/kar-4b-300dpi.png" style="top:6.5cm; left:40cm; width:17cm;" />
<img src="./images/kar-4c-300dpi.png" style="top:18cm; left:14cm; width:17cm;" />
<img src="./images/kar-4d-300dpi.png" style="top:18cm; left:40cm; width:17cm;" />
</section>


<!-- Page 7 segments EFG  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:10.5cm; left:3cm; width:7cm;" />
<img src="./images/kar-4e-300dpi.png" style="top:6.5cm; left:14cm; width:17cm;" />
<img src="./images/kar-4f-300dpi.png" style="top:6.5cm; left:40cm; width:17cm;" />
<img src="./images/kar-4g-300dpi.png" style="top:18cm; left:14cm; width:17cm;" />
</section>


<!-- Page Sa  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:10.5cm; left:3cm; width:7cm;" />
<img src="./images/kar-4a-300dpi.png" style="top:7cm; left:14cm; width:28cm;" />
<!-- 23 --><img src="./images/kar-4a-s-300dpi.png" style="top:7cm; left:14cm; width:28cm;" />
<!-- 3 --><img src="./images/formule-a-300dpi.png" style="top:27cm; left:14cm; width:28cm;" />
</section>

<!-- Page formules  -->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse d'un décodeur 7 segments</h1>
<img src="./images/segment-7.png" style="top:10.5cm; left:3cm; width:7cm;" />
<img src="./images/formules.png" style="top:7cm; left:14cm; width:30cm;" />
</section>


<!-- Page conclusion demi-->
<section>
<!-- A -->
<h1 class="en_tete">Synthèse de circuits combinatoires</h1>
<div style="top: 7.5cm; left: 32.0cm; font-size: 53pt; line-height: 1.6;">
* Simplification des fonctions logiques :
</div>
<div style="top: 11cm; left: 34.0cm; font-size: 53pt; line-height: 1;">
* Simplification algébrique
* Simplification par tableau de KARNAUGH
</div>
<div style="top: 18cm; left: 32.0cm; font-size: 53pt; line-height: 1.6;">
* Diagramme temporel
* Synthèse d'un décodeur 7 segments
</div>
</section>




 

 
