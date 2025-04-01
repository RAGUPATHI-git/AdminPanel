import 'package:adminpanel/features/events/add%20events/domain/entities/add_event_entity.dart';

class AddEventModel extends AddEventEntity{
  AddEventModel({
    required String college,
    required String category,
    required String title,
    required String location,
    required String date,
    required String link
  }):super(
    college: college,
    category: category,
    title: title,
    location: location,
    date: date,
    link: link
  );


  factory AddEventModel.fromJson(Map<String,dynamic> json){
    return AddEventModel(
      college: json['college'],
      category: json['category'], 
      title: json['title'], 
      location: json['location'], 
      date:json['date'], 
      link: json['link']
      );
  }

  Map<String,dynamic> toJson(){
    return{
      'college':college,
      'category':category,
      'title':title,
      'location':location,
      'date':date,
      'link':link
    };
  }

}