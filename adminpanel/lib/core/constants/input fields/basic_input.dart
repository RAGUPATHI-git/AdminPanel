import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BasicInput extends StatelessWidget {
  final String label;
  final String? hintText;
  final String? prefixIcon;
  final TextEditingController? controller;
  final IconButton? suffixIcon;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? error;

  const BasicInput({
    super.key,
    required this.label,
    this.suffixIcon,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.error
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        TextFormField(
          cursorColor: Colors.grey.shade400,
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          decoration: InputDecoration(
            suffixIcon: prefixIcon != null ? suffixIcon : null,
            label: Text(label),
            labelStyle: TextStyle(color: Colors.black),
            hintText: hintText,
            errorText: error,
            prefixIcon: prefixIcon != null
                ? SvgPicture.asset(prefixIcon ?? "",
                    height: 5, width: 5, fit: BoxFit.scaleDown)
                : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(DSizes.borderRadiusSm),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          ),
        ),
      ],
    );
  }
}
