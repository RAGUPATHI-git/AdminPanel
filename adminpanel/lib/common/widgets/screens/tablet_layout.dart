import 'package:adminpanel/common/layouts/headers/header.dart';
import 'package:adminpanel/common/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, required this.body});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Dsidebar(),
      appBar: Header(
        scaffoldKey: scaffoldKey,
      ),
      body: body ?? const SizedBox(),
    );
  }
}
