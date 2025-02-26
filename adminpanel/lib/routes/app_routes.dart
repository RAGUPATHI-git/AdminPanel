import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_desktop.dart';
import 'package:adminpanel/main.dart';
import 'package:flutter/material.dart';

class AppRouting {
  Route onRouteGenerator(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const  App());


      default:
        return MaterialPageRoute(builder: (conext) => const Error404Desktop());
    }
  }
}