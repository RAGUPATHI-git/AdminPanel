import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/students/add%20student/presentation/screens/responsive%20screens/add_student_tablet.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/responsive%20screens/student_list_desktop.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/responsive%20screens/student_list_mobile.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/responsive%20screens/student_list_tablet.dart';
import 'package:flutter/material.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: StudentListDesktop(),
      mobile: StudentListMobile(),
      tablet: StudentListTablet(),
      useLayout: true,
    );
  }
}
