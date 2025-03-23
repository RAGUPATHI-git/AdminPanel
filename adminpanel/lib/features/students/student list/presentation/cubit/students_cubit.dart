import 'package:adminpanel/features/students/student%20list/data/data%20source/student_datasource.dart';
import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/domain/use%20case/student_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'students_state.dart';

class StudentCubit extends Cubit<List<Student>> {
  final GetStudentsUseCase _getStudentsUseCase;
  int _currentPage = 1;
  final int _pageSize = 10;
  List<Student> _allStudents = [];
  List<Student> _searchStudents = [];

  StudentCubit(this._getStudentsUseCase) : super([]);

  void fetchStudents() async {
    _allStudents = await _getStudentsUseCase.execute(_currentPage, _pageSize);
    _searchStudents = StudentDataSource(_allStudents).dummyStudents;
    emit(_allStudents);
    emit(_searchStudents);
  }

  void searchStudents(String query) {
    if (query.isEmpty) {
      emit(_searchStudents);
    } else {
      emit(_searchStudents
          .where((student) =>
              student.name.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  void nextPage() {
    _currentPage++;
    fetchStudents();
  }

  void previousPage() {
    if (_currentPage > 1) {
      _currentPage--;
      fetchStudents();
    }
  }
}
