import 'package:adminpanel/core/utils/device_utility.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  static SidebarController get instance => Get.find();

  final activeItem = Routes.dashBoard.obs;
  final hoverItem = ''.obs;

  void changeActiveItem(String route) => activeItem.value = route;

  void changeHoverItem(String route) {
    if (activeItem.value != route) {
      hoverItem.value = route;
    }
  }

  bool isActive(String route) => activeItem.value == route;
  bool isHovering(String route) => hoverItem.value == route;

  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
    }
    if (DeviceUtility.isMobileScreen(Get.context!)) Get.back();
    if (DeviceUtility.isTabletScreen(Get.context!)) Get.back();

    Get.toNamed(route);
  }
}
