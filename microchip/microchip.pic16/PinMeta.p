package microchip.pic16

from pollen.hardware import PinProtocol

meta { string port, uint8 pin } 

module PinMeta implements PinProtocol {
  
  +{ #include <xc.h> }+

  host uint8 pinMask

  host PinMeta() {
    pinMask = (1 << pin)  
  }

  public set() {                        
    +{ LAT`port`bits.LAT`port``pin` }+ = 1
  }

  public clear() {                     
    +{ LAT`port`bits.LAT`port``pin` }+ = 0
  }

  public toggle() {                   
    +{ LAT`port`bits.LAT`port``pin` }+ ^= 1
  }

  public bool get() {                 
    return +{ LAT`port`bits.LAT`port``pin` }+ == 1
  }

  public bool isInput() {
    return +{ TRIS`port`bits.TRIS`port``pin` }+ ? true : false
  }              
  
  public bool isOutput() {
    return +{ TRIS`port`bits.TRIS`port``pin` }+ ? false : true
  }    
  
  public makeInput() {
    +{ TRIS`port`bits.TRIS`port``pin` }+ = 1 
  }
  
  public makeOutput() {
    +{ TRIS`port`bits.TRIS`port``pin` }+ = 0
  }

}