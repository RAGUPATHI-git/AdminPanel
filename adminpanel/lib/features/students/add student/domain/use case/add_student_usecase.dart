import 'package:adminpanel/features/students/add%20student/data/repositories/add_student_repo_impl.dart';
import 'package:adminpanel/features/students/add%20student/domain/entites/add_student_entity.dart';
import 'package:adminpanel/features/students/add%20student/domain/repositories/add_student_repositiory.dart';

class AddStudentUsecase {
  final AddStudentRepositiory repositiory = AddStudentRepoImpl();

  Future<String> call(AddStudentEntity student) async {
    return repositiory.addStudent(student);
  }
}