import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:adminpanel/features/authentication/login/bloc/auth_bloc.dart';
import 'package:adminpanel/features/authentication/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginTablet extends StatefulWidget {
  const LoginTablet({super.key});

  @override
  State<LoginTablet> createState() => _LoginTabletState();
}

class _LoginTabletState extends State<LoginTablet> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    //instance creation
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 550,
          width: 550,
          child: Stack(
            children: [
              Center(
                child: Container(
                    width: 550,
                    height: 550,
                    decoration: BoxDecoration(
                        gradient: DGradients.flightGet,
                        borderRadius:
                            BorderRadius.circular(DSizes.cardRadiusMd))),
              ),
              Center(
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: EdgeInsets.all(30),
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ADMIN LOGIN ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Divider(
                            thickness: 2,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 20),
                          BasicInput(
                            controller: controller.email,
                            label: "Email",
                            validator: (value) {
                              if (value == '' && value == null) {}
                            },
                            hintText: "example@gmail.com",
                            prefixIcon: DIcons().user,
                            onChanged: (email) =>
                                authBloc.add(AuthEmail(email: email)),
                            error: state.showError && state.email.isEmpty
                                ? state.eMessage
                                : null,
                          ),
                          SizedBox(height: 20),
                          BasicInput(
                            controller: controller.password,
                            onChanged: (password) =>
                                authBloc.add(AuthPassword(password: password)),
                            label: "Password",
                            obscureText: obscure ? true : false,
                            hintText: "Password !",
                            prefixIcon: DIcons().lock,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscure = !obscure;
                                  });
                                },
                                icon: SvgPicture.asset(
                                    obscure
                                        ? DIcons().crossedEye
                                        : DIcons().eye,
                                    color: Colors.grey,
                                    height: 30,
                                    width: 30,
                                    fit: BoxFit.scaleDown)),
                          ),
                          SizedBox(height: 20),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Forgot Password!",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w100),
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: DSizes.spaceBtwItems,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              height: 50,
                              width: 400,
                              child: ElevatedButton(
                                onPressed: () =>
                                    controller.emailAndpasswordSignIn(),
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateColor.resolveWith(
                                    (states) => Color.fromRGBO(8, 102, 255, 1),
                                  ),
                                ),
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
