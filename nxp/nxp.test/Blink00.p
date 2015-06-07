
from nxp.lpc import PinMeta{1, 20} as Led3

module Blink00 {
  
  volatile uint32 temp = 0

  Blink00() {
    Led3.clear()
    Led3.makeOutput()
  }

  pollen.run() {
    for(;;) {
      Led3.toggle()
      _delay(1 << 22)
    }
  }

  _delay(uint32 del) {
    uint32 i

    for(i = 0; i < del; i++) {
      temp = i
    }
  }

}