import 'package:adminpanel/core/helper%20functions/network_manager.dart';
import 'package:adminpanel/features/authentication/login/controllers/user_controller.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
    Get.lazyPut(() => UserController(), fenix: true);
  }
}
