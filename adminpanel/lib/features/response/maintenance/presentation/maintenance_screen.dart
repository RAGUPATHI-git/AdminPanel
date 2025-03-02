import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/response/maintenance/presentation/responsive_screens/maintenance_desktop.dart';
import 'package:adminpanel/features/response/maintenance/presentation/responsive_screens/maintenance_mobile.dart';
import 'package:adminpanel/features/response/maintenance/presentation/responsive_screens/maintenance_tablet.dart';
import 'package:flutter/material.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      desktop: MaintenanceDesktop(),
      tablet: MaintenanceTablet(),
      mobile: MaintenanceMobile(),
      useLayout: false,
    );
  }
}
