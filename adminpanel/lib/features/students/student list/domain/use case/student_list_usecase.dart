import 'package:adminpanel/features/students/student%20list/data/repositories/student_list_impl.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/domain/repositories/student_list_repoistory.dart';

class GetStudentsUseCase {
  final StudentRepository repository = StudentRepositoryImpl();

  // GetStudentsUseCase(this.repository);

  Future<List<Student>> execute(int page, int pageSize) {
    return repository.getStudents(page, pageSize);
  }
}
