import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';

abstract class ChartRepository {
  Future<List<ChartEntity>> getChartData();
}
