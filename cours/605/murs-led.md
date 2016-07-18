% Murs de LED
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/07/11

Document en cours de rédaction.

Des LED rouges ont commencé à être fabriquées en série à la fin des années 1960. Leur luminosité, ou plus exactement leur rendement, n'a fait qu'augmenter depuis cette époque.

Le prix des LED n'a fait que baisser au cours des années, rendant possible financièrement l'usage de LED en nombre important. C'est à ce moment que sont apparus les premiers journaux lumineux monochromes. Leur taille n'a fait qu'augmenter depuis.

Si des LED vertes ont suivi les LED rouges déjà dans les années 1970, il a fallu attendre les années 1990 pour que des LED bleues utilisables deviennent disponible. Il devenait alors possible de réaliser des afficheurs multicolores, avec des pixels construits au moyen de trois LED rouges, vertes et bleues. Avec un nombre suffisant de pixels, de véritables écrans vidéos ont pu être réalisés.

Actuellement, le plus long afficheur de ce type mesure... 460 m ! Couramment, des écrans de plusieurs dizaines de mètre carrés forment de véritables murs de LED, très souvent utilisés lors de spectacles publiques.

Nous allons voir comment ils sont réalisés.


## Des millions de LED ##

Le nombre de LED d'un afficheur dépend de sa taille et de l'espacement entre les LED. La distance en deux LED, exprimée en mm, est souvent appelée le _**Pitch**_ d'un afficheur. Prenons un exemple.

Calculons le nombre de LED d'un afficheur de 16x9 m avec un pitch de 6 mm :
* nombre de pixels par mètre : 1'000 / 6 = 166 LED par mètre
* nombre de pixels par mètre carré : 166 x 166 = 27'556
* nombre de pixels pour l'afficheur : 16 x 9 x 27'556 = 3'968'064
* avec 3 LED par pixel (rouge, vert, bleu) : 3 x 3 968 064 = 11'904'192

L'affichage d'une image vidéo sur un tel afficheur nécessite l'envoi d'une valeur d'intensité variable sur chaque LED. Cette intensité va changer au rythme des images successives de la vidéo, par exemple 25 fois par seconde.

Pour produire une intensité variable, une modulation du type PWM ou BCM est utilisée. Quelle que soit la modulation, le temps entre l'allumage et l'extinction d'une LED peut être calculé en fonction de la fréquence de rafraîchissement et du nombre de bits de l'intensité. Prenons l'exemple d'un rafraîchissement de 100 Hz et de 8 bits d'intensité.

* Période de rafraîchissement : 1 / 100 Hz = 10 ms
* Fraction du temps utilisé pour l'affichage de l'intensité la plus faible : 8 bits correspondent à 256 valeur, la fraction est donc de 1 / 256.
* Durée d'affichage de l'intensité la plus faible : 10 ms / 256 = 39 us

Dans notre mur de LED, il faut donc être capable d'envoyer une nouvelle valeur à environ 12 millions de LED en un temps de 39 us.
Seule une organisation hiérarchique du mur de LED permet une telle performance.


## Panneaux et modules ##

Les écrans géants sont généralement composés de panneaux. Chaque panne doit être couvert de LED jusqu'à son bord pour assurer une continuité de l'image. Les panneaux ont souvent environ un mètre carré. Les panneaux se fixent les uns aux autres par des fixations mécaniques adéquates.

Chaque panneau est constitué de modules carrés ou rectangulaires. On trouve souvent 4 rangées de 4 carrés chacune. Chacun des module est principalement composé d'un circuit imprimé, comportant d'un côté les LED et de l'autre les circuits de commande : des registres dans le cas de modules non multiplexés et un ensemble de registres, de décodeurs  et d'amplificateurs pour des modules multiplexés.

![Organisation en panneaux et modules](images/panneaux-modules.png "Organisation en panneaux et modules"){ width=80% }

Tous les panneaux reçoivent un signal contenant les pixels de tout l'écran. Chaque panneau doit connaître sa position dans l'ensemble de l'écran, extrait du signal la partie de l'image qui le concerne et la mémorise. Ensuite, l'image est distribuée sur les modules.


... HDbaseT
PoH (Power over HDbaseT)
... HDCP ??


