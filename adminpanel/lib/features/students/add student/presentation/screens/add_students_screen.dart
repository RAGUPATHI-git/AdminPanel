import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/responsive%20screens/add_student_desktop.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/responsive%20screens/add_student_mobile.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/responsive%20screens/add_student_tablet.dart';
import 'package:flutter/material.dart';

class AddStudentsScreen extends StatelessWidget {
  const AddStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      mobile: const AddStudentMobile(),
      tablet: const AddStudentTablet(),
      desktop: AddStudentDesktop(),
      useLayout: true,
    );
  }
}
