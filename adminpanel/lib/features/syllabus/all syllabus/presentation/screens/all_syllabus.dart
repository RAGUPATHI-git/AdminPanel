import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/responsive%20screens/all_syllabus_desktop.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/responsive%20screens/all_syllabus_mobile.dart';
import 'package:adminpanel/features/syllabus/all%20syllabus/presentation/screens/responsive%20screens/all_syllabus_tablet.dart';
import 'package:flutter/material.dart';

class AllSyllabus extends StatelessWidget {
  const AllSyllabus({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: AllSyllabusDesktop(),
      tablet: AllSyllabusTablet(),
      mobile: AllSyllabusMobile(),
      useLayout: true,
    );
  }
}