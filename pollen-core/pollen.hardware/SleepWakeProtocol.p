!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

package pollen.hardware


protocol SleepWakeProtocol {
  
  sleep(uint8 level) 

  wake(uint8 level) 

}