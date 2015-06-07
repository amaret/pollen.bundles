
from nxp.lpc import PinMeta{1, 18} as Led1
from nxp.lpc import PinMeta{1, 20} as Led2
from nxp.lpc import PinMeta{1, 21} as Led3
from nxp.lpc import PinMeta{1, 23} as Led4

from pollen.hardware import PinProtocol

module Blink02 {
  
  volatile uint32 temp = 0

  PinProtocol.toggle ledToggle[4] = { Led1.toggle, Led2.toggle, Led3.toggle, Led4.toggle }

  Blink02() {
    Led1.clear()
    Led2.clear()
    Led3.clear()
    Led4.clear()
    Led1.makeOutput()
    Led2.makeOutput()
    Led3.makeOutput()
    Led4.makeOutput()
  }

  pollen.run() {
    PinProtocol.toggle() tog = null
    uint32 dt = (0xF << 16)
    int8 i 

    for(;;) {
      for (i = 0; i < 4; i++) {
        tog = ledToggle[i]
        tog()
        _delay(dt)
      }
      for (i = 0; i < 4; i++) {
        tog = ledToggle[i]
        tog()
        _delay(dt)
      }

      for (i = 3; i >= 0; i--) {
        tog = ledToggle[i]
        tog()
        _delay(dt)
      }

      for (i = 3; i >= 0; i--) {
        tog = ledToggle[i]
        tog()
        _delay(dt)
      }      

    }
  }

  _delay(uint32 del) {
    uint32 i

    for(i = 0; i < del; i++) {
      temp = i
    }
  }

}