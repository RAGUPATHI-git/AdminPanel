import 'package:flutter/material.dart';

class OutlineTogglebutton extends StatefulWidget {
  final String label;
  final double length;
  final double width;
  final double size;
  final double curve;
  final VoidCallback onPressed;
  final bool isSelected; 

  const OutlineTogglebutton({
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
  State<OutlineTogglebutton> createState() => _OutlineTogglebuttonState();
}

class _OutlineTogglebuttonState extends State<OutlineTogglebutton> {

  bool isHovered = false ;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() =>isHovered = true),
      onExit:  (_) => setState(() =>isHovered = false),
      child: OutlinedButton(
        onPressed: widget.onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: widget.length, horizontal: widget.width),
          side: BorderSide(color: widget.isSelected || isHovered ? Colors.blue : Colors.grey), 
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.curve)),
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color:const Color.fromARGB(255, 76, 75, 75), 
            fontWeight: FontWeight.bold,
            fontSize: widget.size,
          ),
        ),
      ),
    );
  }
}