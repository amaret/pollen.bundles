
from pollen.hardware import HardwareTimerProtocol

import Cpu
import TimerInterruptMeta { "TimerA_Match0",    // name    
                            "TIMERA0",         // interrupt
                            "TACCTL0",          // enableRegister 
                            4,                  // enableBit
                            "TACCTL0",          // clearRegister, clearBit
                            0 } as InterruptTimerAMatch0 
                          

from pollen.hardware import HandlerProtocol as HandlerP

module TimerMilliTimerA implements HardwareTimerProtocol {

  +{ #include <msp430.h> }+

  host uint16 ticksPerMs = 0  

  host TimerMilliTimerA() {
    ticksPerMs = Cpu.getAuxillaryClockFrequencyOnHost() / 1000  // TODO: Round out the division
  }

  TimerMilliTimerA() {
    +{ TACTL = TASSEL_1 + MC_0 }+                   // Timer using ACLK, set to off      
    +{ TACCR0 }+ = ticksPerMs                       // setup compare counter 0
  }

  public host setHandlerOnHost(HandlerP.handler h) {
    InterruptTimerAMatch0.setHandlerOnHost(h)       // pass handler through to interrupt
  }

  public setHandler(HandlerP.handler h) {
    InterruptTimerAMatch0.setHandler(h)
  }

  public start() {    
    +{ TAR }+ = 0
    InterruptTimerAMatch0.clear()
    InterruptTimerAMatch0.enable()        
    +{ TACTL |= MC_1 }+                             // Put timer on in Up Mode
  }

  public stop() {
    uint16 mask = ~(3 << 4)
    InterruptTimerAMatch0.disable()
    InterruptTimerAMatch0.clear()
    +{ TACTL }+ &= mask
  }

  public bool isRunning() {
    return InterruptTimerAMatch0.isEnabled() && +{ (TACTL & MC_1) }+
  }

}