import 'package:adminpanel/core/constants/texts.dart';

class DExeception {

  String authExecption(String e){
    if(e == Dtext.invalidCrendiential){
      return "Incorrect Email";
    }
    else {
      return "error";
    }
  }

}