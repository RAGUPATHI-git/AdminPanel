import 'package:adminpanel/common/widgets/textfield.dart';
import 'package:adminpanel/core/constants/colors.dart';
import 'package:adminpanel/core/constants/gradients.dart';
import 'package:flutter/material.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: DGradients.sampleGradient
        ),
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: DColors.standardlightgrey,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color:DColors.standardlightgrey,
                        spreadRadius: 6,
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
                        Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 20),
                        DEmailField(),
                        SizedBox(height: 20),
                        DPasswordfield(),
                        SizedBox(height: 30),
                        SizedBox(height: 20),
                
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){}, child: Text('Forgot Password ?',style: TextStyle(color: Colors.white),)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(height: 560),
                  ElevatedButton(
                    onPressed: (){
                    },
                    style:ElevatedButton.styleFrom(
    backgroundColor: const Color(0x66808080) ,
    foregroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
    textStyle:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),   
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(4),
    ),
  ),
                    child: SizedBox(
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
