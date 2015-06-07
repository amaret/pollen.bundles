from ti.msp430 import MSP430F2274 as Mcu
import Lifecycle

from Mcu import GlobalInterrupts
from Mcu import TimerMilliTimerA
from Mcu import P1_0
from Mcu import P1_1

from pollen.parts import LedMeta{} as Led0      // red led
from pollen.parts import LedMeta{} as Led1      // green led

from pollen.event import Newsroom
from pollen.time import TimerManager

composition EZ430_RF2500 extends Mcu {
  
  preset EZ430_RF2500() {
    Mcu.setFrequencyOnHost(8000000)    
    Led0.pin := P1_0
    Led1.pin := P1_1

    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := TimerMilliTimerA
  }

  export Newsroom.run

  export Led0
  export Led1

}