import 'package:adminpanel/features/students/student%20list/data/data%20source/student_datasource.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/domain/repositories/student_list_repoistory.dart';

class StudentRepositoryImpl implements StudentRepository {
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
        id: 721922104126,
        name: "Ragupathi",
        department: "Computer Science and Engineering"),
  ];

  @override
  Future<List<Student>> getStudents(int page, int pageSize) async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    return StudentDataSource(dummyStudents).dummyStudents;
  }
}
