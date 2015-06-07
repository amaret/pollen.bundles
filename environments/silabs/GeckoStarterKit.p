!--
  Board environment for Bijou using the Gecko starter kit
--!

from silabs.efm32 import EFM32G890 as Mcu
from Mcu import GlobalInterrupts
from Mcu import MillisecTimer1

from Mcu import PC0
from Mcu import PC1
from Mcu import PC2
from Mcu import PC3

from Mcu import PB10      // Button PB1 js on this GPIO on the Gecko STK

from pollen.parts import LedMeta{false} as Led0
from pollen.parts import LedMeta{false} as Led1
from pollen.parts import LedMeta{false} as Led2
from pollen.parts import LedMeta{false} as Led3

from pollen.event import Newsroom
from pollen.time import TimerManager

// from bijou.parts import Button

import Lifecycle

composition GeckoStarterKit {
  
  preset GeckoStarterKit() {
    Mcu.setFrequencyOnHost(14000000)
    // Button.pin := PB10
    Led0.pin := PC0
    Led1.pin := PC1
    Led2.pin := PC2
    Led3.pin := PC3

    Newsroom.GI := GlobalInterrupts
    TimerManager.hwTimer := MillisecTimer1
  }

  export Mcu
  export Mcu.reset
  export Mcu.wait
  export Newsroom.run

  export PC0
  export PC1
  export PC2
  export PC3

  export PB10

  export Led0
  export Led1
  export Led2
  export Led3

  // export Button

}