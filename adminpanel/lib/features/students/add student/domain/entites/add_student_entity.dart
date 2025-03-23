import 'package:adminpanel/core/constants/enums.dart';

class AddStudentEntity {
  final String firstname;
  final String lastname;
  final String department;
  final String email;
  final String password;
  final String year;
  final String gender;
  final String student_id;
  final String phoneno;
  final String useremail;
  final AppRole role;
  final String dob;

  AddStudentEntity({
    required this.firstname,
    required this.lastname,
    required this.department,
    required this.email,
    required this.password,
    required this.year,
    required this.gender,
    required this.student_id,
    required this.phoneno,
    required this.useremail,
    required this.role,
    required this.dob
  });
}
