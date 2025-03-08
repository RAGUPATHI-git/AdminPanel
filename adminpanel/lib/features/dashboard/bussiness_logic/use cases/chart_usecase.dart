import 'package:adminpanel/core/usecases/usecase.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/repositories/chart_repository.dart';

class ChartUsecase extends Usecase<List<ChartData>, void> {
  final ChartRepository repository;
  ChartUsecase(this.repository);

  @override
  Future<List<ChartData>> call(void params) async {
    return repository.getChartData();
  }
}
