
import pollen.environment as Board
from Board import Led1

module Test02 {
  
  pollen.run() {

    while (true) {
      Led1.toggle()
      delay()
    }

  }

  delay() {
    for (uint32 i = 0; i < 100000; i++) {
      Board.cycle()
    }
  }

}