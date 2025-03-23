part of 'event_cubit.dart';

@immutable
sealed class EventState {}

final class EventInitial extends EventState {}


final class EventLoading extends EventState {}


final class OurEventLoaded extends EventState {
  final List<OurEventEntity> events;

  OurEventLoaded(this.events);
}

final class OtherEventLoaded extends EventState {
  final List<OtherEventEntity> events;

  OtherEventLoaded(this.events);
}

class EventError extends EventState {
  final String message;

  EventError(this.message);
}

