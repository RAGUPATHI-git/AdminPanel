import 'package:adminpanel/common/layouts/template/site%20layout.dart';
import 'package:adminpanel/features/events/add%20events/responsive%20screens/add_events_desktop.dart';
import 'package:adminpanel/features/events/add%20events/responsive%20screens/add_events_tablet.dart';
import 'package:flutter/material.dart';

class AddEventsScreen extends StatelessWidget {
  const AddEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: AddEventsDesktop(),
      tablet: AddEventsTablet(),
      mobile: AddEventsTablet(),
      useLayout: true,
      );
  }
}