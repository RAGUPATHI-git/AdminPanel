import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class DToast{
  void successToast(String message, BuildContext context){
    MotionToast toast = MotionToast.success(description: Text(message),enableAnimation: true,position: MotionToastPosition.top,animationType: AnimationType.fromTop,animationCurve: Curves.easeIn,barrierColor: Colors.white,);
  toast.show(context);
}

void faliureToast(String message, BuildContext context){}
}