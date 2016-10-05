int main() {
  WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
  P1DIR |= (1<<6); P1OUT &=~(1<<6); // LED verte en sortie
  // Activation du convertisseur ADC 10 bits (ADC10) :
  ADC10CTL0 = ADC10SHT_2 + ADC10ON + ADC10IE; // ADC10ON, interrupt enabled
  ADC10CTL1 = INCH_1; // Canal 1 = entrée A1 = P1.1
  ADC10AE0 |= (1<<1); // Enclanchement de l'entrée A1
  __enable_interrupt(); // General Interrupt Enable
  ADC10CTL0 |= ENC + ADC10SC; // lance une première conversion

  while(1) { // il n'y a rien à faire dans la boucle principale !
  }
}

// Routine d'interruption associée à la fin de conversion ADC
#pragma vector=ADC10_VECTOR
__interrupt void ADC10_ISR(void) {
  uint16_t val = ADC10MEM; // lit le résultat de la conversion
  ADC10CTL0 |= ENC + ADC10SC; // lance la conversion suivante
  if (val > 512) { // Montre sur la LED verte si la valeur dépasse Vcc/2
    P1OUT |= (1<<6); // LED verte On
  } else {
    P1OUT &=~(1<<6); // LED verte Off
  }
}
