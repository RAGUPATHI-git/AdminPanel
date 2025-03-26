import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/features/students/student%20list/data/models/student_list_model.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/domain/repositories/student_list_repoistory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentRepositoryImpl implements StudentRepository {
  final _firestore = FirebaseFirestore.instance;
  // @override
  // Future<List<Student>> getStudents(int page, int pageSize) async {
  //   await Future.delayed(Duration(seconds: 1)); // Simulate network delay
  //   return List.generate(pageSize, (index) {
  //     int id = (page - 1) * pageSize + index + 1;
  //     return Student(id: id, name: 'Student $id', department: 'Dept $id');
  //   });
  // }
  List<Student> dummyStudents = [
    Student(
        id: "721922104126",
        name: "Ragupathi",
        department: "Computer Science and Engineering",
        year: 'III'),
  ];

  // @override
  // Future<List<Student>> getStudents(int page, int pageSize) async {
  //   await Future.delayed(Duration(seconds: 2)); // Simulate network delay
  //   return StudentDataSource(dummyStudents).dummyStudents;
  // }

  @override
  Future<List<Student>> fetchStudents() async {
    try {
      final snapshot = await _firestore
          .collection('Users')
          .where('Role', isEqualTo: 'student')
          .get();
      return snapshot.docs
          .map((doc) => StudentListModel.fromMap(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Error fetching users: $e');
    }
  }

  @override
  Future<List<Student>> getStudents(int page, int pageSize) {
    // TODO: implement getStudents
    throw UnimplementedError();
  }
}
