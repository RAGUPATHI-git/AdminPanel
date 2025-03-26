import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';

class StudentListModel extends Student {
  StudentListModel(
      {required String id,
      required String name,
      required String department,
      required String year})
      : super(name: name, department: department, id: id, year: year);

  factory StudentListModel.fromMap(Map<String, dynamic> map) {
    return StudentListModel(
        id: map['regno'] ?? ' ',
        name: map['UserName'] ?? ' ',
        department: map['department'] ?? ' ',
        year: map['year'] ?? ' ');
  }
}
