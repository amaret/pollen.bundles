
from microchip.pic16 import PIC16F1829 as Mcu
import Lifecycle

from Mcu import RC0
from Mcu import RC1
from Mcu import RC2
from Mcu import RC3

from pollen.parts import LedMeta{} as Led0
from pollen.parts import LedMeta{} as Led1
from pollen.parts import LedMeta{} as Led2
from pollen.parts import LedMeta{} as Led3

composition PicKitDemoBoard extends Mcu {
  
  preset PicKitDemoBoard() {
    Mcu.setFrequencyOnHost(32000000)
    Led0.pin := RC0
    Led1.pin := RC1
    Led2.pin := RC2
    Led3.pin := RC3
  }

  export Led0
  export Led1
  export Led2
  export Led3

}