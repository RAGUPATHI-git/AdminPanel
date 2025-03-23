import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/features/authentication/login/data/model/authentication_model.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/authentication_repository.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/user_repository.dart';
import 'package:adminpanel/features/students/add%20student/data/models/add_student_model.dart';
import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';
import 'package:adminpanel/features/students/add%20student/domain/repositories/add_student_repositiory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddStudentRepoImpl implements AddStudentRepositiory {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final userRepository = Get.put(UserRepository());
  @override
  Future<String> addStudent(AddStudentEntity student) async {
    try {
      print("add success2");
      print(student.email);
      print(student.password);
      final studentModel = StudentModel(
        firstName: student.firstname,
        lastName: student.lastname,
        regNo: student.student_id,
        phoneNo: student.phoneno,
        email: student.email,
        username: student.firstname + " " + student.lastname,
        password: student.password,
        department: student.department,
        gender: student.gender,
        year: student.year,
        dob: student.dob,
      );

      await firebaseAuth.createUserWithEmailAndPassword(
          email: student.email, password: student.password);

      print("add success");
      return ' ';
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
