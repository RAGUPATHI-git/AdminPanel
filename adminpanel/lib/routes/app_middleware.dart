import 'package:adminpanel/features/authentication/login/data/repositories/authentication_repository.dart';
import 'package:adminpanel/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoutesMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    print('-----middleware-------------');
    return AuthenticationRepository.instance.isAuthentcation
        ? null
        : const RouteSettings(name: Routes.login);
  }
}
