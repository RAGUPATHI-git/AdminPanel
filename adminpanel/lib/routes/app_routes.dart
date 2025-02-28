import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_desktop.dart';
import 'package:adminpanel/features/response/maintenance/presentation/maintenance_screen.dart';
import 'package:adminpanel/routes/routers.dart';
import 'package:flutter/material.dart';



class AppRouting {
  Route onRouteGenerator(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (context) =>const Error404Desktop());
     case Routes.maintenance:
        return MaterialPageRoute(builder: (context) => const  MaintenanceScreen());

      case Routes.error_404:
      return MaterialPageRoute(builder: (context) => const Error404Desktop());

      default:
        return MaterialPageRoute(builder: (conext) => const MaintenanceScreen());


    }
  }
}