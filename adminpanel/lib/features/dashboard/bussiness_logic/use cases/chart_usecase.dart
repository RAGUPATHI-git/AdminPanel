import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/repositories/chart_repository.dart';

class ChartUsecase {
  final ChartRepository repository;
  ChartUsecase({required this.repository});

    Future<List<ChartEntity>> call() async {
    return await repository.getChartData();
  }
}
