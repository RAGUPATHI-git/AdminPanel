import 'package:adminpanel/features/events/add%20events/domain/entities/add_event_entity.dart';
import 'package:adminpanel/features/events/add%20events/domain/repositaries/add_event_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


part 'add_event_event.dart';
part 'add_event_state.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  final AddEventRepoImpl repoImpl = AddEventRepoImpl(firestore: FirebaseFirestore.instance);
  AddEventBloc() : super(AddEventInitial()) {
    on<EventForm>((event, emit) async {
      emit (AddEventIsLoading(isLoading: true));
 

    try{
      final details = AddEventEntity(
        college: event.college, 
        category: event.category, 
        title: event.title, 
        location: event.location, 
        date: event.date, 
        link: event.link);

      String response = await repoImpl.addEvent(details);
      if (response.isNotEmpty){
        emit(AddEventLoaded(event: details));
      }
      else {
        emit (AddEventError(error:"Failed to add the event"));
      }
    }
    catch(e){
      emit(AddEventError(error: "An error occurred :$e"));
    }

   });
  }
}
