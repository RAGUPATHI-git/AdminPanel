import 'package:adminpanel/constants/colors.dart';
import 'package:flutter/material.dart';
class DFilledButtons {
  static ButtonStyle customfilledButton = FilledButton.styleFrom(
    backgroundColor: DColors.custom, 
    foregroundColor: Colors.white, 
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}


// filled buttons venumaaaaa ????