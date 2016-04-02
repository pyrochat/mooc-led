#!/bin/bash

# ##########
#
# Génération des images bitmaps à partir des images SVG
# Usage : ./gen-images.sh NUMERO-CHAPITRE
#
# Ce script ne fonctionne pas sur OSX (malgré mes tentatives).
#
# Mars 2016, Nicolas Jeanmonod
#
# ##########

SCRIPT=`realpath $0`
CUR_DIR=`dirname $SCRIPT`
echo $CUR_DIR

if [[ "$OSTYPE" == darwin14 ]]; then
	shopt -s expand_aliases
	alias inkscape="/Applications/inkscape.app/Contents/Resources/bin/inkscape"
fi

case "$1" in

104)
cd $CUR_DIR/../cours/104/
inkscape -z -C images/non.svg -e=images/non-300dpi.png -d=300
inkscape -z -C images/ou.svg -e=images/ou-300dpi.png -d=300
inkscape -z -C images/et.svg -e=images/et-300dpi.png -d=300
inkscape -z -C images/nand.svg -e=images/nand-300dpi.png -d=300
inkscape -z -C images/nor.svg -e=images/nor-300dpi.png -d=300
inkscape -z -C images/xor.svg -e=images/xor-300dpi.png -d=300
inkscape -z -C images/schema-xor.svg -e=images/schema-xor-300dpi.png -d=300
inkscape -z -C images/fonction-logique.svg -e=images/fonction-logique-300dpi.png -d=300
inkscape -z -C images/fonc-3e-0.svg -e=images/fonc-3e-0-300dpi.png -d=300
inkscape -z -C images/fonc-3e-a.svg -e=images/fonc-3e-a-300dpi.png -d=300
inkscape -z -C images/fonc-3e-b.svg -e=images/fonc-3e-b-300dpi.png -d=300
inkscape -z -C images/fonc-3e.svg -e=images/fonc-3e-300dpi.png -d=300
;;

105)
cd $CUR_DIR/../cours/105/
inkscape -z -C images/fonction-logique.svg -e=images/fonction-logique-300dpi.png -d=300
inkscape -z -C images/kar-3.svg -e=images/kar-3-300dpi.png -d=300
inkscape -z -C images/kar-3-s1.svg -e=images/kar-3-s1-300dpi.png -d=300
inkscape -z -C images/kar-3-s0.svg -e=images/kar-3-s0-300dpi.png -d=300
inkscape -z -C images/logigramme-ps.svg -e=images/logigramme-ps-300dpi.png -d=300
inkscape -z -C images/logigramme-sp.svg -e=images/logigramme-sp-300dpi.png -d=300

inkscape -z -C images/exp-ps.svg -e=images/exp-ps-300dpi.png -d=300
inkscape -z -C images/exp-sp.svg -e=images/exp-sp-300dpi.png -d=300

inkscape -z -C images/schema-kar1.svg -e=images/schema-kar1-300dpi.png -d=300
inkscape -z -C images/schema-kar2.svg -e=images/schema-kar2-300dpi.png -d=300

inkscape -z -C images/kar-4a.svg -e=images/kar-4a-300dpi.png -d=300
inkscape -z -C images/kar-4b.svg -e=images/kar-4b-300dpi.png -d=300
inkscape -z -C images/kar-4c.svg -e=images/kar-4c-300dpi.png -d=300
inkscape -z -C images/kar-4d.svg -e=images/kar-4d-300dpi.png -d=300
inkscape -z -C images/kar-4e.svg -e=images/kar-4e-300dpi.png -d=300
inkscape -z -C images/kar-4f.svg -e=images/kar-4f-300dpi.png -d=300
inkscape -z -C images/kar-4g.svg -e=images/kar-4g-300dpi.png -d=300
inkscape -z -C images/kar-4a-s.svg -e=images/kar-4a-s-300dpi.png -d=300

inkscape -z -C images/decodeur7-Seg.svg -e=images/decodeur7-Seg-300dpi.png -d=300

inkscape -z -C images/deco-verite.svg -e=images/deco-verite-300dpi.png -d=300
inkscape -z -C images/deco-verite-r.svg -e=images/deco-verite-r-300dpi.png -d=300

inkscape -z -C images/formule-a.svg -e=images/formule-a-300dpi.png -d=300
;;

106)
cd $CUR_DIR/../cours/106/
inkscape -z -C images/architecture-sys-info.svg -e=images/architecture-sys-info-200dpi.png -d=200
inkscape -z -C images/schema-msp430.svg -e=images/schema-msp430-200dpi.png -d=200
;;

201)
cd $CUR_DIR/../cours/201/
inkscape -z -C images/bohr.svg -e=images/bohr-300dpi.png -d=300
inkscape -z -C images/test-diode.svg -e=images/test-diode-200dpi.png -d=200
inkscape -z -C images/jonction.svg -e=images/jonction-200dpi.png -d=200
inkscape -z -C images/diode.svg -e=images/diode-200dpi.png -d=200
inkscape -z -C images/carac-prat.svg -e=images/carac-prat-200dpi.png -d=200

inkscape -z -C images/energie-niveaux.svg -e=images/energie-niveaux-200dpi.png -d=200
inkscape -z -C images/valence.svg -e=images/valence-200dpi.png -d=200
inkscape -z -C images/SC-base.svg -e=images/SC-base-200dpi.png -d=200
inkscape -z -C images/elec-trou.svg -e=images/elec-trou-200dpi.png -d=200
inkscape -z -C images/dopeP.svg -e=images/dopeP-200dpi.png -d=200
inkscape -z -C images/dopeN.svg -e=images/dopeN-200dpi.png -d=200
;;

202)
cd $CUR_DIR/../cours/202/
inkscape -z -C images/transistor-tripol.svg -e=images/transistor-tripol-150dpi.png -d=150
inkscape -z -C images/transistor-robinet.svg -e=images/transistor-robinet-150dpi.png -d=150
inkscape -z -C images/transistor-npn.svg -e=images/transistor-npn-80dpi.png -d=80
inkscape -z -C images/transistor-pnp.svg -e=images/transistor-pnp-80dpi.png -d=80
inkscape -z -C images/transistor-res-led.svg -e=images/transistor-res-led-50dpi.png -d=50
;;

203)
cd $CUR_DIR/../cours/203/
inkscape -z -C images/organi-arduino.svg -e=images/organi-arduino-120dpi.png -d=120
inkscape -z -C images/organi-arduino.svg -e=images/organi-arduino-1-300dpi.png -d=300 --export-id=g1 -j
inkscape -z -C images/organi-arduino.svg -e=images/organi-arduino-12-300dpi.png -d=300 --export-id=g12 -j
inkscape -z -C images/chrono-blink.svg -e=images/chrono-blink-300dpi.png -d=300
;;

204)
cd $CUR_DIR/../cours/204/
inkscape -z -C images/transistor-res-leds.svg -e=images/transistor-res-leds-50dpi.png -d=50
inkscape -z -C images/transistor-serie-led.svg -e=images/transistor-serie-led-40dpi.png -d=40
inkscape -z -C images/transistor-3-5led.svg -e=images/transistor-3-5led-30dpi.png -d=30
;;

207)
cd $CUR_DIR/../cours/207/

inkscape -z -C images/diode-led.svg -e=images/diode-led-g1.png -i g1 -j -d=150
inkscape -z -C images/diode-led.svg -e=images/diode-led-g2.png -i g2 -j -d=150
inkscape -z -C images/diode-led.svg -e=images/diode-led-g3.png -i g3 -j -d=150
inkscape -z -C images/diode-led.svg -e=images/diode-led-g4.png -i g4 -j -d=150
inkscape -z -C images/diode-led.svg -e=images/diode-led-g5.png -i g5 -j -d=150

inkscape -z -C images/carac-prat.svg -e=images/carac-prat-150dpi.png -d=150
inkscape -z -C images/carac-max.svg -e=images/carac-max-150dpi.png -d=150
inkscape -z -C images/coul-tension.svg -e=images/coul-tension-150dpi.png -d=150

inkscape -z -C images/flux-courant.svg -e=images/flux-courant-300dpi.png -d=300
inkscape -z -C images/flux-temp.svg -e=images/flux-temp-300dpi.png -d=300
inkscape -z -C images/longueur-onde.svg -e=images/longueur-onde-300dpi.png -d=300

inkscape -z -C images/t-e-i-e.svg -e=images/t-e-i-e-300dpi.png -d=300
;;

301)
cd $CUR_DIR/../cours/301/
inkscape -z -C images/bascule_D_3.svg -e=images/bascule_D_3.png -d=120

;;

304)
cd $CUR_DIR/../cours/304/
inkscape -z -C images/led2-patte1.svg -e=images/led2-patte1-150dpi.png -d=150
inkscape -z -C images/charlie-3pattes.svg -e=images/charlie-3pattes-150dpi.png -d=150
inkscape -z -C images/segment7.svg -e=images/segment7-150dpi.png -d=150
inkscape -z -C images/segment7x4.svg -e=images/segment7x4-150dpi.png -d=150
;;

306)
cd $CUR_DIR/../cours/306/
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-120dpi.png -d=120
;;

307)
cd $CUR_DIR/../cours/307/
inkscape -z -C images/absorptio-emission.svg -e=images/absorptio-emission-60dpi.png -d=60
inkscape -z -C images/led-lum.svg -e=images/led-lum-100dpi.png -d=100
inkscape -z -C images/bande-energie.svg -e=images/bande-energie-60dpi.png -d=60
inkscape -z -C images/triplets.svg -e=images/triplets-150dpi.png -d=150
inkscape -z -C images/mat-coul.svg -e=images/mat-coul-150dpi.png -d=150

inkscape -z -C images/ronds-3-add.svg -e=images/ronds-3-add-150dpi.png -d=150
inkscape -z -C images/ronds-3-sous.svg -e=images/ronds-3-sous-150dpi.png -d=150

inkscape -z -C images/led-rgb.svg -e=images/led-rgb-150dpi.png -d=150
inkscape -z -C images/led-rgb-ac.svg -e=images/led-rgb-ac-150dpi.png -d=150
inkscape -z -C images/led-rgb-cc.svg -e=images/led-rgb-cc-150dpi.png -d=150
inkscape -z -C images/led-rgb-coul.svg -e=images/led-rgb-coul-150dpi.png -d=150
inkscape -z -C images/led-rgb-pwm.svg -e=images/led-rgb-pwm-150dpi.png -d=150
;;

401)
cd $CUR_DIR/../cours/401/
inkscape -z -C images/aff-8x16.svg -e=images/aff-8x16-120dpi.png -d=120
inkscape -z -C images/aff-8x16.svg -e=images/aff-8x16-200dpi.png -d=200
inkscape -z -C images/aff-10x24.svg -e=images/aff-10x24-300dpi.png -d=300

inkscape -z -C images/reg-ser-par-timing-s.svg -e=images/reg-ser-par-timing-s-200dpi.png -d=200
;;

402)
cd $CUR_DIR/../cours/402/
inkscape -z -C images/pwm.svg -e=images/pwm-50dpi.png -d=50
;;

404)
cd $CUR_DIR/../cours/404/
inkscape -z -C images/chrono-enseigne.svg -e=images/chrono-enseigne-300dpi.png -d=300
inkscape -z -C images/graphe-enseigne.svg -e=images/graphe-enseigne-300dpi.png -d=300
inkscape -z -C images/compteur8.svg -e=images/compteur8-600dpi.png -d=600
inkscape -z -C images/chrono-compteur.svg -e=images/chrono-compteur-200dpi.png -d=200
inkscape -z -C images/graphe-compteur.svg -e=images/graphe-compteur-300dpi.png -d=300
inkscape -z -C images/div2.svg -e=images/div2-400dpi.png -d=400
inkscape -z -C images/div2.svg -e=images/div2-120dpi.png -d=120
inkscape -z -C images/div2n.svg -e=images/div2n-100dpi.png -d=100
inkscape -z -C images/compteur8-osc.svg -e=images/compteur8-osc-220dpi.png -d=220
inkscape -z -C images/compteur8-osc-log.svg -e=images/compteur8-osc-log-220dpi.png -d=220
inkscape -z -C images/table-enseigne.svg -e=images/table-enseigne-300dpi.png -d=300
inkscape -z -C images/rom.svg -e=images/rom-300dpi.png -d=300
inkscape -z -C images/schema-seq-rom.svg -e=images/schema-seq-rom-180dpi.png -d=180
inkscape -z -C images/schema-seq-rom-det.svg -e=images/schema-seq-rom-det-180dpi.png -d=180

inkscape -z -C images/rom.svg -e=images/rom-220dpi.png -d=220
inkscape -z -C images/rom-int.svg -e=images/rom-int-220dpi.png -d=220

inkscape -z -C images/ouvert.svg -e=images/ouvert-220dpi.png -d=220
inkscape -z -C images/ouvert0.svg -e=images/ouvert0-220dpi.png -d=220
inkscape -z -C images/ouvert1.svg -e=images/ouvert1-220dpi.png -d=220
inkscape -z -C images/ouvert2.svg -e=images/ouvert2-220dpi.png -d=220
inkscape -z -C images/ouvert3.svg -e=images/ouvert3-220dpi.png -d=220
inkscape -z -C images/ouvert4.svg -e=images/ouvert4-220dpi.png -d=220
inkscape -z -C images/ouvert5.svg -e=images/ouvert5-220dpi.png -d=220
;;

406)
cd $CUR_DIR/../cours/406/
inkscape -z -C images/syst-image.svg -e=images/syst-image-100dpi.png -d=100
inkscape -z -C images/syst-gamma.svg -e=images/syst-gamma-100dpi.png -d=100

inkscape -z -C images/faisceau-ecran.svg -e=images/faisceau-ecran-60dpi.png -d=60


inkscape -z -C images/faisceau-tension.svg -e=images/faisceau-tension-60dpi.png -d=60
inkscape -z -C images/ecran-tension.svg -e=images/ecran-tension-60dpi.png -d=60
inkscape -z -C images/ecran-faisceau.svg -e=images/ecran-faisceau-60dpi.png -d=60
inkscape -z -C images/entree-sortie.svg -e=images/entree-sortie-60dpi.png -d=60

inkscape -z -C images/syst-lut.svg -e=images/syst-lut-100dpi.png -d=100
;;

501)
cd $CUR_DIR/../cours/501/
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-90dpi.png -d=90
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-g1.png -i g1 -j -d=90
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-g2.png -i g2 -j -d=90
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-g3.png -i g3 -j -d=90
inkscape -z -C images/dring-allo.svg -e=images/dring-allo-g4.png -i g4 -j -d=90
;;

502)
cd $CUR_DIR/../cours/502/
inkscape -z -C images/compteur-pwm.svg -e=images/compteur-pwm-300dpi.png -d=300
inkscape -z -C images/timer-base.svg -e=images/timer-base-300dpi.png -d=300
inkscape -z -C images/timer-base.svg -e=images/timer-base-150dpi.png -d=150
inkscape -z -C images/div2.svg -e=images/div2-150dpi.png -d=150
inkscape -z -C images/div2.svg -e=images/div2-200dpi.png -d=200
inkscape -z -C images/div2n.svg -e=images/div2n-150dpi.png -d=150
inkscape -z -C images/chrono-compteur.svg -e=images/chrono-compteur-300dpi.png -d=300

inkscape -z -C images/pre-div.svg -e=images/pre-div-300dpi.png -d=300
inkscape -z -C images/logique-timer.svg -e=images/logique-timer-300dpi.png -d=300
inkscape -z -C images/registre-comp.svg -e=images/registre-comp-300dpi.png -d=300
;;

602)
cd $CUR_DIR/../cours/602/
inkscape -z -C images/xx.svg -e=images/xx-60dpi.png -d=60
;;

603)
cd $CUR_DIR/../cours/603/
inkscape -z -C images/xx.svg -e=images/xx-60dpi.png -d=60
;;

604)
cd $CUR_DIR/../cours/604/
inkscape -z -C images/xx.svg -e=images/xx-60dpi.png -d=60
;;

*)
echo "Usage: ./gen-images.sh NUMERO-CHAPITRE"
exit 1
;;

esac
exit 0
