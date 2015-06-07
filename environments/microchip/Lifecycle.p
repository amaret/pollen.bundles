import pollen.environment as Board

module Lifecycle {
  
  +{
      // CONFIG1
      #pragma config FOSC = INTOSC    // Oscillator Selection (INTOSC oscillator: I/O function on CLKIN pin)
      #pragma config WDTE = OFF       // Watchdog Timer Enable (WDT disabled)
      #pragma config PWRTE = OFF      // Power-up Timer Enable (PWRT disabled)
      #pragma config MCLRE = OFF      // MCLR Pin Function Select (MCLR/VPP pin function is MCLR)
      #pragma config CP = OFF         // Flash Program Memory Code Protection (Program memory code protection is disabled)
      #pragma config CPD = OFF        // Data Memory Code Protection (Data memory code protection is disabled)
      #pragma config BOREN = ON       // Brown-out Reset Enable (Brown-out Reset enabled)
      #pragma config CLKOUTEN = OFF   // Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
      #pragma config IESO = OFF       // Internal/External Switchover (Internal/External Switchover mode is enabled)
      #pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is enabled)

      // CONFIG2
      #pragma config WRT = OFF        // Flash Memory Self-Write Protection (Write protection off)
      #pragma config PLLEN = OFF      // PLL Enable (4x PLL enabled)
      #pragma config STVREN = OFF     // Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will cause a Reset)
      #pragma config LVP = OFF        // Low-Voltage Programming Enable (High-voltage on MCLR/VPP must be used for programming)
  }+

  pollen.reset() {
    Board.reset()           // reset board cpu
    +{ OSCCON }+ = 0x7A     // internal oscillator, no PLL, 32 MHz
  }

  pollen.ready() {

  }

  pollen.shutdown(uint8 id) {

  }

}