import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/use%20cases/chart_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chart_event.dart';
part 'chart_state.dart';


class ChartBloc extends Bloc<ChartEvent, ChartState> {
  final ChartUsecase getChartData;

  ChartBloc({required this.getChartData}) : super(ChartInitial()) {
    on<LoadChartData>((event, emit) async {
      emit(ChartLoading());
      try {
        final data = await getChartData();
        emit(ChartLoaded(chartData: data));
      } catch (e) {
        emit(ChartError(message: e.toString()));
      }
    });
  }
}
