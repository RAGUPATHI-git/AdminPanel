import 'package:adminpanel/common/widgets/responsive%20container/responsive_container.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      this.useLayout = true});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsivecontainer(
      desktop:
          useLayout ? desktop ?? Container() : Container(),
      tablet: useLayout ? tablet ?? Container() : Container(),
      mobile: useLayout ? mobile ?? Container() : Container(),
    ));
  }
}