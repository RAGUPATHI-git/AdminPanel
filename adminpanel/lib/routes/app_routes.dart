import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_desktop.dart';
import 'package:adminpanel/features/response/maintenance/presentation/responsive_screens/maintenance_desktop.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRouting {


final  List<GetPage> pages  = [

  GetPage(name: Routes.error_404, page: () => const Error404Desktop()),
  GetPage(name: Routes.maintenance, page: () => const MaintenanceDesktop()),
];

}
