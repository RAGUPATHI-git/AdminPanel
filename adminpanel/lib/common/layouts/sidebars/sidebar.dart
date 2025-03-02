import 'package:adminpanel/core/utils/device_utility.dart';
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
            color: Colors.white,
            border: Border(right: BorderSide(color: Colors.grey, width: 1))),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              // const SizedBox(
              //   height: 10,
              // ),
              // SizedBox(
              //   height: 70,
              //   width: 70,
              //   child: Image.asset(ImageUrl.logo),
              // ),
              // const SizedBox(
              //   height: Sizes.spaceBtwSections,
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(Sizes.md),
              //   child: Container(
              //     height: 400,
              //     child: SingleChildScrollView(
              //       child: const Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         mainAxisSize: MainAxisSize.min,
              //         children: [
              //           Text(
              //             "Menu",
              //             style: TextStyle(fontSize: 30),
              //           ),
              //           SizedBox(
              //             height: 10,
              //           ),
              //           Mainitem(
              //             title: "Dashboard",
              //             icon: ImageUrl.blueDot,
              //             items: [
              //               Ritem(Routes.dashBoard, ImageUrl.box, "dashboard"),
              //               Ritem(Routes.calendar, ImageUrl.calendar,
              //                   "Calendar View"),
              //             ],
              //           ),
              //           Mainitem(
              //             title: "Management",
              //             icon: ImageUrl.blueDot,
              //             items: [
              //               Ritem(Routes.leaveManagement, ImageUrl.note,
              //                   "Leave Management"),
              //               Ritem(Routes.details, ImageUrl.user,
              //                   "Employee Management"),
              //             ],
              //           ),
              //           Padding(
              //             padding: EdgeInsets.all(Sizes.md),
              //             child: RMenuItem(
              //                 route: Routes.archive,
              //                 icon: ImageUrl.archive,
              //                 itemName: "Archive"),
              //           ),
              //           Mainitem(
              //             title: "UI Interface",
              //             icon: ImageUrl.blueDot,
              //             items: [
              //               Ritem(Routes.buttons, ImageUrl.plus, "Buttons"),
              //               Ritem(Routes.forms, ImageUrl.plus, "Forms"),
              //               Ritem(Routes.modals, ImageUrl.plus, "Modals"),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // const Divider(
              //   thickness: 1,
              //   indent: 10,
              //   endIndent: 10,
              // ),
              // const Padding(
              //   padding: EdgeInsets.all(Sizes.md),
              //   child: RMenuItem(
              //     route: Routes.settings,
              //     itemName: "Settings",
              //     icon: ImageUrl.settings,
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(Sizes.md),
              //   child: InkWell(
              //     onTap: () async {
              //       controller.logout();
              //     },
              //     child: Padding(
              //       padding: const EdgeInsets.symmetric(vertical: Sizes.xs),
              //       child: Container(
              //         height: 50,
              //         decoration: BoxDecoration(
              //             color: Colors.transparent,
              //             borderRadius:
              //                 BorderRadius.circular(Sizes.cardRadiusMd)),
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Padding(
              //                 padding: const EdgeInsets.only(
              //                     left: Sizes.lg,
              //                     top: Sizes.md,
              //                     bottom: Sizes.md,
              //                     right: Sizes.lg),
              //                 child: Image.asset(ImageUrl.logout,
              //                     height: 20, width: 20, color: Colors.grey)),
              //             Flexible(
              //               child: Text(
              //                 "Logout",
              //                 style: TextStyle(color: Colors.grey[800]),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
