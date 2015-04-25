!-- 
  Copyright Amaret, Inc 2011-2015
  See https://github.com/amaret/pollen/blob/master/LICENSE
--!

protocol PrintProtocol {

  printBool(bool b)
  printInt(int32 i)
  printUint(uint32 u) 
  printStr(string s) 
  printReal(real f) 
  
  // host startPrimary()
  // host startSuccess()
  // host startInfo()
  // host startWarn()
  // host startError()
  // host endColor()

}
