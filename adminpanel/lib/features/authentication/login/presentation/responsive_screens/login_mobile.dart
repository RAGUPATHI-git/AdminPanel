import 'package:adminpanel/core/constants/button_styles/elevated_buttons.dart';
import 'package:adminpanel/features/authentication/login/presentation/widgets/textfield.dart';
import 'package:adminpanel/core/constants/colors.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)
          ),
              height: 900,
              width: 500,
              child: Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: DGradients.sampleGradient,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color:Color(0x66004d4d),
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
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   Text(
                                    'ADMIN PANEL',
                                    style: TextStyle(
                                      color:DColors.standardwhite,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              const Divider(thickness: 2,color: Colors.grey, endIndent:80),
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
                  top:135,
                  right: 35,
                   child: CircleAvatar(
                    radius: 50,
                    backgroundColor: DColors.customlight,
                   ),
                 ),
        
        
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 520),
                        ElevatedButton(
                          onPressed: (){
                          },
                          style:DElevatedButtons.loginelevatedButton,
                          child:const SizedBox(
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
      ),
        );
  }
}