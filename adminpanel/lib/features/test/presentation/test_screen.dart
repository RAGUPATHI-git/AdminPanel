import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/test/presentation/responsive_screens/test_desktop.dart';
import 'package:adminpanel/features/test/presentation/responsive_screens/test_mobile.dart';
import 'package:adminpanel/features/test/presentation/responsive_screens/test_tablet.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      desktop: TestDesktop(),
      tablet: TestTablet(),
      mobile: TestMobile(),
      useLayout: true,
    );
  }
}
