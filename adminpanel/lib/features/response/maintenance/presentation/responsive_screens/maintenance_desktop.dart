import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/texts.dart';

class MaintenanceDesktop extends StatelessWidget {
  const MaintenanceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(DAnimations.maintenance, height: 300),
          const SizedBox(height: 20),
          const Text(Dtext.maintenanceTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text(Dtext.maintenanceSubTitle,
              style: TextStyle(fontSize: 18, color: Colors.grey)),
        ],
      ),
    );
  }
}
