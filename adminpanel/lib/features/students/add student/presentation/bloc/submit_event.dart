abstract class AddStudentEvent {}

class SubmitFormEvent extends AddStudentEvent {
  final String firstName;
  final String lastName;
  final String regNo;
  final String phoneNo;
  final String email;
  final String username;
  final String password;
  final String confirmPassword;
  final String gender;
  final String department;
  final String year;
  final String dob;

  SubmitFormEvent( 
      {required this.firstName,
      required this.dob,
      required this.lastName,
      required this.regNo,
      required this.phoneNo,
      required this.email,
      required this.username,
      required this.password,
      required this.confirmPassword,
      required this.gender,
      required this.department,
      required this.year});
}
