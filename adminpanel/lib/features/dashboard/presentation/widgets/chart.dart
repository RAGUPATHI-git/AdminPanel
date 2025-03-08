import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<ChartData> chartData;
  ChartWidget({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
        ),
        gridData: FlGridData(show: true),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: chartData.map((e) => FlSpot(e.x, e.y)).toList(),
            isCurved: true,
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple
              ], // Use gradient instead of `colors`
            ),
            barWidth: 4,
            belowBarData:
                BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
          ),
        ],
      ),
    );
  }
}
