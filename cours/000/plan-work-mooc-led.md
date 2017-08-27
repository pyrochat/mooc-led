% Enseignes et afficheurs à LED
% Plan du MOOC
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL

<img src="../../statiques/images/vignette.jpg" alt="Vignette du MOOC" style="width: 300px; text-align=center;"/>

Version de travail du 2017/03/22

**Enseignants** : (YT) : Yves Tiecours, (AT) Alain Tiedeu, (MLN) Mamadou Lamine Ndiaye, (PYR) Pierre-Yves Rochat.

**Documents** : Les notes de cours sont disponibles en HTML et en PDF. Les dispositives sont en PDFen version compacte.

**Domaines** : Le cours introduit progressivement des sujets en *électronique* et en *microcontrôleur*, pour apprendre à concevoir des enseignes et des afficheurs à LED. En parallèle, un cours de *circuits logiques* est donné, pour mener à la réalisation de commande d'afficheurs complexes utilisant des FPGA. En plus, quelques sujets de *physique* sont proposés.


## Semaine 1 ##



**1.1** **Introduction aux enseignes et afficheurs à LED**  (PYR)  [cours-html](../101/intro.html) [cours-pdf](../101/intro.pdf)   
**1.2** **Circuits électriques**  (PYR)  [cours-html](../102/electric.html) [cours-pdf](../102/electric.pdf) [dias-compact](../102/electric-dia-compact.pdf)   
**1.3** **Nombres et champs de bits**  (YT)  [cours-html](../103/binaire.html) [cours-pdf](../103/binaire.pdf) [dias-compact](../103/binaire-dia-compact.pdf)   
**1.4** **Circuits logiques combinatoires**  (MLN) *[Logique]*  [dias-compact](../104/sys-combi-dia-compact.pdf)   
**1.5** **Synthèse de circuits combinatoires**  (MLN) *[Logique]*  [dias-compact](../105/synth-combi-dia-compact.pdf)   
**1.6** **Le microcontrôleur**  (PYR)  [cours-html](../106/microcontroleur.html) [cours-pdf](../106/microcontroleur.pdf) [dias-compact](../106/microcontroleur-dia-compact.pdf)   
**1.21** *Pratique :* Montages sur Breadboard (?)   
**1.22** *Pratique sur PC :* Simulateur logique (?)   
**1.23** *Pratique sur PC :* Programmation avec Energia (?)   
**1.24** *Pratique :* Montages logiques combinatoires (?)   

### Expérience à distance

* LaunchPad MSP430, 2 LED (+caméra)
   
### Devoirs de programmation

* Génération d’une séquence simple Rouge-Vert-éteint (+chronogramme)
   

## Semaine 2 ##



**2.1** **La diode à jonction : principes physiques**  (AT) *[Physique]*  [dias-compact](../201/jonction-pn-dia-compact.pdf)   
**2.2** **Le transistor**  (YT)  [cours-html](../202/transistor.html) [cours-pdf](../202/transistor.pdf) [dias-compact](../202/transistor-dia-compact.pdf)   
**2.3** **Programmation en C-Arduino**  (PYR)  [cours-html](../203/C-Arduino.html) [cours-pdf](../203/C-Arduino.pdf) [dias-compact](../203/C-Arduino-dia-compact.pdf)   
**2.4** **Enseignes à motifs fixes**  (PYR)  [cours-html](../204/enseignes-fixes.html) [cours-pdf](../204/enseignes-fixes.pdf) [dias-compact](../204/enseignes-fixes-dia-compact.pdf)   
**2.5** **Introduction au VHDL**  (MLN) *[Logique]*  [dias-compact](../205/vhdl-dia-compact.pdf)   
**2.6** **Instructions concurrentes en VHDL**  (MLN) *[Logique]*  [dias-compact](../206/concur-dia-compact.pdf)   
**2.21** *Pratique :* Montages à transistor <!-- (2 segments de 4 LED) --> (?)   
**2.22** *Pratique :* Bascule D (?)   
**2.23** *Pratique :* Microcontrôleur sur Breadboard (?)   
**2.24** *Pratique sur PC :* Séquenceurs sur simulateur logique (?)   

### Expérience à distance

* MSP430, chenillard 8 LED et 1 poussoir sur breadboard
   
### Devoirs de programmation

* Chenillard simple
* Chenillard aller-retour, lancé par un poussoir
   

## Semaine 3 ##



**3.1** **Circuits logiques séquentiels**  (MLN) *[Logique]*  [dias-compact](../301/seq-dia-compact.pdf)   
**3.2** **Entrées-sorties**  (PYR)  [cours-html](../302/entrees-sorties.html) [cours-pdf](../302/entrees-sorties.pdf) [dias-compact](../302/entrees-sorties-dia-compact.pdf)   
**3.3** **PWM : modulation de largeur d'impulsion**  (PYR)  [cours-html](../303/pwm.html) [cours-pdf](../303/pwm.pdf) [dias-compact](../303/pwm-dia-compact.pdf)   
**3.4** **Le multiplexage temporel**  (PYR)  [cours-html](../304/multiplex.html) [cours-pdf](../304/multiplex.pdf) [dias-compact](../304/multiplex-dia-compact.pdf)   
**3.5** **Registre d’extension série-parallèle**  (PYR)  [cours-html](../305/registres-ser-par.html) [cours-pdf](../305/registres-ser-par.pdf) [dias-compact](../305/registres-ser-par-dia-compact.pdf)   
**3.6** **Caractéristiques des LED**  (AT) *[Physique]*  [dias-compact](../306/carac-dia-compact.pdf)       
**3.21** *Pratique sur PC :* Passage de l’Arduino au C (?)   
**3.22** *Pratique sur PC :* Programmation de deux PWM (?)   
**3.23** *Pratique sur PC :* Mise en oeuvre d’un Launchpad MSP432 (?)   
**3.24** *Pratique :* Mise en œuvre d’une LED RGB en PWM (?)   

### Expérience à distance

* Enseigne HOTEL, pilotée par un registre HC595
   
### Devoirs de programmation

* Enseigne HOTEL, animation simple
* Enseigne HOTEL, animation à PWM
   

## Semaine 4 ##



**4.1** **Afficheurs matriciels**  (PYR)  [cours-html](../401/matrice.html) [cours-pdf](../401/matrice.pdf) [dias-compact](../401/matrice-dia-compact.pdf)   
**4.2** **BCM : la modulation codée binaire**  (PYR)  [cours-html](../402/bcm.html) [cours-pdf](../402/bcm.pdf) [dias-compact](../402/bcm-dia-compact.pdf)   
**4.3** **Mémoires permanentes**  (PYR)  [cours-html](../403/memoires-perm.html) [cours-pdf](../403/memoires-perm.pdf) [dias-compact](../403/memoires-perm-dia-compact.pdf)   
**4.4** **Séquenceurs à compteurs**  (YT)  [cours-html](../404/seq-compteur.html) [cours-pdf](../404/seq-compteur.pdf) [dias-compact](../404/seq-compteur-dia-compact.pdf)   
**4.5** **Circuits séquentiels en VHDL**  (MLN) *[Logique]*  [dias-compact](../405/seq-vhdl-dia-compact.pdf)   
**4.6** **LED, lumière et couleur**  (AT) *[Physique]*  [dias-compact](../406/couleur-dia-compact.pdf)   
**4.21** *Pratique :* Circuit imprimé 16x16 LED (?)   
**4.22** *Pratique :* Veroboard 31x7 LED (?)   

### Expérience à distance

* Afficheur matriciel 31x7 (veroboard)
* Afficheur 16x16
   
### Devoirs de programmation

* Ping sur afficheur 16x16
* Texte défilant sur afficheur 31x7
   

## Semaine 5 ##



**5.1** **Les Interruptions**  (YT)  [cours-html](../501/inter.html) [cours-pdf](../501/inter.pdf) [dias-compact](../501/inter-dia-compact.pdf)   
**5.2** **Les timers**  (YT)  [cours-html](../502/timers.html) [cours-pdf](../502/timers.pdf)   
**5.3** **Rubans de LED adressables**  (PYR)  [cours-html](../503/rubans.html) [cours-pdf](../503/rubans.pdf) [dias-compact](../503/rubans-dia-compact.pdf)   
**5.4** **Les afficheurs matriciels multiplexés**  (PYR)  [cours-html](../504/matrice-mux.html) [cours-pdf](../504/matrice-mux.pdf) [dias-compact](../504/matrice-mux-dia-compact.pdf)   
**5.5** **Circuits logiques prorammables : FPGA**  (MLN)  [dias-compact](../505/fpga-dia-compact.pdf)   
**5.6** **Correction Gamma**  (AT) *[Physique]*  [dias-compact](../506/gamma-dia-compact.pdf)   
**5.21** *Pratique :* Récepteur de télécommande IR (?)   
**5.22** *Pratique :* Mise en oeuvre d’un ruban de LED (?)   
**5.29** *Pratique sur PC :* Mise en oeuvre d’un DE0-nano (MLN)   

### Expérience à distance

* Rubans de LEDs RGB, pilotée par un MSP432
* Afficheur Matriciel RGB
   
### Devoirs de programmation

* Goutte tombante sur un ruban de LED
* Animation graphique sur afficheur matriciel RGB
   

## Semaine 6 ##



**6.1** **Direct Memory Access**  (PYR+BP)    
**6.2** **Horloges temps réel**  (PYR)  [cours-html](../602/horloge.html) [cours-pdf](../602/horloge.pdf) [dias-compact](../602/horloge-dia-compact.pdf)   
**6.3** **Commande à distance**  (PYR+NJ)  [cours-html](../603/com-distance.html) [cours-pdf](../603/com-distance.pdf) [dias-compact](../603/com-distance-dia-compact.pdf)   
**6.4** **Langages interprétés spécialisés**  (PYR)  [cours-html](../604/lang-interpr.html) [cours-pdf](../604/lang-interpr.pdf) [dias-compact](../604/lang-interpr-dia-compact.pdf)   
**6.5** **Commande d’une matrice à LED avec une FPGA**  (MLN) *[Logique]*  [dias-compact](../605/commande-fpga-dia-compact.pdf)   
**6.6** **Vidéo et murs de LED**  (PYR)  [cours-html](../606/murs-led.html) [cours-pdf](../606/murs-led.pdf) [dias-compact](../606/murs-led-dia-compact.pdf)   
**6.21** *Pratique :* Afficheur matriciel commandé en DMA (BP?)   
**6.22** *Pratique :* Affichage de l’heure sur une enseigne à MSP432 (?)   
**6.23** *Pratique :* Mise en oeuvre d’un module WiFi (NJ)   

### Expérience à distance

* (toutes les expériences à disposition)
   
### Devoirs de programmation

* Réalisation libre sur une des expériences à distance disponibles (jury des étudiants pour la vidéo, jury des profs pour les candidats au certificat)
* -ou- Réalisation pratique personnelle (petit rapport avec photos et sources des programmes).
   