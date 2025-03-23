import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DFont {
  static TextStyle title = GoogleFonts.sora(
      textStyle: const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ));

  static TextStyle subTitle = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey));

  static TextStyle tableHeading = GoogleFonts.roboto(
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white));
}
