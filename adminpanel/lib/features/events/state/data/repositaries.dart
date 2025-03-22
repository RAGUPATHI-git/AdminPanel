import 'package:adminpanel/features/events/state/business_logic/repositaries.dart';
import 'package:adminpanel/features/events/state/data/data_source.dart';
import 'package:adminpanel/features/events/state/data/model.dart';

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