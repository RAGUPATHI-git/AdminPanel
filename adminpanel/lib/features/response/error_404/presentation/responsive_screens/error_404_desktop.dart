import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Error404Desktop extends StatelessWidget {
  const Error404Desktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/animations/error404.json')
      ),
    );
  }
}
