import 'package:adminpanel/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomToggleButton extends StatefulWidget {
  final String label;
  final double length;
  final double width;
  final double size;
  final double curve;
  final VoidCallback onPressed;

  const CustomToggleButton({
    Key? key,
    this.length=15.0,
    this.width=15.0,
    this.size=15,
    this.curve=10,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomToggleButtonState createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool _isPressed = false;

  void _toggleButton() {
    setState(() {
      _isPressed = !_isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isPressed
        ? ElevatedButton(
            onPressed: () {
              _toggleButton();
              widget.onPressed(); 
            },
            style: ElevatedButton.styleFrom(
              padding:  EdgeInsets.symmetric(vertical: widget.length, horizontal: widget.width),
              backgroundColor: const Color.fromRGBO(8, 102, 255, 1), 
              foregroundColor: Colors.white, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.curve))
            ),
            child: Text(widget.label,style: TextStyle(fontWeight:FontWeight.bold,fontSize: widget.size),),
          )
        : OutlinedButton(
            onPressed: () {
              _toggleButton();
              widget.onPressed(); 
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: widget.length, horizontal: widget.width),
              side: BorderSide(color: DColors.standardlightblack),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.curve))
            ),
            child: Text(
              widget.label,
              style: TextStyle(color:DColors.standardlightblack,fontWeight:FontWeight.bold,fontSize: widget.size),
            ),
          );
  }
}




