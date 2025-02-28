import 'package:adminpanel/features/response/error_404/presentation/responsive_screens/error_404_desktop.dart';
import 'package:adminpanel/routes/app_routes.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: AppRouting().pages,
        // initialBinding: GeneralBindings(),
        // initialRoute: Routes.dashBoard,
        unknownRoute: GetPage(
            name: Routes.error_404, page: () => const Error404Desktop()));
  }
}
