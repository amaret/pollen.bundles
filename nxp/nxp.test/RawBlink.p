

module RawBlink {
  
  +{ #include "LPC17xx.h" }+

  volatile uint32 temp

  pollen.run() {
    +{
        LPC_SC->PCONP |= ( 1 << 15 ); // power up GPIO
        LPC_GPIO1->FIODIR |= 1 << 21 | 1 << 20; // puts pin into output mode.
        while(1)
        {
          LPC_GPIO1->FIOPIN ^= 1 << 21 | 1 << 20; // make P1.29 high
          `_delay`( 1 << 22 );
        }
    }+
  }

  _delay(uint32 del) {
    uint32 i

    for(i = 0; i < del; i++) {
      temp = i
    }
  }

}
