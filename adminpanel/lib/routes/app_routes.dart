import 'package:adminpanel/binding/general_bindings.dart';
import 'package:adminpanel/features/authentication/login/presentation/login_screen.dart';
import 'package:adminpanel/features/dashboard/dashboard_screen.dart';
import 'package:adminpanel/features/events/add%20events/add_events_screen.dart';
import 'package:adminpanel/features/events/edit%20events/edit_events_screen.dart';
import 'package:adminpanel/features/response/error_404/presentation/error_404_screen.dart';
import 'package:adminpanel/features/response/maintenance/presentation/maintenance_screen.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/add_students_screen.dart';
import 'package:adminpanel/features/test/presentation/test_screen.dart';
import 'package:adminpanel/routes/app_middleware.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.dashBoard,
      page: () => const DashboardScreen(),
      middlewares: [RoutesMiddleware()],
      transitionDuration: const Duration(seconds: 1),
      binding: GeneralBindings(),
      title: "Dashboard",
    ),

        name: Routes.maintenance,
        page: () => const MaintenanceScreen(),
        transitionDuration:const Duration(seconds: 0)),
    GetPage(
        name: Routes.test,
        page: () => const TestScreen(),
        transitionDuration:const Duration(seconds: 0)),
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        transitionDuration:const Duration(seconds: 0)),
    GetPage(
        name: Routes.dashBoard,
        page: () =>const DashboardScreen(),
        popGesture: false,
        transitionDuration: const Duration(seconds: 0)),
    GetPage(
        name: Routes.addStudent,
        page: () => const AddStudentsScreen(),
        transitionDuration:  const Duration(seconds: 0)),
     GetPage(
      name: Routes.addevent,
      page: () => const AddEventsScreen(),
      transitionDuration:  const Duration(seconds: 0)),
    GetPage(
      name: Routes.editevent, 
      page: () => const EditEventsScreen(),
      transitionDuration: const Duration(seconds:0)),

  ];
}
