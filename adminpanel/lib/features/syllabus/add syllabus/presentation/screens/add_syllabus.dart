import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/syllabus/add%20syllabus/presentation/screens/responsive%20screens/add_syllabus_desktop.dart';
import 'package:adminpanel/features/syllabus/add%20syllabus/presentation/screens/responsive%20screens/add_syllabus_mobile.dart';
import 'package:adminpanel/features/syllabus/add%20syllabus/presentation/screens/responsive%20screens/add_syllabus_tablet.dart';
import 'package:flutter/material.dart';

class AddSyllabus extends StatelessWidget {
  const AddSyllabus({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop:AddSyllabusDesktop() ,
      tablet: AddSyllabusTablet(),
      mobile: AddSyllabusMobile(),
      useLayout: true,
    );
  }
}