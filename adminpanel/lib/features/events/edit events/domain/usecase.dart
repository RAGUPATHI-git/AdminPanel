import 'package:adminpanel/features/events/edit%20events/domain/entities.dart';
import 'package:adminpanel/features/events/edit%20events/domain/repositaries.dart';


class OurEventUseCase {
  final OurEventRepositary repositary;

  OurEventUseCase(this.repositary);

  Future<List<OurEventEntity>> fetchEvents() async{
    return await repositary.ourfetch();
  }
}

class OtherEventUseCase {
  final OtherEventRepositary repositary;

  OtherEventUseCase(this.repositary);

  Future<List<OtherEventEntity>> fetchEvents() async{
    return await repositary.otherfetch();
  }
}