abstract class AddStudentState {}

class AddStudentInitial extends AddStudentState {}

class AddStudentLoading extends AddStudentState {
  bool isLoading = false;

  AddStudentLoading({required this.isLoading});


}

class AddStudentSuccess extends AddStudentState {
  final String message;

  AddStudentSuccess(this.message);
}

class AddStudentFailure extends AddStudentState {
  final String error;

  AddStudentFailure(this.error);
}
