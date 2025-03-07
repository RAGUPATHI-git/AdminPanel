part of 'chart_bloc.dart';

@immutable
sealed class ChartState {}


class ChartInitial extends ChartState {}

class ChartLoading extends ChartState {}

class ChartLoaded extends ChartState {
  final List<ChartEntity> chartData;
  ChartLoaded({required this.chartData});
}

class ChartError extends ChartState {
  final String message;
  ChartError({required this.message});
}

