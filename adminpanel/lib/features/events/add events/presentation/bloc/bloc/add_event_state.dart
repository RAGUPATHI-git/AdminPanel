part of 'add_event_bloc.dart';

abstract class AddEventState {}

class AddEventInitial extends AddEventState {}

class AddEventIsLoading extends AddEventState{
  bool isLoading = false;

  AddEventIsLoading({required this.isLoading});
}

class AddEventLoaded extends AddEventState{
  final AddEventEntity event;

  AddEventLoaded({required this.event});
}

class AddEventError extends AddEventState{
  String error;

  AddEventError({required this.error});
}