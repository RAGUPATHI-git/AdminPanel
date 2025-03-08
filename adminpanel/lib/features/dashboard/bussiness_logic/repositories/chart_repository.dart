import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';

abstract class ChartRepository {
  Future<List<ChartData>> getChartData();
}
