import 'package:flutter/material.dart';

class DGradients{

  static const LinearGradient sampleGradient = LinearGradient(
  colors: [
    Color(0xFF008080), // Teal
    Color(0xFF20B2AA), // Light Sea Green
    Color(0xFF87CEEB), // Light Sky Blue
    Color(0xFFB0E0E6), // Powder Blue
    Color(0xFF4682B4), // Steel Blue
  ],
  stops: [0.0, 0.25, 0.5, 0.75, 1.0], // Define where each color starts
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
);
  
}