import 'package:adminpanel/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoader extends StatelessWidget {
  const AnimationLoader(
      {super.key,
      required this.text,
      required this.animation,
      this.showAction = false,
      this.actionText,
      this.onActionPressed,
      this.height,
      this.width,
      this.style});

  final String text;
  final TextStyle? style;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,
              height: height ?? MediaQuery.of(context).size.height * 0.5,
              width: width),
          const SizedBox(
            height: DSizes.defaultSpace,
          ),
          const SizedBox(
            height: DSizes.defaultSpace,
          ),
          //     if (showAction) SizedBox(
          //       width: 250,
          //       child: OutlinedButton(onPressed: onActionPressed, style: OutlinedButton.styleFrom(backgroundColor: Colors.black38),
          //        child: Text(actionText!,textAlign: TextAlign.center,)
          //       ,
          //       ),
          // )
        ],
      ),
    );
  }
}
