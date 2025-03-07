import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_desktop.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_mobile.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_tablet.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      desktop: LoginDesktop(),
      tablet: LoginTablet(),
      mobile: LoginMobile(),
      useLayout: true,
    );
  }
}