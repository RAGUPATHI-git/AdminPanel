import 'package:flutter/material.dart';

class DGradients{

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
  
}