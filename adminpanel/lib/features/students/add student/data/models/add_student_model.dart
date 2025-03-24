import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';

class StudentModel extends AddStudentEntity {
  StudentModel({
    required String firstName,
    required String lastName,
    required String regNo,
    required String phoneNo,
    required String email,
    required String username,
    required String password,
    required String gender,
    required String department,
    required String year,
    required String dob
  }) : super(
            firstname: firstName,
            lastname: lastName,
            student_id: regNo,
            phoneno: phoneNo,
            email: email,
            username: "$firstName $lastName",
            password: password,
            department: department,
            gender: gender,
            year: year,
            role: AppRole.student,
            dob:  dob,
            regNO: regNo
          );

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      regNo: json['regno'],
      phoneNo: json['phoneNo'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      gender: json['gender'],
      department: json['department'], year: json['year'],
      dob: json['dob']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'firstName': firstname,
      'lastName': lastname,
      'regNo': student_id,
      'phoneNo': phoneno,
      'email': email,
      'username': "$firstname $lastname",
      'password': password,
      'gender': gender,
      'department': department,
      'dob' : dob,
      'regno' : regNO
    };
  }
}
