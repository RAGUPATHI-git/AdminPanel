import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/edit_events_desktop.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/edit_events_mobile.dart';
import 'package:adminpanel/features/events/edit%20events/responsive%20screens/edit_events_tablet.dart';
import 'package:flutter/material.dart';

class EditEventsScreen extends StatelessWidget {
  const EditEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: EditEventsDesktop(),
      tablet: EditEventsTablet(),
      mobile: EditEventsMobile(),
      useLayout: true,
    );
  }
}