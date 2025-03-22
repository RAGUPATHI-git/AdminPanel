import 'package:adminpanel/features/events/state/data/model.dart';

abstract class OurEventRepositary {
  Future<List<OurEventModel>> ourfetch();
}

abstract class OtherEventRepositary {
  Future<List<OtherEventModel>> otherfetch();
}