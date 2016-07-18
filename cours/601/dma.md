% Dynamic Memory Access
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2015/09/18


## Rappels sur le microcontrôleur ##

Comme nous l'avons vu précédemment, un microcontrôleur est généralement composé d'un processeur (CPU), de mémoire ROM, de mémoire RAM, ainsi que de périphériques divers (I/O).
Le CPU, la mémoire et les périphériques sont reliés entre eux par un bus d'adresse et un bus de données.

![Architecture d’un système informatique](images/architecture-sys-info.svg "Architecture d’un système informatique"){ width=90% }

Le code suivant, en langage Arduino, lit l'état d'un pin et le met en mémoire.

~~~~~~~ { .c .numberLines startFrom="1" }
  int variable = digitalRead (P2_0);
~~~~~~~

Dans le microcontrôleur, ce code se déroulera de la manière suivante :

- La valeur du pin est lue par le périphérique d'entrée-sortie.
- Cette valeur est lancée sur le bus vers le CPU.
- Le CPU récupère la valeur et la place dans la mémoire RAM, via le bus.

Cette façon de faire ne pose pas de problème dans le cas de programmes simples et peu performants. Cependant, un nombre d'opérations d'entrées-sorties plus élevé peut entrainer une saturation du CPU, qui n'aura plus le temps de s'occuper du traitement des données. D'un autre point de vue, en mode embarqué, on voudra réduire autant que possible l'utilisation du CPU, particulièrement énergivore.



## Se passer du CPU ##

Comment alors décharger le CPU de ces tâches? En utilisant le contrôleur DMA, *Dynamic Memory Access*. On trouve un tel contrôleur généralement sur des microcontrôleurs évolués basés sur des cores ARM Cortex M (MSP432, STM32), mais également des PIC (PIC32, PIC24FJ).
Sur d'autres microcontrôleurs moins évolués, par exemple quelques PIC18 et le MSP430, on peut trouver un périphérique (SPI, ADC) capable de transférer des données en mémoire RAM, sans contrôleur DMA. Le fonctionnement est plus simple, mais bien plus limité.

![Vue MSP432](images/map_msp432.png "Vue MSP432"){ width=15cm }

Le contrôleur DMA est une unité dédiée, reliée aux bus d'addresse et de données. Il s'agit en quelque sorte d'un mini-CPU qui va s'occuper exclusivement de transférer les données entre la mémoire et les périphériques.
Chaque périphérique que nous souhaitons utiliser en DMA doit être conçu pour travailler avec le contrôleur DMA. L'interaction entre les deux se fait via un canal dédié.



## Le canal DMA ##