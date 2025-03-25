import 'package:adminpanel/binding/general_bindings.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/authentication_repository.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/use%20cases/chart_usecase.dart';
import 'package:adminpanel/features/dashboard/data/repositories/chart_repository_impl.dart';
import 'package:adminpanel/features/dashboard/presentation/cubit/chart_cubit.dart';
import 'package:adminpanel/features/events/add%20events/presentation/bloc/bloc/add_event_bloc.dart';
import 'package:adminpanel/features/events/edit%20events/data/data_source.dart';
import 'package:adminpanel/features/events/edit%20events/data/repositaries.dart';
import 'package:adminpanel/features/events/edit%20events/domain/usecase.dart';
import 'package:adminpanel/features/events/edit%20events/presentation/cubit/event_cubit.dart';
import 'package:adminpanel/features/response/error_404/presentation/error_404_screen.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_bloc.dart';
import 'package:adminpanel/features/students/student%20list/data/repositories/student_list_impl.dart';
import 'package:adminpanel/features/students/student%20list/domain/use%20case/student_list_usecase.dart';
import 'package:adminpanel/features/students/student%20list/presentation/cubit/students_cubit.dart';
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
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => TestCubit(
              testUseCase: TestUseCase(reopository1: TestRepositoryImpl()),
            ),
          ),
          BlocProvider(
            create: (_) => ChartCubit(
              usecase: ChartUsecase(ChartRepositoryImpl()),
            ),
          ),
          BlocProvider(


            create: (_) => OurEventCubit(
              OurEventUseCase(
                OurEventRepositaryImpl(dataSource:OurEventSampleDataSourceImpl())))
         ),
         BlocProvider(
           create: (_) => OtherEventCubit(
              OtherEventUseCase(
                OtherEventRepositaryImpl(dataSource: OtherEventSampleDataSourceImpl()))),
        ),
        BlocProvider(create: (_)=>AddEventBloc()),

        BlocProvider(
              create: (_) => OurEventCubit(OurEventUseCase(
                  OurEventRepositaryImpl(
                      dataSource: OurEventSampleDataSourceImpl())))),
          BlocProvider(
            create: (_) => OtherEventCubit(OtherEventUseCase(
                OtherEventRepositaryImpl(
                    dataSource: OtherEventSampleDataSourceImpl()))),
          ),
          BlocProvider(create: (_) => StudentCubit()),
          BlocProvider(create: (_) => AddStudentBloc())

        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.pages,
          initialBinding: GeneralBindings(),
          initialRoute: AuthenticationRepository().firebaseUser.value != null
              ? Routes.dashBoard
              : Routes.login,
          unknownRoute: GetPage(
            name: Routes.error_404,
            page: () => const Error404Screen(),
          ),
        ));
  }
}
