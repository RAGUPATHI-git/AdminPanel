import 'dart:convert';
import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';
import 'package:adminpanel/features/dashboard/bussiness_logic/repositories/chart_repository.dart';
import 'package:flutter/services.dart';

class ChartRepositoryImpl implements ChartRepository {
  @override
  Future<List<ChartData>> getChartData() async {
    final String response =
        await rootBundle.loadString('assets/datas/chart_data.json');
    final List<dynamic> data = json.decode(response);

    return data.map((item) => ChartData(x: item['x'].toDouble(), y: item['y'].toDouble())).toList();
  }
}
