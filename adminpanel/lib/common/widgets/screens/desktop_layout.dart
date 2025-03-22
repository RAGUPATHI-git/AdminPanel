import 'package:adminpanel/common/layouts/headers/header.dart';
import 'package:adminpanel/common/layouts/sidebars/sidebar.dart';
import 'package:flutter/material.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, required this.body});

  final Widget? body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 1,
            child: Dsidebar(),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                const SizedBox(
                  height: 3,
                ),
                const Header(),
                Expanded(child: body ?? const SizedBox())
              ],
            ),
          )
        ],
      ),
    );
  }
}
