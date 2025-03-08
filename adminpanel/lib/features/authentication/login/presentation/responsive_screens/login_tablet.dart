import 'package:adminpanel/common/widgets/textfield.dart';
import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/core/constants/colors.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:flutter/material.dart';

class LoginTablet extends StatelessWidget {
  const LoginTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
             width: 900,
            height: 900,
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: DGradients.sampleGradient,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color:DColors.standardlightgrey,
                            spreadRadius: 5,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      height: 400,
                      width: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'ADMIN PANEL',
                              style: TextStyle(
                                color:DColors.standardwhite,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Divider(thickness: 2,color: Colors.grey,endIndent: 90,),
                            const SizedBox(height: 20),
                            const DEmailField(),
                            const SizedBox(height: 20),
                            const DPasswordfield(),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(onPressed: (){}, child: const Text('Forgot Password ?',style: TextStyle(color: Colors.white),)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          
               const Positioned(
                top:70,
                right:110,
                 child: CircleAvatar(
                  radius: 60,
                  backgroundColor: DColors.customlight,
                 ),
               ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 500),
                      ElevatedButton(
                        onPressed: (){
                        },
                        style:DElevatedButtons.loginelevatedButton,
                        child: const SizedBox(
                          height: 40,
                          width: 180,
                          child: Center(child: Text('Login to your account')),
                        ),
                      ),
                    ],
                  ),
                ),
          
              ],
            ),
          ),
        );
  }
}