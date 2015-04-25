!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

from pollen.hardware import HardwareTimerProtocol
from pollen.hardware import HandlerProtocol 

module MicrosecondTimer implements HardwareTimerProtocol {
    
    HardwareTimerProtocol hwTimer 


    MicrosecondTimer() {

    }

    public host setHandlerOnHost(HandlerProtocol.handler h) {
        hwTimer.setHandlerOnHost(h)
    }

    public setHandler(HandlerProtocol.handler h) {
        hwTimer.setHandler(h)
    }

    public start() {

    }

    public stop() {

    }

    public bool isRunning() {

    }

}