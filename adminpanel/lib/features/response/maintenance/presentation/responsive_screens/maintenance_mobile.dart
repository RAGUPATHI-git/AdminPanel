import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/texts.dart';

class MaintenanceMobile extends StatelessWidget {
  const MaintenanceMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(DAnimations.maintenance, height: 400),
        const SizedBox(height: 10),
     const   Text(Dtext.maintenanceTitle,
            style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
      const  Text(Dtext.maintenanceSubTitle,
            style:  TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
