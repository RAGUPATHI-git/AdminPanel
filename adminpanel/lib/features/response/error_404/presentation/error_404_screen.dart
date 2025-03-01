import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_desktop.dart';
import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_mobile.dart';
import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_tablet.dart';
import 'package:flutter/material.dart';

class Error404Screen extends StatelessWidget {
  const Error404Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      desktop: Error404Desktop(),
      tablet: Error404Tablet(),
      mobile: Error404Mobile(),
      useLayout: true,
    );
  }
}