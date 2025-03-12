import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:adminpanel/features/authentication/login/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    //instance creation
    final authBloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: 900,
          height: 1000,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 50,
                child: Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      gradient: DGradients.flightGet,
                      borderRadius: BorderRadius.circular(DSizes.cardRadiusMd)),
                  padding: EdgeInsets.all(40),
                  child: Lottie.asset(DAnimations.login1),
                ),
              ),
              Positioned(
                right: 10,
                top: 100,
                child: Container(
                  width: 500,
                  height: 500,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(181, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(60, 33, 149, 243),
                        offset: Offset(10, 10),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
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
                            label: "Email",
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
                                onPressed: () => authBloc.add(AuthSumbitted()),
                                style: DElevatedButtons.loginelevatedButton,
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
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
    );
  }
}
