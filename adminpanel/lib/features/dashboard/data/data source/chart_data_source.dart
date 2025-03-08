import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';

class ChartDataSource {
//dummy datas
  final List<ChartEntity> dummyDatas = [
    ChartEntity(date: DateTime(2024, 3, 1), value: 50),
    ChartEntity(date: DateTime(2024, 3, 2), value: 80),
    ChartEntity(date: DateTime(2024, 3, 3), value: 45),
    ChartEntity(date: DateTime(2024, 3, 4), value: 90),
  ];

  Future<List<ChartEntity>> getDatas() async {
    await Future.delayed( const Duration(seconds: 2));
    return dummyDatas;
  }
}
