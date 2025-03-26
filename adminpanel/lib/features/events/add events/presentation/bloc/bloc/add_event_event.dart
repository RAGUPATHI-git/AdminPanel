part of 'add_event_bloc.dart';

class AddEventEvent {}

class EventForm extends AddEventEvent{
  final String college;
  final String category;
  final String title;
  final String location;
  final String date;
  final String link;

  EventForm({
    required this.college,
    required this.category,
    required this.title,
    required this.location,
    required this.date,
    required this.link
  });
}
