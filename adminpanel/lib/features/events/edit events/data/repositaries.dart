import 'package:adminpanel/features/events/edit%20events/data/data_source.dart';
import 'package:adminpanel/features/events/edit%20events/data/model.dart';
import 'package:adminpanel/features/events/edit%20events/domain/repositaries.dart';


class OurEventRepositaryImpl extends OurEventRepositary{
  final OurEventSampleDataSource dataSource;

  OurEventRepositaryImpl({required this.dataSource});

  @override
  Future<List<OurEventModel>> ourfetch() async{
    return await dataSource.fetchEvents();
  }
}

class OtherEventRepositaryImpl extends OtherEventRepositary{
  final OtherEventSampleDataSource dataSource;

  OtherEventRepositaryImpl({required this.dataSource});

  @override
  Future<List<OtherEventModel>> otherfetch() async{
    return await dataSource.fetchEvents();
  }
}