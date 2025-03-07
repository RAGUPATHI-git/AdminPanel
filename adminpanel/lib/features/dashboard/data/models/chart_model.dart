import 'package:adminpanel/features/dashboard/bussiness_logic/entities/chart_entity.dart';

class ChartModel extends ChartEntity {
  final double value;
  final DateTime dateTime;
  @override
  ChartModel({required this.value, required this.dateTime})
      : super(date: dateTime, value: value);


  factory ChartModel.fromJson(Map<String, dynamic> json){
    return ChartModel(value: json['value'].todouble(), dateTime: DateTime.parse(json['date']));
  }

  Map<String,dynamic> toJson(){
    return {
      'date' : dateTime.toIso8601String(),
      'value' : value
    };
  }
      
}

