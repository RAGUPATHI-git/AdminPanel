part of 'test_cubit.dart';

@immutable
sealed class TestState {}

final class TestInitial extends TestState {}

final class TestLoaded extends TestState {
  final List<TestEntity> users;
  TestLoaded({required this.users});
}

final class TestLoading extends TestState {}

final class TestSuccess extends TestState {
  final String message;
  TestSuccess({required this.message});
}

final class TestDelete extends TestState {
  final String message;
  TestDelete({required this.message});
}
