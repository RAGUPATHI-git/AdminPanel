import 'package:adminpanel/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatelessWidget {
  final String label;
  final double length;
  final double width;
  final double size;
  final double curve;
  final VoidCallback onPressed;
  final bool isSelected; 

  const CustomToggleButton({
    Key? key,
    this.length = 15.0,
    this.width = 15.0,
    this.size = 15,
    this.curve = 10,
    required this.label,
    required this.onPressed,
    this.isSelected = false, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isSelected 
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: length, horizontal: width),
              backgroundColor: const Color.fromRGBO(8, 102, 255, 1),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(curve)),
            ),
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: size),
            ),
          )
        : OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: length, horizontal: width),
              side: BorderSide(color: DColors.standardlightgrey),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(curve)),
            ),
            child: Text(
              label,
              style: TextStyle(color: DColors.standardlightblack, fontWeight: FontWeight.bold, fontSize: size),
            ),
          );
  }
}




