import 'package:adminpanel/constants/colors.dart';
import 'package:flutter/material.dart';
class DElevatedButtons {
  
  static ButtonStyle customelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.custom, 
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle standardelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardwhite,
    foregroundColor: DColors.standardlightblack,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle darkelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.standardlightgrey,
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle infoelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.infolight,
    foregroundColor: DColors.standardwhite, 
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle successelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.successlight,
    foregroundColor: DColors.standardwhite, 
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle warningelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.warninglight, 
    foregroundColor: DColors.standardwhite,
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ButtonStyle dangerelevatedButton = ElevatedButton.styleFrom(
    elevation: 10,
    backgroundColor: DColors.dangerlight,
    foregroundColor: DColors.standardwhite, 
    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
    textStyle:const TextStyle(fontSize: 18,),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );
}