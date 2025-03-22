import 'package:adminpanel/common/widgets/responsive%20container/responsive_container.dart';
import 'package:adminpanel/common/widgets/screens/desktop_layout.dart';
import 'package:adminpanel/common/widgets/screens/mobile_layout.dart';
import 'package:adminpanel/common/widgets/screens/tablet_layout.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout(
      {super.key,
      this.desktop,
      this.tablet,
      this.mobile,
      this.useLayout = false});

  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsivecontainer(
      desktop:
          useLayout ? DesktopLayout(body: desktop) : desktop ?? Container(),
      tablet: useLayout
          ? TabletLayout(body: tablet ?? desktop)
          : tablet ?? desktop ?? Container(),
      mobile: useLayout
          ? MobileLayout(body: mobile ?? desktop)
          : mobile ?? desktop ?? Container(),
    ));
  }
}
