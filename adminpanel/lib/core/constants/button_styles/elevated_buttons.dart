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
    backgroundColor: DColors.custom,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle standardelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle darkelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardlightgrey,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle infoelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.infolight,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle successelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.success,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(fontSize: 18, color: Colors.white),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle warningelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.warninglight,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle dangerelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.danger,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle: const TextStyle(
      fontSize: 18,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}
