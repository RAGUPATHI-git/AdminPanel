import 'package:adminpanel/features/events/add%20events/domain/entities/add_event_entity.dart';

abstract class AddEventRepositary {
  Future<String> addEvent(AddEventEntity event);
}