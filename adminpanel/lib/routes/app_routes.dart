import 'package:adminpanel/binding/general_bindings.dart';
import 'package:adminpanel/features/authentication/login/presentation/login_screen.dart';
import 'package:adminpanel/features/dashboard/dashboard_screen.dart';
import 'package:adminpanel/features/events/add%20events/presentation/screens/add_events_screen.dart';
import 'package:adminpanel/features/events/edit%20events/presentation/screens/edit_events_screen.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/all_notes_screen.dart';
import 'package:adminpanel/features/profiles/presentation/profiles_screen.dart';
import 'package:adminpanel/features/response/maintenance/presentation/maintenance_screen.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/add_students_screen.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/student_list_screen.dart';
import 'package:adminpanel/features/syllabus/add%20syllabus/presentation/screens/add_syllabus.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/all_syllabus.dart';
import 'package:adminpanel/features/test/presentation/test_screen.dart';
import 'package:adminpanel/routes/app_middleware.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.dashBoard,
      page: () => const DashboardScreen(),
      middlewares: [RoutesMiddleware()],
      transitionDuration: const Duration(seconds: 1),
      binding: GeneralBindings(),
      title: "Dashboard",
    ),

    GetPage(
        name: Routes.maintenance,
        page: () => const MaintenanceScreen(),
        transitionDuration: const Duration(seconds: 0),
        middlewares: [RoutesMiddleware()],
        binding: GeneralBindings()),
    GetPage(
        name: Routes.test,
        page: () => const TestScreen(),
        transitionDuration: const Duration(seconds: 0)),
    GetPage(
        name: Routes.login,
        page: () => const LoginScreen(),
        transitionDuration: const Duration(seconds: 0)),
    GetPage(
      name: Routes.addStudent,
      page: () => const AddStudentsScreen(),
      transitionDuration: const Duration(seconds: 0),
      binding: GeneralBindings(),
      middlewares: [RoutesMiddleware()],
    ),
    GetPage(
        name: Routes.addevent,
        page: () => const AddEventsScreen(),
        transitionDuration: const Duration(seconds: 0),
        middlewares: [RoutesMiddleware()],
        binding: GeneralBindings()),
    GetPage(
      name: Routes.editevent,
      page: () => const EditEventsScreen(),
      transitionDuration: const Duration(seconds: 0),
      middlewares: [RoutesMiddleware()],
      binding: GeneralBindings(),
      ),
    GetPage(
        name: Routes.studentList,
        page: () => const StudentListScreen(),
        transitionDuration: const Duration(seconds: 0),
        middlewares: [RoutesMiddleware()],
        binding: GeneralBindings()
      ),
    GetPage(
      name: Routes.addSyllabus, 
      page: ()=> const AddSyllabus(),
      transitionDuration: const Duration(seconds: 0),
      middlewares: [RoutesMiddleware()],
      binding: GeneralBindings()
      ),
      GetPage(
      name: Routes.allSyllabus, 
      page: ()=> const AllSyllabus(),
      transitionDuration: const Duration(seconds: 0),
      middlewares: [RoutesMiddleware()],
      binding: GeneralBindings()
      ),
    GetPage(
      name: Routes.notes,
      page: () => const AllNotesScreen(),
      transitionDuration: const Duration(seconds: 0),
      middlewares: [RoutesMiddleware()],
      binding: GeneralBindings()
      ),
    GetPage(
      name: Routes.profiles, 
      page: () => const ProfilesScreen(),
      transitionDuration: const Duration(seconds: 0),
      middlewares: [RoutesMiddleware()],
      binding: GeneralBindings()
      ),

  ];
}
