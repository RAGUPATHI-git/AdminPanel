import 'package:adminpanel/features/events/edit%20events/domain/entities.dart';
import 'package:adminpanel/features/events/edit%20events/domain/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'event_state.dart';


class OurEventCubit extends Cubit<EventState>{
  final OurEventUseCase usecase; 

  OurEventCubit(this.usecase) : super(EventInitial());

  Future<void> loadEvents() async {
    emit(EventLoading());
    try {
      final events = await usecase.fetchEvents();
      emit(OurEventLoaded(events));
    } catch (e) {
      emit(EventError("Failed to load events: ${e.toString()}")); 
    }
  }
}


class OtherEventCubit extends Cubit<EventState>{
  final OtherEventUseCase usecase; 

  OtherEventCubit(this.usecase) : super(EventInitial());

  Future<void> loadEvents() async {
    emit(EventLoading());
    try {
      final events = await usecase.fetchEvents();
      emit(OtherEventLoaded(events));
    } catch (e) {
      emit(EventError("Failed to load events: ${e.toString()}")); 
    }
  }
}