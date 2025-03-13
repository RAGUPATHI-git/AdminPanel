import 'package:adminpanel/common/layouts/sidebars/menu/mainitem.dart';
import 'package:adminpanel/common/layouts/sidebars/menu/menuitem.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/utils/device_utility.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:flutter/material.dart';

class Dsidebar extends StatelessWidget {
  const Dsidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: DeviceUtility.isDesktopScreen(context)
          ? const BeveledRectangleBorder()
          : null,
      child: Container(
        decoration: const BoxDecoration(
            // gradient: DGradients.premiumWhite,
            color: Colors.white,
            border: Border(right: BorderSide(color: Colors.grey, width: 1))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 70,
                width: 70,
                // child: Image.asset(ImageUrl.logo),
              ),
              const SizedBox(
                height: DSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.all(DSizes.md),
                child: Container(
                  height: 400,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "Menu",
                          style: TextStyle(fontSize: 30),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Mainitem(
                          title: "Dashboard",
                          // icon: ImageUrl.blueDot,
                          items: [
                            Ritem(Routes.dashBoard, DIcons().dashboard,
                                "dashboard"),
                          ],
                          icon: '',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Mainitem(
                          title: "Students",
                          // icon: ImageUrl.blueDot,
                          items: [
                            Ritem(Routes.addStudent, DIcons().addStudent,
                                " Add Student"),
                          ],
                          icon: '',
                        ),
                        Mainitem(
                          title: "Events",
                          // icon: ImageUrl.blueDot,
                          items: [
                            Ritem(Routes.event, DIcons().addStudent,
                                " Update Event"),
                          ],
                          icon: '',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RMenuItem(
                    route: Routes.logout,
                    icon: DIcons().logout,
                    itemName: "Logout"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Ritem {
  final String route;
  final String icon;
  final String label;
  const Ritem(this.route, this.icon, this.label);
}
