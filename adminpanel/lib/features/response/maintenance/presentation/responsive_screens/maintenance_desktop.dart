import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/constants/texts.dart';
import 'package:adminpanel/core/utils/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MaintenanceDesktop extends StatelessWidget {
  const MaintenanceDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 330,
                ),
                Expanded(
                  child: Lottie.asset(DAnimations.maintenance,
                      height: DeviceUtility.mediaQueryheight(context),
                      width: DeviceUtility.mediaQueryheight(context)),
                ),
                const SizedBox(
                  height: DSizes.md,
                ),
              ],
            ),
            Text(
              Dtext.maintenanceTitle,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Text(
              Dtext.maintenanceSubTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
