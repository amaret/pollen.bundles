!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

package pollen.hardware

protocol LifecycleProtocol {
  
  reset() 

  ready() 

  shutdown(uint8 id)

}