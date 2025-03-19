
import 'package:adminpanel/common/layouts/sidebars/sidebar_controller.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RouteObserver extends GetObserver {
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final sidebarController = Get.put(SidebarController());

    if (previousRoute != null) {
      for (var routeName in Routes.sideBarMenuItems) {
        if (previousRoute.settings.name == routeName) {
          sidebarController.activeItem.value = routeName;
        }
      }
    }
  }

  // @override
  // void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
  //   final sidebarController = Get.put(SidebarController());

  //   super.didPop(route, previousRoute);
  //   if (previousRoute != null) {
  //     for (var routeName in Routes.sideBarMenuItems) {
  //       if (previousRoute.settings.name == routeName) {
  //         sidebarController.activeItem.value = routeName;
  //       }
  //     }
  //   }
  // }
}
