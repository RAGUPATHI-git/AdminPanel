import 'package:adminpanel/common/layouts/loading/responisve%20screens/loading_desktop.dart';
import 'package:adminpanel/common/layouts/loading/responisve%20screens/loading_mobile.dart';
import 'package:adminpanel/common/layouts/loading/responisve%20screens/loading_tablet.dart';
import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: LoadingDesktop(),
      mobile: LoadingMobile(),
      tablet: LoadingTablet(),
      useLayout: false,
    );
  }
}
