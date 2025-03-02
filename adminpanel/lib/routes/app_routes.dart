
import 'package:adminpanel/features/response/error_404/presentation/error_404_screen.dart';
import 'package:adminpanel/features/response/maintenance/presentation/maintenance_screen.dart';
import 'package:adminpanel/features/test/presentation/test_screen.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRouting {
  final List<GetPage> pages = [
    GetPage(name: Routes.error_404, page: () => const Error404Screen()),
    GetPage(name: Routes.maintenance, page: () => const MaintenanceScreen()),
    GetPage(name: Routes.test, page: () => const TestScreen())
  ];

}
