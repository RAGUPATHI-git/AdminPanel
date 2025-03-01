import 'package:adminpanel/features/response/error_404/presentation/error_404_screen.dart';
import 'package:adminpanel/features/response/maintenance/presentation/maintenance_screen.dart';
import 'package:adminpanel/routes/routers.dart';
import 'package:flutter/material.dart';



class AppRouting {
  Route onRouteGenerator(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const   MaintenanceScreen());
     case Routes.maintenance:
        return MaterialPageRoute(builder: (context) => const  MaintenanceScreen());

      case Routes.error_404:
      return MaterialPageRoute(builder: (context) => const Error404Screen());

      default:
        return MaterialPageRoute(builder: (conext) => const MaintenanceScreen());


    }
  }
}