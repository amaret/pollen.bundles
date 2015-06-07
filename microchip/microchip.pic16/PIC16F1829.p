package microchip.pic16

from pollen.hardware import CpuProtocol

import Cpu

import PinMeta{"C", 0} as RC0
import PinMeta{"C", 1} as RC1
import PinMeta{"C", 2} as RC2
import PinMeta{"C", 3} as RC3

composition PIC16F1829 implements CpuProtocol {

  !---------------------
    Main device modules
   ---------------------! 
  export Cpu
  export Cpu.reset
  export Cpu.shutdown
  export Cpu.wait
  export Cpu.cycle
  export Cpu.getFrequency
  export Cpu.getFrequencyOnHost
  export Cpu.setFrequency
  export Cpu.setFrequencyOnHost


  !---------------------
    Gpio Pins
   ---------------------! 

  export RC0
  export RC1
  export RC2
  export RC3
  
}