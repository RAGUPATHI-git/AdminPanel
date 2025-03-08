import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/use%20cases/chart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_state.dart';

class ChartCubit extends Cubit<List<ChartData>> {
  final ChartUsecase usecase;
  ChartCubit({required this.usecase}) : super([]);

  void loadChart() async {
    final data = await usecase(null);
    emit(data);
  }
}
