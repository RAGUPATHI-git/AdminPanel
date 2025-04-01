import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:adminpanel/features/students/student%20list/domain/use%20case/student_list_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'students_state.dart';

class StudentCubit extends Cubit<List<Student>> {
  final GetStudentsUseCase _getStudentsUseCase = GetStudentsUseCase();
  int _currentPage = 1;
  final int _pageSize = 10;
  List<Student> _allStudents = [];
  List<Student> _searchStudents = [];
  String _selectedDepartment = 'All';
  String _selectedYear = 'All';

  StudentCubit() : super([]) {
    fetchStudents();
  }

  void filterByDepartment(String department) {
    _selectedDepartment = department;
    applyFilters();
  }

  void applyFilters({String query = ''}) {
    var filteredStudents = _allStudents.where((student) {
      final matchesQuery =
          student.name.toLowerCase().contains(query.toLowerCase());
      final matchesDepartment = _selectedDepartment == 'All' ||
          student.department == _selectedDepartment;
      final matchesYear =
          _selectedYear == 'All' || student.year == _selectedYear;
      return matchesQuery && matchesDepartment && matchesYear;
    }).toList();
    emit(filteredStudents);
  }

  void fetchStudents() async {
    _allStudents = await _getStudentsUseCase.execute(_currentPage, _pageSize);
    _searchStudents =
        await _getStudentsUseCase.execute(_currentPage, _pageSize);
    emit(_allStudents);
    emit(_searchStudents);
    applyFilters();
  }

  void filterByYear(String year) {
    _selectedYear = year;
    applyFilters();
  }

  void searchStudents(String query) {
    applyFilters(query: query);
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
