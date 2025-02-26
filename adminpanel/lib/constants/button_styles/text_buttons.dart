import 'package:flutter/material.dart';
import '../colors.dart';

class DTextButtons{

  static ButtonStyle customtextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontFamily:'', fontSize:18, color: DColors.custom),
  );

  static ButtonStyle standardtextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontFamily:'', fontSize:18, color: DColors.standardlightblack),
  );

  static ButtonStyle dangertextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontFamily:'', fontSize:18, color: DColors.danger),
  );

  static ButtonStyle successtextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontFamily:'', fontSize:18, color: DColors.success),
  );

  static ButtonStyle infotextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontFamily:'', fontSize:18, color: DColors.info),
  );

  static ButtonStyle warningtextButton = TextButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const  TextStyle(fontFamily:'', fontSize:18, color: DColors.warning),
  );

  



}