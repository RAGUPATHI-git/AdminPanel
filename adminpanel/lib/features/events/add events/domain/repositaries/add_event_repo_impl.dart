import 'package:adminpanel/features/events/add%20events/data/repositaries/add_event_repositary.dart';
import 'package:adminpanel/features/events/add%20events/domain/entities/add_event_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEventRepoImpl implements AddEventRepositary{
  final FirebaseFirestore firestore;

  AddEventRepoImpl({required this.firestore});
  
  @override
  Future<String> addEvent(AddEventEntity event) async {
    try{
      final eventdata={
        'college':event.college.toString(),
        'category':event.category,
        'title':event.title,
        'location':event.location,
        'date':event.date,
        'link':event.link
      };

      DocumentReference docRef = await firestore.collection('Events').add(eventdata);
      return docRef.id;
    }
    catch(e){
      throw Exception('Failed to add event : $e');
    }
  } 
}