

module Test01 {

  +{  
      #define _XTAL_FREQ 32000000

      #include <xc.h>

      // CONFIG1
      #pragma config FOSC = INTOSC    // Oscillator Selection (INTOSC oscillator: I/O function on CLKIN pin)
      #pragma config WDTE = OFF       // Watchdog Timer Enable (WDT disabled)
      #pragma config PWRTE = OFF      // Power-up Timer Enable (PWRT disabled)
      #pragma config MCLRE = ON       // MCLR Pin Function Select (MCLR/VPP pin function is MCLR)
      #pragma config CP = OFF         // Flash Program Memory Code Protection (Program memory code protection is disabled)
      #pragma config CPD = OFF        // Data Memory Code Protection (Data memory code protection is disabled)
      #pragma config BOREN = ON       // Brown-out Reset Enable (Brown-out Reset enabled)
      #pragma config CLKOUTEN = OFF   // Clock Out Enable (CLKOUT function is disabled. I/O or oscillator function on the CLKOUT pin)
      #pragma config IESO = ON        // Internal/External Switchover (Internal/External Switchover mode is enabled)
      #pragma config FCMEN = ON       // Fail-Safe Clock Monitor Enable (Fail-Safe Clock Monitor is enabled)

      // CONFIG2
      #pragma config WRT = OFF        // Flash Memory Self-Write Protection (Write protection off)
      #pragma config PLLEN = OFF       // PLL Enable (4x PLL enabled)
      #pragma config STVREN = ON      // Stack Overflow/Underflow Reset Enable (Stack Overflow or Underflow will cause a Reset)
      #pragma config BORV = LO        // Brown-out Reset Voltage Selection (Brown-out Reset Voltage (Vbor), low trip point selected.)
      #pragma config LVP = OFF        // Low-Voltage Programming Enable (High-voltage on MCLR/VPP must be used for programming)

  }+      


  pollen.run() {
    +{
      OSCCON = 0x7A;      // internal oscillator, no PLL, 32 MHz

      TRISCbits.TRISC0 = 0; //RB0 as Output PIN
      
      while(1)
      {
        LATCbits.LATC0 = 1;  // LED ON
        __delay_ms(50);
        LATCbits.LATC0 = 0;  // LED OFF
        __delay_ms(50); // 1 Second Delay
      }            
    }+
  }

}