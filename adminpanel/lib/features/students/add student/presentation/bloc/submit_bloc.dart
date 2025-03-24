import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';
import 'package:adminpanel/features/students/add%20student/domain/use%20case/add_student_usecase.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_event.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final AddStudentUsecase usecase = AddStudentUsecase();
  AddStudentBloc() : super(AddStudentInitial()) {
    on<SubmitFormEvent>((event, emit) async {
      emit(AddStudentLoading(isLoading: true));

      try {
        final student = AddStudentEntity(
            firstname: event.firstName,
            lastname: event.lastName,
            department: event.department,
            email: event.email,
            password: event.password,
            year: event.year,
            gender: event.gender,
            student_id: event.regNo,
            phoneno: event.phoneNo,
            username: event.email,
            role: AppRole.student,
            dob: event.dob,
            regNO:  event.regNo,
            );
  

        String response = await usecase.call(student);
        if (response == "success") {
          emit(AddStudentSuccess("Student added successfully"));
        } else {
          emit(AddStudentFailure("Failed to add student"));
        }
      } catch (e) {
        // Emit failure state if something goes wrong
        emit(AddStudentFailure(e.toString()));
      }
    });
  }
}
