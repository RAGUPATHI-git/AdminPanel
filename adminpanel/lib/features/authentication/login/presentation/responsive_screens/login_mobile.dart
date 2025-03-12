import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/icons.dart';
import 'package:adminpanel/core/constants/input%20fields/basic_input.dart';
import 'package:adminpanel/core/constants/sizes.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: 550,
            width: 450,
            child: Stack(
              children: [
                Container(
                  width: 450,
                  height: 550,
                  decoration: BoxDecoration(gradient: DGradients.flightGet, borderRadius: BorderRadius.circular(DSizes.cardRadiusMd))
                ),
            
                Center(
                  child: Container(
                  width: 400,
                  height: 500,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(204, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.all(30),
                          child: Column(
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
                              ),
                              SizedBox(height: 20),
                              BasicInput(
                                onChanged: (value) {},
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
                                        obscure ? DIcons().crossedEye : DIcons().eye,
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
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 50,
                                  width: 400,
                                  child: ElevatedButton(
                                    onPressed: () {},
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
                          ),
                        ),
                ),
                    ],
            ),
          ),
        )
      )
        );
  }
}