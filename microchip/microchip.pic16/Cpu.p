package microchip.pic16

from pollen.hardware import CpuProtocol

module Cpu implements CpuProtocol {

  +{ #include <xc.h> }+

  // default starting frequency 
  uint32 frequency = 2000000    

  public reset() {
    
  }

  public shutdown() {

  }                          

  public setFrequency(uint32 hz) {
    @frequency = hz
  }

  public host setFrequencyOnHost(uint32 hz) {
    @frequency = hz
  }  

  public uint32 getFrequency() {
    return @frequency
  }

  public host uint32 getFrequencyOnHost() {
    return @frequency
  }    
     
  public wait(uint16 us) {          // this is not accurate. 
    for (; us > 0; us--) {  
      +{ NOP() }+
      +{ NOP() }+
      +{ NOP() }+
      +{ NOP() }+
      +{ NOP() }+
      +{ NOP() }+                        
    }
  }

  public cycle() {
    +{ NOP() }+
  }                             
  
}
