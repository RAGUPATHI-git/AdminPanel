import 'package:flutter/material.dart';

class DGradients {
  static const LinearGradient sampleGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 7, 101, 101), // Dark Teal
      Color(0xFF87CEEB), // Sky Blue
      Color.fromARGB(255, 117, 200, 227), // Light Blue
    ],
    stops: [0.0, 0.5, 1.0],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient premiumWhite = LinearGradient(
    colors: [
      Color.fromRGBO(213, 212, 208, 0),
      Color.fromRGBO(213, 212, 208, 1),
      Color.fromRGBO(238, 238, 236, 31),
      Color.fromRGBO(239, 238, 236, 75),
      Color.fromRGBO(233, 233, 231, 100),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const LinearGradient flightGet = LinearGradient(colors: [
    Color.fromRGBO(10 ,207, 254,1),
    Color.fromRGBO(73 ,90 ,255,1),
  ]);
  

}

