import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  final String label;
  final List<String> options;
  final String selectedValue;
  final void Function(String?) onChanged;

  RadioButton({
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.options.map((String option) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<String>(
                    toggleable: true,
                    visualDensity: VisualDensity.comfortable,
                    activeColor: Colors.green,
                    focusColor: Colors.lightGreen,
                    mouseCursor: MouseCursor.defer,
                    value: option,
                    groupValue: widget.selectedValue,
                    onChanged: widget.onChanged,
                  ),
                  Text(option),
                  SizedBox(width: 12),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
