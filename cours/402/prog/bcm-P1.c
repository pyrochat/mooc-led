#define BITS_BCM 8

void Attente(uint16_t duree) {
  volatile uint16_t i;
  for (i=0; i<(duree*64); i++) {
  }
}

uint8_t Intens[8] = {0, 0, 0, 0, 0, 0, 128, 0};
uint8_t n, b;
uint8_t t = 0;

int main() {
  WDTCTL = WDTPW+WDTHOLD; // stoppe le WatchDog
  BCSCTL1 = CALBC1_16MHZ; DCOCTL = CALDCO_16MHZ;
  P1DIR = 0xFF; // toutes les broches de P1 en sortie

  while (1) { // Boucle infinie :
    for (n=0; n<BITS_BCM; n++) { // pour une période du BCM
      for (b=0; b<8; b++) { // pour chaque bit de sortie
        if (Intens[b] & (1<<n)) P1OUT|=(1<<b); else P1OUT&=~(1<<b);
      }
      Attente(1<<n);
    }
    // calcul des prochaines valeurs des intensités :
    for (n=0; n<8; n++) {
      Intens[n]++;
    } 
  }
}
