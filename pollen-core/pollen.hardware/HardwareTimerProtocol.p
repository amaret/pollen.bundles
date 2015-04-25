!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

package pollen.hardware

import HandlerProtocol

protocol HardwareTimerProtocol {
	
  host setHandlerOnHost(HandlerProtocol.handler h)

  setHandler(HandlerProtocol.handler h)

  start()

  stop()

  bool isRunning()

}