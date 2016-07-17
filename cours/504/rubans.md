% Rubans de LED
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2016/07/09

Document incomplet, en cours de rédaction.

## Plusieurs sortes de rubans ###

On trouve sur le marché plusieurs types de rubans de LED. On distingue principalement les rubans uniformes et les rubans adressables. Les rubans uniformes peuvent être d'une seule couleur fixe. Dans ce cas seule l'intensité peut être modifiée, par une commande en PWM. Ils peuvent aussi être multicolores. Dans ce cas, tout le ruban peut changer de couleur en même temps. Généralement, la commande se fait par un triple PWM, un pour chaque couleur.

Nous allons nous intéresser ici aux rubans adressables. Chaque pixel du ruban peut alors prendre une couleur indépendamment des autres pixels.


## Les rubans adressables ##

Plusieurs solutions sont techniquement possibles pour faire varier l'intensité de chaque pixel d'un ruban. Celles qui minimisent le nombre de fils utilisé sont évidemment les plus intéressantes. Il faut forcément deux fils pour alimenter les LED, le Gnd et le Vcc. Est-ce possible d'utiliser un seul fil pour apporter à chaque pixel l'information qui le concerne ?

Une solution très souvent utilisée présente l'architecture suivante :

![Rubans à 3 fils](images/archi.ruban.svg "Rubans à 3 fils"){ width=90% }

Alors que les deux fils d'alimentation relient chaque module de pixel, le troisième fil relie la sortie d'un module vers l'entrée d'un autre.


## Le protocole des WS280x ##

On imagine bien que les données vont être transmises en série. Mais il devient nécessaire de regrouper sur un seul fil les données et l'horloge. Le principe est une horloge asymétrique :

![Horloge asymétrique](images/horloge-asym.svg "Horloge asymétrique"){ width=90% }


Chaque bit est transmis par un cycle d'horloge. Lorsque la durée de la partie haute du signal est plus longue que le durée de la partie basse, le bit transmis est un zéro.

Dans le cas des circuits de la famille WS280x, un circuit intégré est utilisé pour chaque pixel, composé de trois LED de couleur rouge, verte et bleu. Souvent, les trois LED sont encapsulées dans le même boîtier. On parle alors d'une LED RGB (*Red Green Blue*).

Chaque LED est commandée par un signal PWM de 8 bits. Il est donc nécessaire d'envoyer 24 bits pour chaque pixel. 


## Reset ##

Pour synchroniser le début de l'envoi d'une nouvelle série de valeurs à tous les pixels du ruban, une attente d'au moins 50 us est nécessaire. Chaque circuit est alors prêt à recevoir 24 bits. L'astuce utilisée est alors la suivante : chaque circuit ne transmet à sa sortie les information qui se présentent à sont entrée qu'après avoir enregistré les 24 premiers bits qui succèdent au Reset.

La figure suivante explique ce principe :

![Mise en cascade des modules](images/horloge-asym.svg "Mise en cascade des modules"){ width=90% }


## Signaux rapides ##

Les contraintes qu'imposent ce circuit sur le timing des signaux rendent difficile sa programmation avec un AVR ou un MSP430. Des solutions ont toutefois été trouvées, e programmant en assembleur, ou encore en utilisant de manière astucieuse le circuit de communication série.

Avec un processeur ARM, c'est plus facile de respecter les exigence temporelles. Nous allons ici montrer un programme écrit pour un STM32, testé sur une carte Nucleo :

~~~~~~~ { .c }

~~~~~~~


<!-- retour au mode normal pour l'éditeur -->

