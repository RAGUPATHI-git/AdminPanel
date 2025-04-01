import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';

abstract class AddStudentRepositiory {
  Future<String> addStudent(AddStudentEntity student);
}
