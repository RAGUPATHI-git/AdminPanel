import 'package:adminpanel/core/constants/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error404Tablet extends StatelessWidget {
  const Error404Tablet({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Padding(padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 400,
                width: 700,
                child: Lottie.asset(DAnimations.error404),
                )
      ),)
    );
  }
}