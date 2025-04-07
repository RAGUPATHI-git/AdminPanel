import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/responsive%20screens/student_list_mobile.dart';
import 'package:adminpanel/features/students/student%20list/presentation/screens/responsive%20screens/student_list_tablet.dart';
import 'package:adminpanel/features/study%20materials/presentation/screens/responsive%20screens/study_material_desktop.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      useLayout: true,
      desktop: StudyMaterialDesktop(),
      tablet: StudentListTablet(),
      mobile: StudentListMobile(),
    );
  }
}
