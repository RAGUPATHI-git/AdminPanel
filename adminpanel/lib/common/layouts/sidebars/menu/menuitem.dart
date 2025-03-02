// import 'package:admin/common/layouts/sidebars/sidebar_controller.dart';
// import 'package:admin/utils/constants/sizes.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class RMenuItem extends StatelessWidget {
//   const RMenuItem(
//       {super.key,
//       required this.route,
//       required this.icon,
//       required this.itemName});
//   final String route;
//   final String icon;
//   final String itemName;

//   @override
//   Widget build(BuildContext context) {
//     final menuController = Get.put(SidebarController());

//     return InkWell(
//       onTap: (route != '/logout')
//           ? () => menuController.menuOnTap(route)
//           : () {
//               FirebaseAuth.instance.signOut();
//             },
//       onHover: (hovering) => hovering
//           ? menuController.changeHoverItem(route)
//           : menuController.changeHoverItem(''),
//       child: Obx(
//         () => Padding(
//           padding: const EdgeInsets.symmetric(vertical: Sizes.xs),
//           child: Container(
//             height: 50,
//             decoration: BoxDecoration(
//                 color: menuController.isActive(route) ||
//                         menuController.isHovering(route)
//                     ? Colors.blue
//                     : Colors.transparent,
//                 borderRadius: BorderRadius.circular(Sizes.cardRadiusMd)),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.only(
//                         left: Sizes.lg,
//                         top: Sizes.md,
//                         bottom: Sizes.md,
//                         right: Sizes.lg),
//                     child: menuController.isActive(route)
//                         ? Image.asset(
//                             icon,
//                             height: 20,
//                             width: 20,
//                             color: Colors.white,
//                           )
//                         : Image.asset(icon,
//                             height: 20,
//                             width: 20,
//                             color: menuController.isHovering(route)
//                                 ? Colors.white
//                                 : Colors.grey)),
//                 if (menuController.isActive(route) ||
//                     menuController.isHovering(route))
//                   Flexible(
//                     child: Text(
//                       itemName,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   )
//                 else
//                   Flexible(
//                     child: Text(
//                       itemName,
//                       style: TextStyle(color: Colors.grey[800]),
//                     ),
//                   )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
