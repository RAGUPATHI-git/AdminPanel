import 'package:adminpanel/core/utils/device_utility.dart';
import 'package:get/get.dart';

class SidebarController extends GetxController {
  static SidebarController get instance => Get.find();

  final activeItem = ''.obs; // Initially empty to prevent forcing 'dashboard'
  final hoverItem = ''.obs;

  @override
  void onInit() {
    super.onInit();
    activeItem.value =
        Get.currentRoute; // Set initial active item based on the current route
    ever(Get.currentRoute.obs, (route) {
      activeItem.value = route; // Update when route changes
    });
  }

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
