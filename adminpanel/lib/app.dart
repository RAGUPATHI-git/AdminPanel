import 'package:adminpanel/features/response/error_404/presentation/error_404_screen.dart';
import 'package:adminpanel/features/test/bussiness_logic/use%20cases/test_use_case.dart';
import 'package:adminpanel/features/test/data/repositories/test_repository_impl.dart';
import 'package:adminpanel/features/test/presentation/cubit/test_cubit.dart';
import 'package:adminpanel/routes/app_routes.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TestCubit(
                testUseCase: TestUseCase(reopository1: TestRepositoryImpl())))
      ],
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRouting().pages,
          // initialBinding: GeneralBindings(),
          initialRoute: Routes.dashBoard,
          unknownRoute: GetPage(
              name: Routes.error_404, page: () => const Error404Screen())),
    );
  }
}
