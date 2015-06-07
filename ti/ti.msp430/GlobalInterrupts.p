
from pollen.hardware import GlobalInterruptsProtocol
    

module GlobalInterrupts implements GlobalInterruptsProtocol {

  +{ #include <in430.h> }+ 

  // Disable gloabl interrupts    
  public disable() {
    +{ __dint() }+
  }             

  // Enable global interrupts
  public enable() {
    +{ __eint() }+
  }              

  // Restore global interrupts to state
  public restore(bool state) {
    if (state) { 
      enable() 
    } 
    else { 
      disable() 
    }
  }  

  public bool isEnabled() {
    return (+{ __read_status_register() }+ & 0x0008) != 0
  }

}