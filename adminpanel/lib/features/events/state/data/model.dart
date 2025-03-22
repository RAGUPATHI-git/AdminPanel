import 'package:adminpanel/features/events/state/business_logic/entities.dart';

class OurEventModel extends OurEventEntity{
  OurEventModel({ 
    required String title ,
    required String date,
    required String posterUrl 
  }):super (
    title: title,
    date: date,
    posterUrl: posterUrl);

    factory OurEventModel.fromJson(Map<String,dynamic>json){
      return OurEventModel(
        title: json['title'], 
        date: json['date'], 
        posterUrl: json['posterUrl']);
    }

    Map<String,dynamic> toJson(){
      return {
        'Event title':title,
        'Event date':date,
        'posterurl':posterUrl
      };
    }
}


class OtherEventModel extends OtherEventEntity{
  OtherEventModel({ 
    required String title ,
    required String date,
    required String posterUrl 
  }):super (
    title: title,
    date: date,
    posterUrl: posterUrl);

    factory OtherEventModel.fromJson(Map<String,dynamic>json){
      return OtherEventModel(
        title: json['title'], 
        date: json['date'], 
        posterUrl: json['posterUrl']);
    }

    Map<String,dynamic> toJson(){
      return {
        'Event title':title,
        'Event date':date,
        'posterurl':posterUrl
      };
    }
}