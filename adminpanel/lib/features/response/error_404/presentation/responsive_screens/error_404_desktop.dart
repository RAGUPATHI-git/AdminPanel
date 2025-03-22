import 'package:adminpanel/core/constants/animations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error404Desktop extends StatelessWidget {
  const Error404Desktop({super.key});

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child:Padding(padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 500,
                width: 800,
                child: Lottie.asset(DAnimations.error404),
                )
      ),)
    );
  }
}
