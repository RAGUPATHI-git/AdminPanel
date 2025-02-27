import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class DeviceUtility {
  //AppBar height
  static const double appBarHeight = 56.0;

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= DSizes.desktopScreenSize;
  }

  static bool isTabletScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= DSizes.tabletScreenSize &&
        MediaQuery.of(context).size.width < DSizes.desktopScreenSize;
  }

  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < DSizes.tabletScreenSize;
  }

  static double mediaQueryWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
   static double mediaQueryheight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}