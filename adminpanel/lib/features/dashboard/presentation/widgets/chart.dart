// import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';


// class ChartWidget extends StatelessWidget {
//   final List<ChartEntity> chartData;

//   ChartWidget({required this.chartData});

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: DateTimeAxis(),
//       title: ChartTitle(text: 'Performance Over Time'),
//       legend: Legend(isVisible: true),
//       series: [
//         LineSeries<ChartEntity, DateTime>(
//           name: 'Values',
//           dataSource: chartData,
//           xValueMapper: (ChartEntity data, _) => data.date,
//           yValueMapper: (ChartEntity data, _) => data.value,
//           markerSettings: MarkerSettings(isVisible: true),
//         ),
//       ],
//     );
//   }
// }
