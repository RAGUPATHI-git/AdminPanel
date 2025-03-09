import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String label;
  final List<String> options;
  final String selectedValue;
  final void Function(String?) onChanged;

  const RadioButton({
    Key? key,
    required this.label,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: options.map((String option) {
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
                    groupValue: selectedValue,
                    onChanged: onChanged,
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
