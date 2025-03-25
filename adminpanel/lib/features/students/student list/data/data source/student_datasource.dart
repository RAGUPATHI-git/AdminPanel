import 'package:adminpanel/features/students/student%20list/domain/entities/student_list_entity.dart';
import 'package:flutter/material.dart';

class StudentDataSource extends DataTableSource {
  final List<Student> students;

  StudentDataSource(this.students);

  @override
  DataRow getRow(int index) {
    final student = students[index];
    return DataRow(cells: [
      DataCell(Text(student.id.toString())),
      DataCell(Text(student.name)),
      DataCell(Text(student.department)),
      DataCell(Text(student.year))
    ]);
  }

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => students.length;
  @override
  int get selectedRowCount => 0;

  // List<Student> dummyStudents = [
  //   Student(
  //       id: 721922104127,
  //       name: "Madhumitha",
  //       department: "Computer Science and Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100000,
  //       name: "Ragupathi",
  //       department: "Computer Science and Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100001,
  //       name: "Arun Kumar",
  //       department: "Mechanical Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100002,
  //       name: "Priya Sharma",
  //       department: "Electrical and Electronics Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100003,
  //       name: "Karthik Raja",
  //       department: "Civil Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100004,
  //       name: "Sneha Reddy",
  //       department: "Information Technology",
  //       year: "II"),
  //   Student(
  //       id: 721922100005,
  //       name: "Vignesh Prabhu",
  //       department: "Electronics and Communication Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100006,
  //       name: "Divya Nair",
  //       department: "Computer Science and Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100007,
  //       name: "Suresh Babu",
  //       department: "Mechanical Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100008,
  //       name: "Anitha Devi",
  //       department: "Electrical and Electronics Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100009,
  //       name: "Bala Subramanian",
  //       department: "Civil Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100010,
  //       name: "Chitra Lakshmi",
  //       department: "Information Technology",
  //       year: "IV"),
  //   Student(
  //       id: 721922100011,
  //       name: "Deepak Raj",
  //       department: "Electronics and Communication Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100012,
  //       name: "Eshwar Prasad",
  //       department: "Computer Science and Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100013,
  //       name: "Fathima Beevi",
  //       department: "Mechanical Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100014,
  //       name: "Gokul Krishna",
  //       department: "Electrical and Electronics Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100015,
  //       name: "Harini Shree",
  //       department: "Civil Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100016,
  //       name: "Irfan Khan",
  //       department: "Information Technology",
  //       year: "II"),
  //   Student(
  //       id: 721922100017,
  //       name: "Janani Priya",
  //       department: "Electronics and Communication Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100018,
  //       name: "Kavin Kumar",
  //       department: "Computer Science and Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100019,
  //       name: "Lavanya Mohan",
  //       department: "Mechanical Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100020,
  //       name: "Senthil Kumar",
  //       department: "Civil Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100021,
  //       name: "Meenakshi Sundaram",
  //       department: "Information Technology",
  //       year: "III"),
  //   Student(
  //       id: 721922100022,
  //       name: "Sathya Narayanan",
  //       department: "Electronics and Communication Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100023,
  //       name: "Karthiga Devi",
  //       department: "Computer Science and Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100024,
  //       name: "Muruganandam",
  //       department: "Mechanical Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100025,
  //       name: "Rajalakshmi",
  //       department: "Electrical and Electronics Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100026,
  //       name: "Periyasamy",
  //       department: "Civil Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100027,
  //       name: "Vaitheeswaran",
  //       department: "Information Technology",
  //       year: "I"),
  //   Student(
  //       id: 721922100028,
  //       name: "Bhavani Shankar",
  //       department: "Electronics and Communication Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100029,
  //       name: "Thirunavukkarasu",
  //       department: "Computer Science and Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100030,
  //       name: "Manickam",
  //       department: "Mechanical Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100031,
  //       name: "Saravanan",
  //       department: "Electrical and Electronics Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100032,
  //       name: "Muthulakshmi",
  //       department: "Civil Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100033,
  //       name: "Balasubramaniam",
  //       department: "Information Technology",
  //       year: "III"),
  //   Student(
  //       id: 721922100034,
  //       name: "Ponnusamy",
  //       department: "Electronics and Communication Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100035,
  //       name: "Aravind Kumar",
  //       department: "Computer Science and Engineering",
  //       year: "I"),
  //   Student(
  //       id: 721922100036,
  //       name: "Sivakumar",
  //       department: "Mechanical Engineering",
  //       year: "II"),
  //   Student(
  //       id: 721922100037,
  //       name: "Vanathi",
  //       department: "Electrical and Electronics Engineering",
  //       year: "III"),
  //   Student(
  //       id: 721922100038,
  //       name: "Natarajan",
  //       department: "Civil Engineering",
  //       year: "IV"),
  //   Student(
  //       id: 721922100039,
  //       name: "Sowmya",
  //       department: "Information Technology",
  //       year: "I"),
  //   Student(
  //       id: 721922100040,
  //       name: "Kandasamy",
  //       department: "Electronics and Communication Engineering",
  //       year: "II"),
  // ];
}
