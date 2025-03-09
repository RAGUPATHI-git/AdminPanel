import 'package:adminpanel/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DEmailField extends StatelessWidget {
  const DEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
                          cursorColor: DColors.standardgrey,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: DColors.standardgrey),
                            hintText: 'Email address',
                            hintStyle: TextStyle(color: DColors.standardgrey,fontWeight: FontWeight.bold),
                            filled: true,
                            fillColor: DColors.standardlightwhite,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: DColors.standardgrey),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:DColors.standardgrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:DColors.standardgrey),
                            ),
                          ),
                          style: TextStyle(color: DColors.standardblack),
                        );
  }
}


class DPasswordfield extends StatefulWidget {
  const DPasswordfield({super.key});

  @override
  State<DPasswordfield> createState() => _DPasswordfieldState();
}

class _DPasswordfieldState extends State<DPasswordfield> {

      bool _isPasswordVisible = false; 
  @override
  Widget build(BuildContext context) {
    return  TextField(
                          cursorColor: DColors.standardgrey,
                          obscureText: !_isPasswordVisible, 
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: DColors.standardgrey),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: DColors.standardgrey,fontWeight: FontWeight.bold),
                            filled: true,
                            fillColor:DColors.standardlightwhite,
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color:  DColors.standardgrey),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:  DColors.standardgrey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:  DColors.standardgrey),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: DColors.standardgrey,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible; 
                                });
                              },
                            ),
                          ),
                          style: TextStyle(color: DColors.standardblack),
                        );
  }

}