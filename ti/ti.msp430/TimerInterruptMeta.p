
from pollen.hardware import InterruptSourceProtocol
from pollen.hardware import HandlerProtocol

meta { string name,
       string interrupt,
       string enableRegister, 
       uint8 enableBit, 
       string clearRegister, 
       uint8 clearBit
     }   

module TimerInterruptMeta implements InterruptSourceProtocol {

  HandlerProtocol.handler() timerISR = null

  +{ 
      #include <msp430.h>

      #pragma vector=`interrupt`_VECTOR
      __interrupt void `name`_isr() {
         (`timerISR`)();
      }        
  }+

  public host setHandlerOnHost(HandlerProtocol.handler h) {
    timerISR = h
  }

  public setHandler(HandlerProtocol.handler h) {
    timerISR = h
  }

  public enable() {
    +{ `enableRegister` |= (1 << `enableBit`) }+
  }

  public disable() {
    +{ `enableRegister` &= ~(1 << `enableBit`) }+
  }

  public clear() {
    +{ `clearRegister` &= ~(1 << `clearBit`) }+
  }

  public set() {
    // TODO: implement
  }

  public bool get() {
    return false
  }

  public bool isEnabled() {
    return +{ `enableRegister` & (1 << `enableBit`) }+
  }

}