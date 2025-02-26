import 'package:adminpanel/features/authentication/login/presentation/responsive_screens/login_desktop.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(  const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
      home: LoginDesktop(),
    );
  }
}
