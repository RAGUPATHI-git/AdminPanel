import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/notes/add%20notes/presentation/screens/responsive%20screens/add_notes_desktop.dart';
import 'package:adminpanel/features/notes/add%20notes/presentation/screens/responsive%20screens/add_notes_mobile.dart';
import 'package:adminpanel/features/notes/add%20notes/presentation/screens/responsive%20screens/add_notes_tablet.dart';
import 'package:flutter/material.dart';

class AddNotesScreen extends StatelessWidget {
  const AddNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: AddNotesDesktop(),
      tablet: AddNotesTablet(),
      mobile: AddNotesMobile(),
      useLayout: true,
    );
  }
}