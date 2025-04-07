import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/responsive%20screens/all_notes_desktop.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/responsive%20screens/all_notes_mobile.dart';
import 'package:adminpanel/features/notes/all%20notes/presentation/screens/responsive%20screens/all_notes_tablet.dart';
import 'package:flutter/material.dart';

class AllNotesScreen extends StatelessWidget {
  const AllNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: AllNotesDesktop(),
      tablet: AllNotesTablet(),
      mobile: AllNotesMobile(),
      useLayout: true,
    );
  }
}