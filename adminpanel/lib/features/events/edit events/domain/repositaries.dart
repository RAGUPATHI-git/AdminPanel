import 'package:adminpanel/features/events/edit%20events/data/model.dart';


abstract class OurEventRepositary {
  Future<List<OurEventModel>> ourfetch();
}

abstract class OtherEventRepositary {
  Future<List<OtherEventModel>> otherfetch();
}