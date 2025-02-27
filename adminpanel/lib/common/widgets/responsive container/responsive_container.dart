import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class Responsivecontainer extends StatelessWidget {
  const Responsivecontainer(
      {super.key,
      required this.desktop,
      required this.tablet,
      required this.mobile});

  final Widget desktop;
  final Widget tablet;
  final Widget mobile;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrain) {
      if (constrain.maxWidth >= DSizes.desktopScreenSize) {
        return desktop;
      } else if (constrain.maxWidth < DSizes.desktopScreenSize &&
          constrain.maxWidth >= DSizes.mobileScreenSize) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}