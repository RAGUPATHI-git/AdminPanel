// import 'package:adminpanel/common/widgets/textfield.dart';
// import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
// import 'package:adminpanel/core/constants/colors.dart';
import 'package:adminpanel/common/widgets/textfield.dart';
import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/colors.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:flutter/material.dart';

class LoginDesktop extends StatelessWidget {
  const LoginDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                      gradient:DGradients.sampleGradient
                    ),
                    padding: EdgeInsets.all(40),
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
                          color:Color(0x66004d4d),
                          offset: Offset(10, 10),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ADMIN LOGIN ',
                          style: TextStyle(
                            color: DColors.custom,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Divider(thickness: 2,color: Colors.grey,),
                        SizedBox(height: 20),
                        DEmailField(),
                        SizedBox(height: 20),
                        DPasswordfield(),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  color: DColors.custom,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              
              Positioned(
                           right :70,
                           bottom:30,
                           child: ElevatedButton(
                            onPressed: () {},
                            style: DElevatedButtons.loginelevatedButton,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
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
      );
    
  }
}