import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';

abstract class StudentRepository {
  Future<List<Student>> getStudents(int page, int pageSize);
}