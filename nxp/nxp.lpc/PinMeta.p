package nxp.lpc

from pollen.hardware import PinProtocol

meta { uint8 port, uint8 pin }

module PinMeta implements PinProtocol {
  
  +{ #include "LPC17xx.h" }+

  host uint32 mask = (1 << pin)

  PinMeta() {
    +{ LPC_SC->PCONP }+ |= (1 << 15)      // Power up the GPIO
  }

  public set() {        // Set the pin high 
    +{ LPC_GPIO`port`->FIOSET }+ |= mask
  }                       

  public clear() {      // Set the pin low  
    +{ LPC_GPIO`port`->FIOCLR }+ |= mask
  }                     
  
  public toggle() {     // Toggle the state of the pin 
    +{ LPC_GPIO`port`->FIOPIN }+ ^= mask 
  }                    
  
  public bool get() {   // Get the pin state 
    return +{ LPC_GPIO`port`->FIOPIN }+ & mask != 0 
  }                  

  public bool isInput() {   // Check if pin is configured as an input 
    return +{ LPC_GPIO`port`->FIODIR }+ & mask == 0
  }              
  
  public bool isOutput() {  // Check if pin is configured as an output 
    return +{ LPC_GPIO`port`->FIODIR }+ & mask != 0
  }             
  
  // Make pin an input 
  public makeInput() {   
    +{ LPC_GPIO`port`->FIODIR }+ &= ~mask  
  }                 
  
  // Make pin an output  
  public makeOutput() {   
    +{ LPC_GPIO`port`->FIODIR }+ |= mask  
  }                
  
}