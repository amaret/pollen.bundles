
from nxp.lpc import PinMeta{1, 18} as Led1
from nxp.lpc import PinMeta{1, 20} as Led2
from nxp.lpc import PinMeta{1, 21} as Led3
from nxp.lpc import PinMeta{1, 23} as Led4

module Blink01 {
  
  volatile uint32 temp = 0

  Blink01() {
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
    for(;;) {
      Led1.toggle()
      _delay(1 << 20)
      Led2.toggle()
      _delay(1 << 20)
      Led3.toggle()
      _delay(1 << 20)
      Led4.toggle()
      _delay(1 << 23)
    }
  }

  _delay(uint32 del) {
    uint32 i

    for(i = 0; i < del; i++) {
      temp = i
    }
  }

}