import 'package:adminpanel/common/layouts/pop_ups/full_screen_loader.dart';
import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/enums.dart';
import 'package:adminpanel/core/helper%20functions/network_manager.dart';
import 'package:adminpanel/features/authentication/login/controllers/user_controller.dart';
import 'package:adminpanel/features/authentication/login/data/model/authentication_model.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/authentication_repository.dart';
import 'package:adminpanel/features/authentication/login/data/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final loginForemKey = GlobalKey<FormState>();

  // controller for handling login functionality
  static LoginController get instance => Get.find();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  // Handles email and password sign-in process
  Future<void> emailAndpasswordSignIn() async {
    try {
      // Start loading
      // FullScreenLoader.popUpCircular();
      FullScreenLoader.openLoadingDialog(
          'you may wait', DAnimations.timerLoading);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      } else {}

      // Form validation
      // if (!loginForemKey.currentState!.validate()) {
      //   print('not connected form valid');

      //   FullScreenLoader.stopLoading();
      // }

      //save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //login usear using Email & password Authentication
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //Fetch usr details and assign to UserController
      final userDetail = await UserController.instance.fetchUserDetails();

      //Remove loader
      FullScreenLoader.stopLoading();

      //if user is not admin, logout and return

      if (userDetail.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        const SnackBar(content: Text('Something went wrong'));
      } else {
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      throw "Something went wrong!. Please try again!!";
    }
  }

  // Handles registrations of admin user
  Future<void> registerAdmin() async {
    //Start loading
    FullScreenLoader.openLoadingDialog(
        'Registering Admin Account...', DAnimations.timerLoading);

    //check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      FullScreenLoader.stopLoading();
      return;
    }
    // Register user using Email & password Authentications
    await AuthenticationRepository.instance
        .registerWithEmailAndPassword("admin@gmail.com", "admin123");

    // Create admin record in the Firebase
    final userRepository = Get.put(UserRepository());
    await userRepository.createUser(UserModel(
        email: "admin@gmail.com",
        id: AuthenticationRepository.instance.authUser!.uid,
        createdAt: DateTime.now(),
        role: AppRole.admin,
        firstName: 'super',
        lastName: 'Admin'));
  }

  Future<void> signOUt() async {
    try {
      // Start loading
      // FullScreenLoader.popUpCircular();
      FullScreenLoader.openLoadingDialog(
          'you may wait', DAnimations.timerLoading);
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      } else {}

      // Form validation
      // if (!loginForemKey.currentState!.validate()) {
      //   print('not connected form valid');

      //   FullScreenLoader.stopLoading();
      // }

      //save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      //login usear using Email & password Authentication
      await AuthenticationRepository.instance.signOut();
        //Fetch usr details and assign to UserController

      //Remove loader
      FullScreenLoader.stopLoading();
      final userDetail = await UserController.instance.fetchUserDetails();

      //if user is not admin, logout and return

      if (userDetail.role != AppRole.admin) {
        await AuthenticationRepository.instance.logout();
        const SnackBar(content: Text('Something went wrong'));
      } else {
        AuthenticationRepository.instance.screenRedirect();
      }
    } catch (e) {
      throw "Something went wrong!. Please try again!!";
    }
  }
}
