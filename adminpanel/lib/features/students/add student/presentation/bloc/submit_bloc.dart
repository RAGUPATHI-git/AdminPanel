import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';
import 'package:adminpanel/features/students/add%20student/domain/use%20case/add_student_usecase.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_event.dart';
import 'package:adminpanel/features/students/add%20student/presentation/bloc/submit_state.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddStudentBloc extends Bloc<AddStudentEvent, AddStudentState> {
  final AddStudentUsecase usecase = AddStudentUsecase();
  AddStudentBloc() : super(AddStudentInitial()) {
    // Register event handlers using the `on<EventName>` method
    on<SubmitFormEvent>((event, emit) async {
      emit(AddStudentLoading()); // Show loading state

      try {
        // Simulating form submission logic, e.g., saving to database or calling an API
        await Future.delayed(const Duration(seconds: 2)); // Simulating a delay

        // Here you can log the form data to console or process it
        print("First Name: ${event.firstName}");
        print("Last Name: ${event.lastName}");
        print("Reg No.: ${event.regNo}");
        print("Phone No.: ${event.phoneNo}");
        print("Email: ${event.email}");
        print("Username: ${event.username}");
        print("Password: ${event.password}");
        print("Confirm Password: ${event.confirmPassword}");
        print("Gender: ${event.gender}");
        print("Department: ${event.department}");
        print("year: ${event.year}");
        print("dob: ${event.dob}");

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
            useremail: event.email,
            role: AppRole.student,
            dob: event.dob);

        await usecase.call(student);

        // Emit success state
        emit(AddStudentSuccess("Student added successfully"));
      } catch (e) {
        // Emit failure state if something goes wrong
        emit(AddStudentFailure("Failed to add student"));
      }
    });
  }
}
