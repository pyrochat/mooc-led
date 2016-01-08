// Commande de 2 LED avec une seule broche du microcontrôleur
//--------------------------------------
// MOOC Enseignes et afficheurs à LED
// 2015, Pierre-Yves Rochat, pyr@pyr.ch
//--------------------------------------

#define Sortie0 pinMode(P1_4, OUTPUT); digitalWrite(P1_4, 0)
#define Sortie1 pinMode(P1_4, OUTPUT); digitalWrite(P1_4, 1)
#define SortieH pinMode(P1_4, INPUT)

void setup() {
}

void loop() {
  uint8_t i;
  SortieH ; delay (1000); // LED1 et LED2 éteintes pendant 1 seconde

  for (i=0; i<250; i++) { // 250 x 4ms = 1 s
    Sortie1; delay (2); // LED1 allumée
    SortieH; delay (2); // LED1 et LED2 éteintes
  }

  for (i=0; i<250; i++) { // 250 x 4ms = 1 s
    Sortie0; delay (2); // LED2 allumée
    SortieH; delay (2); // LED1 et LED2 éteintes
  }

  for (i=0; i<250; i++) { // 250 x 4ms = 1 s
    Sortie1; delay (2); // LED1 allumée
    Sortie0; delay (2); // LED2 allumée
  }
}
