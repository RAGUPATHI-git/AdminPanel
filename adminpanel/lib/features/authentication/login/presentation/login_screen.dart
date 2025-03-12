import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/authentication/login/bloc/auth_bloc.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/auth_repository.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_desktop.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_mobile.dart';
import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_tablet.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepository()),
      child: const SiteLayout(
        desktop: LoginDesktop(),
        tablet: LoginTablet(),
        mobile: LoginMobile(),
        useLayout: false,
      ),
    );
  }
}
