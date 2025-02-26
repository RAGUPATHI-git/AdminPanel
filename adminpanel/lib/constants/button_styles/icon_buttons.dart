import 'package:adminpanel/constants/colors.dart';
import 'package:flutter/material.dart';
class DIconButtons {

  static ButtonStyle customiconButton = IconButton.styleFrom(
    iconSize: 30.0,
    padding: const EdgeInsets.all(10.0),
    backgroundColor: DColors.standardwhite, // Background color
    foregroundColor: DColors.custom, // Icon color
    shape: const CircleBorder(),
  );

  static ButtonStyle standardiconButton = IconButton.styleFrom(
    iconSize: 30.0,
    padding: const EdgeInsets.all(10.0),
    backgroundColor: DColors.standardwhite, 
    foregroundColor: DColors.standardlightgrey, 
    shape: const CircleBorder(),
  );

  static ButtonStyle darkiconButton = IconButton.styleFrom(
    iconSize: 30.0,
    padding: const EdgeInsets.all(10.0),
    backgroundColor: DColors.standardlightgrey, 
    foregroundColor: DColors.standardblack, 
    shape: const CircleBorder(),
  );
}