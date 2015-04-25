!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

package pollen.hardware

import HandlerProtocol

protocol InterruptSourceProtocol {

    host setHandlerOnHost(HandlerProtocol.handler h)

    setHandler(HandlerProtocol.handler h)

    enable()

    disable()

    clear()

    bool isEnabled()

}