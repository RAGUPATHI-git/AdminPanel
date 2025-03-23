import 'package:flutter/material.dart';

class FormController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();

  String yearController = '';
  String selectedGender = 'Male';
  String selectedDepartment = '';
  bool saveLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> accountkey = GlobalKey<FormState>();

  bool validateForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
