import 'package:flutter/material.dart';
import '../colors.dart';

class DOutlinedButtons {

  static ButtonStyle customoutlinedButton = OutlinedButton.styleFrom(
    side: const BorderSide(color: DColors.custom), // Border color
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,  ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle standardoutlinedButton = OutlinedButton.styleFrom(
    side: const BorderSide(color: DColors.standardblack), // Border color
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,  ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle dangeroutlinedButton = OutlinedButton.styleFrom(
    side: const BorderSide(color: DColors.danger), // Border color
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontSize: 18,  ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}