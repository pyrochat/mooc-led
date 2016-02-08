% Afficheurs matriciels multiplexés
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2015/09/18


## xxx ###

Voici 

## Variation de l'intensité ##
## La modulation codée binaire ##

La technique classique du PWM nécessite de renvoyer très souvent de l'état de chaque LED à l'afficheur. Par exemple, pour obtenir une fréquence de rafraîchissement de 100Hz et un PWM avec une résolution de 100, il faut renvoyer tous les 10 micro-secondes.

Une technique est souvent utilisée pour 
~~~~~~~ { .c .numberLines startFrom="1" }

~~~~~~~

![Organisation de l'afficheur 8x16 pixels](images/organisation-aff-8x16.png "Organisation de l'afficheur 8x16 pixels")

