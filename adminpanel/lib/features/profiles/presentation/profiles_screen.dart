import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/profiles/presentation/responsive%20screens/profiles_desktop.dart';
import 'package:adminpanel/features/profiles/presentation/responsive%20screens/profiles_mobile.dart';
import 'package:adminpanel/features/profiles/presentation/responsive%20screens/profiles_tablet.dart';
import 'package:flutter/material.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: ProfilesDesktop(),
      tablet: ProfilesTablet(),
      mobile: ProfilesMobile(),
      useLayout: true,
    );
  }
}