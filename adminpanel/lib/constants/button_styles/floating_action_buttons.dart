import 'package:flutter/material.dart';
import '../colors.dart';

class DFloatingActionButtons {

    static FloatingActionButtonThemeData customfloatingActionButton = FloatingActionButtonThemeData(
    backgroundColor: DColors.standardlightwhite, // Background color
    foregroundColor: DColors.custom, // Icon color
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));

    static FloatingActionButtonThemeData standardfloatingAction = FloatingActionButtonThemeData(
    backgroundColor: DColors.standardlightwhite, 
    foregroundColor: DColors.standardblack, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));

    static FloatingActionButtonThemeData darkfloatingAction = FloatingActionButtonThemeData(
    backgroundColor: DColors.standardlightgrey, 
    foregroundColor: DColors.standardblack, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ));
}