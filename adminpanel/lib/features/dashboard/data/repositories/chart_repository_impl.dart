import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/repositories/chart_repository.dart';
import 'package:adminpanel/features/dashboard/data/data%20source/chart_data_source.dart';

class ChartRepositoryImpl implements ChartRepository {
  final ChartDataSource dataSource;
  ChartRepositoryImpl({required this.dataSource});

  @override
  Future<List<ChartEntity>> getChartData() async {
    return await dataSource.getDatas();
  }
}
