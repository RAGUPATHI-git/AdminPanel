import 'package:adminpanel/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DElevatedButtons {
  static ButtonStyle loginelevatedButton = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromRGBO(8, 102, 255, 1),
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 80),
    textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );

  static ButtonStyle customelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: const Color.fromRGBO(8, 102, 255, 1),
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
    textStyle: const TextStyle( fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static ButtonStyle standardelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardwhite,
    foregroundColor: DColors.standardblack,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle darkelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardlightgrey,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle infoelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.infolight,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle successelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.success,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(fontSize: 18, color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle warningelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.warninglight,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  static ButtonStyle dangerelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.danger,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
