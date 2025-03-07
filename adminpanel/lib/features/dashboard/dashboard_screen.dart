import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/dashboard/presentation/responsive_screens/dashboard_desktop.dart';
import 'package:adminpanel/features/dashboard/presentation/responsive_screens/dashboard_mobile.dart';
import 'package:adminpanel/features/dashboard/presentation/responsive_screens/dashboard_tablet.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      mobile: DashboardMobile(),
      tablet: DashboardTablet(),
      desktop: DashboardDesktop(),
      useLayout: true,
    );
  }
}
