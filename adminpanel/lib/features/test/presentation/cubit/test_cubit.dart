import 'package:adminpanel/features/test/bussiness_logic/entities/test_entity.dart';
import 'package:adminpanel/features/test/bussiness_logic/use%20cases/test_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  final TestUseCase testUseCase;


  TestCubit({required this.testUseCase}) : super(TestInitial());

  Future<void> fetchUsers() async {
    emit(TestLoading());
    final users = await testUseCase.getUsers();
    emit(TestLoaded(users: users));
  }

  Future<void> addUser(TestEntity user) async {
    await testUseCase.addTestUser(user);
    fetchUsers();
    emit(TestSuccess(message: "The User has been added"));
  }

  Future<void> deleteUser(String id) async {
    await testUseCase.deleteUSer(id);
    fetchUsers();
     emit(TestDelete(message: "The User has been deleted"));
  }
}
