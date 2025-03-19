import 'package:adminpanel/core/constants/animations.dart';
import 'package:adminpanel/core/constants/fonts.dart';
import 'package:adminpanel/core/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDesktop extends StatelessWidget {
  const LoadingDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: LottieBuilder.asset(DAnimations.timerLoading),
              ),
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    Dtext.loadingWelcome,
                    style: DFont.title,
                  )),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    Dtext.loadingmessage,
                    style: DFont.subTitle,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
