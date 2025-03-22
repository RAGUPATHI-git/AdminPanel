import 'package:adminpanel/common/layouts/sidebars/sidebar_controller.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RMenuItem extends StatelessWidget {
  const RMenuItem(
      {super.key,
      required this.route,
      required this.icon,
      required this.itemName});
  final String route;
  final String icon;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    final menuController = Get.put(SidebarController());

    return InkWell(
      onTap: (route != '/logout')
          ? () => menuController.menuOnTap(route)
          : () {
              FirebaseAuth.instance.signOut();
            },
      onHover: (hovering) => hovering
          ? menuController.changeHoverItem(route)
          : menuController.changeHoverItem(''),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: DSizes.xs),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: menuController.isActive(route) ||
                        menuController.isHovering(route)
                    ? Colors.blue
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(DSizes.cardRadiusMd)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      left: DSizes.md,
                      top: DSizes.md,
                      bottom: DSizes.md,
                      right: DSizes.lg,
                    ),
                    child: menuController.isActive(route)
                        ? SvgPicture.asset(
                            icon,
                            height: 15,
                            width: 15,
                            color: Colors.white,
                          )
                        : SvgPicture.asset(icon,
                            height: 15,
                            width: 15,
                            color: menuController.isHovering(route)
                                ? Colors.white
                                : Colors.grey)),
                if (menuController.isActive(route) ||
                    menuController.isHovering(route))
                  Flexible(
                    child: Text(
                      itemName,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                else
                  Flexible(
                    child: Text(
                      itemName,
                      style: TextStyle(color: Colors.grey[800]),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
