import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/texts.dart';

class MaintenanceTablet extends StatelessWidget {
  const MaintenanceTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(DAnimations.maintenance, height: 300),
          const SizedBox(height: 15),
          const Text(Dtext.maintenanceTitle,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text(Dtext.maintenanceSubTitle,
              style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
