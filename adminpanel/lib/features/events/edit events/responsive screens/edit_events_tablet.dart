import 'package:adminpanel/core/constants/fonts.dart';
import 'package:flutter/material.dart';

class EditEventsTablet extends StatelessWidget {
  const EditEventsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Text("EDIT / DELETE EVENTS",style: DFont.title,)
        ],
      )
      ,
    );
  }
}