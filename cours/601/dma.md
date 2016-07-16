% Dynamic Memory Access
% [Pierre-Yves Rochat](mailto:pyr@pyr.ch), EPFL
% rév 2015/09/18


## Se passer du CPU ##

Comme nous l'avons vu précédemment, un microcontrôleur est généralement composé d'un CPU (core ARM, PIC, AVR, etc) et de périphériques divers (ADC, GPIO, timer, etc).
Le core et les périphériques sont reliés entre eux par un ou plusieurs bus.

![Carte SoC](images/soc_map.png "Carte SoC"){ width=15cm }

